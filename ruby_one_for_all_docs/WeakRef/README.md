# WeakRef < Delegator

(from ruby core)
---
Weak Reference class that allows a referenced object to be garbage-collected.

A WeakRef may be used exactly like the object it references.

Usage:

    foo = Object.new            # create a new object instance
    p foo.to_s                  # original's class
    foo = WeakRef.new(foo)      # reassign foo with WeakRef instance
    p foo.to_s                  # should be same class
    GC.start                    # start the garbage collector
    p foo.to_s                  # should raise exception (recycled)

## Example

With help from WeakRef, we can implement our own rudimentary WeakHash class.

We will call it WeakHash, since it's really just a Hash except all of it's
keys and values can be garbage collected.

    require 'weakref'

    class WeakHash < Hash
      def []= key, obj
        super WeakRef.new(key), WeakRef.new(obj)
      end
    end

This is just a simple implementation, we've opened the Hash class and changed
Hash#store to create a new WeakRef object with `key` and `obj` parameters
before passing them as our key-value pair to the hash.

With this you will have to limit your self to String keys, otherwise you will
get an ArgumentError because WeakRef cannot create a finalizer for a Symbol.
Symbols are immutable and cannot be garbage collected.

Let's see it in action:

    omg = "lol"
    c = WeakHash.new
    c['foo'] = "bar"
    c['baz'] = Object.new
    c['qux'] = omg
    puts c.inspect
    #=> {"foo"=>"bar", "baz"=>#<Object:0x007f4ddfc6cb48>, "qux"=>"lol"}

    # Now run the garbage collector
    GC.start
    c['foo'] #=> nil
    c['baz'] #=> nil
    c['qux'] #=> nil
    omg      #=> "lol"

    puts c.inspect
    #=> WeakRef::RefError: Invalid Reference - probably recycled

You can see the local variable `omg` stayed, although its reference in our
hash object was garbage collected, along with the rest of the keys and values.
Also, when we tried to inspect our hash, we got a WeakRef::RefError. This is
because these objects were also garbage collected.
---
# Class methods:

    new

# Instance methods:

    weakref_alive?

# WeakRef::new

(from ruby core)
---
    new(orig)

---

#### (Uses superclass method RDoc::AnyMethod: Delegator::new)
---

Creates a weak reference to `orig`

Raises an ArgumentError if the given `orig` is immutable, such as Symbol,
Fixnum, or Float.


# WeakRef#weakref_alive?

(from ruby core)
---
    weakref_alive?()

---

Returns true if the referenced object is still alive.


