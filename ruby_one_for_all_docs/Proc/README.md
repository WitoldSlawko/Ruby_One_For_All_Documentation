# Proc < Object

---
# Includes:
(from gem method_source-0.8.2)
    MethodSource::SourceLocation::ProcExtensions
    MethodSource::MethodExtensions

(from ruby core)
---
`Proc` objects are blocks of code that have been bound to a set of local
variables. Once bound, the code may be called in different contexts and still
access those variables.

    def gen_times(factor)
      return Proc.new {|n| n*factor }
    end

    times3 = gen_times(3)
    times5 = gen_times(5)

    times3.call(12)               #=> 36
    times5.call(5)                #=> 25
    times3.call(times5.call(4))   #=> 60
---
# Class methods:

    new

# Instance methods:

    ===
    []
    arity
    binding
    call
    curry
    hash
    inspect
    lambda?
    parameters
    source_location
    to_proc
    to_s
    yield

# Proc::new

(from ruby core)
---
    Proc.new {|...| block } -> a_proc
    Proc.new                -> a_proc

---

Creates a new `Proc` object, bound to the current context. `Proc::new` may be
called without a block only within a method with an attached block, in which
case that block is converted to the `Proc` object.

    def proc_from
      Proc.new
    end
    proc = proc_from { "hello" }
    proc.call   #=> "hello"


# Proc#===

(from ruby core)
---
    proc === obj   -> result_of_proc

---

Invokes the block with `obj` as the proc's parameter like Proc#call.  It is to
allow a proc object to be a target of `when` clause in a case statement.


# Proc#[]

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


# Proc#arity

(from ruby core)
---
    prc.arity -> integer

---

Returns the number of mandatory arguments. If the block is declared to take no
arguments, returns 0. If the block is known to take exactly n arguments,
returns n. If the block has optional arguments, returns -n-1, where n is the
number of mandatory arguments, with the exception for blocks that are not
lambdas and have only a finite number of optional arguments; in this latter
case, returns n. Keywords arguments will considered as a single additional
argument, that argument being mandatory if any keyword argument is mandatory.
A `proc` with no argument declarations is the same as a block declaring `||`
as its arguments.

    proc {}.arity                  #=>  0
    proc { || }.arity              #=>  0
    proc { |a| }.arity             #=>  1
    proc { |a, b| }.arity          #=>  2
    proc { |a, b, c| }.arity       #=>  3
    proc { |*a| }.arity            #=> -1
    proc { |a, *b| }.arity         #=> -2
    proc { |a, *b, c| }.arity      #=> -3
    proc { |x:, y:, z:0| }.arity   #=>  1
    proc { |*a, x:, y:0| }.arity   #=> -2

    proc   { |x=0| }.arity         #=>  0
    lambda { |x=0| }.arity         #=> -1
    proc   { |x=0, y| }.arity      #=>  1
    lambda { |x=0, y| }.arity      #=> -2
    proc   { |x=0, y=0| }.arity    #=>  0
    lambda { |x=0, y=0| }.arity    #=> -1
    proc   { |x, y=0| }.arity      #=>  1
    lambda { |x, y=0| }.arity      #=> -2
    proc   { |(x, y), z=0| }.arity #=>  1
    lambda { |(x, y), z=0| }.arity #=> -2
    proc   { |a, x:0, y:0| }.arity #=>  1
    lambda { |a, x:0, y:0| }.arity #=> -2


# Proc#binding

(from ruby core)
---
    prc.binding    -> binding

---

Returns the binding associated with *prc*. Note that `Kernel#eval` accepts
either a `Proc` or a `Binding` object as its second parameter.

    def fred(param)
      proc {}
    end

    b = fred(99)
    eval("param", b.binding)   #=> 99


# Proc#call

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


# Proc#curry

(from ruby core)
---
    prc.curry         -> a_proc
    prc.curry(arity)  -> a_proc

---

Returns a curried proc. If the optional *arity* argument is given, it
determines the number of arguments. A curried proc receives some arguments. If
a sufficient number of arguments are supplied, it passes the supplied
arguments to the original proc and returns the result. Otherwise, returns
another curried proc that takes the rest of arguments.

    b = proc {|x, y, z| (x||0) + (y||0) + (z||0) }
    p b.curry[1][2][3]           #=> 6
    p b.curry[1, 2][3, 4]        #=> 6
    p b.curry(5)[1][2][3][4][5]  #=> 6
    p b.curry(5)[1, 2][3, 4][5]  #=> 6
    p b.curry(1)[1]              #=> 1

    b = proc {|x, y, z, *w| (x||0) + (y||0) + (z||0) + w.inject(0, &:+) }
    p b.curry[1][2][3]           #=> 6
    p b.curry[1, 2][3, 4]        #=> 10
    p b.curry(5)[1][2][3][4][5]  #=> 15
    p b.curry(5)[1, 2][3, 4][5]  #=> 15
    p b.curry(1)[1]              #=> 1

    b = lambda {|x, y, z| (x||0) + (y||0) + (z||0) }
    p b.curry[1][2][3]           #=> 6
    p b.curry[1, 2][3, 4]        #=> wrong number of arguments (given 4, expected 3)
    p b.curry(5)                 #=> wrong number of arguments (given 5, expected 3)
    p b.curry(1)                 #=> wrong number of arguments (given 1, expected 3)

    b = lambda {|x, y, z, *w| (x||0) + (y||0) + (z||0) + w.inject(0, &:+) }
    p b.curry[1][2][3]           #=> 6
    p b.curry[1, 2][3, 4]        #=> 10
    p b.curry(5)[1][2][3][4][5]  #=> 15
    p b.curry(5)[1, 2][3, 4][5]  #=> 15
    p b.curry(1)                 #=> wrong number of arguments (given 1, expected 3)

    b = proc { :foo }
    p b.curry[]                  #=> :foo


# Proc#hash

(from ruby core)
---
    prc.hash   ->  integer

---

Returns a hash value corresponding to proc body.

See also Object#hash.


# Proc#inspect

(from ruby core)
---
    inspect()

---


# Proc#lambda?

(from ruby core)
---
    prc.lambda? -> true or false

---

Returns `true` for a Proc object for which argument handling is rigid. Such
procs are typically generated by `lambda`.

A Proc object generated by `proc` ignores extra arguments.

    proc {|a,b| [a,b] }.call(1,2,3)    #=> [1,2]

It provides `nil` for missing arguments.

    proc {|a,b| [a,b] }.call(1)        #=> [1,nil]

It expands a single array argument.

    proc {|a,b| [a,b] }.call([1,2])    #=> [1,2]

A Proc object generated by `lambda` doesn't have such tricks.

    lambda {|a,b| [a,b] }.call(1,2,3)  #=> ArgumentError
    lambda {|a,b| [a,b] }.call(1)      #=> ArgumentError
    lambda {|a,b| [a,b] }.call([1,2])  #=> ArgumentError

Proc#lambda? is a predicate for the tricks. It returns `true` if no tricks
apply.

    lambda {}.lambda?            #=> true
    proc {}.lambda?              #=> false

Proc.new is the same as `proc`.

    Proc.new {}.lambda?          #=> false

`lambda`, `proc` and Proc.new preserve the tricks of a Proc object given by
`&` argument.

    lambda(&lambda {}).lambda?   #=> true
    proc(&lambda {}).lambda?     #=> true
    Proc.new(&lambda {}).lambda? #=> true

    lambda(&proc {}).lambda?     #=> false
    proc(&proc {}).lambda?       #=> false
    Proc.new(&proc {}).lambda?   #=> false

A Proc object generated by `&` argument has the tricks

    def n(&b) b.lambda? end
    n {}                         #=> false

The `&` argument preserves the tricks if a Proc object is given by `&`
argument.

    n(&lambda {})                #=> true
    n(&proc {})                  #=> false
    n(&Proc.new {})              #=> false

A Proc object converted from a method has no tricks.

    def m() end
    method(:m).to_proc.lambda?   #=> true

    n(&method(:m))               #=> true
    n(&method(:m).to_proc)       #=> true

`define_method` is treated the same as method definition. The defined method
has no tricks.

    class C
      define_method(:d) {}
    end
    C.new.d(1,2)       #=> ArgumentError
    C.new.method(:d).to_proc.lambda?   #=> true

`define_method` always defines a method without the tricks, even if a
non-lambda Proc object is given. This is the only exception for which the
tricks are not preserved.

    class C
      define_method(:e, &proc {})
    end
    C.new.e(1,2)       #=> ArgumentError
    C.new.method(:e).to_proc.lambda?   #=> true

This exception ensures that methods never have tricks and makes it easy to
have wrappers to define methods that behave as usual.

    class C
      def self.def2(name, &body)
        define_method(name, &body)
      end

      def2(:f) {}
    end
    C.new.f(1,2)       #=> ArgumentError

The wrapper *def2* defines a method which has no tricks.


# Proc#parameters

(from ruby core)
---
    prc.parameters  -> array

---

Returns the parameter information of this proc.

    prc = lambda{|x, y=42, *other|}
    prc.parameters  #=> [[:req, :x], [:opt, :y], [:rest, :other]]


# Proc#source_location

(from ruby core)
---
    prc.source_location  -> [String, Integer]

---

Returns the Ruby source filename and line number containing this proc or `nil`
if this proc was not defined in Ruby (i.e. native)


# Proc#to_proc

(from ruby core)
---
    prc.to_proc -> proc

---

Part of the protocol for converting objects to `Proc` objects. Instances of
class `Proc` simply return themselves.


# Proc#to_s

(from ruby core)
---
    prc.to_s   -> string

---

Returns the unique identifier for this proc, along with an indication of where
the proc was defined.


# Proc#yield

(from ruby core)
---
    prc.call(params,...)   -> obj
    prc[params,...]        -> obj
    prc.(params,...)       -> obj

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


---
Also found in:
    gem method_source-0.8.2

