# Control Flow Primitives & Position-Independent Shellcode Labs

This directory contains focused labs exploring **control-flow discipline and position-independent execution**, which are **foundational to real shellcode and egg hunter design**.

These labs are **not about exploitation outcomes** (no buffer overflows, no RIP hijacking, no ROP).
They exist to build **mechanical intuition** around how shellcode **moves, locates itself, loops, and survives relocation**.

The goal is to treat control flow as **a constrained resource** — not something you freely manipulate with absolute addresses — and to learn how shellcode **discovers its own location**, **controls execution paths**, and **accesses data without assumptions**.

---

## What These Labs Are *Not*

These labs intentionally **exclude**:

* Buffer overflows or memory corruption
* ASLR bypass techniques
* ROP chains or gadget hunting
* libc dependency
* High-level exploit frameworks

Those belong elsewhere.

This directory is about **movement before exploitation**.

---

## Lab Structure

```
lab_01_RIP_Relative_Addressing
lab_02_Call_Pop_Self_Location
lab_03_Jump_Logic_and_Loops
lab_04_Position_Independent_Data_Access
```

Each lab isolates **one control-flow primitive** that shellcode must master to function reliably in unknown memory layouts.

---

## Lab 01 — RIP-Relative Addressing

Introduces **execution flow without absolute jumps** and reinforces how shellcode must move using only relative offsets.

### Focus

* Short and near jumps
* Label-relative control flow
* Forward and backward jumps
* Stack-safe execution movement
* No hardcoded addresses

This lab establishes that **movement must be relative**, or shellcode breaks instantly under relocation.

---

## Lab 02 — Call–Pop Self Location Discovery

Introduces the **canonical shellcode technique** for discovering runtime addresses.

### Focus

* `jmp` → `call` → `pop` pattern
* Retrieving instruction pointer indirectly
* Position-independent string references
* Data colocated with code
* Runtime address discovery without RIP access

This lab explains how shellcode **finds itself**.

---

## Lab 03 — Jump Logic and Loops

Explores **controlled repetition and conditional execution** without corrupting state.

### Focus

* Loop construction without `loop` instruction
* Conditional jumps
* Register lifecycle across syscalls
* Why some registers become garbage after syscalls
* Silent logic corruption vs crashes

This lab demonstrates how shellcode **keeps running without destroying itself**.

---

## Lab 04 — Position-Independent Data Access (PIC)

Demonstrates safe data traversal when **static addresses do not exist**.

### Focus

* JMP–CALL–POP + data walking
* Register recycling under syscall pressure
* Avoiding register clobbering
* Byte-wise data access
* Null-terminated data traversal

This lab connects **control flow and data access**, which is critical for egg hunters and staged payloads.

---

## Conceptual Throughline

Across all labs:

* Control flow is **deliberate, minimal, and reversible**
* No instruction is assumed to be “safe”
* Registers are treated as volatile resources
* Code must survive relocation and reuse
* Failures often produce **wrong behavior, not crashes**

These are the same failure modes seen in real shellcode and exploit payloads.

---

## Conventions

Each lab contains:

* Minimal assembly
* One focused concept
* A working binary
* `notes.md` with technical observations
* No automation, no abstraction

Documentation reflects **low-level reasoning**, not tutorials.

---

## Why This Matters

Advanced payloads fail not because of missing exploits — but because of **broken control flow**.

If you cannot reliably:

* move execution
* find your own code
* loop without corruption
* access data position-independently

then egg hunters, polymorphic shellcode, and loaders will fail silently.

This directory exists to eliminate that weakness.

---
