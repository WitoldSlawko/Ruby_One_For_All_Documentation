# Float < Numeric

(from ruby core)
---
BigDecimal extends the native Float class to provide the #to_d method.

When you require BigDecimal in your application, this method will be available
on Float objects.


Float objects represent inexact real numbers using the native architecture's
double-precision floating point representation.

Floating point has a different arithmetic and is an inexact number. So you
should know its esoteric system. see following:

*   http://docs.sun.com/source/806-3568/ncg_goldberg.html
*   http://wiki.github.com/rdp/ruby_tutorials_core/ruby-talk-faq#wiki-floats_i
    mprecise
*   http://en.wikipedia.org/wiki/Floating_point#Accuracy_problems

---
# Constants:

DIG
:   The minimum number of significant decimal digits in a double-precision
    floating point.

    Usually defaults to 15.
EPSILON
:   The difference between 1 and the smallest double-precision floating point
    number greater than 1.

    Usually defaults to 2.2204460492503131e-16.
INFINITY
:   An expression representing positive infinity.
MANT_DIG
:   The number of base digits for the `double` data type.

    Usually defaults to 53.
MAX
:   The largest possible integer in a double-precision floating point number.

    Usually defaults to 1.7976931348623157e+308.
MAX_10_EXP
:   The largest positive exponent in a double-precision floating point where
    10 raised to this power minus 1.

    Usually defaults to 308.
MAX_EXP
:   The largest possible exponent value in a double-precision floating point.

    Usually defaults to 1024.
MIN
:   The smallest positive normalized number in a double-precision floating
    point.

    Usually defaults to 2.2250738585072014e-308.

    If the platform supports denormalized numbers, there are numbers between
    zero and Float::MIN. 0.0.next_float returns the smallest positive floating
    point number including denormalized numbers.
MIN_10_EXP
:   The smallest negative exponent in a double-precision floating point where
    10 raised to this power minus 1.

    Usually defaults to -307.
MIN_EXP
:   The smallest posable exponent value in a double-precision floating point.

    Usually defaults to -1021.
NAN
:   An expression representing a value which is "not a number".
RADIX
:   The base of the floating point, or number of unique digits used to
    represent the number.

    Usually defaults to 2 on most systems, which would represent a base-10
    decimal.
ROUNDS
:   Represents the rounding mode for floating point addition.

    Usually defaults to 1, rounding to the nearest number.

    Other modes include:

    -1
:       Indeterminable
    0
:       Rounding towards zero
    1
:       Rounding to the nearest number
    2
:       Rounding towards positive infinity
    3
:       Rounding towards negative infinity



# Instance methods:

    %
    *
    **
    +
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
    abs
    angle
    arg
    ceil
    coerce
    dclone
    denominator
    divmod
    eql?
    fdiv
    finite?
    floor
    hash
    infinite?
    inspect
    magnitude
    modulo
    nan?
    negative?
    next_float
    numerator
    phase
    positive?
    prev_float
    quo
    rationalize
    round
    to_d
    to_f
    to_i
    to_int
    to_r
    to_s
    truncate
    zero?

# Float#%

(from ruby core)
---
    float % other        ->  float

---

Return the modulo after division of `float` by `other`.

    6543.21.modulo(137)      #=> 104.21
    6543.21.modulo(137.24)   #=> 92.9299999999996


# Float#*

(from ruby core)
---
    float * other  ->  float

---

Returns a new float which is the product of `float` and `other`.


# Float#**

(from ruby core)
---
    float ** other  ->  float

---

Raises `float` to the power of `other`.

    2.0**3      #=> 8.0


# Float#+

(from ruby core)
---
    float + other  ->  float

---

Returns a new float which is the sum of `float` and `other`.


# Float#-

(from ruby core)
---
    float - other  ->  float

---

Returns a new float which is the difference of `float` and `other`.


# Float#-@

(from ruby core)
---
    -float  ->  float

---

Returns float, negated.


# Float#/

(from ruby core)
---
    float / other  ->  float

---

Returns a new float which is the result of dividing `float` by `other`.


# Float#<

(from ruby core)
---
    float < real  ->  true or false

---

Returns `true` if `float` is less than `real`.

The result of `NaN < NaN` is undefined, so the implementation-dependent value
is returned.


# Float#<=

(from ruby core)
---
    float <= real  ->  true or false

---

Returns `true` if `float` is less than or equal to `real`.

The result of `NaN <= NaN` is undefined, so the implementation-dependent value
is returned.


# Float#<=>

(from ruby core)
---
    float <=> real  ->  -1, 0, +1 or nil

---

Returns -1, 0, +1 or nil depending on whether `float` is less than, equal to,
or greater than `real`. This is the basis for the tests in Comparable.

The result of `NaN <=> NaN` is undefined, so the implementation-dependent
value is returned.

`nil` is returned if the two values are incomparable.


# Float#==

(from ruby core)
---
    float == obj  ->  true or false

---

Returns `true` only if `obj` has the same value as `float`. Contrast this with
Float#eql?, which requires obj to be a Float.

The result of `NaN == NaN` is undefined, so the implementation-dependent value
is returned.

    1.0 == 1   #=> true


# Float#===

(from ruby core)
---
    float == obj  ->  true or false

---

Returns `true` only if `obj` has the same value as `float`. Contrast this with
Float#eql?, which requires obj to be a Float.

The result of `NaN == NaN` is undefined, so the implementation-dependent value
is returned.

    1.0 == 1   #=> true


# Float#>

(from ruby core)
---
    float > real  ->  true or false

---

Returns `true` if `float` is greater than `real`.

The result of `NaN > NaN` is undefined, so the implementation-dependent value
is returned.


# Float#>=

(from ruby core)
---
    float >= real  ->  true or false

---

Returns `true` if `float` is greater than or equal to `real`.

The result of `NaN >= NaN` is undefined, so the implementation-dependent value
is returned.


# Float#abs

(from ruby core)
---
    float.abs        ->  float

---

Returns the absolute value of `float`.

    (-34.56).abs   #=> 34.56
    -34.56.abs     #=> 34.56


# Float#angle

(from ruby core)
---
    flo.angle  ->  0 or float

---

Returns 0 if the value is positive, pi otherwise.


# Float#arg

(from ruby core)
---
    flo.arg    ->  0 or float

---

Returns 0 if the value is positive, pi otherwise.


# Float#ceil

(from ruby core)
---
    float.ceil([ndigits])  ->  integer or float

---

Returns the smallest number greater than or equal to `float` in decimal digits
(default 0 digits).

Precision may be negative.  Returns a floating point number when `ndigits` is
positive, `self` for zero, and ceil up for negative.

    1.2.ceil      #=> 2
    2.0.ceil      #=> 2
    (-1.2).ceil   #=> -1
    (-2.0).ceil   #=> -2
    1.234567.ceil(2)  #=> 1.24
    1.234567.ceil(3)  #=> 1.235
    1.234567.ceil(4)  #=> 1.2346
    1.234567.ceil(5)  #=> 1.23457

    34567.89.ceil(-5) #=> 100000
    34567.89.ceil(-4) #=> 40000
    34567.89.ceil(-3) #=> 35000
    34567.89.ceil(-2) #=> 34600
    34567.89.ceil(-1) #=> 34570
    34567.89.ceil(0)  #=> 34568
    34567.89.ceil(1)  #=> 34567.9
    34567.89.ceil(2)  #=> 34567.89
    34567.89.ceil(3)  #=> 34567.89


# Float#coerce

(from ruby core)
---
    float.coerce(numeric)  ->  array

---

Returns an array with both a `numeric` and a `float` represented as Float
objects.

This is achieved by converting a `numeric` to a Float.

    1.2.coerce(3)       #=> [3.0, 1.2]
    2.5.coerce(1.1)     #=> [1.1, 2.5]


# Float#dclone

(from ruby core)
---
    dclone()

---

provides a unified `clone` operation, for REXML::XPathParser to use across
multiple Object types


# Float#denominator

(from ruby core)
---
    flo.denominator  ->  integer

---

Returns the denominator (always positive).  The result is machine dependent.

See numerator.


# Float#divmod

(from ruby core)
---
    float.divmod(numeric)  ->  array

---

See Numeric#divmod.

    42.0.divmod 6 #=> [7, 0.0]
    42.0.divmod 5 #=> [8, 2.0]


# Float#eql?

(from ruby core)
---
    float.eql?(obj)  ->  true or false

---

Returns `true` only if `obj` is a Float with the same value as `float`.
Contrast this with Float#==, which performs type conversions.

The result of `NaN.eql?(NaN)` is undefined, so the implementation-dependent
value is returned.

    1.0.eql?(1)   #=> false


# Float#fdiv

(from ruby core)
---
    float.fdiv(numeric)  ->  float

---

Returns `float / numeric`, same as Float#/.


# Float#finite?

(from ruby core)
---
    float.finite?  ->  true or false

---

Returns `true` if `float` is a valid IEEE floating point number (it is not
infinite, and Float#nan? is `false`).


# Float#floor

(from ruby core)
---
    float.floor([ndigits])  ->  integer or float

---

Returns the largest number less than or equal to `float` in decimal digits
(default 0 digits).

Precision may be negative.  Returns a floating point number when `ndigits` is
positive, `self` for zero, and floor down for negative.

    1.2.floor      #=> 1
    2.0.floor      #=> 2
    (-1.2).floor   #=> -2
    (-2.0).floor   #=> -2

    1.234567.floor(2)  #=> 1.23
    1.234567.floor(3)  #=> 1.234
    1.234567.floor(4)  #=> 1.2345
    1.234567.floor(5)  #=> 1.23456

    34567.89.floor(-5) #=> 0
    34567.89.floor(-4) #=> 30000
    34567.89.floor(-3) #=> 34000
    34567.89.floor(-2) #=> 34500
    34567.89.floor(-1) #=> 34560
    34567.89.floor(0)  #=> 34567
    34567.89.floor(1)  #=> 34567.8
    34567.89.floor(2)  #=> 34567.89
    34567.89.floor(3)  #=> 34567.89


# Float#hash

(from ruby core)
---
    float.hash  ->  integer

---

Returns a hash code for this float.

See also Object#hash.


# Float#infinite?

(from ruby core)
---
    float.infinite?  ->  nil, -1, +1

---

Return values corresponding to the value of `float`:

`finite`
:   `nil`
`-Infinity`
:   `-1`
+`Infinity`
:   `1`


For example:

    (0.0).infinite?        #=> nil
    (-1.0/0.0).infinite?   #=> -1
    (+1.0/0.0).infinite?   #=> 1


# Float#inspect

(from ruby core)
---
    inspect()

---


# Float#magnitude

(from ruby core)
---
    float.magnitude  ->  float

---

Returns the absolute value of `float`.

    (-34.56).abs   #=> 34.56
    -34.56.abs     #=> 34.56


# Float#modulo

(from ruby core)
---
    float.modulo(other)  ->  float

---

Return the modulo after division of `float` by `other`.

    6543.21.modulo(137)      #=> 104.21
    6543.21.modulo(137.24)   #=> 92.9299999999996


# Float#nan?

(from ruby core)
---
    float.nan?  ->  true or false

---

Returns `true` if `float` is an invalid IEEE floating point number.

    a = -1.0      #=> -1.0
    a.nan?        #=> false
    a = 0.0/0.0   #=> NaN
    a.nan?        #=> true


# Float#negative?

(from ruby core)
---
    float.negative? ->  true or false

---

Returns `true` if `float` is less than 0.


# Float#next_float

(from ruby core)
---
    float.next_float  ->  float

---

Returns the next representable floating-point number.

Float::MAX.next_float and Float::INFINITY.next_float is Float::INFINITY.

Float::NAN.next_float is Float::NAN.

For example:

    p 0.01.next_float  #=> 0.010000000000000002
    p 1.0.next_float   #=> 1.0000000000000002
    p 100.0.next_float #=> 100.00000000000001

    p 0.01.next_float - 0.01   #=> 1.734723475976807e-18
    p 1.0.next_float - 1.0     #=> 2.220446049250313e-16
    p 100.0.next_float - 100.0 #=> 1.4210854715202004e-14

    f = 0.01; 20.times { printf "%-20a %s\n", f, f.to_s; f = f.next_float }
    #=> 0x1.47ae147ae147bp-7 0.01
    #   0x1.47ae147ae147cp-7 0.010000000000000002
    #   0x1.47ae147ae147dp-7 0.010000000000000004
    #   0x1.47ae147ae147ep-7 0.010000000000000005
    #   0x1.47ae147ae147fp-7 0.010000000000000007
    #   0x1.47ae147ae148p-7  0.010000000000000009
    #   0x1.47ae147ae1481p-7 0.01000000000000001
    #   0x1.47ae147ae1482p-7 0.010000000000000012
    #   0x1.47ae147ae1483p-7 0.010000000000000014
    #   0x1.47ae147ae1484p-7 0.010000000000000016
    #   0x1.47ae147ae1485p-7 0.010000000000000018
    #   0x1.47ae147ae1486p-7 0.01000000000000002
    #   0x1.47ae147ae1487p-7 0.010000000000000021
    #   0x1.47ae147ae1488p-7 0.010000000000000023
    #   0x1.47ae147ae1489p-7 0.010000000000000024
    #   0x1.47ae147ae148ap-7 0.010000000000000026
    #   0x1.47ae147ae148bp-7 0.010000000000000028
    #   0x1.47ae147ae148cp-7 0.01000000000000003
    #   0x1.47ae147ae148dp-7 0.010000000000000031
    #   0x1.47ae147ae148ep-7 0.010000000000000033

    f = 0.0
    100.times { f += 0.1 }
    p f                            #=> 9.99999999999998       # should be 10.0 in the ideal world.
    p 10-f                         #=> 1.9539925233402755e-14 # the floating-point error.
    p(10.0.next_float-10)          #=> 1.7763568394002505e-15 # 1 ulp (units in the last place).
    p((10-f)/(10.0.next_float-10)) #=> 11.0                   # the error is 11 ulp.
    p((10-f)/(10*Float::EPSILON))  #=> 8.8                    # approximation of the above.
    p "%a" % f                     #=> "0x1.3fffffffffff5p+3" # the last hex digit is 5.  16 - 5 = 11 ulp.


# Float#numerator

(from ruby core)
---
    flo.numerator  ->  integer

---

Returns the numerator.  The result is machine dependent.

    n = 0.3.numerator    #=> 5404319552844595
    d = 0.3.denominator  #=> 18014398509481984
    n.fdiv(d)            #=> 0.3


# Float#phase

(from ruby core)
---
    flo.phase  ->  0 or float

---

Returns 0 if the value is positive, pi otherwise.


# Float#positive?

(from ruby core)
---
    float.positive? ->  true or false

---

Returns `true` if `float` is greater than 0.


# Float#prev_float

(from ruby core)
---
    float.prev_float  ->  float

---

Returns the previous representable floating-point number.

(-Float::MAX).prev_float and (-Float::INFINITY).prev_float is
-Float::INFINITY.

Float::NAN.prev_float is Float::NAN.

For example:

    p 0.01.prev_float  #=> 0.009999999999999998
    p 1.0.prev_float   #=> 0.9999999999999999
    p 100.0.prev_float #=> 99.99999999999999

    p 0.01 - 0.01.prev_float   #=> 1.734723475976807e-18
    p 1.0 - 1.0.prev_float     #=> 1.1102230246251565e-16
    p 100.0 - 100.0.prev_float #=> 1.4210854715202004e-14

    f = 0.01; 20.times { printf "%-20a %s\n", f, f.to_s; f = f.prev_float }
    #=> 0x1.47ae147ae147bp-7 0.01
    #   0x1.47ae147ae147ap-7 0.009999999999999998
    #   0x1.47ae147ae1479p-7 0.009999999999999997
    #   0x1.47ae147ae1478p-7 0.009999999999999995
    #   0x1.47ae147ae1477p-7 0.009999999999999993
    #   0x1.47ae147ae1476p-7 0.009999999999999992
    #   0x1.47ae147ae1475p-7 0.00999999999999999
    #   0x1.47ae147ae1474p-7 0.009999999999999988
    #   0x1.47ae147ae1473p-7 0.009999999999999986
    #   0x1.47ae147ae1472p-7 0.009999999999999985
    #   0x1.47ae147ae1471p-7 0.009999999999999983
    #   0x1.47ae147ae147p-7  0.009999999999999981
    #   0x1.47ae147ae146fp-7 0.00999999999999998
    #   0x1.47ae147ae146ep-7 0.009999999999999978
    #   0x1.47ae147ae146dp-7 0.009999999999999976
    #   0x1.47ae147ae146cp-7 0.009999999999999974
    #   0x1.47ae147ae146bp-7 0.009999999999999972
    #   0x1.47ae147ae146ap-7 0.00999999999999997
    #   0x1.47ae147ae1469p-7 0.009999999999999969
    #   0x1.47ae147ae1468p-7 0.009999999999999967


# Float#quo

(from ruby core)
---
    float.quo(numeric)  ->  float

---

Returns `float / numeric`, same as Float#/.


# Float#rationalize

(from ruby core)
---
    flt.rationalize([eps])  ->  rational

---

Returns a simpler approximation of the value (flt-|eps| <= result <=
flt+|eps|).  if the optional eps is not given, it will be chosen
automatically.

    0.3.rationalize          #=> (3/10)
    1.333.rationalize        #=> (1333/1000)
    1.333.rationalize(0.01)  #=> (4/3)

See to_r.


# Float#round

(from ruby core)
---
    float.round([ndigits])  ->  integer or float

---

Rounds `float` to a given precision in decimal digits (default 0 digits).

Precision may be negative.  Returns a floating point number when `ndigits` is
more than zero.

    1.4.round      #=> 1
    1.5.round      #=> 2
    1.6.round      #=> 2
    (-1.5).round   #=> -2

    1.234567.round(2)  #=> 1.23
    1.234567.round(3)  #=> 1.235
    1.234567.round(4)  #=> 1.2346
    1.234567.round(5)  #=> 1.23457

    34567.89.round(-5) #=> 0
    34567.89.round(-4) #=> 30000
    34567.89.round(-3) #=> 35000
    34567.89.round(-2) #=> 34600
    34567.89.round(-1) #=> 34570
    34567.89.round(0)  #=> 34568
    34567.89.round(1)  #=> 34567.9
    34567.89.round(2)  #=> 34567.89
    34567.89.round(3)  #=> 34567.89

If `half:` optional keyword is given, just-half number will be rounded
according to that value. Supported values for this keyword are follows.

*   `:up` or `nil`: the result will be rounded away from zero
*   `:even`: the result will be rounded to nearest even number
*   `:down`: the result will be rounded close to zero



# Float#to_d

(from ruby core)
---
    flt.to_d  -> bigdecimal

---

Convert `flt` to a BigDecimal and return it.

    require 'bigdecimal'
    require 'bigdecimal/util'

    0.5.to_d
    # => 0.5e0


# Float#to_f

(from ruby core)
---
    float.to_f  ->  self

---

Since `float` is already a float, returns `self`.


# Float#to_i

(from ruby core)
---
    float.to_i      ->  integer
    float.to_int    ->  integer

---

Returns the `float` truncated to an Integer.

Synonyms are #to_i and #to_int


# Float#to_int

(from ruby core)
---
    float.to_int    ->  integer

---

Returns the `float` truncated to an Integer.

Synonyms are #to_i and #to_int


# Float#to_r

(from ruby core)
---
    flt.to_r  ->  rational

---

Returns the value as a rational.

NOTE: 0.3.to_r isn't the same as '0.3'.to_r.  The latter is equivalent to
'3/10'.to_r, but the former isn't so.

    2.0.to_r    #=> (2/1)
    2.5.to_r    #=> (5/2)
    -0.75.to_r  #=> (-3/4)
    0.0.to_r    #=> (0/1)

See rationalize.


# Float#to_s

(from ruby core)
---
    float.to_s  ->  string

---

Returns a string containing a representation of self. As well as a fixed or
exponential form of the `float`, the call may return `NaN`, `Infinity`, and
`-Infinity`.


# Float#truncate

(from ruby core)
---
    float.truncate([ndigits])  ->  integer or float

---

Truncates `float` to a given precision in decimal digits (default 0 digits).

Precision may be negative.  Returns a floating point number when `ndigits` is
more than zero.


# Float#zero?

(from ruby core)
---
    float.zero?  ->  true or false

---

Returns `true` if `float` is 0.0.


---
Also found in:
    gem activesupport-5.1.2

