# Lab 01 — PIE Basics & GDB Navigation

## Goal

Understand how PIE affects runtime addresses, how to locate offsets, and how to reliably set breakpoints in PIE binaries using pwndbg + radare2.

---

## 1. Check the security properties

<img src="./assets/checksec.png" width="500">

* This confirms the binary is fully position independent.

## 2. Display file info / PIE sections

<img src="./assets/file_info.png" width="500">

* Useful for seeing `.text` boundaries, entry point, and segment layout.

## 3. Get the PIE base at runtime

<img src="./assets/piebase.png" width="500">

* This is the actual load address GDB uses.

## 4. Compute real addresses
```
runtime address = piebase + offset
```

## 5. Find offsets with radare2

    * r2 -A lab01
    * afl

<img src="./assets/Offset.png" width="500">

## 6. Set breakpoints using raw offsets

```
b * (piebase + offset)
```

<img src="./assets/main-breakpoint.png" width="500">

## 7. Assembly view in GDB

<img src="./assets/main.png" width="500">
<img src="./assets/main-disassembled.png" width="500">

##  What I Learned

- How to find offsets using radare2.  
- How PIE shifts addresses at runtime.  
- How to compute real addresses with PIE.  
- How to set precise breakpoints using offsets.  
- How to use pwndbg layouts for assembly-level debugging.
