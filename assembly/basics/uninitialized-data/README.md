# 1. **RESB / RESW / RESD / RESQ**

| Directive  | Meaning          | Size         |
| ---------- | ---------------- | ------------ |
| **resb N** | reserve N bytes  | 1 byte each  |
| **resw N** | reserve N words  | 2 bytes each |
| **resd N** | reserve N dwords | 4 bytes each |
| **resq N** | reserve N qwords | 8 bytes each |

Examples:

```asm
resb 10    ; 10 bytes
resw 4     ; 4 * 2 = 8 bytes
resd 3     ; 3 * 4 = 12 bytes
resq 2     ; 2 * 8 = 16 bytes
```

---

# 2. **.data + .bss**

```asm
section .data
    hello db "Hi!", 0

section .bss
    inputbuf resb 32      ; reserve 32 bytes
    number   resd 1       ; reserve 4 bytes

section .text
    global _start

_start:
    ; program code here
```

---

# 3. Explanation

```
.text
    - Contains instructions (executable code)
    - Read/execute, not writable

.data
    - Initialized variables
    - Values exist in the binary
    - Like: msg db "Hello",0

.bss
    - Uninitialized variables
    - RESB/RESW/RESD/RESQ allocate space
    - File size does not increase
    - Runtime sets them to ZERO
```