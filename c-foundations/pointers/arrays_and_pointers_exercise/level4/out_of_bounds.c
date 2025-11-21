#include <stdio.h>

void display(int value) {
    printf("%d\n", value);
}

int main() {
    int arr[2] = {10, 20};

    display(arr[0]);       // valid
    display(arr[1]);       // valid
    display(*(arr + 2));   // out-of-bounds
    display(*(arr + 3));   // out-of-bounds

    return 0;
}
