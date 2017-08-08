# NilClass < Object

(from ruby core)
---
The class of the singleton object `nil`.
---
# Instance methods:

    &
    ===
    ^
    inspect
    nil?
    rationalize
    to_a
    to_c
    to_f
    to_h
    to_i
    to_r
    to_s
    |

# NilClass#&

(from ruby core)
---
    false & obj   -> false
    nil & obj     -> false

---

And---Returns `false`. *obj* is always evaluated as it is the argument to a
method call---there is no short-circuit evaluation in this case.


# NilClass#===

(from ruby core)
---
    obj === other   -> true or false

---

Case Equality -- For class Object, effectively the same as calling `#==`, but
typically overridden by descendants to provide meaningful semantics in `case`
statements.


# NilClass#^

(from ruby core)
---
    false ^ obj    -> true or false
    nil   ^ obj    -> true or false

---

Exclusive Or---If *obj* is `nil` or `false`, returns `false`; otherwise,
returns `true`.


# NilClass#inspect

(from ruby core)
---
    nil.inspect  -> "nil"

---

Always returns the string "nil".


# NilClass#nil?

(from ruby core)
---
    nil.nil?               -> true

---

Only the object *nil* responds `true` to `nil?`.


# NilClass#rationalize

(from ruby core)
---
    nil.rationalize([eps])  ->  (0/1)

---

Returns zero as a rational.  The optional argument eps is always ignored.


# NilClass#to_a

(from ruby core)
---
    nil.to_a    -> []

---

Always returns an empty array.

    nil.to_a   #=> []


# NilClass#to_c

(from ruby core)
---
    nil.to_c  ->  (0+0i)

---

Returns zero as a complex.


# NilClass#to_f

(from ruby core)
---
    nil.to_f    -> 0.0

---

Always returns zero.

    nil.to_f   #=> 0.0


# NilClass#to_h

(from ruby core)
---
    nil.to_h    -> {}

---

Always returns an empty hash.

    nil.to_h   #=> {}


# NilClass#to_i

(from ruby core)
---
    nil.to_i -> 0

---

Always returns zero.

    nil.to_i   #=> 0


# NilClass#to_r

(from ruby core)
---
    nil.to_r  ->  (0/1)

---

Returns zero as a rational.


# NilClass#to_s

(from ruby core)
---
    nil.to_s    -> ""

---

Always returns the empty string.


# NilClass#|

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
    try
    try!

# NilClass#blank?

(from gem activesupport-5.1.2)
---
    blank?()

---

`nil` is blank:

    nil.blank? # => true

@return [true]


# NilClass#duplicable?

(from gem activesupport-5.1.2)
---
    duplicable?()

---

`nil` is not duplicable:

    nil.duplicable? # => false
    nil.dup         # => TypeError: can't dup NilClass


# NilClass#to_param

(from gem activesupport-5.1.2)
---
    to_param()

---

Returns `self`.


# NilClass#try

(from gem activesupport-5.1.2)
---
    try(*args)

---

Calling `try` on `nil` always returns `nil`. It becomes especially helpful
when navigating through associations that may return `nil`.

    nil.try(:name) # => nil

Without `try`
    @person && @person.children.any? && @person.children.first.name

With `try`
    @person.try(:children).try(:first).try(:name)


# NilClass#try!

(from gem activesupport-5.1.2)
---
    try!(*args)

---

Calling `try!` on `nil` always returns `nil`.

    nil.try!(:name) # => nil


