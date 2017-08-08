# ThreadSafe

(from gem thread_safe-0.3.6)
---















---
# Constants:

Array
:   Because MRI never runs code in parallel, the existing non-thread-safe
    structures should usually work fine.
ConcurrentCacheBackend
:   [not documented]
Hash
:   [not documented]
NULL
:   Various classes within allows for `nil` values to be stored, so a special
    `NULL` token is required to indicate the "nil-ness".
VERSION
:   [not documented]


# Class methods:

    allocate

# Instance methods:

    _mon_initialize
    decrement_size
    increment_size
    lock_and_clean_up_reverse_forwarders
    rebuild
    split_bin
    split_old_bin
    try_in_resize_lock

# ThreadSafe::allocate

(from gem thread_safe-0.3.6)
---
    allocate()

---


# ThreadSafe#_mon_initialize

(from gem thread_safe-0.3.6)
---
    _mon_initialize()

---


# ThreadSafe#decrement_size

(from gem thread_safe-0.3.6)
---
    decrement_size(by = 1)

---


# ThreadSafe#increment_size

(from gem thread_safe-0.3.6)
---
    increment_size()

---


# ThreadSafe#lock_and_clean_up_reverse_forwarders

(from gem thread_safe-0.3.6)
---
    lock_and_clean_up_reverse_forwarders(old_table, old_table_size, new_table, i, forwarder)

---


# ThreadSafe#rebuild

(from gem thread_safe-0.3.6)
---
    rebuild(table)

---

Moves and/or copies the nodes in each bin to new table. See above for
explanation.


# ThreadSafe#split_bin

(from gem thread_safe-0.3.6)
---
    split_bin(new_table, i, node, node_hash)

---


# ThreadSafe#split_old_bin

(from gem thread_safe-0.3.6)
---
    split_old_bin(table, new_table, i, node, node_hash, forwarder)

---

Splits a normal bin with list headed by e into lo and hi parts; installs in
given table.


# ThreadSafe#try_in_resize_lock

(from gem thread_safe-0.3.6)
---
    try_in_resize_lock(current_table, size_ctrl) { || ... }

---


