# Stack Canary Bypass Labs

This directory contains focused labs exploring **stack canary mechanisms**, their enforcement logic, and practical bypass strategies.

The goal is to understand stack canaries **as a system**, not as a single trick — from identification and leakage to preservation and control-flow hijacking.

---

## Lab Structure

```
lab_01_Canary_Bypass_via_Flag_Manipulation_(GDB)
lab_02_Stack_Canary_Identification
lab_03_Format_String_Canary_Leak
lab_04_Canary-Preserving_Overflow
lab_05_Format_String_Exploit
```

Each lab targets a distinct aspect of stack canary behavior.

---

## Lab 01 — Canary Bypass via Flag Manipulation (GDB)

Explores bypassing stack canary enforcement by manipulating execution logic.

### Focus

* Canary check mechanics
* Conditional jumps and flags
* Skipping `__stack_chk_fail`

---

## Lab 02 — Stack Canary Identification

Focuses on locating and understanding the stack canary.

### Focus

* Canary placement in stack frames
* TLS storage (`fs:[0x28]`)
* Canary byte patterns and termination

---

## Lab 03 — Format String Canary Leak

Demonstrates leaking the stack canary via information disclosure.

### Focus

* Format string vulnerabilities
* Stack disclosure primitives
* Canary secrecy failure

---

## Lab 04 — Canary-Preserving Overflow

Demonstrates exploiting a vulnerable program **while preserving the canary**.

### Focus

* Payload construction with canary preservation
* Stack frame layout
* Control-flow hijacking without triggering protection

---

## Lab 05 — Format String → Canary Leak → Preserve → ret2win (No GDB)

This lab combines multiple vulnerability classes to demonstrate a realistic stack canary bypass without debugger-based manipulation.
Unlike earlier labs, this exploit is performed entirely through program input, simulating a real attack scenario.

### Focus

* Multi-stage exploitation in a single process
* Chaining information disclosure with memory corruption
* Stack canary bypass through leakage and preservation
* Control-flow hijacking without debugger assistance

---

## Conventions

Each lab contains:

* `notes.md` with minimal technical observations
* One proof screenshot
* Source code or binary

Documentation is intentionally concise and reflects real-world exploit development workflows.
