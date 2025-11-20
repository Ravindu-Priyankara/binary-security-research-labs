#include <stdio.h>

int main() {

    int a = 50;
    int *ptr = &a;

    printf("Value of a: %d\n", a);                    // value
    printf("Address of a: %p\n", (void *)&a);         // variable address
    printf("Pointer value (address stored in ptr): %p\n", (void *)ptr); // pointer value
    printf("Pointer's own address: %p\n", (void *)&ptr);  // address of ptr
    printf("Dereferenced value (*ptr): %d\n", *ptr);  // dereferenced value

    return 0;
}
