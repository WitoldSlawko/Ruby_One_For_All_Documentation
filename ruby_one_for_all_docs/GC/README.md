# GC

(from ruby core)
---
The GC module provides an interface to Ruby's mark and sweep garbage
collection mechanism.

Some of the underlying methods are also available via the ObjectSpace module.

You may obtain information about the operation of the GC through GC::Profiler.
---
# Constants:

INTERNAL_CONSTANTS
:   [not documented]
OPTS
:   [not documented]


# Class methods:

    add_stress_to_class
    count
    disable
    enable
    latest_gc_info
    malloc_allocated_size
    malloc_allocations
    remove_stress_to_class
    start
    stat
    stress
    stress=
    verify_internal_consistency

# Instance methods:

    garbage_collect

# GC::add_stress_to_class

(from ruby core)
---
    add_stress_to_class(*args)

---


# GC::count

(from ruby core)
---
    GC.count -> Integer

---

The number of times GC occurred.

It returns the number of times GC occurred since the process started.


# GC::disable

(from ruby core)
---
    GC.disable    -> true or false

---

Disables garbage collection, returning `true` if garbage collection was
already disabled.

    GC.disable   #=> false
    GC.disable   #=> true


# GC::enable

(from ruby core)
---
    GC.enable    -> true or false

---

Enables garbage collection, returning `true` if garbage collection was
previously disabled.

    GC.disable   #=> false
    GC.enable    #=> true
    GC.enable    #=> false


# GC::latest_gc_info

(from ruby core)
---
    GC.latest_gc_info -> {:gc_by=>:newobj}
    GC.latest_gc_info(hash) -> hash
    GC.latest_gc_info(:major_by) -> :malloc

---

Returns information about the most recent garbage collection.


# GC::malloc_allocated_size

(from ruby core)
---
    GC.malloc_allocated_size -> Integer

---

Returns the size of memory allocated by malloc().

Only available if ruby was built with `CALC_EXACT_MALLOC_SIZE`.


# GC::malloc_allocations

(from ruby core)
---
    GC.malloc_allocations -> Integer

---

Returns the number of malloc() allocations.

Only available if ruby was built with `CALC_EXACT_MALLOC_SIZE`.


# GC::remove_stress_to_class

(from ruby core)
---
    remove_stress_to_class(*args)

---


# GC::start

(from ruby core)
---
    GC.start                     -> nil
    GC.start(full_mark: true, immediate_sweep: true)           -> nil

---

Initiates garbage collection, unless manually disabled.

This method is defined with keyword arguments that default to true:

    def GC.start(full_mark: true, immediate_sweep: true); end

Use full_mark: false to perform a minor GC. Use immediate_sweep: false to
defer sweeping (use lazy sweep).

Note: These keyword arguments are implementation and version dependent. They
are not guaranteed to be future-compatible, and may be ignored if the
underlying implementation does not support them.


# GC::stat

(from ruby core)
---
    GC.stat -> Hash
    GC.stat(hash) -> hash
    GC.stat(:key) -> Numeric

---

Returns a Hash containing information about the GC.

The hash includes information about internal statistics about GC such as:

    {
        :count=>0,
        :heap_allocated_pages=>24,
        :heap_sorted_length=>24,
        :heap_allocatable_pages=>0,
        :heap_available_slots=>9783,
        :heap_live_slots=>7713,
        :heap_free_slots=>2070,
        :heap_final_slots=>0,
        :heap_marked_slots=>0,
        :heap_eden_pages=>24,
        :heap_tomb_pages=>0,
        :total_allocated_pages=>24,
        :total_freed_pages=>0,
        :total_allocated_objects=>7796,
        :total_freed_objects=>83,
        :malloc_increase_bytes=>2389312,
        :malloc_increase_bytes_limit=>16777216,
        :minor_gc_count=>0,
        :major_gc_count=>0,
        :remembered_wb_unprotected_objects=>0,
        :remembered_wb_unprotected_objects_limit=>0,
        :old_objects=>0,
        :old_objects_limit=>0,
        :oldmalloc_increase_bytes=>2389760,
        :oldmalloc_increase_bytes_limit=>16777216
    }

The contents of the hash are implementation specific and may be changed in the
future.

This method is only expected to work on C Ruby.


# GC::stress

(from ruby core)
---
    GC.stress     -> integer, true or false

---

Returns current status of GC stress mode.


# GC::stress=

(from ruby core)
---
    GC.stress = flag          -> flag

---

Updates the GC stress mode.

When stress mode is enabled, the GC is invoked at every GC opportunity: all
memory and object allocations.

Enabling stress mode will degrade performance, it is only for debugging.

flag can be true, false, or an integer bit-ORed following flags.
    0x01:: no major GC
    0x02:: no immediate sweep
    0x04:: full mark after malloc/calloc/realloc


# GC::verify_internal_consistency

(from ruby core)
---
    GC.verify_internal_consistency                  -> nil

---

Verify internal consistency.

This method is implementation specific. Now this method checks generational
consistency if RGenGC is supported.


# GC#garbage_collect

(from ruby core)
---
    ObjectSpace.garbage_collect  -> nil
    include GC; garbage_collect  -> nil
    ObjectSpace.garbage_collect(full_mark: true, immediate_sweep: true) -> nil

---

Initiates garbage collection, unless manually disabled.

This method is defined with keyword arguments that default to true:

    def GC.start(full_mark: true, immediate_sweep: true); end

Use full_mark: false to perform a minor GC. Use immediate_sweep: false to
defer sweeping (use lazy sweep).

Note: These keyword arguments are implementation and version dependent. They
are not guaranteed to be future-compatible, and may be ignored if the
underlying implementation does not support them.


