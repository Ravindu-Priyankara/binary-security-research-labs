#include <stdio.h>

int main() {

    int value = 10;
    int *p = &value;
    int **pp = &p;

    // Values
    printf("Value using p: %d\n", *p);
    printf("Value using pp: %d\n", **pp);

    // Addresses of all three
    printf("Address of value: %p\n", (void *)&value);
    printf("Address of p: %p\n", (void *)&p);
    printf("Address of pp: %p\n", (void *)&pp);

    return 0;
}
