# Shellcode Labs

This repository contains hands-on **Linux x86_64 shellcode development labs** focused on correctness, size optimization, and exploit-grade reliability.

The emphasis is on **manual instruction selection, byte-level control, and iteration**, not framework-based payload generation.

---

## Repository Structure

```
shellcode-labs/
├── Lab_01_exit_shellcode
│   ├── v1-safe
│   ├── v2-short-but-buggy
│   └── v3-exploit-grade
├── Lab_02–Linux_x86_64_write()_Shellcode_Optimization
│   ├── v1-Readable
│   └── v2-Optimized
```

---

## Skills Trained

* Linux syscall interface (x86_64)
* Register-level calling conventions
* Null-byte and bad-byte avoidance
* Instruction size optimization
* Stack-based string construction
* Payload reliability vs minimal size tradeoffs

---

## Lab Structure

Each lab is implemented in **multiple versions** to demonstrate:

* Correct but verbose implementations
* Size-optimized variants
* Exploit-grade payloads suitable for real use

Each version typically includes:

* Assembly source
* Minimal notes on design decisions
* Byte-size and behavior validation

---

## Tools Used

* NASM
* objdump
* GDB
* ld / gcc
* objcopy
* xxd

---

## Goal

Develop **reliable, minimal, and controlled shellcode** as a foundation for:

* Exploit development
* CTF challenges
* Advanced payload engineering