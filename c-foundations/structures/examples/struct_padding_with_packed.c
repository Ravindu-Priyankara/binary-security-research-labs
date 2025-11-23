#include <stdio.h>
#include <stddef.h>

struct TestPacked {
    int a;    // 4 bytes
    char b;   // 1 byte
    double c; // 8 bytes
} __attribute__((packed)); // <--- The packed attribute

int main() {
    size_t size_of_struct = sizeof(struct TestPacked);

    printf("--- Memory Layout (Packed) ---\n");
    printf("Size of struct TestPacked:\t%zu bytes\n", size_of_struct);
    printf("Offset of a (int):\t%zu\n", offsetof(struct TestPacked, a));
    printf("Offset of b (char):\t%zu\n", offsetof(struct TestPacked, b));
    printf("Offset of c (double):\t%zu\n", offsetof(struct TestPacked, c));
    
    return 0;
}