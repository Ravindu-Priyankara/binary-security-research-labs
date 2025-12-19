# NX Bypass & ROP Labs

This directory contains focused labs exploring **NX (Non-Executable stack)** enforcement and practical bypass techniques using **return-oriented programming (ROP)**.

The goal is to understand NX **as a system**, not as a single obstacle — from basic control-flow hijacking under NX to real-world, ASLR-safe `ret2libc` exploitation using staged leaks.

These labs emphasize **control flow**, **calling conventions**, and **linker/runtime behavior**, not automation.

---

## Lab Structure

```
lab_01_RIP_Control_Under_NX
lab_02_ret2win_(ret2text)
lab_03_NX_Bypass_via_ret2libc_(Static_Addresses)
lab_04_ret2libc_With_Leak_(ASLR_Safe)
```

Each lab isolates a single concept in NX bypass progression.

---

## Lab 01 — RIP Control Under NX

Establishes that NX does **not** prevent memory corruption or control-flow hijacking.

### Focus

* Stack-based buffer overflow
* Saved RIP overwrite
* NX execution policy boundaries
* Separation of overwrite vs execution prevention

---

## Lab 02 — ret2win (ret2text)

Demonstrates bypassing NX by redirecting execution to existing code within the binary.

### Focus

* Returning into `.text`
* Function epilogue behavior (`leave; ret`)
* NX irrelevance when reusing trusted code
* Minimal ROP (single return target)

---

## Lab 03 — ret2libc (Static)

Introduces classic NX bypass by executing libc functions directly.

### Focus

* `system("/bin/sh")` via libc
* System V AMD64 calling convention
* Argument control via `pop rdi ; ret`
* Stack alignment considerations
* ROP as manual function invocation

---

## Lab 04 — ret2libc With Leak (ASLR-Safe)

Demonstrates reliable NX bypass under ASLR using a staged exploit.

### Focus

* Information disclosure via GOT
* PLT as a controlled call site
* Runtime libc base calculation
* Multi-stage exploitation in a single process
* Returning to `main` for re-entry

---

## Exploitation Model Progression

```
overflow
→ RIP control
→ ret2text
→ ret2libc
→ leak → calculate → execute
```

Each lab removes an assumption made by the previous one.

---

## Conventions

Each lab contains:

* `notes.md` with concise technical observations
* One proof screenshot
* Source code or binary
* No automation or frameworks

Documentation is intentionally minimal and reflects **real exploit development workflows**, not CTF-style solutions.

---
