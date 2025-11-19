# Pointers

1. What is pointer?
    - Variables that store the memory address of another variable. 

2. Declare a Pointer
    ```c
    <data type> *<pointer name>;
    int *marks;
    ```

3. Assign value to pointer
    ```c
    int key = 1212; // assign 1212 to variable key
    int *keyPointer; // declare a pointer
    keyPointer = &key; //assign variable to pointer
    ```
    Or

    ```c
    int key = 1212; // declare a varible and assign value
    int *keyPointer = &key; // declare a pointer and assign varible
    ```

4. Display value using pointer
    ```c
    int number = 1234;
    int *numberAddress = &number;

    printf("%d\n",*numberAddress);
    ```

5. Display variable address
    ```c
    printf("%p\n",numberAddress); //address of number variable
    ```

6. Display pointer address
    ```c
    printf("%p\n",&numberAddress); // address of pointer
    ```

7. 