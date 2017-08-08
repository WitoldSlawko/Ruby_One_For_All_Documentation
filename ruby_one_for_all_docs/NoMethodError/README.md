# NoMethodError < NameError

(from ruby core)
---
Raised when a method is called on a receiver which doesn't have it defined and
also fails to respond with `method_missing`.

    "hello".to_ary

*raises the exception:*

    NoMethodError: undefined method `to_ary' for "hello":String
---
# Class methods:

    new

# Instance methods:

    args
    private_call?

# NoMethodError::new

(from ruby core)
---
    NoMethodError.new([msg, *, name [, args]])  -> no_method_error

---

Construct a NoMethodError exception for a method of the given name called with
the given arguments. The name may be accessed using the `#name` method on the
resulting object, and the arguments using the `#args` method.


# NoMethodError#args

(from ruby core)
---
    no_method_error.args  -> obj

---

Return the arguments passed in as the third parameter to the constructor.


# NoMethodError#private_call?

(from ruby core)
---
    private_call?()

---


