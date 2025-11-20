#include <stdio.h>

int main() {
    int arr[5] = {10, 20, 30, 40, 50};
    int *ptr = arr;
    int sum = 0;

    // Sum using pointer only
    while (ptr < arr + 5) {
        sum += *ptr;   // dereference the pointer
        ptr++;         // move pointer to next int
    }

    printf("Sum = %d\n", sum);

    return 0;
}
