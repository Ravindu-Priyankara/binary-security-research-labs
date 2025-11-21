#include <stdio.h>

int main() {
    int arr[5] = {10, 20, 30, 40, 50};
    int *end = arr + 4;

    while (end >= arr) {
        printf("%d ", *end);
        end--;
    }

    printf("\n");
    return 0;
}
