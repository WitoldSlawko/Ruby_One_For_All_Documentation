# TrueClass < Object

(from ruby core)
---
The global value `true` is the only instance of class `TrueClass` and
represents a logically true value in boolean expressions. The class provides
operators allowing `true` to be used in logical expressions.
---
# Instance methods:

    &
    ===
    ^
    inspect
    to_s
    |

# TrueClass#&

(from ruby core)
---
    true & obj    -> true or false

---

And---Returns `false` if *obj* is `nil` or `false`, `true` otherwise.


# TrueClass#===

(from ruby core)
---
    obj === other   -> true or false

---

Case Equality -- For class Object, effectively the same as calling `#==`, but
typically overridden by descendants to provide meaningful semantics in `case`
statements.


# TrueClass#^

(from ruby core)
---
    true ^ obj   -> !obj

---

Exclusive Or---Returns `true` if *obj* is `nil` or `false`, `false` otherwise.


# TrueClass#inspect

(from ruby core)
---
    inspect()

---


# TrueClass#to_s

(from ruby core)
---
    true.to_s   ->  "true"

---

The string representation of `true` is "true".


# TrueClass#|

(from ruby core)
---
    true | obj   -> true

---

Or---Returns `true`. As *obj* is an argument to a method call, it is always
evaluated; there is no short-circuit evaluation in this case.

    true |  puts("or")
    true || puts("logical or")

*produces:*

    or


(from gem activesupport-5.1.2)
---



---
# Instance methods:

    blank?
    duplicable?
    to_param

# TrueClass#blank?

(from gem activesupport-5.1.2)
---
    blank?()

---

`true` is not blank:

    true.blank? # => false

@return [false]


# TrueClass#duplicable?

(from gem activesupport-5.1.2)
---
    duplicable?()

---

`true` is not duplicable:

    true.duplicable? # => false
    true.dup         # => TypeError: can't dup TrueClass


# TrueClass#to_param

(from gem activesupport-5.1.2)
---
    to_param()

---

Returns `self`.


