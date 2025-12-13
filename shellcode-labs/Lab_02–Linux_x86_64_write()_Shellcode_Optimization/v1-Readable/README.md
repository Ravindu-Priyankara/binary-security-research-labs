# Lab 02 – write() Shellcode

## Description

This is a **readable and educational variant** of a 64-bit Linux shellcode that prints
`"hello world\n"` to stdout using the `write()` syscall, then exits cleanly.

This version prioritizes:

* clarity
* explicit register setup
* easy auditing in disassembly

It serves as the **baseline** before moving into size and opcode optimizations.

---

## Syscalls Used

### write()

| Register | Value | Meaning                      |
| -------- | ----- | ---------------------------- |
| `rax`    | `1`   | syscall number (`sys_write`) |
| `rdi`    | `1`   | file descriptor (stdout)     |
| `rsi`    | `rsp` | pointer to buffer            |
| `rdx`    | `12`  | length of string             |

### exit()

| Register | Value | Meaning                     |
| -------- | ----- | --------------------------- |
| `rax`    | `60`  | syscall number (`sys_exit`) |
| `rdi`    | `0`   | exit status                 |

---

## String Construction

The string `"hello world\n"` is built **directly on the stack** to keep the shellcode:

* position-independent (PIC)
* free from absolute addresses
* null-byte free

### Stack layout (top → bottom)

```
rsp → "hello world\n"
```

Implementation:

* Push last 4 bytes: `"\nldr"`
* Push first 8 bytes: `"ow olleh"`
* Use `rsp` as buffer pointer

---


## Raw Shellcode Bytes

```
48 31 c0 48 ff c0
48 31 ff 48 ff c7
68 72 6c 64 0a
48 bb 68 65 6c 6c 6f 20 77 6f
53
48 89 e6
48 31 d2 b2 0c
0f 05
48 31 c0 b0 3c
48 31 ff
0f 05
```

---

## Shellcode Size

* **48 bytes**
* No padding
* No `ret`
* No NULL bytes

---

## Properties

* ✔ Null-free
* ✔ Position-independent (PIC)
* ✔ Works on modern x86_64 Linux
* ✔ Easy to disassemble and reason about

---

## Testing Environment

* **OS:** Ubuntu 22.04 LTS
* **Arch:** x86_64
* **Assembler:** NASM
* **Tools:** `objdump`, `readelf`, `gdb`, `pwndbg`, `strace`

---