# Pointer to Pointer

# Pointer to Pointer (Double Pointer)

## 1. What is a Pointer to Pointer?

A **pointer to pointer** is a variable that stores the address of another pointer.

It creates *two levels of indirection*:

- Level 1 → pointer stores address of a variable  
- Level 2 → pointer-to-pointer stores address of that pointer  

Think of it like a chain:

- value → stored in memory
- p → stores address of value
- pp → stores address of p


---

## 2. Declaration

```c
int value = 10;
int *p = &value;   // pointer to int
int **pp = &p;     // pointer to pointer to int
```

Here:
- p points to value
- pp points to p

## 3. Accessing the Value
Value itself:
```c
value        // 10
```

Using pointer:

```c
*p           // 10
```
Using pointer → pointer:

```c
**pp         // 10
```

Double dereference **pp means:
- Go to the address stored in pp → get p → dereference p → get value.

## 4. Printing Everything (Addresses + Values)
```c
printf("value: %d\n", value);
printf("*p: %d\n", *p);
printf("**pp: %d\n", **pp);

printf("address of value: %p\n", (void *)&value);
printf("address stored in p: %p\n", (void *)p);
printf("address of p: %p\n", (void *)&p);
printf("address stored in pp: %p\n", (void *)pp);
printf("address of pp: %p\n", (void *)&pp);
```
## 5. Memory Diagram (Stack)

```c
Stack Memory
---------------------------------------------------
0x7ffd12f4c8b0 : [ 10 ]               <-- value
0x7ffd12f4c8a8 : [ 0x7ffd12f4c8b0 ]    <-- p  (stores &value)
0x7ffd12f4c8a0 : [ 0x7ffd12f4c8a8 ]    <-- pp (stores &p)
---------------------------------------------------
```

## 6. Why Double Pointers Matter
Double pointers are essential for:
- ✔ Dynamic memory allocation (e.g., modifying a pointer inside a function)

```c
void allocate(int **pp) {
    *pp = malloc(sizeof(int));
}
```

✔ Passing pointers by reference
- Used when a function must modify the caller’s pointer.

✔ 2D arrays (as int**)
- For dynamic matrix allocation.

✔ Linked lists, trees, complex structs
- Used to modify head pointers.

✔ Exploit development
- Double pointers appear in:
    - function pointer tables
    - GOT/PLT overwrites
    - heap chunk metadata
    - pointer dereference chains

## 7. Common Mistakes
### ❌ Forgetting the number of dereferences
```c
printf("%d", *pp);   // WRONG → prints p's address as integer
printf("%d", **pp);  // CORRECT → prints actual value
```

### ❌ Misunderstanding the type
```c
p  → int*
pp → int**
```
### ❌ Confusing address levels
Always ask:
- What does it POINT TO?
- What does it STORE?

