# rationale-private-stack


```
stack_switch()
call extension()
stack_switch()
```

我们可以确定，call extension之前切换栈，不影响参数传递，哪怕参数是个struct需要压栈

但是我们不确定，调用之后，比如返回了一个struct，我们应该如何处理返回的struct

这里需要反编译，看看怎么办，可能需要copy一下

之后把这玩意放进kernel里面试试看



RDI, RSI, RDX, RCX, R8, R9,栈

call -> push ip + jmp func
ret -> pop ip
leave -> mov %ebp,%esp + pop %ebp

-------------------------------



-------------------------------

# 当struct作为返回值时

大致分成两种情况，

- 如果struct小，那么可能会拆成几个寄存器返回，
- 如果struct比较大，通常在前一个函数的栈里面分配一块空间，然后把这块空间的地址当做参数传递给被调用函数，函数的返回值 $rax，保存了前一个栈里面空间的地址

```
//    struct s gets = gens(a, b, c);

 ► 0x55555555522f <main+70>    callq  gens                <gens>
        rdi: 0x7fffffffdd50 ◂— 0x0 // 这里就是struct s的地址，在上一个函数的栈里面
        rsi: 0x0
        rdx: 0x1
        rcx: 0x2

```

然而这在private stack处理时有个恶心的后果，就是比如caller是kernel，callee是extension，那么extension需要直接取写caller的栈

解决办法是llvm-ir基本上能够识别这种情况，那么当识别为sret时，自动替换指针
```
define dso_local void @gens(%struct.s* noalias sret(%struct.s) align 8 %0, i64 %1, i64 %2, i64 %3) #0 {
```


-------------------------------

# 当struct作为参数时

被分解成struct的元素个参数，全部压栈，略微修改刚刚的例子

```
    struct s d = {.a = 4, .b = 5, .c = 6};
    struct s gets = gens1(a, b, c, d);

   0x5555555552af <main+75>     leaq   -0x20(%rbp), %rax // 上个函数的stack里面，给struct返回值分配的空间
   0x5555555552b3 <main+79>     movq   -0x48(%rbp), %rcx // arg2
   0x5555555552b7 <main+83>     movq   -0x50(%rbp), %rdx // arg1
   0x5555555552bb <main+87>     movq   -0x58(%rbp), %rsi // arg0
   0x5555555552bf <main+91>     subq   $8, %rsp
   0x5555555552c3 <main+95>     pushq  -0x30(%rbp)      // d.c
   0x5555555552c6 <main+98>     pushq  -0x38(%rbp)      // d.b
   0x5555555552c9 <main+101>    pushq  -0x40(%rbp)      // d.a
   0x5555555552cc <main+104>    movq   %rax, %rdi       // leaq 读取的struct的返回地址
 ► 0x5555555552cf <main+107>    callq  gens1                <gens1>
        rdi: 0x7fffffffdd50 ◂— 0x0                      // 这里就是struct s的地址，在上一个函数的栈里面
        rsi: 0x0
        rdx: 0x1
        rcx: 0x2

```

-------------------------------

# tail call


一般在递归的时候用

没优化：
```
function recsum(x) {
    if (x === 0) {
        return 0;
    } else {
        return x + recsum(x - 1);
    }
}

recsum(5)
5 + recsum(4)
5 + (4 + recsum(3))
5 + (4 + (3 + recsum(2)))
5 + (4 + (3 + (2 + recsum(1))))
5 + (4 + (3 + (2 + (1 + recsum(0)))))
5 + (4 + (3 + (2 + (1 + 0))))
5 + (4 + (3 + (2 + 1)))
5 + (4 + (3 + 3))
5 + (4 + 6)
5 + 10
15
```

优化之后：
```
function tailrecsum(x, running_total = 0) {
    if (x === 0) {
        return running_total;
    } else {
        return tailrecsum(x - 1, running_total + x);
    }
}

tailrecsum(5, 0)
tailrecsum(4, 5)
tailrecsum(3, 9)
tailrecsum(2, 12)
tailrecsum(1, 14)
tailrecsum(0, 15)
15
```


-------------------------------
A simple example of a x64 private stack for sensitive functions

只考虑参数6个以内，返回值8字节以内的情况，即只需要移动RSP寄存器即可

> 方案二，整体加减偏移量，平移RBP，RSP寄存器

* main 从sensitive返回之后并不重置RSP1，导致资源浪费
* main-narrow，从sensitive 返回之后重置RSP1，应该是正确的private stack

**linux kernel代码的编译器优化似乎把超过6个参数的函数也使用寄存器传递了**，因此模拟linux的私有栈可以理解成

* 进入sensitive，保存原有RSP，换成private RSP
* 离开sensitive，保存private RSP，换成原有RSP

## 原理分析

正常进行函数调用

```
    call func; // push %rip; jmp func;


    ... into func ...
    push %rbp
    mov  %rsp, %rbp
    ...
    leave // mov %rbp, %rsp; pop %rbp;
    ret   // pop %rip;
    ... leave func ...


    next instruction after call;
```

私有栈切换

```
    // save origin %rsp, use private %rsp
    asm volatile ("mov %%rsp, %0" : "=m"(RSP0):);
    asm volatile ("mov %0, %%rsp" : :""(RSP1));

    call func; // push %rip; jmp func;


    ... into func ...
    push %rbp
    mov  %rsp, %rbp
    ...
    leave // mov %rbp, %rsp; pop %rbp;
    ret   // pop %rip;
    ... leave func ...

    // save private %rsp, use origin %rsp
    asm volatile ("mov %%rsp, %0" : "=m"(RSP1):);
	asm volatile ("mov %0, %%rsp" : :""(RSP0));
    
    next instruction after call;
```


## parameters passing

x64的cpu上有足够的寄存器，因此

> System V ABI:  
>> The first six integer or pointer arguments are passed in registers RDI, RSI, RDX, RCX, R8, and R9, while XMM0, XMM1, XMM2, XMM3, XMM4, XMM5, XMM6 and XMM7 are used for floating point arguments ... As in the Microsoft x64 calling convention, additional arguments are passed on the stack and the return value is stored in RAX.

超过六个寄存器，或者struct类型返回值超过16字节，使用栈传递

编译器优化，会把超过6个寄存器的部分也是用寄存器传递，而非栈，例如

```
void *__vmalloc_node_range(unsigned long size, unsigned long align,
			unsigned long start, unsigned long end, gfp_t gfp_mask,
			pgprot_t prot, unsigned long vm_flags, int node,
			const void *caller)


0000000000005890 <__vmalloc_node_range>:
    5890:	e8 00 00 00 00       	call   5895 <__vmalloc_node_range+0x5>	5891: R_X86_64_PLT32	__fentry__-0x4
    5895:	55                   	push   %rbp
    5896:	48 89 e5             	mov    %rsp,%rbp
    5899:	41 57                	push   %r15
    589b:	41 56                	push   %r14
    589d:	41 55                	push   %r13
    589f:	41 54                	push   %r12
    58a1:	53                   	push   %rbx
    58a2:	48 83 ec 38          	sub    $0x38,%rsp
    58a6:	4c 89 4d c8          	mov    %r9,-0x38(%rbp)
    58aa:	8b 5d 18             	mov    0x18(%rbp),%ebx
```



