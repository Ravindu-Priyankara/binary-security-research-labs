# 💥 Overwriting Structure Members

Overwriting structure members typically occurs when a program allows **more data to be written into a structure's buffer** than it was allocated to hold. This is a classic **Buffer Overflow** scenario, but confined within the boundaries of a single structure.

### 1\. The Vulnerable Structure

Consider a scenario where a structure contains a local buffer followed immediately by a critical piece of data (e.g., a state flag or a function pointer).

```c
struct Config {
    char username[32];   // Local buffer, 32 bytes
    int is_admin;        // Critical field, 4 bytes
    char *session_key;   // Pointer, 8 bytes (on 64-bit systems)
};
```

In memory, due to the default alignment rules (assuming 4-byte alignment and no padding between `username` and `is_admin`), the layout is sequential:

| Member | Offset (Bytes) | Size |
| :--- | :--- | :--- |
| `username[32]` | 0 | 32 |
| `is_admin` | 32 | 4 |
| `session_key` | 36 | 8 |

-----

## 🎯 Techniques for Overwriting

The goal of the attack is to write past the end of the `username` buffer (offset 0 to 31) and overwrite the `is_admin` field (starting at offset 32).

### A. Overwriting an Adjacent Scalar (State Change)

This is the simplest form of exploitation: changing a security-relevant state flag.

1.  **Vulnerable Code:** A function uses an unsafe copy routine like `strcpy` or `gets` that does not check the destination buffer size.

    ```c
    void process_config(struct Config *c, const char *input) {
        // Vulnerable call: copies attacker-controlled 'input' into 'c->username'
        strcpy(c->username, input);
        // If input > 32 bytes, 'is_admin' will be overwritten.
    }
    ```

2.  **Exploit Input:** The attacker crafts an input string of exactly **33 bytes** where:

      * Bytes $0-31$ are junk data (to fill the buffer).
      * Byte $32$ is the first byte of the new value for `is_admin`.

3.  **Result:** To become an administrator, the attacker must set `is_admin` to a non-zero value (e.g., `1`). The attacker sends $32$ bytes of junk followed by the 4-byte integer value $1$.

      * `username` is filled.
      * `is_admin` is overwritten from $0$ to $1$. The attacker is now granted administrative privileges by the subsequent logic check (`if (c->is_admin)`).

### B. Overwriting an Adjacent Pointer (Control Flow Hijacking)

This is a more powerful attack where the goal is to overwrite a **pointer field** to an address controlled by the attacker. This often leads to an **Arbitrary Write Primitive** or **Control Flow Hijacking** (especially if the pointer is a function pointer).

1.  **Exploit Input:** The attacker must write $36$ bytes of data (32 for `username` + 4 for `is_admin`) followed by the 8-byte target address for the new `session_key` pointer.

      * Attacker payload: $\text{Junk} [32\text{ bytes}] + \text{Junk} [4\text{ bytes}] + \text{Target Address} [8\text{ bytes}]$.

2.  **Result:** The `session_key` pointer now points to the **Target Address**. If the program later attempts to write data to `session_key` (e.g., `strcpy(c->session_key, "new data");`), the attacker has successfully forced the program to **write data to a memory location of their choice**.

-----