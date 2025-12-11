#include <stdio.h>
#include <stdlib.h>
#include <sys/mman.h>
#include <unistd.h>
#include <fcntl.h>
#include <string.h>
#include <errno.h>

int main(int argc, char *argv[]) {
    if (argc != 2) {
        fprintf(stderr, "Usage: %s <shellcode_file>\n", argv[0]);
        return 1;
    }

    const char *filename = argv[1];
    int fd = open(filename, O_RDONLY);
    if (fd < 0) {
        fprintf(stderr, "[-] Failed to open %s: %s\n", filename, strerror(errno));
        return 1;
    }

    // Find file size
    off_t size = lseek(fd, 0, SEEK_END);
    lseek(fd, 0, SEEK_SET);

    if (size <= 0) {
        fprintf(stderr, "[-] Invalid shellcode file size\n");
        close(fd);
        return 1;
    }

    // Allocate RWX memory
    void *mem = mmap(NULL, size,
        PROT_READ | PROT_WRITE | PROT_EXEC,
        MAP_PRIVATE | MAP_ANONYMOUS,
        -1, 0);

    if (mem == MAP_FAILED) {
        fprintf(stderr, "[-] mmap failed: %s\n", strerror(errno));
        close(fd);
        return 1;
    }

    // Read shellcode into allocated memory
    if (read(fd, mem, size) != size) {
        fprintf(stderr, "[-] Failed to read shellcode\n");
        munmap(mem, size);
        close(fd);
        return 1;
    }

    close(fd);

    printf("[+] Loaded %ld bytes of shellcode from %s\n", size, filename);
    printf("[+] Executing shellcode...\n\n");

    // Execute shellcode
    void (*sc)() = mem;
    sc();

    return 0;
}

//Usage:
//gcc -z execstack -fno-stack-check -no-pie -o loader loader.c
//objcopy -O binary shell shellcode.bin
// ./loader shellcode.bin