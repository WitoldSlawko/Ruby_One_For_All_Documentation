# Method < Object

---
# Includes:
(from gem method_source-0.8.2)
    MethodSource::SourceLocation::MethodExtensions
    MethodSource::MethodExtensions

(from ruby core)
---
Method

---
# Instance methods:

    ==
    []
    arity
    call
    clone
    curry
    eql?
    hash
    inspect
    name
    original_name
    owner
    parameters
    receiver
    source_location
    super_method
    to_proc
    to_s
    unbind

# Method#==

(from ruby core)
---
    meth == other_meth  -> true or false

---

Two method objects are equal if they are bound to the same object and refer to
the same method definition and their owners are the same class or module.


# Method#[]

(from ruby core)
---
    prc[params,...]        -> obj

---

Invokes the block, setting the block's parameters to the values in *params*
using something close to method calling semantics. Generates a warning if
multiple values are passed to a proc that expects just one (previously this
silently converted the parameters to an array).  Note that `prc.()` invokes
`prc.call()` with the parameters given.  It's a syntax sugar to hide "call".

Returns the value of the last expression evaluated in the block. See also
Proc#yield.

    a_proc = Proc.new { |scalar, *values| values.collect { |value| value*scalar } }
    a_proc.call(9, 1, 2, 3)   #=> [9, 18, 27]
    a_proc[9, 1, 2, 3]        #=> [9, 18, 27]
    a_proc.(9, 1, 2, 3)       #=> [9, 18, 27]

For procs created using `lambda` or `->()` an error is generated if the wrong
number of parameters are passed to a Proc with multiple parameters.  For procs
created using `Proc.new` or `Kernel.proc`, extra parameters are silently
discarded.

    a_proc = lambda {|a,b| a}
    a_proc.call(1,2,3)

*produces:*

    prog.rb:4:in `block in <main>': wrong number of arguments (given 3, expected 2) (ArgumentError)
     from prog.rb:5:in `call'
     from prog.rb:5:in `<main>'


# Method#arity

(from ruby core)
---
    meth.arity    -> integer

---

Returns an indication of the number of arguments accepted by a method. Returns
a nonnegative integer for methods that take a fixed number of arguments. For
Ruby methods that take a variable number of arguments, returns -n-1, where n
is the number of required arguments. For methods written in C, returns -1 if
the call takes a variable number of arguments.

    class C
      def one;    end
      def two(a); end
      def three(*a);  end
      def four(a, b); end
      def five(a, b, *c);    end
      def six(a, b, *c, &d); end
    end
    c = C.new
    c.method(:one).arity     #=> 0
    c.method(:two).arity     #=> 1
    c.method(:three).arity   #=> -1
    c.method(:four).arity    #=> 2
    c.method(:five).arity    #=> -3
    c.method(:six).arity     #=> -3

    "cat".method(:size).arity      #=> 0
    "cat".method(:replace).arity   #=> 1
    "cat".method(:squeeze).arity   #=> -1
    "cat".method(:count).arity     #=> -1


# Method#call

(from ruby core)
---
    prc.call(params,...)   -> obj

---

    Document-method: []

Invokes the block, setting the block's parameters to the values in *params*
using something close to method calling semantics. Generates a warning if
multiple values are passed to a proc that expects just one (previously this
silently converted the parameters to an array).  Note that `prc.()` invokes
`prc.call()` with the parameters given.  It's a syntax sugar to hide "call".

Returns the value of the last expression evaluated in the block. See also
Proc#yield.

    a_proc = Proc.new { |scalar, *values| values.collect { |value| value*scalar } }
    a_proc.call(9, 1, 2, 3)   #=> [9, 18, 27]
    a_proc[9, 1, 2, 3]        #=> [9, 18, 27]
    a_proc.(9, 1, 2, 3)       #=> [9, 18, 27]

For procs created using `lambda` or `->()` an error is generated if the wrong
number of parameters are passed to a Proc with multiple parameters.  For procs
created using `Proc.new` or `Kernel.proc`, extra parameters are silently
discarded.

    a_proc = lambda {|a,b| a}
    a_proc.call(1,2,3)

*produces:*

    prog.rb:4:in `block in <main>': wrong number of arguments (given 3, expected 2) (ArgumentError)
     from prog.rb:5:in `call'
     from prog.rb:5:in `<main>'


# Method#clone

(from ruby core)
---
    method.clone -> new_method

---

Returns a clone of this method.

    class A
      def foo
        return "bar"
      end
    end

    m = A.new.method(:foo)
    m.call # => "bar"
    n = m.clone.call # => "bar"


# Method#curry

(from ruby core)
---
    meth.curry        -> proc
    meth.curry(arity) -> proc

---

Returns a curried proc based on the method. When the proc is called with a
number of arguments that is lower than the method's arity, then another
curried proc is returned. Only when enough arguments have been supplied to
satisfy the method signature, will the method actually be called.

The optional *arity* argument should be supplied when currying methods with
variable arguments to determine how many arguments are needed before the
method is called.

    def foo(a,b,c)
      [a, b, c]
    end

    proc  = self.method(:foo).curry
    proc2 = proc.call(1, 2)          #=> #<Proc>
    proc2.call(3)                    #=> [1,2,3]

    def vararg(*args)
      args
    end

    proc = self.method(:vararg).curry(4)
    proc2 = proc.call(:x)      #=> #<Proc>
    proc3 = proc2.call(:y, :z) #=> #<Proc>
    proc3.call(:a)             #=> [:x, :y, :z, :a]


# Method#eql?

(from ruby core)
---
    meth.eql?(other_meth)  -> true or false

---

Two method objects are equal if they are bound to the same object and refer to
the same method definition and their owners are the same class or module.


# Method#hash

(from ruby core)
---
    meth.hash   -> integer

---

Returns a hash value corresponding to the method object.

See also Object#hash.


# Method#inspect

(from ruby core)
---
    meth.inspect   ->  string

---

Returns the name of the underlying method.

    "cat".method(:count).inspect   #=> "#<Method: String#count>"


# Method#name

(from ruby core)
---
    meth.name    -> symbol

---

Returns the name of the method.


# Method#original_name

(from ruby core)
---
    meth.original_name    -> symbol

---

Returns the original name of the method.


# Method#owner

(from ruby core)
---
    meth.owner    -> class_or_module

---

Returns the class or module that defines the method.


# Method#parameters

(from ruby core)
---
    meth.parameters  -> array

---

Returns the parameter information of this method.

    def foo(bar); end
    method(:foo).parameters #=> [[:req, :bar]]

    def foo(bar, baz, bat, &blk); end
    method(:foo).parameters #=> [[:req, :bar], [:req, :baz], [:req, :bat], [:block, :blk]]

    def foo(bar, *args); end
    method(:foo).parameters #=> [[:req, :bar], [:rest, :args]]

    def foo(bar, baz, *args, &blk); end
    method(:foo).parameters #=> [[:req, :bar], [:req, :baz], [:rest, :args], [:block, :blk]]


# Method#receiver

(from ruby core)
---
    meth.receiver    -> object

---

Returns the bound receiver of the method object.


# Method#source_location

(from ruby core)
---
    meth.source_location  -> [String, Integer]

---

Returns the Ruby source filename and line number containing this method or nil
if this method was not defined in Ruby (i.e. native)


# Method#super_method

(from ruby core)
---
    meth.super_method  -> method

---

Returns a Method of superclass which would be called when super is used or nil
if there is no method on superclass.


# Method#to_proc

(from ruby core)
---
    meth.to_proc    -> proc

---

Returns a `Proc` object corresponding to this method.


# Method#to_s

(from ruby core)
---
    meth.to_s      ->  string

---

Returns the name of the underlying method.

    "cat".method(:count).inspect   #=> "#<Method: String#count>"


# Method#unbind

(from ruby core)
---
    meth.unbind    -> unbound_method

---

Dissociates *meth* from its current receiver. The resulting `UnboundMethod`
can subsequently be bound to a new object of the same class (see
`UnboundMethod`).


(from gem activesupport-5.1.2)
---
# Instance methods:

    duplicable?

# Method#duplicable?

(from gem activesupport-5.1.2)
---
    duplicable?()

---

Methods are not duplicable:

    method(:puts).duplicable? # => false
    method(:puts).dup         # => TypeError: allocator undefined for Method


---
Also found in:
    gem method_source-0.8.2

