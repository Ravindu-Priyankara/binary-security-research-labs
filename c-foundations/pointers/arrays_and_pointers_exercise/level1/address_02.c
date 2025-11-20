#include <stdio.h>

int main() {
    int arr[5] = {10, 20, 30, 40, 50};

    for (int i = 0; i < 5; i++) {
        printf("%p\n", (void *)(arr + i));   // print address of each element
    }

    return 0;
}
