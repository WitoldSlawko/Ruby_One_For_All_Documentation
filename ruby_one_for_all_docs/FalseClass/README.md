# FalseClass < Object

(from ruby core)
---
The global value `false` is the only instance of class `FalseClass` and
represents a logically false value in boolean expressions. The class provides
operators allowing `false` to participate correctly in logical expressions.
---
# Instance methods:

    &
    ===
    ^
    inspect
    to_s
    |

# FalseClass#&

(from ruby core)
---
    false & obj   -> false
    nil & obj     -> false

---

And---Returns `false`. *obj* is always evaluated as it is the argument to a
method call---there is no short-circuit evaluation in this case.


# FalseClass#===

(from ruby core)
---
    obj === other   -> true or false

---

Case Equality -- For class Object, effectively the same as calling `#==`, but
typically overridden by descendants to provide meaningful semantics in `case`
statements.


# FalseClass#^

(from ruby core)
---
    false ^ obj    -> true or false
    nil   ^ obj    -> true or false

---

Exclusive Or---If *obj* is `nil` or `false`, returns `false`; otherwise,
returns `true`.


# FalseClass#inspect

(from ruby core)
---
    inspect()

---


# FalseClass#to_s

(from ruby core)
---
    false.to_s   ->  "false"

---

'nuf said...


# FalseClass#|

(from ruby core)
---
    false | obj   ->   true or false
    nil   | obj   ->   true or false

---

Or---Returns `false` if *obj* is `nil` or `false`; `true` otherwise.


(from gem activesupport-5.1.2)
---



---
# Instance methods:

    blank?
    duplicable?
    to_param

# FalseClass#blank?

(from gem activesupport-5.1.2)
---
    blank?()

---

`false` is blank:

    false.blank? # => true

@return [true]


# FalseClass#duplicable?

(from gem activesupport-5.1.2)
---
    duplicable?()

---

`false` is not duplicable:

    false.duplicable? # => false
    false.dup         # => TypeError: can't dup FalseClass


# FalseClass#to_param

(from gem activesupport-5.1.2)
---
    to_param()

---

Returns `self`.


