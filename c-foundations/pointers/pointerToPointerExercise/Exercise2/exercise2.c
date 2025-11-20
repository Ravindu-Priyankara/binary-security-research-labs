#include <stdio.h>

void changePointer(int **pp, int *new_addr) {
    *pp = new_addr;   // change the original pointer to point somewhere else
}

int main() {
    int a = 10;
    int b = 20;

    int *ptr = &a;     // ptr initially points to a

    changePointer(&ptr, &b);  // now change ptr to point to b

    printf("Value pointed by ptr: %d\n", *ptr);   // prints 20

    return 0;
}
