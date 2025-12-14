# Lab 02 – write() Optimized Shellcode

## Description

This is an **optimized variant** of a 64-bit Linux shellcode that prints
`"hello world\n"` to stdout using the `write()` syscall, then exits cleanly.

This version prioritizes:

* byte-size reduction
* register reuse
* stack-based string construction

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
* NULL-byte free

### Stack layout (top → bottom)

```

rsp → "hello world\n"

```

Implementation details:

* Push last 4 bytes: `"rld\n"`
* Push first 8 bytes: `"hello wo"`
* Use `rsp` as the buffer pointer for `write()`

---

## Raw Shellcode Bytes

```

6a 01
58
89 c7
68 72 6c 64 0a
48 bb 68 65 6c 6c 6f 20 77 6f
53
48 89 e6
6a 0c
5a
0f 05
6a 3c
58
31 ff
0f 05

```

---

## Shellcode Size

* **36 bytes**
* No padding
* No `ret`
* No NULL bytes

---

## Optimization Notes

* Reduced instruction count compared to v1 (48 → 36 bytes)
* Reused registers instead of reloading constants
* Stack used as both storage and buffer pointer
* No absolute addresses (fully PIC)

---

## Properties

* ✔ Null-free
* ✔ Position-independent (PIC)
* ✔ Works on modern x86_64 Linux

---

## Testing Environment

* **OS:** Ubuntu 22.04 LTS
* **Arch:** x86_64
* **Assembler:** NASM
* **Tools:** `objdump`, `readelf`, `gdb`, `pwndbg`, `strace`

---