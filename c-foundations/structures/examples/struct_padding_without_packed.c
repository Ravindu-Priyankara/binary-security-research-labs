#include <stdio.h>
#include <stddef.h> // For size_t

struct Test {
    int a;    // 4 bytes
    char b;   // 1 byte
    double c; // 8 bytes
};

int main() {
    struct Test test1;
    size_t size_of_struct = sizeof(struct Test);

    printf("--- Memory Layout (Default Alignment) ---\n");
    printf("Size of struct Test:\t%zu bytes\n", size_of_struct);
    printf("Offset of a (int):\t%zu\n", offsetof(struct Test, a));
    printf("Offset of b (char):\t%zu\n", offsetof(struct Test, b));
    printf("Offset of c (double):\t%zu\n", offsetof(struct Test, c));

    return 0;
}