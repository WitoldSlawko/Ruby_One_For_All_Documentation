# SystemCallError < StandardError

(from ruby core)
---
SystemCallError is the base class for all low-level platform-dependent errors.

The errors available on the current platform are subclasses of SystemCallError
and are defined in the Errno module.

    File.open("does/not/exist")

*raises the exception:*

    Errno::ENOENT: No such file or directory - does/not/exist
---
# Class methods:

    ===
    new

# Instance methods:

    errno

# SystemCallError::===

(from ruby core)
---
    system_call_error === other  -> true or false

---

Return `true` if the receiver is a generic `SystemCallError`, or if the error
numbers `self` and *other* are the same.


# SystemCallError::new

(from ruby core)
---
    SystemCallError.new(msg, errno)  -> system_call_error_subclass

---

If *errno* corresponds to a known system error code, constructs the
appropriate `Errno` class for that error, otherwise constructs a generic
`SystemCallError` object. The error number is subsequently available via the
`errno` method.


# SystemCallError#errno

(from ruby core)
---
    system_call_error.errno   -> integer

---

Return this SystemCallError's error number.


