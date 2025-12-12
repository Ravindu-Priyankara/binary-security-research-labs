#include <sys/mman.h>
#include <string.h>
#include <stdio.h>

unsigned char code[] = {
  0x48,0x31,0xc0, 0xb0,0x3c, 0x48,0x31,0xf6, 0x0f,0x05, 0xc3
};

int main(void) {
    void *mem = mmap(NULL, sizeof(code),
                     PROT_READ|PROT_WRITE|PROT_EXEC,
                     MAP_PRIVATE|MAP_ANONYMOUS, -1, 0);
    memcpy(mem, code, sizeof(code));
    ((void(*)())mem)();
    return 0;
}
