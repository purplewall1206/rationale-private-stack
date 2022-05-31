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



