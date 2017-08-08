# UncaughtThrowError < ArgError

(from ruby core)
---
Raised when `throw` is called with a *tag* which does not have corresponding
`catch` block.

    throw "foo", "bar"

*raises the exception:*

    UncaughtThrowError: uncaught throw "foo"
---
# Class methods:

    new

# Instance methods:

    tag
    to_s
    value

# UncaughtThrowError::new

(from ruby core)
---
    new(*args)

---

Document-class: UncaughtThrowError

Raised when `throw` is called with a *tag* which does not have corresponding
`catch` block.

    throw "foo", "bar"

*raises the exception:*

    UncaughtThrowError: uncaught throw "foo"


# UncaughtThrowError#tag

(from ruby core)
---
    uncaught_throw.tag   -> obj

---

Return the tag object which was called for.


# UncaughtThrowError#to_s

(from ruby core)
---
    uncaught_throw.to_s   ->  string

---

Returns formatted message with the inspected tag.


# UncaughtThrowError#value

(from ruby core)
---
    uncaught_throw.value   -> obj

---

Return the return value which was called for.


