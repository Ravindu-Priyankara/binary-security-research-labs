# **Reverse Engineering Labs (radare2)**

This repository contains hands-on **binary reverse engineering labs** completed using
**radare2 and manual analysis** on ELF binaries.

The focus is on **understanding how binaries actually behave**, not tool automation, CTF shortcuts, or copy‑paste workflows.

These labs are built to train **control flow reasoning, compiler awareness, and runtime truth**, forming a solid base for exploitation, malware analysis, and low‑level security research.

---

## **Repository Structure**

```
re-labs/
├── lab01_basic_reversing
│   └── lab01_hello_world_analysis
│
├── lab02_control_flow
│   ├── lab02_1_simple_branching
│   ├── lab02_2_optimized_conditions
│   ├── lab02_3_pie_runtime_control
│   └── lab02_4_obfuscated_control_flow
```

---

## **Skills Trained**

* Control flow analysis (`cmp`, `test`, `jcc`, `cmov`)
* Register and flag reasoning
* PIE & ASLR awareness
* Runtime vs static analysis
* Manual patching and verification
* Compiler behavior and optimizations
* Security mechanism understanding (NX, Canary)
* Low-level execution thinking

---

## **Lab Conventions**

Each lab contains:

* `notes.md` with **concise technical observations**
* One proof run (log or screenshot)
* Source code or binary
* No automation frameworks
* No “magic” commands without understanding

Documentation is intentionally minimal to reflect **real-world reversing workflows**, not tutorials.

---

## **Tools Used**

* radare2
* rabin2
* r2pipe
* objdump
* readelf
* strings
* nm
* gcc (various optimization levels)
* checksec
* hexdump / xxd
* diff / cmp

---

## **Goal**

Build a **deep, correct mental model** of how binaries work — so that:

* exploitation becomes logical, not memorized
* protections make sense
* tools become extensions of thinking, not crutches

This repository is designed to produce **real reverse engineers**, not tool operators.

---