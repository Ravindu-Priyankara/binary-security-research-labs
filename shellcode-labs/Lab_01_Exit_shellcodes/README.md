# **Exit Shellcode Variants – What Changed & What I Learned**

This repository documents the evolution of a minimal `exit(0)` shellcode on **x86_64 Linux**, showing how small details at assembly level matter in real exploit scenarios.

---

## **V1 – Safe but Verbose**

**Concept:** Clear registers explicitly, then invoke syscall.

**Characteristics:**

* Correct in all contexts
* Uses full 64‑bit clears (`xor rax, rax`)
* Slightly larger byte size

**Lesson:**

> Correctness comes first, even if byte count is higher.

---

## **V2 – Smaller but Buggy**

**Concept:** Optimize size by loading syscall number directly into `al`.

**Problem:**

* `mov al, 60` only overwrites **8 bits** of `RAX`
* If `RAX` contains garbage (common in exploits), syscall number becomes invalid

**Lesson:**

> Partial register writes can silently break shellcode in hostile environments.

---

## **V3 – Optimal and Exploit‑Grade**

**Concept:** Load syscall number using stack‑based technique.

### **Disassembly**

```
401000: 6a 3c      push 0x3c
401002: 58         pop  rax
401003: 31 ff      xor  edi, edi
401006: 0f 05      syscall
```

**Why this works:**

* `push` / `pop` guarantees **full `RAX = 60`**
* No dependency on previous register state
* No NULL bytes
* Smaller than V1 and safer than V2

**Lesson:**

> Stack tricks are powerful for safe, compact shellcode.

---

## **Comparison Summary**

| Version | Technique            | Exploit‑Safe | Bytes  | Key Insight       |
| ------- | -------------------- | ------------ | ------ | ----------------- |
| V1      | Full register clears | ✅            | Larger | Correct baseline  |
| V2      | `mov al, imm8`       | ❌            | Small  | Partial write bug |
| **V3**  | `push` / `pop`       | ✅            | Small  | Best balance      |

---

## **Final Takeaway**

> Shellcode is not about writing assembly that *works once* — it’s about writing assembly that works **everywhere**.

V3 represents the correct exploit‑developer mindset: **control the CPU state, don’t assume it.**