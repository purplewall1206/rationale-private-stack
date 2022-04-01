#include <stdio.h>
#include <stdlib.h>

unsigned long RSP0 = 0;
unsigned long RSP1 = 0;

unsigned long service(unsigned long c) {
    return c + 2;
}

unsigned long sensitive(unsigned long a, unsigned long b) {
    unsigned long c = a + b;
    printf("sensitive %d\n", c);
    // c = service(c);
    return c;
}


int main()
{
    unsigned long x = 2;
    unsigned long y = 8;

    unsigned long *addr = (unsigned long*) malloc(4096 * 4);
    RSP1 = (unsigned long)addr;

    asm("mov %%rsp, %0" : "=r"(RSP0):);
    asm("mov %0, %%rsp" : :"r"(RSP1));
    unsigned long z = sensitive(x, y);
    asm("mov %0, %%rsp" : "=r"(RSP0):);

    printf("main %d\n", z);

    return (int)z;
}