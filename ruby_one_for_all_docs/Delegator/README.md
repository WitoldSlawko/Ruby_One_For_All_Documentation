# Delegator < BasicObject

---
# Includes:
ActiveSupport::Tryable (from gem activesupport-5.1.2)

(from ruby core)
---
This library provides three different ways to delegate method calls to an
object.  The easiest to use is SimpleDelegator.  Pass an object to the
constructor and all methods supported by the object will be delegated.  This
object can be changed later.

Going a step further, the top level DelegateClass method allows you to easily
setup delegation through class inheritance.  This is considerably more
flexible and thus probably the most common use for this library.

Finally, if you need full control over the delegation scheme, you can inherit
from the abstract class Delegator and customize as needed.  (If you find
yourself needing this control, have a look at Forwardable which is also in the
standard library.  It may suit your needs better.)

SimpleDelegator's implementation serves as a nice example of the use of
Delegator:

    class SimpleDelegator < Delegator
      def __getobj__
        @delegate_sd_obj # return object we are delegating to, required
      end

      def __setobj__(obj)
        @delegate_sd_obj = obj # change delegation object,
                               # a feature we're providing
      end
    end

## Notes

Be advised, RDoc will not detect delegated methods.
---
# Class methods:

    new

# Instance methods:

    !
    !=
    ==
    __getobj__
    __raise__
    __setobj__
    freeze
    marshal_dump
    marshal_load
    method_missing
    methods
    protected_methods
    public_methods
    raise
    respond_to_missing?
    taint
    trust
    untaint
    untrust

# Delegator::new

(from ruby core)
---
    new(obj)

---

Pass in the *obj* to delegate method calls to.  All methods supported by *obj*
will be delegated to.


# Delegator#!

(from ruby core)
---
    !()

---

Delegates ! to the _*getobj*_


# Delegator#!=

(from ruby core)
---
    !=(obj)

---

Returns true if two objects are not considered of equal value.


# Delegator#==

(from ruby core)
---
    ==(obj)

---

Returns true if two objects are considered of equal value.


# Delegator#__getobj__

(from ruby core)
---
    __getobj__()

---

This method must be overridden by subclasses and should return the object
method calls are being delegated to.


# Delegator#__raise__

(from ruby core)
---
    __raise__()

---


# Delegator#__setobj__

(from ruby core)
---
    __setobj__(obj)

---

This method must be overridden by subclasses and change the object delegate to
*obj*.


# Delegator#freeze

(from ruby core)
---
    freeze()

---

Freeze both the object returned by _*getobj*_ and self.


# Delegator#marshal_dump

(from ruby core)
---
    marshal_dump()

---

Serialization support for the object returned by _*getobj*_.


# Delegator#marshal_load

(from ruby core)
---
    marshal_load(data)

---

Reinitializes delegation from a serialized object.


# Delegator#method_missing

(from ruby core)
---
    method_missing(m, *args, &block)

---

#### (Uses superclass method RDoc::AnyMethod: BasicObject#method_missing)
---

Handles the magic of delegation through _*getobj*_.


# Delegator#methods

(from ruby core)
---
    methods(all=true)

---

Returns the methods available to this delegate object as the union of this
object's and _*getobj*_ methods.


# Delegator#protected_methods

(from ruby core)
---
    protected_methods(all=true)

---

Returns the methods available to this delegate object as the union of this
object's and _*getobj*_ protected methods.


# Delegator#public_methods

(from ruby core)
---
    public_methods(all=true)

---

Returns the methods available to this delegate object as the union of this
object's and _*getobj*_ public methods.


# Delegator#raise

(from ruby core)
---
    raise()

---

Use __raise__ if your Delegator does not have a object to delegate the raise
method call.


# Delegator#respond_to_missing?

(from ruby core)
---
    respond_to_missing?(m, include_private)

---

Checks for a method provided by this the delegate object by forwarding the
call through _*getobj*_.


# Delegator#taint

(from ruby core)
---
    taint()

---

Taint both the object returned by _*getobj*_ and self.


# Delegator#trust

(from ruby core)
---
    trust()

---

Trust both the object returned by _*getobj*_ and self.


# Delegator#untaint

(from ruby core)
---
    untaint()

---

Untaint both the object returned by _*getobj*_ and self.


# Delegator#untrust

(from ruby core)
---
    untrust()

---

Untrust both the object returned by _*getobj*_ and self.


(from gem activesupport-5.1.2)
---
# Instance methods:

    try
    try!

# Delegator#try

(from gem activesupport-5.1.2)
---
    try(a*, &b)

---

See Object#try


# Delegator#try!

(from gem activesupport-5.1.2)
---
    try!(a*, &b)

---

See Object#try!


