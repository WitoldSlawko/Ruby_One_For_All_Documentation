# Synchronizer_m

(from ruby core)
---
A module that provides a two-phase lock with a counter.
---
# Constants:

EX
:   [not documented]
SH
:   [not documented]
UN
:   lock mode


# Class methods:

    append_features
    define_aliases
    extend_object
    new

# Instance methods:

    sync_ex_count
    sync_ex_locker
    sync_exclusive?
    sync_extend
    sync_initialize
    sync_inspect
    sync_lock
    sync_locked?
    sync_mode
    sync_sh_locker
    sync_shared?
    sync_synchronize
    sync_try_lock
    sync_try_lock_sub
    sync_unlock
    sync_upgrade_waiting
    sync_waiting

# Attributes:

    attr_accessor sync_ex_count
    attr_accessor sync_ex_locker
    attr_accessor sync_mode
    attr_accessor sync_sh_locker
    attr_accessor sync_upgrade_waiting
    attr_accessor sync_waiting

# Synchronizer_m::append_features

(from ruby core)
### Implementation from Sync_m
---
    append_features(cl)

---


# Synchronizer_m::define_aliases

(from ruby core)
### Implementation from Sync_m
---
    define_aliases(cl)

---


# Synchronizer_m::extend_object

(from ruby core)
### Implementation from Sync_m
---
    extend_object(obj)

---


# Synchronizer_m::new

(from ruby core)
### Implementation from Sync_m
---
    new(*args)

---


# Synchronizer_m#sync_exclusive?

(from ruby core)
### Implementation from Sync_m
---
    sync_exclusive?()

---


# Synchronizer_m#sync_extend

(from ruby core)
### Implementation from Sync_m
---
    sync_extend()

---


# Synchronizer_m#sync_inspect

(from ruby core)
### Implementation from Sync_m
---
    sync_inspect()

---


# Synchronizer_m#sync_lock

(from ruby core)
### Implementation from Sync_m
---
    sync_lock(m = EX)

---


# Synchronizer_m#sync_locked?

(from ruby core)
### Implementation from Sync_m
---
    sync_locked?()

---

accessing


# Synchronizer_m#sync_shared?

(from ruby core)
### Implementation from Sync_m
---
    sync_shared?()

---


# Synchronizer_m#sync_synchronize

(from ruby core)
### Implementation from Sync_m
---
    sync_synchronize(mode = EX) { || ... }

---


# Synchronizer_m#sync_try_lock

(from ruby core)
### Implementation from Sync_m
---
    sync_try_lock(mode = EX)

---

locking methods.


# Synchronizer_m#sync_unlock

(from ruby core)
### Implementation from Sync_m
---
    sync_unlock(m = EX)

---


# Synchronizer_m#sync_initialize

(from ruby core)
### Implementation from Sync_m
---
    sync_initialize()

---


# Synchronizer_m#sync_try_lock_sub

(from ruby core)
### Implementation from Sync_m
---
    sync_try_lock_sub(m)

---


