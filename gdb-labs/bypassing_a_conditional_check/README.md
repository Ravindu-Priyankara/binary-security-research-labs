# Bypassing a Conditional Check

This document explains **how to inspect and modify program state during debugging** using GDB.

---

## Method A — Modifying a Stack Variable During Debugging

In this method, we inspect the stack layout and manually adjust a local variable to explore program flow.

### Steps

1. **Set a breakpoint** at the instruction where the comparison happens:

   ```gdb
   break *<cmp_address>
   ```

2. **Inspect RBP** to understand the stack frame:

   ```gdb
   info registers rbp
   ```

3. Calculate the target variable’s address using the offset:

   * Example assembly:

     ```
     cmp DWORD PTR [rbp-0x4], 0x0
     ```

     The variable is located at `rbp - 0x4`.

4. **Write a new value** to that stack variable:

   ```gdb
   set {int}0x<calculated_address> = 1
   ```

By changing the variable value before the comparison, the program follows the alternate branch during execution. This is useful for understanding control flow and testing different paths in your own code.

---

## Method B — Redirecting Execution by Editing RIP

Here we modify the instruction pointer after a conditional jump to observe how the program behaves when entering different branches.

### Steps

1. **Set a breakpoint** on the conditional jump (`je`, `jne`, etc.).

2. When paused, update `rip` to the target instruction you want to execute:

   ```gdb
   set $rip = 0x<target_address>
   ```

GDB will resume execution from the address you provide, letting you test alternative branches without modifying the binary.

---

## Method C — Jumping Directly to a Target Instruction

GDB provides a simple way to jump to any instruction during execution.

### Steps

1. Start the program and run until any breakpoint.
2. Use:

   ```gdb
   jump *0x<address>
   ```

Execution continues from the target instruction, allowing you to inspect behavior across different code paths.

---