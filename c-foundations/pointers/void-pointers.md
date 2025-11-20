# Void Pointers

## What is a void pointer?
A void pointer (`void *`) is a special type of pointer that does **not** have a data type associated with it.  
This means:

- It can store the address of **any** data type (`int`, `char`, `float`, structs, arrays, etc.).
- Before dereferencing it, you **must cast it** to the correct pointer type.
- Commonly used for generic data handling, memory allocation, and low-level system programming.

---

## Create a void pointer called X
```c
void *X;
```

X can point to any variable, for example:

```c
int a = 10;
X = &a;  // valid

float b = 3.14;
X = &b;  // valid
```

But you must cast to read the value:

```c
printf("%d", *(int *)X);     // if X points to int
printf("%f", *(float *)X);   // if X points to float
```

Key Points
- void * cannot be dereferenced directly.
- No arithmetic allowed (X++ not allowed).
- Widely used in functions like malloc(), which return void *.

