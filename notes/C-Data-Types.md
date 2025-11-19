### ✅ Data types in C
|Type|printf() with| scanf() with| Notes|
|----|-------------|-------------|------|
|char|`%c`|`%c`|Used for printing a single character. If you want to print its integer value, use %d.|
|int|`%d` or `%i`|`%d` or `%i`|The most common specifier for whole numbers.|
|short|`%hd` or `%hi`|`%hd` or `%hi`|The h modifier indicates a short integer type.|
|long|`%ld` or `%li`|`%ld` or `%li`| The l modifier indicates a long integer type.|
|longg long| `%lld` or `%lli`| `%lld` or `%lli`|Usellfor the C99 standard's long long type.|

### ✅ Data types with sizes
|Type|size| Description| usage|
|----|-------------|-------------|------|
|char|`1 byte`|Used to store a single character (like 'a', 'Z', '9') or a small integer. It is the smallest addressable unit of memory.|Storing single characters, or when working with raw bytes of data (e.g., in network programming, reading/writing files, or shellcode manipulation).|
|int|`2or4 byte`|The most natural size for integers on the computer architecture.|Storing whole numbers for general counting, loops, and basic arithmetic.|
|short|`2 byte`|A smaller integer type.|When you need a whole number but want to save memory and know the value won't exceed ±32,767.|
|long|`4 or 8 byte`|A larger integer type.|When you expect integer values to exceed the limits of a standard int.|
|float|`4 bytes`|Used for single-precision floating-point numbers (numbers with a decimal point).|Calculations requiring less precision or for basic scientific/engineering math.|
|double|`8 bytes`|Used for double-precision floating-point numbers. This is the default type for decimal numbers in C.|Calculations requiring high precision, which is most common for scientific or graphical applications|

## Size Modifiers (Qualifiers)

You can modify the base integer types (char, short, int, long) using the following qualifiers:

- `signed`: Allows storage of positive and negative values (default for `int`, `short`, and `long`).

- `unsigned`: Allows storage of only `positive values`, doubling the maximum positive range. `Critical for exploit development` when dealing with `memory addresses`, `sizes`, or `array indices`, which are always `non-negative`.

    - Example: `unsigned int address`;

## Derived Types (Crucial for System Programming)

- `Arrays`: A collection of data of the same type stored in contiguous memory locations. This is fundamental to C and directly tied to `memory management` (and `buffer overflows`).

    - Example: `char shellcode[500];`

- `Pointers (*)`: Variables that store the memory address of another variable. Absolutely essential for low-level tasks like `shellcoding` and `exploit development`, which require direct manipulation of memory, function addresses, and the stack.

    - Example: `int *ptr; or char *buffer_ptr;`

- `Structures (struct)`: A user-defined data type that groups related variables (which can be of different types) under a single name. Used to `model complex data`, such as file headers or operating system objects.