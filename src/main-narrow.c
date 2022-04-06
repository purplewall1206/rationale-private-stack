#include <stdio.h>
#include <stdlib.h>

unsigned long RSP0 = 0;
unsigned long RSP1 = 0;
int debug = 0;

// sensitive enter in to the non-sensitive
#define s_enter_ns \
		if (!debug) {\
			asm volatile ("mov %%rsp, %0" : "=m"(RSP1):); \
        	asm volatile ("mov %0, %%rsp": :""(RSP0)); \
		}
        

#define ns_exit_s \
		if (!debug) {\
            asm volatile ("mov %%rsp, %0": "=m"(RSP0):);\
			asm volatile ("mov %0, %%rsp": :""(RSP1));\
		}
        

#define ns_enter_s \
		if (!debug) {\
			asm volatile ("mov %%rsp, %0" : "=m"(RSP0):);\
        	asm volatile ("mov %0, %%rsp" : :""(RSP1));\
		}
        

#define s_exit_ns \
		if (!debug) {\
            asm volatile ("mov %%rsp, %0" : "=m"(RSP1):);\
			asm volatile ("mov %0, %%rsp" : :""(RSP0));\
		}
        

void nested_test(int a, int b, int c, int d);

unsigned long service(unsigned long c) {
    printf("request service\n");
    return c + 2;
}

unsigned long sensitive(unsigned long a, unsigned long b) {
    unsigned long c = a + b;
    printf("sensitive %ld\n", c);

    s_enter_ns
    c = service(c);
    ns_exit_s

    s_enter_ns
    c = service(c);
    ns_exit_s

	s_enter_ns
    nested_test(10, 100, 1000, 4096);
    ns_exit_s
    return c;
}

void sensitive_nested_test(int a, int b, int c, int d)
{
	printf("sensitive_nested_test %d %d %d %d\n", a, b, c, d);
	s_enter_ns
    service(10);
    ns_exit_s
}

void nested_test(int a, int b, int c, int d)
{
	printf("nested_test %d %d %d %d\n", a, b, c, d);
	ns_enter_s
    sensitive_nested_test(a, b, c, d);
    s_exit_ns
}


int main()
{
    unsigned long x = 2;
    unsigned long y = 8;

    // create a private stack, put the rsp in the middle
    // if put rsp in the beginning, 'push' will cause a illegal access, and result in segment fault
    unsigned long *addr = (unsigned long*) malloc(4096 * 4);
    RSP1 = (unsigned long)(addr + 4096 * 2);

    // asm volatile ("mov %%rsp, %0" : "=m"(RSP0):);
    // asm volatile ("mov %0, %%rsp" : :""(RSP1));
    ns_enter_s
    unsigned long z = sensitive(x, y);
    s_exit_ns
    // asm volatile ("mov %0, %%rsp" : :""(RSP0));

    printf("main %ld\n", z);

    return 0;
}