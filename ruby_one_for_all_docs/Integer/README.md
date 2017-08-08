# Integer < Numeric

(from ruby core)
---
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

    each_prime
    from_prime_division

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
    >
    >=
    >>
    []
    ^
    abs
    bit_length
    ceil
    chr
    coerce
    dclone
    denominator
    digits
    div
    divmod
    downto
    even?
    fdiv
    floor
    gcd
    gcdlcm
    inspect
    integer?
    lcm
    magnitude
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
    succ
    times
    to_bn
    to_d
    to_f
    to_i
    to_int
    to_r
    to_s
    truncate
    upto
    |
    ~

# Integer::each_prime

(from ruby core)
---
    each_prime(ubound) { |prime| ... }

---

Iterates the given block over all prime numbers.

See `Prime`#each for more details.


# Integer::from_prime_division

(from ruby core)
---
    from_prime_division(pd)

---

Re-composes a prime factorization and returns the product.

See Prime#int_from_prime_division for more details.


# Integer#%

(from ruby core)
---
    int % other        ->  real

---

Returns `int` modulo `other`.

See Numeric#divmod for more information.


# Integer#&

(from ruby core)
---
    integer & integer  ->  integer_result

---

Bitwise AND.


# Integer#*

(from ruby core)
---
    int * numeric  ->  numeric_result

---

Performs multiplication: the class of the resulting object depends on the
class of `numeric` and on the magnitude of the result. It may return a Bignum.


# Integer#**

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


# Integer#+

(from ruby core)
---
    int + numeric  ->  numeric_result

---

Performs addition: the class of the resulting object depends on the class of
`numeric` and on the magnitude of the result. It may return a Bignum.


# Integer#-

(from ruby core)
---
    int - numeric  ->  numeric_result

---

Performs subtraction: the class of the resulting object depends on the class
of `numeric` and on the magnitude of the result. It may return a Bignum.


# Integer#-@

(from ruby core)
---
    -int  ->  integer

---

Negates `int`. (returns an integer whose value is 0-int)


# Integer#/

(from ruby core)
---
    int / numeric  ->  numeric_result

---

Performs division: the class of the resulting object depends on the class of
`numeric` and on the magnitude of the result. It may return a Bignum.


# Integer#<

(from ruby core)
---
    int < real  ->  true or false

---

Returns `true` if the value of `int` is less than that of `real`.


# Integer#<<

(from ruby core)
---
    int << count  ->  integer

---

Shifts `int` left `count` positions, or right if `count` is negative.


# Integer#<=

(from ruby core)
---
    int <= real  ->  true or false

---

Returns `true` if the value of `int` is less than or equal to that of `real`.


# Integer#<=>

(from ruby core)
---
    int <=> numeric  ->  -1, 0, +1 or nil

---

Comparison---Returns `-1`, `0`, +`1` or `nil` depending on whether `int` is
less than, equal to, or greater than `numeric`.

This is the basis for the tests in the Comparable module.

`nil` is returned if the two values are incomparable.


# Integer#==

(from ruby core)
---
    int == other  ->  true or false

---

Return `true` if `int` equals `other` numerically. Contrast this with
`Integer#eql?`, which requires *other* to be a `Integer`.

    1 == 2      #=> false
    1 == 1.0    #=> true


# Integer#===

(from ruby core)
---
    ===(p1)

---


# Integer#>

(from ruby core)
---
    int > real  ->  true or false

---

Returns `true` if the value of `int` is greater than that of `real`.


# Integer#>=

(from ruby core)
---
    int >= real  ->  true or false

---

Returns `true` if the value of `int` is greater than or equal to that of
`real`.


# Integer#>>

(from ruby core)
---
    int >> count  ->  integer

---

Shifts `int` right `count` positions, or left if `count` is negative.


# Integer#[]

(from ruby core)
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


# Integer#^

(from ruby core)
---
    integer ^ integer  ->  integer_result

---

Bitwise EXCLUSIVE OR.


# Integer#abs

(from ruby core)
---
    int.abs        ->  integer

---

Returns the absolute value of `int`.

    -12345.abs   #=> 12345
    12345.abs    #=> 12345
    -1234567890987654321.abs   #=> 1234567890987654321


# Integer#bit_length

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


# Integer#ceil

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


# Integer#chr

(from ruby core)
---
    int.chr([encoding])  ->  string

---

Returns a string containing the character represented by the `int`'s value
according to `encoding`.

    65.chr    #=> "A"
    230.chr   #=> "\346"
    255.chr(Encoding::UTF_8)   #=> "\303\277"


# Integer#coerce

(from ruby core)
---
    big.coerce(numeric)  ->  array

---

Returns an array with both a `numeric` and a `big` represented as Bignum
objects.

This is achieved by converting `numeric` to a Bignum.

A TypeError is raised if the `numeric` is not a Fixnum or Bignum type.

    (0x3FFFFFFFFFFFFFFF+1).coerce(42)   #=> [42, 4611686018427387904]


# Integer#dclone

(from ruby core)
---
    dclone()

---

provides a unified `clone` operation, for REXML::XPathParser to use across
multiple Object types


# Integer#denominator

(from ruby core)
---
    int.denominator  ->  1

---

Returns 1.


# Integer#digits

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


# Integer#div

(from ruby core)
---
    int.div(numeric)  ->  integer

---

Performs integer division: returns integer result of dividing `int` by
`numeric`.


# Integer#divmod

(from ruby core)
---
    integer.divmod(numeric)  ->  array

---

See `Numeric#divmod`.


# Integer#downto

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


# Integer#even?

(from ruby core)
---
    int.even?  ->  true or false

---

Returns `true` if `int` is an even number.


# Integer#fdiv

(from ruby core)
---
    integer.fdiv(numeric)  ->  float

---

Returns the floating point result of dividing `fix` by `numeric`.

    654321.fdiv(13731)      #=> 47.6528293642124
    654321.fdiv(13731.24)   #=> 47.6519964693647

    -1234567890987654321.fdiv(13731)      #=> -89910996357705.5
    -1234567890987654321.fdiv(13731.24)   #=> -89909424858035.7


# Integer#floor

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


# Integer#gcd

(from ruby core)
---
    int.gcd(int2)  ->  integer

---

Returns the greatest common divisor (always positive).  0.gcd(x) and x.gcd(0)
return abs(x).

    2.gcd(2)                    #=> 2
    3.gcd(-7)                   #=> 1
    ((1<<31)-1).gcd((1<<61)-1)  #=> 1


# Integer#gcdlcm

(from ruby core)
---
    int.gcdlcm(int2)  ->  array

---

Returns an array; [int.gcd(int2), int.lcm(int2)].

    2.gcdlcm(2)                    #=> [2, 2]
    3.gcdlcm(-7)                   #=> [1, 21]
    ((1<<31)-1).gcdlcm((1<<61)-1)  #=> [1, 4951760154835678088235319297]


# Integer#inspect

(from ruby core)
---
    inspect(*args)

---


# Integer#integer?

(from ruby core)
---
    int.integer?  ->  true

---

Since `int` is already an Integer, this always returns `true`.


# Integer#lcm

(from ruby core)
---
    int.lcm(int2)  ->  integer

---

Returns the least common multiple (always positive).  0.lcm(x) and x.lcm(0)
return zero.

    2.lcm(2)                    #=> 2
    3.lcm(-7)                   #=> 21
    ((1<<31)-1).lcm((1<<61)-1)  #=> 4951760154835678088235319297


# Integer#magnitude

(from ruby core)
---
    int.magnitude  ->  integer

---

Returns the absolute value of `int`.

    -12345.abs   #=> 12345
    12345.abs    #=> 12345
    -1234567890987654321.abs   #=> 1234567890987654321


# Integer#modulo

(from ruby core)
---
    int.modulo(other)  ->  real

---

Returns `int` modulo `other`.

See Numeric#divmod for more information.


# Integer#next

(from ruby core)
---
    int.next  ->  integer

---

Returns the Integer equal to `int` + 1.

    1.next      #=> 2
    (-1).next   #=> 0
    1.succ      #=> 2
    (-1).succ   #=> 0


# Integer#numerator

(from ruby core)
---
    int.numerator  ->  self

---

Returns self.


# Integer#odd?

(from ruby core)
---
    int.odd?  ->  true or false

---

Returns `true` if `int` is an odd number.


# Integer#ord

(from ruby core)
---
    int.ord  ->  self

---

Returns the `int` itself.

    ?a.ord    #=> 97

This method is intended for compatibility to character constant in Ruby 1.9.

For example, ?a.ord returns 97 both in 1.8 and 1.9.


# Integer#pred

(from ruby core)
---
    int.pred  ->  integer

---

Returns the Integer equal to `int` - 1.

    1.pred      #=> 0
    (-1).pred   #=> -2


# Integer#prime?

(from ruby core)
---
    prime?()

---

Returns true if `self` is a prime number, else returns false.


# Integer#prime_division

(from ruby core)
---
    prime_division(generator = Prime::Generator23.new)

---

Returns the factorization of `self`.

See Prime#prime_division for more details.


# Integer#rationalize

(from ruby core)
---
    int.rationalize([eps])  ->  rational

---

Returns the value as a rational.  The optional argument eps is always ignored.


# Integer#remainder

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


# Integer#round

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


# Integer#size

(from ruby core)
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


# Integer#succ

(from ruby core)
---
    int.succ  ->  integer

---

Returns the Integer equal to `int` + 1.

    1.next      #=> 2
    (-1).next   #=> 0
    1.succ      #=> 2
    (-1).succ   #=> 0


# Integer#times

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


# Integer#to_bn

(from ruby core)
---
    to_bn()

---

Casts an Integer as an OpenSSL::BN

See `man bn` for more info.


# Integer#to_d

(from ruby core)
---
    int.to_d  -> bigdecimal

---

Convert `int` to a BigDecimal and return it.

    require 'bigdecimal'
    require 'bigdecimal/util'

    42.to_d
    # => 0.42e2


# Integer#to_f

(from ruby core)
---
    int.to_f  ->  float

---

Converts `int` to a `Float`.  If `int` doesn't fit in a `Float`, the result is
infinity.


# Integer#to_i

(from ruby core)
---
    int.to_i      ->  integer

---

As `int` is already an Integer, all these methods simply return the receiver.

Synonyms is #to_int


# Integer#to_int

(from ruby core)
---
    int.to_i      ->  integer

---

As `int` is already an Integer, all these methods simply return the receiver.

Synonyms is #to_int


# Integer#to_r

(from ruby core)
---
    int.to_r  ->  rational

---

Returns the value as a rational.

    1.to_r        #=> (1/1)
    (1<<64).to_r  #=> (18446744073709551616/1)


# Integer#to_s

(from ruby core)
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


# Integer#truncate

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


# Integer#upto

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


# Integer#|

(from ruby core)
---
    integer | integer  ->  integer_result

---

Bitwise OR.


# Integer#~

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

    month
    months
    multiple_of?
    ordinal
    ordinalize
    year
    years

# Integer#month

(from gem activesupport-5.1.2)
---
    month()

---


# Integer#months

(from gem activesupport-5.1.2)
---
    months()

---

Enables the use of time calculations and declarations, like `45.minutes +
2.hours + 4.years`.

These methods use Time#advance for precise date calculations when using
`from_now`, `ago`, etc. as well as adding or subtracting their results from a
Time object.

    # equivalent to Time.now.advance(months: 1)
    1.month.from_now

    # equivalent to Time.now.advance(years: 2)
    2.years.from_now

    # equivalent to Time.now.advance(months: 4, years: 5)
    (4.months + 5.years).from_now


# Integer#multiple_of?

(from gem activesupport-5.1.2)
---
    multiple_of?(number)

---

Check whether the integer is evenly divisible by the argument.

    0.multiple_of?(0)  # => true
    6.multiple_of?(5)  # => false
    10.multiple_of?(2) # => true


# Integer#ordinal

(from gem activesupport-5.1.2)
---
    ordinal()

---

Ordinal returns the suffix used to denote the position in an ordered sequence
such as 1st, 2nd, 3rd, 4th.

    1.ordinal     # => "st"
    2.ordinal     # => "nd"
    1002.ordinal  # => "nd"
    1003.ordinal  # => "rd"
    -11.ordinal   # => "th"
    -1001.ordinal # => "st"


# Integer#ordinalize

(from gem activesupport-5.1.2)
---
    ordinalize()

---

Ordinalize turns a number into an ordinal string used to denote the position
in an ordered sequence such as 1st, 2nd, 3rd, 4th.

    1.ordinalize     # => "1st"
    2.ordinalize     # => "2nd"
    1002.ordinalize  # => "1002nd"
    1003.ordinalize  # => "1003rd"
    -11.ordinalize   # => "-11th"
    -1001.ordinalize # => "-1001st"


# Integer#year

(from gem activesupport-5.1.2)
---
    year()

---


# Integer#years

(from gem activesupport-5.1.2)
---
    years()

---


(from gem builder-3.2.3)
---
Enhance the Integer class with a XML escaped character conversion.
---
# Constants:

XChar
:   [not documented]


# Instance methods:

    xchr

# Integer#xchr

(from gem builder-3.2.3)
---
    xchr(escape=true)

---

XML escaped version of chr. When `escape` is set to false the CP1252 fix is
still applied but utf-8 characters are not converted to character entities.


