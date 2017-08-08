# SingleForwardable

(from ruby core)
---
SingleForwardable can be used to setup delegation at the object level as well.

    printer = String.new
    printer.extend SingleForwardable        # prepare object for delegation
    printer.def_delegator "STDOUT", "puts"  # add delegation for STDOUT.puts()
    printer.puts "Howdy!"

Also, SingleForwardable can be used to set up delegation for a Class or
Module.

    class Implementation
      def self.service
        puts "serviced!"
      end
    end

    module Facade
      extend SingleForwardable
      def_delegator :Implementation, :service
    end

    Facade.service #=> serviced!

If you want to use both Forwardable and SingleForwardable, you can use methods
def_instance_delegator and def_single_delegator, etc.
---
# Instance methods:

    def_delegator
    def_delegators
    def_single_delegator
    def_single_delegators
    delegate
    single_delegate

# SingleForwardable#def_delegator

(from ruby core)
---
    def_delegator(accessor, method, ali = method)

---


# SingleForwardable#def_delegators

(from ruby core)
---
    def_delegators(accessor, *methods)

---


# SingleForwardable#def_single_delegator

(from ruby core)
---
    def_single_delegator(accessor, method, new_name=method)

---

Defines a method *method* which delegates to *accessor* (i.e. it calls the
method of the same name in *accessor*).  If *new_name* is provided, it is used
as the name for the delegate method.


# SingleForwardable#def_single_delegators

(from ruby core)
---
    def_single_delegators(accessor, *methods)

---

Shortcut for defining multiple delegator methods, but with no provision for
using a different name.  The following two code samples have the same effect:

    def_delegators :@records, :size, :<<, :map

    def_delegator :@records, :size
    def_delegator :@records, :<<
    def_delegator :@records, :map


# SingleForwardable#delegate

(from ruby core)
---
    delegate(hash)

---


# SingleForwardable#single_delegate

(from ruby core)
---
    delegate method => accessor
    delegate [method, method, ...] => accessor

---

Takes a hash as its argument.  The key is a symbol or an array of symbols. 
These symbols correspond to method names.  The value is the accessor to which
the methods will be delegated.


