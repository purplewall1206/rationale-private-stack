#include <stdio.h>
#include <stdlib.h>
#include <sys/mman.h>
#include <unistd.h>

// ALL anonymous pages are initialed as 0

int main()
{
    // unsigned long * addr = (unsigned long *)mmap(0, 4096 * 1024, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_ANONYMOUS, -1, 0);
    // unsigned long * addr = (unsigned long *) malloc(100*1024);
    void *heap_start = sbrk(0);
    unsigned long *addr = (unsigned long *) heap_start;
    printf("heap_start %016lx\n", (unsigned long) heap_start);
    brk(heap_start + 4096 * 1000);

    if (!addr) {
        printf("faild %ld\n", addr);
        return -1;
    }
    for (int i = 0;i < 4096 * 1000 / 8 ;i++) {
        if (addr[i] != 0)
            printf("index:%010d : %016lx\n", i, addr[i]);
    }
    return 0;
}