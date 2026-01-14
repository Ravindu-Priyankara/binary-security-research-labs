# ELF Internals & Execution Labs

This directory contains **low‑level ELF reverse‑engineering labs** focused on how Linux binaries are **identified, mapped, and executed** by the kernel and loader.

The goal is not to “learn ELF” academically —
the goal is to **see how reality works**: how bytes become memory, how headers control execution, and how attackers abuse those rules.

These labs model the ELF file the same way **malware, packers, and loaders** do.

---

## Lab Structure

```
lab_01_ELF_Identity_Fields
lab_02_EI_CLASS_Is_Not_Truth
lab_03_EI_DATA_Corruption_Experiment
lab_04_e_machine_is_not_the_cpu
lab_05_Program_Headers_Define_Reality
lab_06_Program_Headers_define_execution
lab_07_e_entry_Is_Just_a_Pointer
lab_08_Memory_Permissions_Control_Execution
lab_09_Section_Header_Identity
```

Each lab isolates **one ELF truth** that most tools hide.

No automation.
No frameworks.
Only headers, offsets, and memory.

---

## Lab 01 — ELF Identity Fields

Establishes that **ELF identity is just metadata**, not truth.

### Focus

* `e_ident` fields
* ELF class vs real architecture
* How loaders decide “what this file is”
* How spoofed identity breaks tools

This lab proves that **file format ≠ reality**.

---

## Lab 02 — EI_CLASS Is Not Truth

Demonstrates that **32‑bit vs 64‑bit is just a flag** — not an enforced rule.

### Focus

* `EI_CLASS` manipulation
* Loader behavior vs static tools
* How malware lies about bitness
* Toolchain trust failures

---

## Lab 03 — EI_DATA Corruption Experiment

Shows how **endianness controls meaning**.

### Focus

* `EI_DATA`
* Byte‑order interpretation
* How corruption alters execution
* Why cross‑platform parsing is dangerous

---

## Lab 04 — e_machine Is Not the CPU

Proves that **architecture fields do not define execution**.

### Focus

* `e_machine`
* Kernel vs loader validation
* Cross‑architecture tricks
* Anti‑analysis via header mismatch

---

## Lab 05 — Program Headers Define Reality

Introduces the **real power** in ELF.

### Focus

* `PT_LOAD`
* Virtual memory mapping
* File → memory translation
* Why sections do not matter to the kernel

---

## Lab 06 — Program Headers Define Execution

Extends PHDR control into execution flow.

### Focus

* Entry segments
* Loader decisions
* How code gets executable memory
* What really starts a program

---

## Lab 07 — `e_entry` Is Just a Pointer

Destroys the myth of “program start”.

### Focus

* `e_entry`
* Jump redirection
* Hidden loaders
* Execution detours

---

## Lab 08 — Memory Permissions Control Execution

Shows how **execution is a permission, not a location**.

### Focus

* RX vs RWX memory
* How packers and malware bypass NX
* Loader vs runtime protection

---

## Lab 09 — Section Header Identity

Explains why **sections are for humans, not the kernel**.

### Focus

* Section header table
* `.shstrtab`
* Name resolution
* Malware hiding code in fake or misleading sections

---

## Mental Model

```
ELF bytes
→ headers
→ memory
→ permissions
→ execution
```

These labs follow the same path the **Linux loader** does.

---

## Conventions

Each lab contains:

* `notes.md` with technical observations
* One proof screenshot
* A binary or source file
* No scripts
* No tooling shortcuts

Everything is done the way **real reverse engineers** work:
hex, offsets, and memory.

---
