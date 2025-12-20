# **Control Flow Reversing Labs (Lab02)**

This directory contains focused labs exploring **control flow logic inside compiled binaries**, with emphasis on **branching, flags, compiler optimizations, and runtime behavior**.

The goal is to understand control flow **as a system**, not as a single `je/jne` decision — from simple conditional checks to **branchless logic**, **PIE runtime effects**, and **misleading static graphs**.

These labs emphasize **reasoning**, **runtime truth**, and **manual analysis using radare2**, not symbolic execution or automation.

---

## **Lab Structure**

```
lab02_1_simple_branching
lab02_2_optimized_conditions
lab02_3_pie_runtime_control
lab02_4_obfuscated_control_flow
```

Each lab isolates a single control-flow concept and removes assumptions made in the previous one.

---

## **Lab02.1 — Simple Branching Logic**

Introduces basic conditional execution paths and how they appear in assembly.

### Focus

* `cmp`, `test`, `je`, `jne`
* Flag-driven branching
* Mapping high-level `if` logic to assembly
* Identifying decision points in `.text`
* Manual branch forcing (runtime & static)

---

## **Lab02.2 — Optimized Conditions**

Demonstrates how compiler optimizations obscure obvious control flow.

### Focus

* `-O2 / -O3` effects
* Inlined comparisons
* Reduced or reordered branches
* Unexpected instruction layouts
* Why “no jump ≠ no condition”

---

## **Lab02.3 — PIE & Runtime Control Flow**

Explores how PIE and ASLR affect control flow analysis and patching.

### Focus

* Runtime vs static addresses
* PIE base calculation
* Breakpoints vs real execution
* Temporary (runtime) vs permanent (binary) control-flow changes
* Understanding relocation warnings and binary state

---

## **Lab02.4 — Obfuscated & Branchless Control Flow**

Demonstrates intentionally confusing control flow that defeats naïve analysis.

### Focus

* `cmov`-based logic (branchless decisions)
* Flag reuse and indirect conditions
* Why graph view can lie
* Register-driven truth vs visual flow
* Identifying *decision results*, not branches

---

## **Analysis Model Progression**

```
obvious branch
→ optimized condition
→ PIE runtime truth
→ branchless / deceptive logic
```

Each lab removes a simplifying assumption from the previous one.

---

## **Conventions**

Each lab contains:

* `notes.md` with concise technical observations
* One proof run (screenshot or log)
* Source code or compiled binary
* Manual r2 workflow only

Documentation is intentionally minimal and reflects **real reverse-engineering workflows**, not CTF walkthroughs.

---

## **What This Series Is (and Is Not)**

✔ Control flow theory\
✔ Binary decision analysis\
✔ Compiler reality\
✔ r2-centric reasoning

✘ Exploitation\
✘ Anti-debugging\
✘ Automation frameworks\

Those topics are intentionally separated into later lab series.

---

## **Outcome**

After completing Lab02, the analyst can:

* Identify *where* a decision is made
* Understand *how* it is enforced
* Override it at runtime or permanently
* Ignore misleading visual artifacts
* Trust registers and flags over graphs

This is the foundation for **advanced reversing, exploit development, and malware analysis**.

---