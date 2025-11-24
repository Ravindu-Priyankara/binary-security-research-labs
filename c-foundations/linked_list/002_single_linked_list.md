# Singly Linked List (SLL) Implementation in C

[![Language](https://img.shields.io/badge/Language-C-blue)](https://en.wikipedia.org/wiki/C_(programming_language))
[![Data Structure](https://img.shields.io/badge/Type-Linear_Data_Structure-informational)]()


A **Singly Linked List** is a fundamental dynamic data structure where elements are stored as **Nodes** scattered across memory, connected through unidirectional **pointers**. This repository provides a basic C implementation, demonstrating node creation and list traversal.

---

## Core Concept: Self-Referential Structure

The building block of any linked list is the **self-referential structure**. This structure includes a member that is a pointer to an instance of its own type, enabling the creation of a chain or sequence in memory.

### C Structure Definition

```c
struct abc {
    int a;
    char b;
    // 'self' is the pointer that links this instance to the next instance of struct abc
    struct abc *self; 
};
````

-----

## Singly Linked List Node

The SLL Node uses the self-referential concept to hold both the data and the link to the subsequent node.

### Node Definition

```c
#include <stdio.h>
#include <stdlib.h>

// The Node structure defining the SLL element
struct Node{
    int data;          // The data payload (can be any type)
    struct Node *next; // The link (pointer to the next node)
};
```

[Image of Singly Linked List Node Structure]

### Function: `create(int val)`

Dynamically allocates memory for a new node on the **Heap** and initializes its members.

```c
struct Node *create(int val){
    // Allocate memory from the heap for one Node structure
    struct Node *n = (struct Node *)malloc(sizeof(struct Node)); 
    
    // Error handling omitted for brevity, but essential in production code
    
    n->data = val;
    n->next = NULL; // New node is initially the end of any sequence
    
    return n; // Returns the address (pointer) of the new node
}
```

-----

## List Traversal

Traversal is the process of visiting every node in the list sequentially, beginning at the **Head** pointer. The process terminates when the `next` pointer evaluates to `NULL`.

### Function: `print_list(struct Node *head)`

```c
void print_list(struct Node *head) {
    // 'cur' is the traversal pointer, initialized to the list's head
    struct Node *cur = head; 
    
    printf("--- List Traversal ---\n");
    // Loop continues as long as the current node pointer is not NULL
    while (cur != NULL) { 
        printf("Node at %p | data = %d | next = %p\n",
               (void*)cur, cur->data, (void*)cur->next);
        
        // Advance the traversal to the next node
        cur = cur->next; 
    }
    printf("--- End of List ---\n");
}
```

### Demonstration: Linking Nodes

The `main` function demonstrates creating and linking nodes manually to establish a sequential list structure:

```c
int main(){
    // Create three separate nodes
    struct Node *a = create(10); // Head of the list
    struct Node *b = create(20);
    struct Node *c = create(30);

    // Link the nodes: a -> b -> c -> NULL
    a->next = b; // 'a' points to 'b'
    b->next = c; // 'b' points to 'c'

    printf("---- Initial List (Head = %p) ----\n", (void*)a);
    print_list(a); 

    // Important: In production code, memory must be freed after use.
    // Cleanup code is required here for complete memory management.

    return 0;
}
```

### Example Output (Addresses will vary)

```
---- Initial List (Head = 0x1000) ----
--- List Traversal ---
Node at 0x1000 | data = 10 | next = 0x2000
Node at 0x2000 | data = 20 | next = 0x3000
Node at 0x3000 | data = 30 | next = 0x0
--- End of List ---
```

---