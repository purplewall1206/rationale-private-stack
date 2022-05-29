#include <stdio.h>
#include <stdlib.h>

unsigned long *shadow_stack;

unsigned long extension(unsigned long a, unsigned long b, unsigned long c) 
{
    unsigned long d = a + b + c;
    return d;
}

unsigned long kernel() 
{
    unsigned long a = 1;
    unsigned long b = 10;
    unsigned long c = 100;
    unsigned long d = extension(a, b, c);
    printf("%ld\n", d);
    return d;
}

int main()
{
    shadow_stack = mmap(NULL, )
    kernel();
    return 0;
}