# Numeric < Object

---
# Includes:
Comparable (from ruby core)

(from ruby core)
---

Numeric is the class from which all higher-level numeric classes should
inherit.

Numeric allows instantiation of heap-allocated objects. Other core numeric
classes such as Integer are implemented as immediates, which means that each
Integer is a single immutable object which is always passed by value.

    a = 1
    puts 1.object_id == a.object_id   #=> true

There can only ever be one instance of the integer `1`, for example. Ruby
ensures this by preventing instantiation and duplication.

    Integer.new(1)   #=> NoMethodError: undefined method `new' for Integer:Class
    1.dup            #=> TypeError: can't dup Integer

For this reason, Numeric should be used when defining other numeric classes.

Classes which inherit from Numeric must implement `coerce`, which returns a
two-member Array containing an object that has been coerced into an instance
of the new class and `self` (see #coerce).

Inheriting classes should also implement arithmetic operator methods (`+`,
`-`, `*` and `/`) and the `<=>` operator (see Comparable). These methods may
rely on `coerce` to ensure interoperability with instances of other numeric
classes.

    class Tally < Numeric
      def initialize(string)
        @string = string
      end

      def to_s
        @string
      end

      def to_i
        @string.size
      end

      def coerce(other)
        [self.class.new('|' * other.to_i), self]
      end

      def <=>(other)
        to_i <=> other.to_i
      end

      def +(other)
        self.class.new('|' * (to_i + other.to_i))
      end

      def -(other)
        self.class.new('|' * (to_i - other.to_i))
      end

      def *(other)
        self.class.new('|' * (to_i * other.to_i))
      end

      def /(other)
        self.class.new('|' * (to_i / other.to_i))
      end
    end

    tally = Tally.new('||')
    puts tally * 2            #=> "||||"
    puts tally > 1            #=> true
---
# Instance methods:

    %
    +@
    -@
    <=>
    abs
    abs2
    angle
    arg
    ceil
    coerce
    conj
    conjugate
    denominator
    div
    divmod
    eql?
    fdiv
    finite?
    floor
    i
    imag
    imaginary
    infinite?
    initialize_copy
    integer?
    magnitude
    modulo
    negative?
    nonzero?
    numerator
    phase
    polar
    positive?
    quo
    real
    real?
    rect
    rectangular
    remainder
    round
    singleton_method_added
    step
    to_c
    to_int
    truncate
    zero?

# Numeric#%

(from ruby core)
---
    num.modulo(numeric)  ->  real

---

    x.modulo(y) means x-y*(x/y).floor

Equivalent to `num.divmod(numeric)[1]`.

See Numeric#divmod.


# Numeric#+@

(from ruby core)
---
    +num  ->  num

---

Unary Plus---Returns the receiver's value.


# Numeric#-@

(from ruby core)
---
    -num  ->  numeric

---

Unary Minus---Returns the receiver's value, negated.


# Numeric#<=>

(from ruby core)
---
    number <=> other  ->  0 or nil

---

Returns zero if `number` equals `other`, otherwise `nil` is returned if the
two values are incomparable.


# Numeric#abs

(from ruby core)
---
    num.abs        ->  numeric

---

Returns the absolute value of `num`.

    12.abs         #=> 12
    (-34.56).abs   #=> 34.56
    -34.56.abs     #=> 34.56

Numeric#magnitude is an alias of Numeric#abs.


# Numeric#abs2

(from ruby core)
---
    num.abs2  ->  real

---

Returns square of self.


# Numeric#angle

(from ruby core)
---
    num.angle  ->  0 or float

---

Returns 0 if the value is positive, pi otherwise.


# Numeric#arg

(from ruby core)
---
    num.arg    ->  0 or float

---

Returns 0 if the value is positive, pi otherwise.


# Numeric#ceil

(from ruby core)
---
    num.ceil([ndigits])  ->  integer or float

---

Returns the smallest possible Integer that is greater than or equal to `num`.

Numeric achieves this by converting itself to a Float then invoking
Float#ceil.

    1.ceil        #=> 1
    1.2.ceil      #=> 2
    (-1.2).ceil   #=> -1
    (-1.0).ceil   #=> -1


# Numeric#coerce

(from ruby core)
---
    num.coerce(numeric)  ->  array

---

If a `numeric` is the same type as `num`, returns an array containing
`numeric` and `num`. Otherwise, returns an array with both a `numeric` and
`num` represented as Float objects.

This coercion mechanism is used by Ruby to handle mixed-type numeric
operations: it is intended to find a compatible common type between the two
operands of the operator.

    1.coerce(2.5)   #=> [2.5, 1.0]
    1.2.coerce(3)   #=> [3.0, 1.2]
    1.coerce(2)     #=> [2, 1]


# Numeric#conj

(from ruby core)
---
    num.conj       ->  self
    num.conjugate  ->  self

---

Returns self.


# Numeric#conjugate

(from ruby core)
---
    num.conjugate  ->  self

---

Returns self.


# Numeric#denominator

(from ruby core)
---
    num.denominator  ->  integer

---

Returns the denominator (always positive).


# Numeric#div

(from ruby core)
---
    num.div(numeric)  ->  integer

---

Uses `/` to perform division, then converts the result to an integer.
`numeric` does not define the `/` operator; this is left to subclasses.

Equivalent to `num.divmod(numeric)[0]`.

See Numeric#divmod.


# Numeric#divmod

(from ruby core)
---
    num.divmod(numeric)  ->  array

---

Returns an array containing the quotient and modulus obtained by dividing
`num` by `numeric`.

If `q, r = * x.divmod(y)`, then

    q = floor(x/y)
    x = q*y+r

The quotient is rounded toward -infinity, as shown in the following table:

     a    |  b  |  a.divmod(b)  |   a/b   | a.modulo(b) | a.remainder(b)
    ------+-----+---------------+---------+-------------+---------------
     13   |  4  |   3,    1     |   3     |    1        |     1
    ------+-----+---------------+---------+-------------+---------------
     13   | -4  |  -4,   -3     |  -4     |   -3        |     1
    ------+-----+---------------+---------+-------------+---------------
    -13   |  4  |  -4,    3     |  -4     |    3        |    -1
    ------+-----+---------------+---------+-------------+---------------
    -13   | -4  |   3,   -1     |   3     |   -1        |    -1
    ------+-----+---------------+---------+-------------+---------------
     11.5 |  4  |   2,    3.5   |   2.875 |    3.5      |     3.5
    ------+-----+---------------+---------+-------------+---------------
     11.5 | -4  |  -3,   -0.5   |  -2.875 |   -0.5      |     3.5
    ------+-----+---------------+---------+-------------+---------------
    -11.5 |  4  |  -3,    0.5   |  -2.875 |    0.5      |    -3.5
    ------+-----+---------------+---------+-------------+---------------
    -11.5 | -4  |   2,   -3.5   |   2.875 |   -3.5      |    -3.5

Examples

    11.divmod(3)         #=> [3, 2]
    11.divmod(-3)        #=> [-4, -1]
    11.divmod(3.5)       #=> [3, 0.5]
    (-11).divmod(3.5)    #=> [-4, 3.0]
    (11.5).divmod(3.5)   #=> [3, 1.0]


# Numeric#eql?

(from ruby core)
---
    num.eql?(numeric)  ->  true or false

---

Returns `true` if `num` and `numeric` are the same type and have equal values.
 Contrast this with `Numeric#==`, which performs type conversions.

    1 == 1.0          #=> true
    1.eql?(1.0)       #=> false
    (1.0).eql?(1.0)   #=> true
    68719476736.eql?(68719476736.0)   #=> false


# Numeric#fdiv

(from ruby core)
---
    num.fdiv(numeric)  ->  float

---

Returns float division.


# Numeric#finite?

(from ruby core)
---
    num.finite?  ->  true or false

---

Return true if `num` is finite number, oterwise returns false.


# Numeric#floor

(from ruby core)
---
    num.floor([ndigits])  ->  integer or float

---

Returns the largest integer less than or equal to `num`.

Numeric implements this by converting an Integer to a Float and invoking
Float#floor.

    1.floor      #=> 1
    (-1).floor   #=> -1


# Numeric#i

(from ruby core)
---
    num.i  ->  Complex(0,num)

---

Returns the corresponding imaginary number. Not available for complex numbers.


# Numeric#imag

(from ruby core)
---
    num.imag       ->  0
    num.imaginary  ->  0

---

Returns zero.


# Numeric#imaginary

(from ruby core)
---
    num.imaginary  ->  0

---

Returns zero.


# Numeric#infinite?

(from ruby core)
---
    num.infinite?  ->  nil or 1 or -1

---

Returns values corresponding to the value of `num`'s magnitude:

`finite`
:   `nil`
`-Infinity`
:   `-1`
+`Infinity`
:   +`1`



# Numeric#initialize_copy

(from ruby core)
---
    initialize_copy(p1)

---

Numerics are immutable values, which should not be copied.

Any attempt to use this method on a Numeric will raise a TypeError.


# Numeric#integer?

(from ruby core)
---
    num.integer?  ->  true or false

---

Returns `true` if `num` is an Integer.

    (1.0).integer? #=> false
    (1).integer?   #=> true


# Numeric#magnitude

(from ruby core)
---
    num.magnitude  ->  numeric

---

Returns the absolute value of `num`.

    12.abs         #=> 12
    (-34.56).abs   #=> 34.56
    -34.56.abs     #=> 34.56

Numeric#magnitude is an alias of Numeric#abs.


# Numeric#modulo

(from ruby core)
---
    num.modulo(numeric)  ->  real

---

    x.modulo(y) means x-y*(x/y).floor

Equivalent to `num.divmod(numeric)[1]`.

See Numeric#divmod.


# Numeric#negative?

(from ruby core)
---
    num.negative? ->  true or false

---

Returns `true` if `num` is less than 0.


(from gem activesupport-5.1.2)
---
    negative?()

---

Returns true if the number is negative.

    -1.negative? # => true
    0.negative?  # => false
    1.negative?  # => false


# Numeric#nonzero?

(from ruby core)
---
    num.nonzero?  ->  self or nil

---

Returns `self` if `num` is not zero, `nil` otherwise.

This behavior is useful when chaining comparisons:

    a = %w( z Bb bB bb BB a aA Aa AA A )
    b = a.sort {|a,b| (a.downcase <=> b.downcase).nonzero? || a <=> b }
    b   #=> ["A", "a", "AA", "Aa", "aA", "BB", "Bb", "bB", "bb", "z"]


# Numeric#numerator

(from ruby core)
---
    num.numerator  ->  integer

---

Returns the numerator.


# Numeric#phase

(from ruby core)
---
    num.phase  ->  0 or float

---

Returns 0 if the value is positive, pi otherwise.


# Numeric#polar

(from ruby core)
---
    num.polar  ->  array

---

Returns an array; [num.abs, num.arg].


# Numeric#positive?

(from ruby core)
---
    num.positive? ->  true or false

---

Returns `true` if `num` is greater than 0.


(from gem activesupport-5.1.2)
---
    positive?()

---

Returns true if the number is positive.

    1.positive?  # => true
    0.positive?  # => false
    -1.positive? # => false


# Numeric#quo

(from ruby core)
---
    num.quo(int_or_rat)   ->  rat
    num.quo(flo)          ->  flo

---

Returns most exact division (rational for integers, float for floats).


# Numeric#real

(from ruby core)
---
    num.real  ->  self

---

Returns self.


# Numeric#real?

(from ruby core)
---
    num.real?  ->  true or false

---

Returns `true` if `num` is a Real number. (i.e. not Complex).


# Numeric#rect

(from ruby core)
---
    num.rect  ->  array
    num.rectangular  ->  array

---

Returns an array; [num, 0].


# Numeric#rectangular

(from ruby core)
---
    num.rectangular  ->  array

---

Returns an array; [num, 0].


# Numeric#remainder

(from ruby core)
---
    num.remainder(numeric)  ->  real

---

    x.remainder(y) means x-y*(x/y).truncate

See Numeric#divmod.


# Numeric#round

(from ruby core)
---
    num.round([ndigits])  ->  integer or float

---

Rounds `num` to a given precision in decimal digits (default 0 digits).

Precision may be negative.  Returns a floating point number when `ndigits` is
more than zero.

Numeric implements this by converting itself to a Float and invoking
Float#round.


# Numeric#singleton_method_added

(from ruby core)
---
    singleton_method_added(p1)

---

Trap attempts to add methods to Numeric objects. Always raises a TypeError.

Numerics should be values; singleton_methods should not be added to them.


# Numeric#step

(from ruby core)
---
    num.step(by: step, to: limit) {|i| block }   ->  self
    num.step(by: step, to: limit)                ->  an_enumerator
    num.step(limit=nil, step=1) {|i| block }     ->  self
    num.step(limit=nil, step=1)                  ->  an_enumerator

---

Invokes the given block with the sequence of numbers starting at `num`,
incremented by `step` (defaulted to `1`) on each call.

The loop finishes when the value to be passed to the block is greater than
`limit` (if `step` is positive) or less than `limit` (if `step` is negative),
where *limit* is defaulted to infinity.

In the recommended keyword argument style, either or both of `step` and
`limit` (default infinity) can be omitted.  In the fixed position argument
style, zero as a step (i.e. num.step(limit, 0)) is not allowed for historical
compatibility reasons.

If all the arguments are integers, the loop operates using an integer counter.

If any of the arguments are floating point numbers, all are converted to
floats, and the loop is executed the following expression:

    floor(n + n*epsilon)+ 1

Where the `n` is the following:

    n = (limit - num)/step

Otherwise, the loop starts at `num`, uses either the less-than (<) or
greater-than (>) operator to compare the counter against `limit`, and
increments itself using the `+` operator.

If no block is given, an Enumerator is returned instead.

For example:

    p 1.step.take(4)
    p 10.step(by: -1).take(4)
    3.step(to: 5) { |i| print i, " " }
    1.step(10, 2) { |i| print i, " " }
    Math::E.step(to: Math::PI, by: 0.2) { |f| print f, " " }

Will produce:

    [1, 2, 3, 4]
    [10, 9, 8, 7]
    3 4 5
    1 3 5 7 9
    2.71828182845905 2.91828182845905 3.11828182845905


# Numeric#to_c

(from ruby core)
---
    num.to_c  ->  complex

---

Returns the value as a complex.


# Numeric#to_int

(from ruby core)
---
    num.to_int  ->  integer

---

Invokes the child class's `to_i` method to convert `num` to an integer.

    1.0.class => Float
    1.0.to_int.class => Integer
    1.0.to_i.class => Integer


# Numeric#truncate

(from ruby core)
---
    num.truncate([ndigits])  ->  integer or float

---

Returns `num` truncated to an Integer.

Numeric implements this by converting its value to a Float and invoking
Float#truncate.


# Numeric#zero?

(from ruby core)
---
    num.zero?  ->  true or false

---

Returns `true` if `num` has a zero value.


(from gem activesupport-5.1.2)
---





---
# Constants:

EXABYTE
:   [not documented]
GIGABYTE
:   [not documented]
KILOBYTE
:   [not documented]
MEGABYTE
:   [not documented]
PETABYTE
:   [not documented]
TERABYTE
:   [not documented]


# Instance methods:

    byte
    bytes
    day
    days
    duplicable?
    exabyte
    exabytes
    fortnight
    fortnights
    gigabyte
    gigabytes
    hour
    hours
    html_safe?
    in_milliseconds
    kilobyte
    kilobytes
    megabyte
    megabytes
    minute
    minutes
    negative?
    petabyte
    petabytes
    positive?
    second
    seconds
    terabyte
    terabytes
    week
    weeks

# Numeric#byte

(from gem activesupport-5.1.2)
---
    byte()

---


# Numeric#bytes

(from gem activesupport-5.1.2)
---
    bytes()

---

Enables the use of byte calculations and declarations, like 45.bytes +
2.6.megabytes

    2.bytes # => 2


# Numeric#day

(from gem activesupport-5.1.2)
---
    day()

---


# Numeric#days

(from gem activesupport-5.1.2)
---
    days()

---

Returns a Duration instance matching the number of days provided.

    2.days # => 2 days


# Numeric#duplicable?

(from gem activesupport-5.1.2)
---
    duplicable?()

---

Numbers are not duplicable:

    3.duplicable? # => false
    3.dup         # => TypeError: can't dup Integer


# Numeric#exabyte

(from gem activesupport-5.1.2)
---
    exabyte()

---


# Numeric#exabytes

(from gem activesupport-5.1.2)
---
    exabytes()

---

Returns the number of bytes equivalent to the exabytes provided.

    2.exabytes # => 2_305_843_009_213_693_952


# Numeric#fortnight

(from gem activesupport-5.1.2)
---
    fortnight()

---


# Numeric#fortnights

(from gem activesupport-5.1.2)
---
    fortnights()

---

Returns a Duration instance matching the number of fortnights provided.

    2.fortnights # => 4 weeks


# Numeric#gigabyte

(from gem activesupport-5.1.2)
---
    gigabyte()

---


# Numeric#gigabytes

(from gem activesupport-5.1.2)
---
    gigabytes()

---

Returns the number of bytes equivalent to the gigabytes provided.

    2.gigabytes # => 2_147_483_648


# Numeric#hour

(from gem activesupport-5.1.2)
---
    hour()

---


# Numeric#hours

(from gem activesupport-5.1.2)
---
    hours()

---

Returns a Duration instance matching the number of hours provided.

    2.hours # => 2 hours


# Numeric#html_safe?

(from gem activesupport-5.1.2)
---
    html_safe?()

---


# Numeric#in_milliseconds

(from gem activesupport-5.1.2)
---
    in_milliseconds()

---

Returns the number of milliseconds equivalent to the seconds provided. Used
with the standard time durations, like 1.hour.in_milliseconds -- so we can
feed them to JavaScript functions like getTime().

    2.in_milliseconds # => 2_000


# Numeric#kilobyte

(from gem activesupport-5.1.2)
---
    kilobyte()

---


# Numeric#kilobytes

(from gem activesupport-5.1.2)
---
    kilobytes()

---

Returns the number of bytes equivalent to the kilobytes provided.

    2.kilobytes # => 2048


# Numeric#megabyte

(from gem activesupport-5.1.2)
---
    megabyte()

---


# Numeric#megabytes

(from gem activesupport-5.1.2)
---
    megabytes()

---

Returns the number of bytes equivalent to the megabytes provided.

    2.megabytes # => 2_097_152


# Numeric#minute

(from gem activesupport-5.1.2)
---
    minute()

---


# Numeric#minutes

(from gem activesupport-5.1.2)
---
    minutes()

---

Returns a Duration instance matching the number of minutes provided.

    2.minutes # => 2 minutes


# Numeric#negative?

(from ruby core)
---
    num.negative? ->  true or false

---

Returns `true` if `num` is less than 0.


(from gem activesupport-5.1.2)
---
    negative?()

---

Returns true if the number is negative.

    -1.negative? # => true
    0.negative?  # => false
    1.negative?  # => false


# Numeric#petabyte

(from gem activesupport-5.1.2)
---
    petabyte()

---


# Numeric#petabytes

(from gem activesupport-5.1.2)
---
    petabytes()

---

Returns the number of bytes equivalent to the petabytes provided.

    2.petabytes # => 2_251_799_813_685_248


# Numeric#positive?

(from ruby core)
---
    num.positive? ->  true or false

---

Returns `true` if `num` is greater than 0.


(from gem activesupport-5.1.2)
---
    positive?()

---

Returns true if the number is positive.

    1.positive?  # => true
    0.positive?  # => false
    -1.positive? # => false


# Numeric#second

(from gem activesupport-5.1.2)
---
    second()

---


# Numeric#seconds

(from gem activesupport-5.1.2)
---
    seconds()

---

Enables the use of time calculations and declarations, like 45.minutes +
2.hours + 4.years.

These methods use Time#advance for precise date calculations when using
from_now, ago, etc. as well as adding or subtracting their results from a Time
object. For example:

    # equivalent to Time.current.advance(months: 1)
    1.month.from_now

    # equivalent to Time.current.advance(years: 2)
    2.years.from_now

    # equivalent to Time.current.advance(months: 4, years: 5)
    (4.months + 5.years).from_now


# Numeric#terabyte

(from gem activesupport-5.1.2)
---
    terabyte()

---


# Numeric#terabytes

(from gem activesupport-5.1.2)
---
    terabytes()

---

Returns the number of bytes equivalent to the terabytes provided.

    2.terabytes # => 2_199_023_255_552


# Numeric#week

(from gem activesupport-5.1.2)
---
    week()

---


# Numeric#weeks

(from gem activesupport-5.1.2)
---
    weeks()

---

Returns a Duration instance matching the number of weeks provided.

    2.weeks # => 2 weeks


