# Symbol < Object

---
# Includes:
Comparable (from ruby core)

(from ruby core)
---

`Symbol` objects represent names and some strings inside the Ruby interpreter.
They are generated using the `:name` and `:"string"` literals syntax, and by
the various `to_sym` methods. The same `Symbol` object will be created for a
given name or string for the duration of a program's execution, regardless of
the context or meaning of that name. Thus if `Fred` is a constant in one
context, a method in another, and a class in a third, the `Symbol` `:Fred`
will be the same object in all three contexts.

    module One
      class Fred
      end
      $f1 = :Fred
    end
    module Two
      Fred = 1
      $f2 = :Fred
    end
    def Fred()
    end
    $f3 = :Fred
    $f1.object_id   #=> 2514190
    $f2.object_id   #=> 2514190
    $f3.object_id   #=> 2514190

BigDecimal extends the native Integer class to provide the #to_d method.

When you require the BigDecimal library in your application, this method will
be available on Integer objects.

Add double dispatch to Integer

When mathn is required, Integer's division is enhanced to return more precise
values from mathematical expressions.

    2/3*3  # => 0
    require 'mathn'
    2/3*3  # => 2

    (2**72) / ((2**70) * 3)  # => 4/3



Holds Integer values.  You cannot add a singleton method to an Integer. Any
attempt to add a singleton method to an Integer object will raise a TypeError.
---
# Constants:

GMP_VERSION
:   The version of loaded GMP.



# Class methods:

    all_symbols
    each_prime
    from_prime_division
    json_create

# Instance methods:

    %
    &
    *
    **
    +
    -
    -@
    /
    <
    <<
    <=
    <=>
    ==
    ===
    =~
    >
    >=
    >>
    []
    ^
    abs
    as_json
    bit_length
    capitalize
    casecmp
    casecmp?
    ceil
    chr
    coerce
    dclone
    denominator
    digits
    div
    divmod
    downcase
    downto
    empty?
    encoding
    even?
    fdiv
    floor
    gcd
    gcdlcm
    id2name
    inspect
    integer?
    intern
    lcm
    length
    magnitude
    match
    match?
    modulo
    next
    numerator
    odd?
    ord
    pred
    prime?
    prime_division
    rationalize
    remainder
    round
    size
    slice
    succ
    swapcase
    times
    to_bn
    to_d
    to_f
    to_i
    to_int
    to_json
    to_proc
    to_r
    to_s
    to_sym
    truncate
    upcase
    upto
    |
    ~

# Symbol::all_symbols

(from ruby core)
---
    Symbol.all_symbols    => array

---

Returns an array of all the symbols currently in Ruby's symbol table.

    Symbol.all_symbols.size    #=> 903
    Symbol.all_symbols[1,20]   #=> [:floor, :ARGV, :Binding, :symlink,
                                    :chown, :EOFError, :$;, :String,
                                    :LOCK_SH, :"setuid?", :$<,
                                    :default_proc, :compact, :extend,
                                    :Tms, :getwd, :$=, :ThreadGroup,
                                    :wait2, :$>]


# Symbol::json_create

(from ruby core)
---
    json_create(o)

---

Deserializes JSON string by converting the `string` value stored in the object
to a Symbol


# Symbol::each_prime

(from ruby core)
---
    each_prime(ubound) { |prime| ... }

---

Iterates the given block over all prime numbers.

See `Prime`#each for more details.


# Symbol::from_prime_division

(from ruby core)
---
    from_prime_division(pd)

---

Re-composes a prime factorization and returns the product.

See Prime#int_from_prime_division for more details.


# Symbol#<=>

(from ruby core)
### Implementation from Object
---
    obj <=> other -> 0 or nil

---

Returns 0 if `obj` and `other` are the same object or `obj == other`,
otherwise nil.

The `<=>` is used by various methods to compare objects, for example
Enumerable#sort, Enumerable#max etc.

Your implementation of `<=>` should return one of the following values: -1, 0,
1 or nil. -1 means self is smaller than other. 0 means self is equal to other.
1 means self is bigger than other. Nil means the two values could not be
compared.

When you define `<=>`, you can include Comparable to gain the methods `<=`,
`<`, `==`, `>=`, `>` and `between?`.


(from ruby core)
### Implementation from Integer
---
    int <=> numeric  ->  -1, 0, +1 or nil

---

Comparison---Returns `-1`, `0`, +`1` or `nil` depending on whether `int` is
less than, equal to, or greater than `numeric`.

This is the basis for the tests in the Comparable module.

`nil` is returned if the two values are incomparable.


# Symbol#==

(from ruby core)
### Implementation from BasicObject
---
    obj == other        -> true or false

---

Equality --- At the `Object` level, `==` returns `true` only if `obj` and
`other` are the same object. Typically, this method is overridden in
descendant classes to provide class-specific meaning.

Unlike `==`, the `equal?` method should never be overridden by subclasses as
it is used to determine object identity (that is, `a.equal?(b)` if and only if
`a` is the same object as `b`):

    obj = "a"
    other = obj.dup

    obj == other      #=> true
    obj.equal? other  #=> false
    obj.equal? obj    #=> true

The `eql?` method returns `true` if `obj` and `other` refer to the same hash
key.  This is used by Hash to test members for equality.  For objects of class
`Object`, `eql?` is synonymous with `==`.  Subclasses normally continue this
tradition by aliasing `eql?` to their overridden `==` method, but there are
exceptions.  `Numeric` types, for example, perform type conversion across
`==`, but not across `eql?`, so:

    1 == 1.0     #=> true
    1.eql? 1.0   #=> false


(from ruby core)
### Implementation from Comparable
---
    obj == other    -> true or false

---

Compares two objects based on the receiver's `<=>` method, returning true if
it returns 0. Also returns true if *obj* and *other* are the same object.


(from ruby core)
### Implementation from Integer
---
    int == other  ->  true or false

---

Return `true` if `int` equals `other` numerically. Contrast this with
`Integer#eql?`, which requires *other* to be a `Integer`.

    1 == 2      #=> false
    1 == 1.0    #=> true


# Symbol#===

(from ruby core)
### Implementation from Object
---
    obj === other   -> true or false

---

Case Equality -- For class Object, effectively the same as calling `#==`, but
typically overridden by descendants to provide meaningful semantics in `case`
statements.


(from ruby core)
### Implementation from Integer
---
    ===(p1)

---


# Symbol#=~

(from ruby core)
---
    sym =~ obj   -> integer or nil

---

Returns `sym.to_s =~ obj`.


# Symbol#[]

(from ruby core)
### Implementation from Integer
---
    int[n]  ->  0, 1

---

Bit Reference---Returns the +n+th bit in the binary representation of `int`,
where `int[0]` is the least significant bit.

For example:

    a = 0b11001100101010
    30.downto(0) do |n| print a[n] end
    #=> 0000000000000000011001100101010

    a = 9**15
    50.downto(0) do |n|
      print a[n]
    end
    #=> 000101110110100000111000011110010100111100010111001


# Symbol#as_json

(from ruby core)
---
    as_json(*)

---

Returns a hash, that will be turned into a JSON object and represent this
object.


# Symbol#capitalize

(from ruby core)
---
    sym.capitalize [options]   -> symbol

---

Same as `sym.to_s.capitalize.intern`.


# Symbol#casecmp

(from ruby core)
---
    sym.casecmp(other)  -> -1, 0, +1 or nil

---

Case-insensitive version of `Symbol#<=>`. Currently, case-insensitivity only
works on characters A-Z/a-z, not all of Unicode. This is different from
`casecmp?`.


# Symbol#casecmp?

(from ruby core)
---
    sym.casecmp?(other)  -> true, false, or nil

---

Returns true if sym and other are equal after Unicode case folding, false if
they are not equal, and nil if other is not a symbol.


# Symbol#downcase

(from ruby core)
---
    sym.downcase [options]   -> symbol

---

Same as `sym.to_s.downcase.intern`.


# Symbol#empty?

(from ruby core)
---
    sym.empty?   -> true or false

---

Returns that *sym* is :"" or not.


# Symbol#encoding

(from ruby core)
---
    sym.encoding   -> encoding

---

Returns the Encoding object that represents the encoding of *sym*.


# Symbol#id2name

(from ruby core)
---
    sym.id2name   -> string

---

Returns the name or string corresponding to *sym*.

    :fred.id2name   #=> "fred"


# Symbol#inspect

(from ruby core)
### Implementation from Object
---
    obj.inspect   -> string

---

Returns a string containing a human-readable representation of *obj*. The
default `inspect` shows the object's class name, an encoding of the object id,
and a list of the instance variables and their values (by calling #inspect on
each of them). User defined classes should override this method to provide a
better representation of *obj*.  When overriding this method, it should return
a string whose encoding is compatible with the default external encoding.

    [ 1, 2, 3..4, 'five' ].inspect   #=> "[1, 2, 3..4, \"five\"]"
    Time.new.inspect                 #=> "2008-03-08 19:43:39 +0900"

    class Foo
    end
    Foo.new.inspect                  #=> "#<Foo:0x0300c868>"

    class Bar
      def initialize
        @bar = 1
      end
    end
    Bar.new.inspect                  #=> "#<Bar:0x0300c868 @bar=1>"


(from ruby core)
### Implementation from Integer
---
    inspect(*args)

---


# Symbol#intern

(from ruby core)
---
    sym.intern   -> sym

---

In general, `to_sym` returns the `Symbol` corresponding to an object. As *sym*
is already a symbol, `self` is returned in this case.


# Symbol#length

(from ruby core)
---
    sym.length    -> integer

---

Same as `sym.to_s.length`.


# Symbol#match

(from ruby core)
---
    sym.match(obj)   -> MatchData or nil

---

Returns `sym.to_s.match(obj)`.


# Symbol#match?

(from ruby core)
---
    sym.match?(obj)   -> true or false

---

Returns `sym.to_s.match?(obj)`.


# Symbol#next

(from ruby core)
### Implementation from Integer
---
    int.next  ->  integer

---

Returns the Integer equal to `int` + 1.

    1.next      #=> 2
    (-1).next   #=> 0
    1.succ      #=> 2
    (-1).succ   #=> 0


# Symbol#size

(from ruby core)
### Implementation from File
---
    file.size    -> integer

---

Returns the size of *file* in bytes.

    File.new("testfile").size   #=> 66


(from ruby core)
### Implementation from Integer
---
    int.size  ->  int

---

Returns the number of bytes in the machine representation of `fix`.

    1.size            #=> 4
    -1.size           #=> 4
    2147483647.size   #=> 4
    (256**10 - 1).size   #=> 12
    (256**20 - 1).size   #=> 20
    (256**40 - 1).size   #=> 40


# Symbol#slice

(from ruby core)
---
    sym.slice(idx)      -> char
    sym.slice(b, n)     -> string

---

Returns `sym.to_s[]`.


# Symbol#succ

(from ruby core)
### Implementation from Integer
---
    int.succ  ->  integer

---

Returns the Integer equal to `int` + 1.

    1.next      #=> 2
    (-1).next   #=> 0
    1.succ      #=> 2
    (-1).succ   #=> 0


# Symbol#swapcase

(from ruby core)
---
    sym.swapcase [options]   -> symbol

---

Same as `sym.to_s.swapcase.intern`.


# Symbol#to_json

(from ruby core)
---
    to_json(*a)

---

Stores class name (Symbol) with String representation of Symbol as a JSON
string.


# Symbol#to_proc

(from ruby core)
---
    sym.to_proc

---

Returns a *Proc* object which respond to the given method by *sym*.

    (1..3).collect(&:to_s)  #=> ["1", "2", "3"]


# Symbol#to_s

(from ruby core)
### Implementation from Object
---
    obj.to_s    -> string

---

Returns a string representing *obj*. The default `to_s` prints the object's
class and an encoding of the object id. As a special case, the top-level
object that is the initial execution context of Ruby programs returns
``main''.


(from ruby core)
### Implementation from Integer
---
    int.to_s(base=10)  ->  string

---

Returns a string containing the representation of `int` radix `base` (between
2 and 36).

    12345.to_s       #=> "12345"
    12345.to_s(2)    #=> "11000000111001"
    12345.to_s(8)    #=> "30071"
    12345.to_s(10)   #=> "12345"
    12345.to_s(16)   #=> "3039"
    12345.to_s(36)   #=> "9ix"
    78546939656932.to_s(36)  #=> "rubyrules"


# Symbol#to_sym

(from ruby core)
---
    sym.to_sym   -> sym

---

In general, `to_sym` returns the `Symbol` corresponding to an object. As *sym*
is already a symbol, `self` is returned in this case.


# Symbol#upcase

(from ruby core)
---
    sym.upcase [options]   -> symbol

---

Same as `sym.to_s.upcase.intern`.


# Symbol#%

(from ruby core)
---
    int % other        ->  real

---

Returns `int` modulo `other`.

See Numeric#divmod for more information.


# Symbol#&

(from ruby core)
---
    integer & integer  ->  integer_result

---

Bitwise AND.


# Symbol#*

(from ruby core)
---
    int * numeric  ->  numeric_result

---

Performs multiplication: the class of the resulting object depends on the
class of `numeric` and on the magnitude of the result. It may return a Bignum.


# Symbol#**

(from ruby core)
---
    integer ** numeric  ->  numeric_result

---

Raises `integer` to the power of `numeric`, which may be negative or
fractional. The result may be an Integer, or a Float

    2 ** 3      #=> 8
    2 ** -1     #=> (1/2)
    2 ** 0.5    #=> 1.4142135623731

    123456789 ** 2      #=> 15241578750190521
    123456789 ** 1.2    #=> 5126464716.09932
    123456789 ** -2     #=> (1/15241578750190521)


# Symbol#+

(from ruby core)
---
    int + numeric  ->  numeric_result

---

Performs addition: the class of the resulting object depends on the class of
`numeric` and on the magnitude of the result. It may return a Bignum.


# Symbol#-

(from ruby core)
---
    int - numeric  ->  numeric_result

---

Performs subtraction: the class of the resulting object depends on the class
of `numeric` and on the magnitude of the result. It may return a Bignum.


# Symbol#-@

(from ruby core)
---
    -int  ->  integer

---

Negates `int`. (returns an integer whose value is 0-int)


# Symbol#/

(from ruby core)
---
    int / numeric  ->  numeric_result

---

Performs division: the class of the resulting object depends on the class of
`numeric` and on the magnitude of the result. It may return a Bignum.


# Symbol#<

(from ruby core)
### Implementation from Comparable
---
    obj < other    -> true or false

---

Compares two objects based on the receiver's `<=>` method, returning true if
it returns -1.


(from ruby core)
---
    int < real  ->  true or false

---

Returns `true` if the value of `int` is less than that of `real`.


# Symbol#<<

(from ruby core)
---
    int << count  ->  integer

---

Shifts `int` left `count` positions, or right if `count` is negative.


# Symbol#<=

(from ruby core)
### Implementation from Comparable
---
    obj <= other    -> true or false

---

Compares two objects based on the receiver's `<=>` method, returning true if
it returns -1 or 0.


(from ruby core)
---
    int <= real  ->  true or false

---

Returns `true` if the value of `int` is less than or equal to that of `real`.


# Symbol#>

(from ruby core)
### Implementation from Comparable
---
    obj > other    -> true or false

---

Compares two objects based on the receiver's `<=>` method, returning true if
it returns 1.


(from ruby core)
---
    int > real  ->  true or false

---

Returns `true` if the value of `int` is greater than that of `real`.


# Symbol#>=

(from ruby core)
### Implementation from Comparable
---
    obj >= other    -> true or false

---

Compares two objects based on the receiver's `<=>` method, returning true if
it returns 0 or 1.


(from ruby core)
---
    int >= real  ->  true or false

---

Returns `true` if the value of `int` is greater than or equal to that of
`real`.


# Symbol#>>

(from ruby core)
---
    int >> count  ->  integer

---

Shifts `int` right `count` positions, or left if `count` is negative.


# Symbol#^

(from ruby core)
---
    integer ^ integer  ->  integer_result

---

Bitwise EXCLUSIVE OR.


# Symbol#abs

(from ruby core)
---
    int.abs        ->  integer

---

Returns the absolute value of `int`.

    -12345.abs   #=> 12345
    12345.abs    #=> 12345
    -1234567890987654321.abs   #=> 1234567890987654321


# Symbol#bit_length

(from ruby core)
---
    int.bit_length -> integer

---

Returns the number of bits of the value of *int*.

"the number of bits" means that the bit position of the highest bit which is
different to the sign bit. (The bit position of the bit 2**n is n+1.) If there
is no such bit (zero or minus one), zero is returned.

I.e. This method returns ceil(log2(int < 0 ? -int : int+1)).

    (-2**10000-1).bit_length  #=> 10001
    (-2**10000).bit_length    #=> 10000
    (-2**10000+1).bit_length  #=> 10000
    (-2**1000-1).bit_length   #=> 1001
    (-2**1000).bit_length     #=> 1000
    (-2**1000+1).bit_length   #=> 1000
    (-2**12-1).bit_length     #=> 13
    (-2**12).bit_length       #=> 12
    (-2**12+1).bit_length     #=> 12
    -0x101.bit_length         #=> 9
    -0x100.bit_length         #=> 8
    -0xff.bit_length          #=> 8
    -2.bit_length             #=> 1
    -1.bit_length             #=> 0
    0.bit_length              #=> 0
    1.bit_length              #=> 1
    0xff.bit_length           #=> 8
    0x100.bit_length          #=> 9
    (2**12-1).bit_length      #=> 12
    (2**12).bit_length        #=> 13
    (2**12+1).bit_length      #=> 13
    (2**1000-1).bit_length    #=> 1000
    (2**1000).bit_length      #=> 1001
    (2**1000+1).bit_length    #=> 1001
    (2**10000-1).bit_length   #=> 10000
    (2**10000).bit_length     #=> 10001
    (2**10000+1).bit_length   #=> 10001

This method can be used to detect overflow in Array#pack as follows.

    if n.bit_length < 32
      [n].pack("l") # no overflow
    else
      raise "overflow"
    end


# Symbol#ceil

(from ruby core)
---
    int.ceil([ndigits])  ->  integer or float

---

Returns the smallest number than or equal to `int` in decimal digits (default
0 digits).

Precision may be negative.  Returns a floating point number when `ndigits` is
positive, `self` for zero, and ceil up for negative.

    1.ceil        #=> 1
    1.ceil(2)     #=> 1.0
    15.ceil(-1)   #=> 20


# Symbol#chr

(from ruby core)
---
    int.chr([encoding])  ->  string

---

Returns a string containing the character represented by the `int`'s value
according to `encoding`.

    65.chr    #=> "A"
    230.chr   #=> "\346"
    255.chr(Encoding::UTF_8)   #=> "\303\277"


# Symbol#coerce

(from ruby core)
---
    big.coerce(numeric)  ->  array

---

Returns an array with both a `numeric` and a `big` represented as Bignum
objects.

This is achieved by converting `numeric` to a Bignum.

A TypeError is raised if the `numeric` is not a Fixnum or Bignum type.

    (0x3FFFFFFFFFFFFFFF+1).coerce(42)   #=> [42, 4611686018427387904]


# Symbol#dclone

(from ruby core)
### Implementation from Object
---
    dclone()

---

provides a unified `clone` operation, for REXML::XPathParser to use across
multiple Object types


(from ruby core)
---
    dclone()

---

provides a unified `clone` operation, for REXML::XPathParser to use across
multiple Object types


# Symbol#denominator

(from ruby core)
---
    int.denominator  ->  1

---

Returns 1.


# Symbol#digits

(from ruby core)
---
    int.digits       -> [int]
    int.digits(base) -> [int]

---

Returns the array including the digits extracted by place-value notation with
radix `base` of `int`.

`base` should be greater than or equal to 2.

    12345.digits      #=> [5, 4, 3, 2, 1]
    12345.digits(7)   #=> [4, 6, 6, 0, 5]
    12345.digits(100) #=> [45, 23, 1]

    -12345.digits(7)  #=> Math::DomainError


# Symbol#div

(from ruby core)
---
    int.div(numeric)  ->  integer

---

Performs integer division: returns integer result of dividing `int` by
`numeric`.


# Symbol#divmod

(from ruby core)
---
    integer.divmod(numeric)  ->  array

---

See `Numeric#divmod`.


# Symbol#downto

(from ruby core)
---
    int.downto(limit) {|i| block }  ->  self
    int.downto(limit)               ->  an_enumerator

---

Iterates the given block, passing decreasing values from `int` down to and
including `limit`.

If no block is given, an Enumerator is returned instead.

    5.downto(1) { |n| print n, ".. " }
    print "  Liftoff!\n"
    #=> "5.. 4.. 3.. 2.. 1..   Liftoff!"


# Symbol#even?

(from ruby core)
---
    int.even?  ->  true or false

---

Returns `true` if `int` is an even number.


# Symbol#fdiv

(from ruby core)
---
    integer.fdiv(numeric)  ->  float

---

Returns the floating point result of dividing `fix` by `numeric`.

    654321.fdiv(13731)      #=> 47.6528293642124
    654321.fdiv(13731.24)   #=> 47.6519964693647

    -1234567890987654321.fdiv(13731)      #=> -89910996357705.5
    -1234567890987654321.fdiv(13731.24)   #=> -89909424858035.7


# Symbol#floor

(from ruby core)
---
    int.floor([ndigits])  ->  integer or float

---

Returns the largest number less than or equal to `int` in decimal digits
(default 0 digits).

Precision may be negative.  Returns a floating point number when `ndigits` is
positive, `self` for zero, and floor down for negative.

    1.floor        #=> 1
    1.floor(2)     #=> 1.0
    15.floor(-1)   #=> 10


# Symbol#gcd

(from ruby core)
---
    int.gcd(int2)  ->  integer

---

Returns the greatest common divisor (always positive).  0.gcd(x) and x.gcd(0)
return abs(x).

    2.gcd(2)                    #=> 2
    3.gcd(-7)                   #=> 1
    ((1<<31)-1).gcd((1<<61)-1)  #=> 1


# Symbol#gcdlcm

(from ruby core)
---
    int.gcdlcm(int2)  ->  array

---

Returns an array; [int.gcd(int2), int.lcm(int2)].

    2.gcdlcm(2)                    #=> [2, 2]
    3.gcdlcm(-7)                   #=> [1, 21]
    ((1<<31)-1).gcdlcm((1<<61)-1)  #=> [1, 4951760154835678088235319297]


# Symbol#integer?

(from ruby core)
---
    int.integer?  ->  true

---

Since `int` is already an Integer, this always returns `true`.


# Symbol#lcm

(from ruby core)
---
    int.lcm(int2)  ->  integer

---

Returns the least common multiple (always positive).  0.lcm(x) and x.lcm(0)
return zero.

    2.lcm(2)                    #=> 2
    3.lcm(-7)                   #=> 21
    ((1<<31)-1).lcm((1<<61)-1)  #=> 4951760154835678088235319297


# Symbol#magnitude

(from ruby core)
---
    int.magnitude  ->  integer

---

Returns the absolute value of `int`.

    -12345.abs   #=> 12345
    12345.abs    #=> 12345
    -1234567890987654321.abs   #=> 1234567890987654321


# Symbol#modulo

(from ruby core)
---
    int.modulo(other)  ->  real

---

Returns `int` modulo `other`.

See Numeric#divmod for more information.


# Symbol#numerator

(from ruby core)
---
    int.numerator  ->  self

---

Returns self.


# Symbol#odd?

(from ruby core)
---
    int.odd?  ->  true or false

---

Returns `true` if `int` is an odd number.


# Symbol#ord

(from ruby core)
---
    int.ord  ->  self

---

Returns the `int` itself.

    ?a.ord    #=> 97

This method is intended for compatibility to character constant in Ruby 1.9.

For example, ?a.ord returns 97 both in 1.8 and 1.9.


# Symbol#pred

(from ruby core)
---
    int.pred  ->  integer

---

Returns the Integer equal to `int` - 1.

    1.pred      #=> 0
    (-1).pred   #=> -2


# Symbol#prime?

(from ruby core)
---
    prime?()

---

Returns true if `self` is a prime number, else returns false.


# Symbol#prime_division

(from ruby core)
---
    prime_division(generator = Prime::Generator23.new)

---

Returns the factorization of `self`.

See Prime#prime_division for more details.


# Symbol#rationalize

(from ruby core)
---
    int.rationalize([eps])  ->  rational

---

Returns the value as a rational.  The optional argument eps is always ignored.


# Symbol#remainder

(from ruby core)
---
    int.remainder(numeric)  ->  real

---

Returns the remainder after dividing *big* by *numeric* as:

    x.remainder(y) means x-y*(x/y).truncate

Examples

    5.remainder(3)    #=> 2
    -5.remainder(3)   #=> -2
    5.remainder(-3)   #=> 2
    -5.remainder(-3)  #=> -2

    -1234567890987654321.remainder(13731)      #=> -6966
    -1234567890987654321.remainder(13731.24)   #=> -9906.22531493148

See Numeric#divmod.


# Symbol#round

(from ruby core)
---
    int.round([ndigits])  ->  integer or float

---

Rounds `int` to a given precision in decimal digits (default 0 digits).

Precision may be negative.  Returns a floating point number when `ndigits` is
positive, `self` for zero, and round down for negative.

    1.round        #=> 1
    1.round(2)     #=> 1.0
    15.round(-1)   #=> 20


# Symbol#times

(from ruby core)
---
    int.times {|i| block }  ->  self
    int.times               ->  an_enumerator

---

Iterates the given block `int` times, passing in values from zero to `int -
1`.

If no block is given, an Enumerator is returned instead.

    5.times do |i|
      print i, " "
    end
    #=> 0 1 2 3 4


# Symbol#to_bn

(from ruby core)
---
    to_bn()

---

Casts an Integer as an OpenSSL::BN

See `man bn` for more info.


# Symbol#to_d

(from ruby core)
---
    int.to_d  -> bigdecimal

---

Convert `int` to a BigDecimal and return it.

    require 'bigdecimal'
    require 'bigdecimal/util'

    42.to_d
    # => 0.42e2


# Symbol#to_f

(from ruby core)
---
    int.to_f  ->  float

---

Converts `int` to a `Float`.  If `int` doesn't fit in a `Float`, the result is
infinity.


# Symbol#to_i

(from ruby core)
---
    int.to_i      ->  integer

---

As `int` is already an Integer, all these methods simply return the receiver.

Synonyms is #to_int


# Symbol#to_int

(from ruby core)
---
    int.to_i      ->  integer

---

As `int` is already an Integer, all these methods simply return the receiver.

Synonyms is #to_int


# Symbol#to_r

(from ruby core)
---
    int.to_r  ->  rational

---

Returns the value as a rational.

    1.to_r        #=> (1/1)
    (1<<64).to_r  #=> (18446744073709551616/1)


# Symbol#truncate

(from ruby core)
### Implementation from File
---
    file.truncate(integer)    -> 0

---

Truncates *file* to at most *integer* bytes. The file must be opened for
writing. Not available on all platforms.

    f = File.new("out", "w")
    f.syswrite("1234567890")   #=> 10
    f.truncate(5)              #=> 0
    f.close()                  #=> nil
    File.size("out")           #=> 5


(from ruby core)
---
    int.truncate([ndigits])  ->  integer or float

---

Returns the smallest number than or equal to `int` in decimal digits (default
0 digits).

Precision may be negative.  Returns a floating point number when `ndigits` is
positive, `self` for zero, and truncate up for negative.

    1.truncate        #=> 1
    1.truncate(2)     #=> 1.0
    15.truncate(-1)   #=> 10


# Symbol#upto

(from ruby core)
---
    int.upto(limit) {|i| block }  ->  self
    int.upto(limit)               ->  an_enumerator

---

Iterates the given block, passing in integer values from `int` up to and
including `limit`.

If no block is given, an Enumerator is returned instead.

For example:

    5.upto(10) { |i| print i, " " }
    #=> 5 6 7 8 9 10


# Symbol#|

(from ruby core)
---
    integer | integer  ->  integer_result

---

Bitwise OR.


# Symbol#~

(from ruby core)
---
    ~integer  ->  integer

---

One's complement: returns a number where each bit is flipped.

Inverts the bits in an integer. As Integers are conceptually infinite length,
the result acts as if it had an infinite number of one bits to the left. In
hex representations, this is displayed as two periods to the left of the
digits.

    sprintf("%X", ~0x1122334455)    #=> "..FEEDDCCBBAA"


(from gem activesupport-5.1.2)
---

---
# Instance methods:

    duplicable?

# Symbol#duplicable?

(from gem activesupport-5.1.2)
---
    duplicable?()

---

Symbols are not duplicable:

    :my_symbol.duplicable? # => false
    :my_symbol.dup         # => TypeError: can't dup Symbol


(from gem builder-3.2.3)
---
# Instance methods:

    _blankslate_as_name

# Symbol#_blankslate_as_name

(from gem builder-3.2.3)
---
    _blankslate_as_name()

---


