#include <stdio.h>

int main() {
    int x = 3;
    int y = 5;

    int *ptr;     // pointer to int
    int **pptr;   // pointer to pointer to int

    ptr = &x;     // ptr stores the address of x
    pptr = &ptr;  // pptr stores the address of ptr

    // Value access
    printf("Value of x using ptr: %d\n", *ptr);
    printf("Value of x using pptr: %d\n", **pptr);

    // Address access
    printf("Address of x (ptr): %p\n", (void *)ptr);
    printf("Address of ptr (pptr): %p\n", (void *)pptr);

    // Addresses of pointer variables
    printf("Address of ptr variable: %p\n", (void *)&ptr);
    printf("Address of pptr variable: %p\n", (void *)&pptr);

    return 0;
}
