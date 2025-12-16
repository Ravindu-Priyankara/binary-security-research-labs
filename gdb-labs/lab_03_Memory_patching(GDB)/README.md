# GDB Memory & Control-Flow Labs

This repository contains hands-on labs focused on **runtime analysis, memory inspection, and execution control** using GDB.
The goal is to move beyond theory and build **practical debugger-driven exploitation intuition**.

Labs progress from basic data patching to advanced dynamic memory and control-flow manipulation.

---

## Lab Structure

```
lab_01_Patch_Variables_at_Runtime_(Data Patching)
lab_02_Patch_Instructions_(Code Patching)
lab_03_Patch_Control_Flow_(Advanced)
lab_04_Memory_Analysis_&_Dumping
lab_05_Dynamic_Memory_&_Patching
```

Each lab is self-contained and focuses on a specific exploitation primitive.

---

## Lab 01 — Patch Variables at Runtime (Data Patching)

This lab introduces **runtime data manipulation** using GDB.

### Focus Areas

* Stack and global variables
* Runtime value modification
* Condition bypass via data patching

### Techniques Practiced

* Variable inspection
* Stack memory analysis
* Direct memory writes in GDB

---

## Lab 02 — Patch Instructions (Code Patching)

This lab focuses on **instruction-level patching** to alter program behavior.

### Focus Areas

* Disassembly analysis
* Conditional jumps (`je`, `jne`)
* NOP and opcode replacement

### Techniques Practiced

* Instruction decoding
* Runtime opcode patching
* Control-flow alteration

---

## Lab 03 — Patch Control Flow (Advanced)

This lab explores **direct execution hijacking**.

### Focus Areas

* PIE base calculation
* Instruction pointer (`RIP`) manipulation
* Jumping to hidden or unreachable code

### Techniques Practiced

* Runtime address calculation
* `RIP` patching
* Call vs jump behavior

---

## Lab 04 — Memory Analysis & Dumping

This lab focuses on **memory visibility and state comparison**.

### Focus Areas

* Virtual memory layout
* Stack vs data segment analysis
* Snapshot-based memory comparison

### Techniques Practiced

* `vmmap` / `info proc mappings`
* Memory dumping
* Binary diffing (`cmp`, `diff`)

---

## Lab 05 — Dynamic Memory & Patching

This lab combines **data patching, instruction patching, and live memory tracking**.

### Focus Areas

* Conditional execution paths
* Watchpoints vs breakpoints
* Runtime instruction and data manipulation

### Techniques Practiced

* Watchpoints
* Conditional patches
* Memory diff validation
* Safe exploit simulation via GDB

---

## Lab Conventions

Each lab contains:

* `notes.md` with minimal observations
* One or more proof screenshots
* Source code or compiled binary

The emphasis is on **clarity, correctness, and execution insight** — not automation or exploitation frameworks.

