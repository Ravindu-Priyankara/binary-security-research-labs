#include <stdio.h>

int main() {
    int arr[3] = {1, 2, 3};
    int *ptr = arr;

    for (int i = 0; i < 3; i++) {
        *(ptr + i) = *(ptr + i) * 5;   // modify the array value
    }

    for (int i = 0; i < 3; i++) {
        printf("%d ", arr[i]);        // print updated array
    }

    printf("\n");
    return 0;
}
