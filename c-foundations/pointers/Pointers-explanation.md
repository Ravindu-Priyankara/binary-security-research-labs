# Pointers (Low-Level Deep Dive)

## 1. What is a Pointer?

A **pointer** is a variable that stores the *memory address* of another variable.

In low-level programming and exploit development, understanding pointers means understanding:
- memory layout  
- stack frames  
- referencing vs dereferencing  
- how data actually moves through RAM  

A pointer does *not* store a value — it stores a *location*.

---

## 2. Declaring a Pointer

```c
<data_type> *<pointer_name>;
int *marks;
```
* does NOT mean multiplication here.
It tells the compiler: “this variable stores an address of an int.”

## 3. Assigning a Value to a Pointer
### Method 1 — Declare first, assign later

```c
int key = 1212;        // value stored normally
int *keyPointer;       // pointer declaration
keyPointer = &key;     // & gives the memory address of 'key'
```

### Method 2 — Declare + assign in one line

```c
int key = 1212;
int *keyPointer = &key;
```
- `&` → address-of operator
- `*` → dereference operator

## 4. Display Value Through a Pointer (Dereferencing)

```c
int number = 1234;
int *numberAddress = &number;

printf("%d\n", *numberAddress); // prints 1234
```
Dereferencing `(*pointer)` means:
- Go to the memory address stored in the pointer and read the value there.

## 5. Display the Variable’s Address
```c
printf("%p\n", numberAddress);
```
This prints the address where `number` lives on the stack.

Example (will vary):

```bash
0x7ffc5b2c8f14
```

## 6. Display the Pointer’s Own Address
Pointers are variables too — so they also live somewhere in memory.

```c
printf("%p\n", &numberAddress);
```

This shows where the pointer itself is stored.

## 📌 Memory Diagram (Visual)

```bash
number = 1234
numberAddress = &number

Stack Memory
-------------------------
0x7ffdf42c8f14 : [ 1234 ]   <-- 'number'
0x7ffdf42c8f08 : [ 0x7ffdf42c8f14 ]  <-- 'numberAddress' (pointer)
-------------------------
```
- Pointer stores: `0x7ffdf42c8f14`
- Dereferencing reads: `1234`

## Printing Addresses with `%p` and Why We Cast to `(void*)`

When printing a memory address using `printf`, the correct format specifier is **%p**.

By the C standard, `%p` **expects a `void*`**, not an `int*`, `char*`, or any other pointer type.

So while this works on many compilers:

```c
printf("%p\n", &y);
```
It is technically not correct, because &y is of type int*.\
The 100% standard-correct and warning-free version is:

```c
printf("%p\n", (void *)&y);
```

Why cast to `(void*)`?
- `void*` is the universal pointer type in C.
- `%p` requires a `void*`. 
- Casting removes warnings and follows the C standard.

## 🧠 Why Pointers Matter in Exploit Development
Pointers directly relate to:
- Buffer overflows
- Stack smashing
- RIP/EIP control
- Function pointer hijacking
- Shellcode execution
- ROP chains
- Memory corruption

If you don’t understand pointers deeply, exploit development becomes impossible.

## ⚠️ Common Mistakes (And Why They Matter)
### ❌ Using an uninitialized pointer

```c
int *p;
printf("%d", *p); // undefined behavior
```
This can cause:
- segmentation fault
- reading random memory
- leaking stack data (in CTFs)

### ❌ Writing to an invalid pointer
```c
int *p = 0;  
*p = 10; // writes to NULL → crash
```

### ❌ Forgetting that arrays decay into pointers
```c
int arr[4];
printf("%p", arr);   // prints address
```
arr is not a pointer, but it decays into one in many expressions.

### ❌ Confusing address-of vs dereference

```kotlin
&var  → gives memory location  
*ptr → reads/writes data in that location
```

## 🔍 Pointer Arithmetic (Essential for Exploits)
When you increment a pointer:
```c
int *p;
p++;
```
It doesn't move by 1 byte.\
It moves by sizeof(int) bytes.

Pointers move type size steps.

This matters for:

- walking through buffers
- crafting payload offsets
- understanding stack alignment

