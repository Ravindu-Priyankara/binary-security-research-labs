# **Program Headers Define Execution**

## Purpose

Understand how **PT_LOAD segments define execution and memory behavior**, and how section concepts are **inferred**, not loaded.

---

## Draw a Memory Map

| PT_LOAD | File Range            | Memory Range           | Perms  |
| ------- | --------------------- | ---------------------- | ------ |
| #1      | 0x000000 – 0x000638   | 0x000000 – 0x000638    | R--    |
| #2      | 0x001000 – 0x001175   | 0x001000 – 0x001175    | R-X    |
| #3      | 0x002000 – 0x002184   | 0x002000 – 0x002184    | R--    |
| #4      | 0x002db8 – 0x003010   | 0x003db8 – 0x003018    | RW-    |
| -----   | --------------------- | ---------------------- | ------ |

> Memory ranges are calculated using `p_vaddr + p_memsz`.

---

## Categorizing PT_LOAD Segments

> **Important:** These categories are **inferred** from flags and sizes.
> The kernel does **not** know section names.

---

## 1. PT_LOAD with **R-X** → Code Segment

| PT_LOAD | File Range          | Memory Range        | Perms |
| ------- | ------------------- | ------------------- | ----- |
| #2      | 0x001000 – 0x001175 | 0x001000 – 0x001175 | R-X   |

**Reasoning**

* `PF_X` → executable
* `PF_R` → readable
* No write permission

**This segment contains (conceptually):**

* `.text`
* `.plt`
* `.init`, `.fini`

**This is the only segment where execution is allowed**

---

## 2. PT_LOAD with **R--**, file-backed → Read-Only Data

| PT_LOAD | File Range          | Memory Range        | Perms |
| ------- | ------------------- | ------------------- | ----- |
| #3      | 0x002000 – 0x002184 | 0x002000 – 0x002184 | R--   |

**Reasoning**

* Read-only
* `p_filesz == p_memsz` → fully file-backed
* No execute, no write

**This segment contains (conceptually):**

* `.rodata`
* string literals
* constants

Used heavily by format strings, config data, hardcoded values.

---

## 3. PT_LOAD with **RW-**, `p_memsz > p_filesz` → Writable Data + BSS

| PT_LOAD | File Range          | Memory Range        | Perms |
| ------- | ------------------- | ------------------- | ----- |
| #4      | 0x002db8 – 0x003010 | 0x003db8 – 0x003018 | RW-   |

**Reasoning**

* Writable memory
* `p_memsz > p_filesz` → zero-initialized tail

**Breakdown**

* File-backed part → `.data`
* Zero-filled part → `.bss`

Kernel behavior:

1. Maps `p_memsz`
2. Copies `p_filesz`
3. Zero-fills the rest

---

## 4. PT_LOAD with **R--**, low address → ELF Metadata

| PT_LOAD | File Range          | Memory Range        | Perms |
| ------- | ------------------- | ------------------- | ----- |
| #1      | 0x000000 – 0x000638 | 0x000000 – 0x000638 | R--   |

**Reasoning**

* Low virtual address
* Read-only
* Contains ELF + PHDR region

**This segment contains:**

* ELF header
* Program headers
* Loader metadata

- Not code
- Not data
- Required for loading

---

## Key Takeaways

* The kernel loads **segments**, not sections
* `.text`, `.data`, `.bss`, `.rodata` are **linker concepts**
* Execution, permissions, and memory layout are defined **only by PT_LOAD**
* Exploits and malware operate at the **segment level**

> **If it’s not in a PT_LOAD, it does not exist at runtime.**

---