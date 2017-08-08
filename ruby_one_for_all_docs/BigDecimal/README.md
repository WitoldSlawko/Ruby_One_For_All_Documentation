# BigDecimal < Numeric

(from ruby core)
---
BigDecimal provides arbitrary-precision floating point decimal arithmetic.

## Introduction

Ruby provides built-in support for arbitrary precision integer arithmetic.

For example:

    42**13  #=>   1265437718438866624512

BigDecimal provides similar support for very large or very accurate floating
point numbers.

Decimal arithmetic is also useful for general calculation, because it provides
the correct answers people expect--whereas normal binary floating point
arithmetic often introduces subtle errors because of the conversion between
base 10 and base 2.

For example, try:

    sum = 0
    10_000.times do
      sum = sum + 0.0001
    end
    print sum #=> 0.9999999999999062

and contrast with the output from:

    require 'bigdecimal'

    sum = BigDecimal.new("0")
    10_000.times do
      sum = sum + BigDecimal.new("0.0001")
    end
    print sum #=> 0.1E1

Similarly:

    (BigDecimal.new("1.2") - BigDecimal("1.0")) == BigDecimal("0.2") #=> true

    (1.2 - 1.0) == 0.2 #=> false

## Special features of accurate decimal arithmetic

Because BigDecimal is more accurate than normal binary floating point
arithmetic, it requires some special values.

### Infinity

BigDecimal sometimes needs to return infinity, for example if you divide a
value by zero.

    BigDecimal.new("1.0") / BigDecimal.new("0.0")  #=> Infinity
    BigDecimal.new("-1.0") / BigDecimal.new("0.0")  #=> -Infinity

You can represent infinite numbers to BigDecimal using the strings
`'Infinity'`, `'+Infinity'` and `'-Infinity'` (case-sensitive)

### Not a Number

When a computation results in an undefined value, the special value `NaN` (for
'not a number') is returned.

Example:

    BigDecimal.new("0.0") / BigDecimal.new("0.0") #=> NaN

You can also create undefined values.

NaN is never considered to be the same as any other value, even NaN itself:

    n = BigDecimal.new('NaN')
    n == 0.0 #=> false
    n == n #=> false

### Positive and negative zero

If a computation results in a value which is too small to be represented as a
BigDecimal within the currently specified limits of precision, zero must be
returned.

If the value which is too small to be represented is negative, a BigDecimal
value of negative zero is returned.

    BigDecimal.new("1.0") / BigDecimal.new("-Infinity") #=> -0.0

If the value is positive, a value of positive zero is returned.

    BigDecimal.new("1.0") / BigDecimal.new("Infinity") #=> 0.0

(See BigDecimal.mode for how to specify limits of precision.)

Note that `-0.0` and `0.0` are considered to be the same for the purposes of
comparison.

Note also that in mathematics, there is no particular concept of negative or
positive zero; true mathematical zero has no sign.

## License

Copyright (C) 2002 by Shigeo Kobayashi <shigeo@tinyforest.gr.jp>.

BigDecimal is released under the Ruby and 2-clause BSD licenses. See
LICENSE.txt for details.

Maintained by mrkn <mrkn@mrkn.jp> and ruby-core members.

Documented by zzak <zachary@zacharyscott.net>, mathew <meta@pobox.com>, and
many other contributors.

BigDecimal extends the native Numeric class to provide the #to_digits and
#to_d methods.

When you require BigDecimal in your application, this method will be available
on BigDecimal objects.

---
# Constants:

BASE
:   Base value used in internal calculations.  On a 32 bit system, BASE is
    10000, indicating that calculation is done in groups of 4 digits. (If it
    were larger, BASE**2 wouldn't fit in 32 bits, so you couldn't guarantee
    that two groups could always be multiplied together without overflow.)
EXCEPTION_ALL
:   Determines whether overflow, underflow or zero divide result in an
    exception being thrown. See BigDecimal.mode.
EXCEPTION_INFINITY
:   Determines what happens when the result of a computation is infinity.  See
    BigDecimal.mode.
EXCEPTION_NaN
:   Determines what happens when the result of a computation is not a number
    (NaN). See BigDecimal.mode.
EXCEPTION_OVERFLOW
:   Determines what happens when the result of a computation is an overflow (a
    result too large to be represented). See BigDecimal.mode.
EXCEPTION_UNDERFLOW
:   Determines what happens when the result of a computation is an underflow
    (a result too small to be represented). See BigDecimal.mode.
EXCEPTION_ZERODIVIDE
:   Determines what happens when a division by zero is performed. See
    BigDecimal.mode.
INFINITY
:   Positive infinity value.

NAN
:   'Not a Number' value.

ROUND_CEILING
:   Round towards +Infinity. See BigDecimal.mode.

ROUND_DOWN
:   Indicates that values should be rounded towards zero. See BigDecimal.mode.
ROUND_FLOOR
:   Round towards -Infinity. See BigDecimal.mode.

ROUND_HALF_DOWN
:   Indicates that digits >= 6 should be rounded up, others rounded down. See
    BigDecimal.mode.
ROUND_HALF_EVEN
:   Round towards the even neighbor. See BigDecimal.mode.

ROUND_HALF_UP
:   Indicates that digits >= 5 should be rounded up, others rounded down. See
    BigDecimal.mode.

ROUND_MODE
:   Determines what happens when a result must be rounded in order to fit in
    the appropriate number of significant digits. See BigDecimal.mode.
ROUND_UP
:   Indicates that values should be rounded away from zero. See
    BigDecimal.mode.
SIGN_NEGATIVE_FINITE
:   Indicates that a value is negative and finite. See BigDecimal.sign.

SIGN_NEGATIVE_INFINITE
:   Indicates that a value is negative and infinite. See BigDecimal.sign.

SIGN_NEGATIVE_ZERO
:   Indicates that a value is -0. See BigDecimal.sign.

SIGN_NaN
:   Indicates that a value is not a number. See BigDecimal.sign.

SIGN_POSITIVE_FINITE
:   Indicates that a value is positive and finite. See BigDecimal.sign.

SIGN_POSITIVE_INFINITE
:   Indicates that a value is positive and infinite. See BigDecimal.sign.

SIGN_POSITIVE_ZERO
:   Indicates that a value is +0. See BigDecimal.sign.



# Class methods:

    _load
    double_fig
    json_create
    limit
    mode
    new
    save_exception_mode
    save_limit
    save_rounding_mode
    ver

# Instance methods:

    %
    *
    **
    +
    +@
    -
    -@
    /
    <
    <=
    <=>
    ==
    ===
    >
    >=
    _dump
    abs
    add
    as_json
    ceil
    coerce
    div
    divmod
    eql?
    exponent
    finite?
    fix
    floor
    frac
    hash
    infinite?
    inspect
    modulo
    mult
    nan?
    nonzero?
    power
    precs
    quo
    remainder
    round
    sign
    split
    sqrt
    sub
    to_d
    to_digits
    to_f
    to_i
    to_int
    to_json
    to_r
    to_s
    truncate
    zero?

# BigDecimal::_load

(from ruby core)
---
    _load(p1)

---

Internal method used to provide marshalling support. See the Marshal module.


# BigDecimal::double_fig

(from ruby core)
---
    BigDecimal.double_fig

---

The BigDecimal.double_fig class method returns the number of digits a Float
number is allowed to have. The result depends upon the CPU and OS in use.


# BigDecimal::json_create

(from ruby core)
---
    json_create(object)

---

Import a JSON Marshalled object.

method used for JSON marshalling support.


# BigDecimal::limit

(from ruby core)
---
    BigDecimal.limit(digits)

---

Limit the number of significant digits in newly created BigDecimal numbers to
the specified value. Rounding is performed as necessary, as specified by
BigDecimal.mode.

A limit of 0, the default, means no upper limit.

The limit specified by this method takes less priority over any limit
specified to instance methods such as ceil, floor, truncate, or round.


# BigDecimal::mode

(from ruby core)
---
    BigDecimal.mode(mode, value)

---

Controls handling of arithmetic exceptions and rounding. If no value is
supplied, the current value is returned.

Six values of the mode parameter control the handling of arithmetic
exceptions:

BigDecimal::EXCEPTION_NaN BigDecimal::EXCEPTION_INFINITY
BigDecimal::EXCEPTION_UNDERFLOW BigDecimal::EXCEPTION_OVERFLOW
BigDecimal::EXCEPTION_ZERODIVIDE BigDecimal::EXCEPTION_ALL

For each mode parameter above, if the value set is false, computation
continues after an arithmetic exception of the appropriate type. When
computation continues, results are as follows:

EXCEPTION_NaN
:   NaN
EXCEPTION_INFINITY
:   +Infinity or -Infinity
EXCEPTION_UNDERFLOW
:   0
EXCEPTION_OVERFLOW
:   +Infinity or -Infinity
EXCEPTION_ZERODIVIDE
:   +Infinity or -Infinity


One value of the mode parameter controls the rounding of numeric values:
BigDecimal::ROUND_MODE. The values it can take are:

ROUND_UP, :up
:   round away from zero
ROUND_DOWN, :down, :truncate
:   round towards zero (truncate)
ROUND_HALF_UP, :half_up, :default
:   round towards the nearest neighbor, unless both neighbors are equidistant,
    in which case round away from zero. (default)
ROUND_HALF_DOWN, :half_down
:   round towards the nearest neighbor, unless both neighbors are equidistant,
    in which case round towards zero.
ROUND_HALF_EVEN, :half_even, :banker
:   round towards the nearest neighbor, unless both neighbors are equidistant,
    in which case round towards the even neighbor (Banker's rounding)
ROUND_CEILING, :ceiling, :ceil
:   round towards positive infinity (ceil)
ROUND_FLOOR, :floor
:   round towards negative infinity (floor)



# BigDecimal::new

(from ruby core)
---
    new(initial, digits)

---

Create a new BigDecimal object.

initial
:   The initial value, as an Integer, a Float, a Rational, a BigDecimal, or a
    String.

    If it is a String, spaces are ignored and unrecognized characters
    terminate the value.

digits
:   The number of significant digits, as an Integer. If omitted or 0, the
    number of significant digits is determined from the initial value.


The actual number of significant digits used in computation is usually larger
than the specified number.

#### Exceptions

TypeError
:   If the `initial` type is neither Integer, Float, Rational, nor BigDecimal,
    this exception is raised.

TypeError
:   If the `digits` is not an Integer, this exception is raised.

ArgumentError
:   If `initial` is a Float, and the `digits` is larger than Float::DIG + 1,
    this exception is raised.

ArgumentError
:   If the `initial` is a Float or Rational, and the `digits` value is
    omitted, this exception is raised.



# BigDecimal::save_exception_mode

(from ruby core)
---
    BigDecimal.save_exception_mode { ... }

---

Execute the provided block, but preserve the exception mode

    BigDecimal.save_exception_mode do
      BigDecimal.mode(BigDecimal::EXCEPTION_OVERFLOW, false)
      BigDecimal.mode(BigDecimal::EXCEPTION_NaN, false)

      BigDecimal.new(BigDecimal('Infinity'))
      BigDecimal.new(BigDecimal('-Infinity'))
      BigDecimal(BigDecimal.new('NaN'))
    end

For use with the BigDecimal::EXCEPTION_*

See BigDecimal.mode


# BigDecimal::save_limit

(from ruby core)
---
    BigDecimal.save_limit { ... }

---

Execute the provided block, but preserve the precision limit

    BigDecimal.limit(100)
    puts BigDecimal.limit
    BigDecimal.save_limit do
        BigDecimal.limit(200)
        puts BigDecimal.limit
    end
    puts BigDecimal.limit


# BigDecimal::save_rounding_mode

(from ruby core)
---
    BigDecimal.save_rounding_mode { ... }

---

Execute the provided block, but preserve the rounding mode

    BigDecimal.save_rounding_mode do
      BigDecimal.mode(BigDecimal::ROUND_MODE, :up)
      puts BigDecimal.mode(BigDecimal::ROUND_MODE)
    end

For use with the BigDecimal::ROUND_*

See BigDecimal.mode


# BigDecimal::ver

(from ruby core)
---
    ver()

---

Returns the BigDecimal version number.


# BigDecimal#%

(from ruby core)
---
    a % b

---

Returns the modulus from dividing by b.

See BigDecimal#divmod.


# BigDecimal#*

(from ruby core)
---
    mult(value, digits)

---

Multiply by the specified value.

e.g.
    c = a.mult(b,n)
    c = a * b

digits
:   If specified and less than the number of significant digits of the result,
    the result is rounded to that number of digits, according to
    BigDecimal.mode.



# BigDecimal#**

(from ruby core)
---
    a ** n  -> bigdecimal

---

Returns the value raised to the power of n.

See BigDecimal#power.


# BigDecimal#+

(from ruby core)
---
    add(value, digits)

---

Add the specified value.

e.g.
    c = a.add(b,n)
    c = a + b

digits
:   If specified and less than the number of significant digits of the result,
    the result is rounded to that number of digits, according to
    BigDecimal.mode.



# BigDecimal#+@

(from ruby core)
---
    +big_decimal  ->  big_decimal

---

Return self.

    +BigDecimal('5')  #=> 0.5e1


# BigDecimal#-

(from ruby core)
---
    a - b   -> bigdecimal

---

Subtract the specified value.

e.g.
    c = a - b

The precision of the result value depends on the type of `b`.

If `b` is a Float, the precision of the result is Float::DIG+1.

If `b` is a BigDecimal, the precision of the result is `b`'s precision of
internal representation from platform. So, it's return value is platform
dependent.


# BigDecimal#-@

(from ruby core)
---
    -big_decimal  ->  big_decimal

---

Return the negation of self.

    -BigDecimal('5')  #=> -0.5e1


# BigDecimal#/

(from ruby core)
---
    div(value, digits)
    quo(value)

---

Divide by the specified value.

e.g.
    c = a.div(b,n)

digits
:   If specified and less than the number of significant digits of the result,
    the result is rounded to that number of digits, according to
    BigDecimal.mode.


If digits is 0, the result is the same as the / operator. If not, the result
is an integer BigDecimal, by analogy with Float#div.

The alias quo is provided since `div(value, 0)` is the same as computing the
quotient; see BigDecimal#divmod.


# BigDecimal#<

(from ruby core)
---
    a < b

---

Returns true if a is less than b.

Values may be coerced to perform the comparison (see ==, BigDecimal#coerce).


# BigDecimal#<=

(from ruby core)
---
    a <= b

---

Returns true if a is less than or equal to b.

Values may be coerced to perform the comparison (see ==, BigDecimal#coerce).


# BigDecimal#<=>

(from ruby core)
---
    <=>(p1)

---

The comparison operator. a <=> b is 0 if a == b, 1 if a > b, -1 if a < b.


# BigDecimal#==

(from ruby core)
---
    ==(p1)

---

Tests for value equality; returns true if the values are equal.

The == and === operators and the eql? method have the same implementation for
BigDecimal.

Values may be coerced to perform the comparison:

    BigDecimal.new('1.0') == 1.0  #=> true


# BigDecimal#===

(from ruby core)
---
    ===(p1)

---

Tests for value equality; returns true if the values are equal.

The == and === operators and the eql? method have the same implementation for
BigDecimal.

Values may be coerced to perform the comparison:

    BigDecimal.new('1.0') == 1.0  #=> true


# BigDecimal#>

(from ruby core)
---
    a > b

---

Returns true if a is greater than b.

Values may be coerced to perform the comparison (see ==, BigDecimal#coerce).


# BigDecimal#>=

(from ruby core)
---
    a >= b

---

Returns true if a is greater than or equal to b.

Values may be coerced to perform the comparison (see ==, BigDecimal#coerce)


# BigDecimal#_dump

(from ruby core)
---
    _dump

---

Method used to provide marshalling support.

    inf = BigDecimal.new('Infinity')
      #=> Infinity
    BigDecimal._load(inf._dump)
      #=> Infinity

See the Marshal module.


# BigDecimal#abs

(from ruby core)
---
    big_decimal.abs  ->  big_decimal

---

Returns the absolute value, as a BigDecimal.

    BigDecimal('5').abs  #=> 0.5e1
    BigDecimal('-3').abs #=> 0.3e1


# BigDecimal#add

(from ruby core)
---
    add(value, digits)

---

    +

Add the specified value.

e.g.
    c = a.add(b,n)
    c = a + b

digits
:   If specified and less than the number of significant digits of the result,
    the result is rounded to that number of digits, according to
    BigDecimal.mode.



# BigDecimal#as_json

(from ruby core)
---
    as_json(*)

---

Marshal the object to JSON.

method used for JSON marshalling support.


# BigDecimal#ceil

(from ruby core)
---
    ceil(n)

---

Return the smallest integer greater than or equal to the value, as a
BigDecimal.

    BigDecimal('3.14159').ceil #=> 4
    BigDecimal('-9.1').ceil #=> -9

If n is specified and positive, the fractional part of the result has no more
than that many digits.

If n is specified and negative, at least that many digits to the left of the
decimal point will be 0 in the result.

    BigDecimal('3.14159').ceil(3) #=> 3.142
    BigDecimal('13345.234').ceil(-2) #=> 13400.0


# BigDecimal#coerce

(from ruby core)
---
    coerce(p1)

---

The coerce method provides support for Ruby type coercion. It is not enabled
by default.

This means that binary operations like + * / or - can often be performed on a
BigDecimal and an object of another type, if the other object can be coerced
into a BigDecimal value.

e.g.
    a = BigDecimal.new("1.0")
    b = a / 2.0 #=> 0.5

Note that coercing a String to a BigDecimal is not supported by default; it
requires a special compile-time option when building Ruby.


# BigDecimal#div

(from ruby core)
---
    div(p1, p2 = v2)

---


# BigDecimal#divmod

(from ruby core)
---
    divmod(value)

---

Divides by the specified value, and returns the quotient and modulus as
BigDecimal numbers. The quotient is rounded towards negative infinity.

For example:

    require 'bigdecimal'

    a = BigDecimal.new("42")
    b = BigDecimal.new("9")

    q, m = a.divmod(b)

    c = q * b + m

    a == c  #=> true

The quotient q is (a/b).floor, and the modulus is the amount that must be
added to q * b to get a.


# BigDecimal#eql?

(from ruby core)
---
    eql?(p1)

---

Tests for value equality; returns true if the values are equal.

The == and === operators and the eql? method have the same implementation for
BigDecimal.

Values may be coerced to perform the comparison:

    BigDecimal.new('1.0') == 1.0  #=> true


# BigDecimal#exponent

(from ruby core)
---
    exponent()

---

Returns the exponent of the BigDecimal number, as an Integer.

If the number can be represented as 0.xxxxxx*10**n where xxxxxx is a string of
digits with no leading zeros, then n is the exponent.


# BigDecimal#finite?

(from ruby core)
---
    finite?()

---

Returns True if the value is finite (not NaN or infinite).



# BigDecimal#fix

(from ruby core)
---
    fix()

---

Return the integer part of the number, as a BigDecimal.


# BigDecimal#floor

(from ruby core)
---
    floor(n)

---

Return the largest integer less than or equal to the value, as a BigDecimal.

    BigDecimal('3.14159').floor #=> 3
    BigDecimal('-9.1').floor #=> -10

If n is specified and positive, the fractional part of the result has no more
than that many digits.

If n is specified and negative, at least that many digits to the left of the
decimal point will be 0 in the result.

    BigDecimal('3.14159').floor(3) #=> 3.141
    BigDecimal('13345.234').floor(-2) #=> 13300.0


# BigDecimal#frac

(from ruby core)
---
    frac()

---

Return the fractional part of the number, as a BigDecimal.


# BigDecimal#hash

(from ruby core)
---
    hash

---

Creates a hash for this BigDecimal.

Two BigDecimals with equal sign, fractional part and exponent have the same
hash.


# BigDecimal#infinite?

(from ruby core)
---
    infinite?()

---

Returns nil, -1, or +1 depending on whether the value is finite, -Infinity, or
+Infinity.


# BigDecimal#inspect

(from ruby core)
---
    inspect()

---

Returns debugging information about the value as a string of comma-separated
values in angle brackets with a leading #:

    BigDecimal.new("1234.5678").inspect
      #=> "0.12345678e4"

The first part is the address, the second is the value as a string, and the
final part ss(mm) is the current number of significant digits and the maximum
number of significant digits, respectively.


# BigDecimal#modulo

(from ruby core)
---
    a.modulo(b)

---

Returns the modulus from dividing by b.

See BigDecimal#divmod.


# BigDecimal#mult

(from ruby core)
---
    mult(value, digits)

---

Multiply by the specified value.

e.g.
    c = a.mult(b,n)
    c = a * b

digits
:   If specified and less than the number of significant digits of the result,
    the result is rounded to that number of digits, according to
    BigDecimal.mode.



# BigDecimal#nan?

(from ruby core)
---
    nan?()

---

Returns True if the value is Not a Number.



# BigDecimal#nonzero?

(from ruby core)
---
    nonzero?()

---

Returns self if the value is non-zero, nil otherwise.



# BigDecimal#power

(from ruby core)
---
    power(n)
    power(n, prec)

---

Returns the value raised to the power of n.

Note that n must be an Integer.

Also available as the operator **.


# BigDecimal#precs

(from ruby core)
---
    big_decimal.precs  ->  array

---

Returns an Array of two Integer values.

The first value is the current number of significant digits in the BigDecimal.
The second value is the maximum number of significant digits for the
BigDecimal.

    BigDecimal('5').precs #=> [9, 18]


# BigDecimal#quo

(from ruby core)
---
    quo(value)

---

Divide by the specified value.

e.g.
    c = a.div(b,n)

digits
:   If specified and less than the number of significant digits of the result,
    the result is rounded to that number of digits, according to
    BigDecimal.mode.


If digits is 0, the result is the same as the / operator. If not, the result
is an integer BigDecimal, by analogy with Float#div.

The alias quo is provided since `div(value, 0)` is the same as computing the
quotient; see BigDecimal#divmod.


# BigDecimal#remainder

(from ruby core)
---
    remainder(value)

---

Returns the remainder from dividing by the value.

x.remainder(y) means x-y*(x/y).truncate


# BigDecimal#round

(from ruby core)
---
    round(n, mode)

---

Round to the nearest integer (by default), returning the result as a
BigDecimal.

    BigDecimal('3.14159').round #=> 3
    BigDecimal('8.7').round #=> 9
    BigDecimal('-9.9').round #=> -10

If n is specified and positive, the fractional part of the result has no more
than that many digits.

If n is specified and negative, at least that many digits to the left of the
decimal point will be 0 in the result.

    BigDecimal('3.14159').round(3) #=> 3.142
    BigDecimal('13345.234').round(-2) #=> 13300.0

The value of the optional mode argument can be used to determine how rounding
is performed; see BigDecimal.mode.


# BigDecimal#sign

(from ruby core)
---
    sign()

---

Returns the sign of the value.

Returns a positive value if > 0, a negative value if < 0, and a zero if == 0.

The specific value returned indicates the type and sign of the BigDecimal, as
follows:

BigDecimal::SIGN_NaN
:   value is Not a Number
BigDecimal::SIGN_POSITIVE_ZERO
:   value is +0
BigDecimal::SIGN_NEGATIVE_ZERO
:   value is -0
BigDecimal::SIGN_POSITIVE_INFINITE
:   value is +Infinity
BigDecimal::SIGN_NEGATIVE_INFINITE
:   value is -Infinity
BigDecimal::SIGN_POSITIVE_FINITE
:   value is positive
BigDecimal::SIGN_NEGATIVE_FINITE
:   value is negative



# BigDecimal#split

(from ruby core)
---
    split()

---

Splits a BigDecimal number into four parts, returned as an array of values.

The first value represents the sign of the BigDecimal, and is -1 or 1, or 0 if
the BigDecimal is Not a Number.

The second value is a string representing the significant digits of the
BigDecimal, with no leading zeros.

The third value is the base used for arithmetic (currently always 10) as an
Integer.

The fourth value is an Integer exponent.

If the BigDecimal can be represented as 0.xxxxxx*10**n, then xxxxxx is the
string of significant digits with no leading zeros, and n is the exponent.

From these values, you can translate a BigDecimal to a float as follows:

    sign, significant_digits, base, exponent = a.split
    f = sign * "0.#{significant_digits}".to_f * (base ** exponent)

(Note that the to_f method is provided as a more convenient way to translate a
BigDecimal to a Float.)


# BigDecimal#sqrt

(from ruby core)
---
    sqrt(n)

---

Returns the square root of the value.

Result has at least n significant digits.


# BigDecimal#sub

(from ruby core)
---
    sub(value, digits)  -> bigdecimal

---

Subtract the specified value.

e.g.
    c = a.sub(b,n)

digits
:   If specified and less than the number of significant digits of the result,
    the result is rounded to that number of digits, according to
    BigDecimal.mode.



# BigDecimal#to_d

(from ruby core)
---
    a.to_d -> bigdecimal

---

Returns self.


# BigDecimal#to_digits

(from ruby core)
---
    a.to_digits -> string

---

Converts a BigDecimal to a String of the form "nnnnnn.mmm". This method is
deprecated; use BigDecimal#to_s("F") instead.

    require 'bigdecimal'
    require 'bigdecimal/util'

    d = BigDecimal.new("3.14")
    d.to_digits
    # => "3.14"


# BigDecimal#to_f

(from ruby core)
---
    to_f()

---

Returns a new Float object having approximately the same value as the
BigDecimal number. Normal accuracy limits and built-in errors of binary Float
arithmetic apply.


# BigDecimal#to_i

(from ruby core)
---
    to_i()

---

Returns the value as an Integer.

If the BigDecimal is infinity or NaN, raises FloatDomainError.


# BigDecimal#to_int

(from ruby core)
---
    to_int()

---

Returns the value as an Integer.

If the BigDecimal is infinity or NaN, raises FloatDomainError.


# BigDecimal#to_json

(from ruby core)
---
    to_json(*)

---

return the JSON value


# BigDecimal#to_r

(from ruby core)
---
    to_r()

---

Converts a BigDecimal to a Rational.


# BigDecimal#to_s

(from ruby core)
---
    to_s(s)

---

Converts the value to a string.

The default format looks like  0.xxxxEnn.

The optional parameter s consists of either an integer; or an optional '+' or
' ', followed by an optional number, followed by an optional 'E' or 'F'.

If there is a '+' at the start of s, positive values are returned with a
leading '+'.

A space at the start of s returns positive values with a leading space.

If s contains a number, a space is inserted after each group of that many
fractional digits.

If s ends with an 'E', engineering notation (0.xxxxEnn) is used.

If s ends with an 'F', conventional floating point notation is used.

Examples:

    BigDecimal.new('-123.45678901234567890').to_s('5F')
      #=> '-123.45678 90123 45678 9'

    BigDecimal.new('123.45678901234567890').to_s('+8F')
      #=> '+123.45678901 23456789'

    BigDecimal.new('123.45678901234567890').to_s(' F')
      #=> ' 123.4567890123456789'


# BigDecimal#truncate

(from ruby core)
---
    truncate(n)

---

Truncate to the nearest integer (by default), returning the result as a
BigDecimal.

    BigDecimal('3.14159').truncate #=> 3
    BigDecimal('8.7').truncate #=> 8
    BigDecimal('-9.9').truncate #=> -9

If n is specified and positive, the fractional part of the result has no more
than that many digits.

If n is specified and negative, at least that many digits to the left of the
decimal point will be 0 in the result.

    BigDecimal('3.14159').truncate(3) #=> 3.141
    BigDecimal('13345.234').truncate(-2) #=> 13300.0


# BigDecimal#zero?

(from ruby core)
---
    zero?()

---

Returns True if the value is zero.



(from gem activesupport-5.1.2)
---

---
# Instance methods:

    duplicable?

# BigDecimal#duplicable?

(from gem activesupport-5.1.2)
---
    duplicable?()

---

BigDecimals are duplicable:

BigDecimal.new("1.2").duplicable? # => true BigDecimal.new("1.2").dup        
# => #<BigDecimal:...,'0.12E1',18(18)>


