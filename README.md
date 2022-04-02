# rationale-private-stack


A simple example of a x64 private stack for sensitive functions

只考虑参数6个以内，返回值8字节以内的情况，即只需要移动RSP寄存器即可

> 方案二，整体加减偏移量，平移RBP，RSP寄存器

## parameters passing

x64的cpu上有足够的寄存器，因此

> System V ABI:  
>> The first six integer or pointer arguments are passed in registers RDI, RSI, RDX, RCX, R8, and R9, while XMM0, XMM1, XMM2, XMM3, XMM4, XMM5, XMM6 and XMM7 are used for floating point arguments ... As in the Microsoft x64 calling convention, additional arguments are passed on the stack and the return value is stored in RAX.

超过六个寄存器，或者struct类型返回值超过16字节，使用栈传递


## function disassembler

the start of a function
```
    push %rbp
    mov  %rsp, %rbp
```


