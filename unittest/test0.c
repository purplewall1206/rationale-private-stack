#include <stdio.h>
#include <stdlib.h>

struct s 
{
    unsigned long a;
    unsigned long b;
    unsigned long c;
};

struct s gens(unsigned long a, unsigned long b, unsigned long c) {
    struct s x;
    x.a = a + 1;
    x.b = b + 2;
    x.c = c + 3;
    return x;
}

void params8(int a, int b, int c, int d, int e, int f, int g, int h) {
    return;
}

unsigned long main()
{
    // unsigned long a = 0, b = 1, c = 2;
    // struct s gets = gens(a, b, c);
    // unsigned long aa = gets.a;
    // unsigned long bb = gets.b;
    // unsigned long cc = gets.c;
    int a = 0, b = 1, c = 2;
    params8(a, b ,c, a, b, c, a, b);
    return 0;
}