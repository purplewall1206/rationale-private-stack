# rationale-private-stack


A simple example of a x64 private stack for sensitive functions


## parameters passing

x64的cpu上有足够的寄存器，因此

> System V ABI:  
>> The first six integer or pointer arguments are passed in registers RDI, RSI, RDX, RCX, R8, and R9, while XMM0, XMM1, XMM2, XMM3, XMM4, XMM5, XMM6 and XMM7 are used for floating point arguments ... As in the Microsoft x64 calling convention, additional arguments are passed on the stack and the return value is stored in RAX.

据观察在linux，更多的参数都是寄存器传递的，但是规则


## function disassembler

the start of a function
```
    push %rbp
    mov  %rsp, %rbp
```

因此可以试试看只换一个$rsp 有没有影响