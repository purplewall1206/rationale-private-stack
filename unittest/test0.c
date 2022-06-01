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

void params8(unsigned long a, unsigned long b, unsigned long c, unsigned long d, unsigned long e, unsigned long f, unsigned long g, unsigned long h) {
    return;
}

struct s gens1(unsigned long a, unsigned long b, unsigned long c, struct s d) {
    struct s x;
    x.a = a + 1;
    x.b = b + 2;
    x.c = c + 3;
    x.a += d.a;
    x.b += d.b;
    return x;
}

unsigned long tailcall(unsigned long param) {
    param += 10;
    return param;
}

unsigned long call(unsigned long param) {
    param += 100;
    return tailcall(param);
}


int main()
{
    // unsigned long a = 0, b = 1, c = 2;
    // struct s gets = gens(a, b, c);
    // unsigned long aa = gets.a;
    // unsigned long bb = gets.b;
    // unsigned long cc = gets.c;
    // unsigned long a = 0, b = 1, c = 2;
    // struct s d = {.a = 4, .b = 5, .c = 6};
    // struct s gets = gens1(a, b, c, d);

    // printf("%ld %ld %ld\n", gets.a, gets.b, gets.c);
    // params8(a, b ,c, a, b, c, a, b);
    unsigned long ret = call(2);
    return 0;
}