# SynchronizedDelegator < SimpleDelegator

(from gem thread_safe-0.3.6)
---
This class provides a trivial way to synchronize all calls to a given object
by wrapping it with a `Delegator` that performs `Monitor#enter/exit` calls
around the delegated `#send`. Example:

    array = [] # not thread-safe on many impls
    array = SynchronizedDelegator.new([]) # thread-safe

A simple `Monitor` provides a very coarse-grained way to synchronize a given
object, in that it will cause synchronization for methods that have no need
for it, but this is a trivial way to get thread-safety where none may exist
currently on some implementations.

This class is currently being considered for inclusion into stdlib, via
https://bugs.ruby-lang.org/issues/8556
---
# Class methods:

    new

# Instance methods:

    method_missing
    setup
    teardown

# SynchronizedDelegator::new

(from gem thread_safe-0.3.6)
---
    new(obj)

---


# SynchronizedDelegator#method_missing

(from gem thread_safe-0.3.6)
---
    method_missing(method, *args, &block)

---


# SynchronizedDelegator#setup

(from gem thread_safe-0.3.6)
---
    setup()

---


# SynchronizedDelegator#teardown

(from gem thread_safe-0.3.6)
---
    teardown()

---


