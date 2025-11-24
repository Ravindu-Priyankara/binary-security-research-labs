
# Linked Lists: Structure and Comparison

[![Data Structure](https://img.shields.io/badge/Structure-Linear-blue)](https://en.wikipedia.org/wiki/Data_structure)
[![Time Complexity](https://img.shields.io/badge/Access-O(n)-red)](https://en.wikipedia.org/wiki/Linked_list)

A **Linked List** is a fundamental linear data structure that manages a collection of elements (called **nodes**) where the nodes are linked to one another via **pointers** or **references**. Unlike arrays, nodes are not stored in contiguous memory locations.

---

## Node Structure

Every element in a linked list is a **Node**. Each node typically contains two key parts:

1.  **Data:** The actual value or information stored in the node.
2.  **Link (or Next):** A pointer (memory address) to the next node in the sequence.

```mermaid
graph LR
    A[Node] --> B{Data};
    A --> C{Link / Next};
    C --> D[Next Node's Address];
````

-----

## Types of Linked Lists

Linked lists are classified based on their connection and traversal mechanism:

| Type | Description | Navigation | Terminal Condition |
| :--- | :--- | :--- | :--- |
| **Singly Linked List** | Each node points only to the next node. | **Forward Only** | Last node links to `NULL`. |
| **Doubly Linked List** | Each node contains a **Next** pointer and a **Previous** pointer. | **Forward and Backward** | Head's previous is `NULL`, Tail's next is `NULL`. |
| **Circular Linked List** | The link/pointer of the last node points back to the first node. | Forms a continuous loop. | No `NULL` pointer. |

-----

## Singly Linked List (SLL) Deep Dive

The SLL is the simplest form, characterized by unidirectional traversal.

### Structure Diagram

The list is accessed via the **Head** pointer, which holds the address of the first node.

```
+------+
| HEAD |
+------+
   |
   V
+-----------+     +-----------+     +-----------+
| DATA: 12  | --> | DATA: 13  | --> | DATA: 14  | --> NULL
| NEXT: 2000|     | NEXT: 3000|     | NEXT: NULL|
+-----------+     +-----------+     +-----------+
Address: 1000   Address: 2000   Address: 3000
```

  * **Head:** Pointer to the first element (Address 1000).
  * **Traversal:** Movement is possible only from one node to its subsequent node.
  * **End:** The list terminates when the `Link` pointer is `NULL`.

-----

## Array vs. Linked List Comparison

The key difference lies in memory allocation and the resulting performance trade-offs.

### Array Characteristics

| Feature | Description | Example (Int = 4 bytes) |
| :--- | :--- | :--- |
| **Memory** | **Contiguous** (Consecutive blocks in memory). | Addresses: `1000`, `1004`, `1008` |
| **Access** | **Random Access (O(1))**. Elements accessed via calculated index. | `list[i]` is immediate. |
| **Insertion/Deletion** | **Slow (O(n))**. Requires shifting subsequent elements. | Inserting at the front is costly. |
| **Size** | **Fixed** or requires resizing. | Size is often set at initialization. |

### Linked List Characteristics

| Feature | Description | Example |
| :--- | :--- | :--- |
| **Memory** | **Non-Contiguous**. Nodes are scattered but linked. | Addresses: `1000`, `2000`, `3000` (Anywhere in memory) |
| **Access** | **Sequential Access (O(n))**. Requires traversing from the Head. | Finding the $i$-th element requires $i$ steps. |
| **Insertion/Deletion** | **Fast (O(1))** if the node location is known. | Requires only updating a few pointers. |
| **Size** | **Dynamic**. Grows and shrinks easily at runtime. | Memory is allocated node-by-node. |

-----

## Summary of Trade-offs

| Operation | Array Time Complexity | Linked List Time Complexity |
| :--- | :--- | :--- |
| **Access/Lookup** | **O(1)** (Excellent) | **O(n)** (Poor) |
| **Insertion/Deletion** | **O(n)** (Poor) | **O(1)** (Excellent) |
| **Memory Overhead**| Low (Only data) | High (Data + Pointer) |

---