# Forwardable

(from ruby core)
---
The Forwardable module provides delegation of specified methods to a
designated object, using the methods #def_delegator and #def_delegators.

For example, say you have a class RecordCollection which contains an array
`@records`.  You could provide the lookup method #record_number(), which
simply calls #[] on the `@records` array, like this:

    require 'forwardable'

    class RecordCollection
      attr_accessor :records
      extend Forwardable
      def_delegator :@records, :[], :record_number
    end

We can use the lookup method like so:

    r = RecordCollection.new
    r.records = [4,5,6]
    r.record_number(0)  # => 4

Further, if you wish to provide the methods #size, #<<, and #map, all of which
delegate to @records, this is how you can do it:

    class RecordCollection # re-open RecordCollection class
      def_delegators :@records, :size, :<<, :map
    end

    r = RecordCollection.new
    r.records = [1,2,3]
    r.record_number(0)   # => 1
    r.size               # => 3
    r << 4               # => [1, 2, 3, 4]
    r.map { |x| x * 2 }  # => [2, 4, 6, 8]

You can even extend regular objects with Forwardable.

    my_hash = Hash.new
    my_hash.extend Forwardable              # prepare object for delegation
    my_hash.def_delegator "STDOUT", "puts"  # add delegation for STDOUT.puts()
    my_hash.puts "Howdy!"

## Another example

We want to rely on what has come before obviously, but with delegation we can
take just the methods we need and even rename them as appropriate.  In many
cases this is preferable to inheritance, which gives us the entire old
interface, even if much of it isn't needed.

    class Queue
      extend Forwardable

      def initialize
        @q = [ ]    # prepare delegate object
      end

      # setup preferred interface, enq() and deq()...
      def_delegator :@q, :push, :enq
      def_delegator :@q, :shift, :deq

      # support some general Array methods that fit Queues well
      def_delegators :@q, :clear, :first, :push, :shift, :size
    end

    q = Queue.new
    q.enq 1, 2, 3, 4, 5
    q.push 6

    q.shift    # => 1
    while q.size > 0
      puts q.deq
    end

    q.enq "Ruby", "Perl", "Python"
    puts q.first
    q.clear
    puts q.first

This should output:

    2
    3
    4
    5
    6
    Ruby
    nil

## Notes

Be advised, RDoc will not detect delegated methods.

`forwardable.rb` provides single-method delegation via the def_delegator and
def_delegators methods. For full-class delegation via DelegateClass, see
`delegate.rb`.
---
# Constants:

FORWARDABLE_VERSION
:   Version of `forwardable.rb`


# Class methods:

    debug

# Instance methods:

    def_delegator
    def_delegators
    def_instance_delegator
    def_instance_delegators
    delegate
    instance_delegate

# Attributes:

    attr_accessor debug

# Forwardable#def_delegator

(from ruby core)
---
    def_delegator(accessor, method, ali = method)

---


# Forwardable#def_delegators

(from ruby core)
---
    def_delegators(accessor, *methods)

---


# Forwardable#def_instance_delegator

(from ruby core)
---
    def_instance_delegator(accessor, method, ali = method)

---

Define `method` as delegator instance method with an optional alias name
`ali`. Method calls to `ali` will be delegated to `accessor.method`.

    class MyQueue
      extend Forwardable
      attr_reader :queue
      def initialize
        @queue = []
      end

      def_delegator :@queue, :push, :mypush
    end

    q = MyQueue.new
    q.mypush 42
    q.queue    #=> [42]
    q.push 23  #=> NoMethodError


# Forwardable#def_instance_delegators

(from ruby core)
---
    def_instance_delegators(accessor, *methods)

---

Shortcut for defining multiple delegator methods, but with no provision for
using a different name.  The following two code samples have the same effect:

    def_delegators :@records, :size, :<<, :map

    def_delegator :@records, :size
    def_delegator :@records, :<<
    def_delegator :@records, :map


# Forwardable#delegate

(from ruby core)
---
    delegate(hash)

---


# Forwardable#instance_delegate

(from ruby core)
---
    delegate method => accessor
    delegate [method, method, ...] => accessor

---

Takes a hash as its argument.  The key is a symbol or an array of symbols. 
These symbols correspond to method names.  The value is the accessor to which
the methods will be delegated.


