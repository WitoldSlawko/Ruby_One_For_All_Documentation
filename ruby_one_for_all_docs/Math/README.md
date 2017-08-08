# Math

(from ruby core)
---
When mathn is required, the Math module changes as follows:

Standard Math module behaviour:
    Math.sqrt(4/9)     # => 0.0
    Math.sqrt(4.0/9.0) # => 0.666666666666667
    Math.sqrt(- 4/9)   # => Errno::EDOM: Numerical argument out of domain - sqrt

After require 'mathn', this is changed to:

    require 'mathn'
    Math.sqrt(4/9)      # => 2/3
    Math.sqrt(4.0/9.0)  # => 0.666666666666667
    Math.sqrt(- 4/9)    # => Complex(0, 2/3)

The Math module contains module functions for basic trigonometric and
transcendental functions. See class Float for a list of constants that define
Ruby's floating point accuracy.

Domains and codomains are given only for real (not complex) numbers.
---
# Constants:

E
:   Definition of the mathematical constant E (e) as a Float number.

PI
:   Definition of the mathematical constant PI as a Float number.



# Class methods:

    acos
    acosh
    asin
    asinh
    atan
    atan2
    atanh
    cbrt
    cos
    cosh
    erf
    erfc
    exp
    frexp
    gamma
    hypot
    ldexp
    lgamma
    log
    log10
    log2
    rsqrt
    sin
    sinh
    sqrt
    tan
    tanh

# Instance methods:

    rsqrt
    sqrt

# Math::acos

(from ruby core)
---
    Math.acos(x)    -> Float

---

Computes the arc cosine of `x`. Returns 0..PI.

Domain: [-1, 1]

Codomain: [0, PI]

    Math.acos(0) == Math::PI/2  #=> true


# Math::acosh

(from ruby core)
---
    Math.acosh(x)    -> Float

---

Computes the inverse hyperbolic cosine of `x`.

Domain: [1, INFINITY)

Codomain: [0, INFINITY)

    Math.acosh(1) #=> 0.0


# Math::asin

(from ruby core)
---
    Math.asin(x)    -> Float

---

Computes the arc sine of `x`. Returns -PI/2..PI/2.

Domain: [-1, -1]

Codomain: [-PI/2, PI/2]

    Math.asin(1) == Math::PI/2  #=> true


# Math::asinh

(from ruby core)
---
    Math.asinh(x)    -> Float

---

Computes the inverse hyperbolic sine of `x`.

Domain: (-INFINITY, INFINITY)

Codomain: (-INFINITY, INFINITY)

    Math.asinh(1) #=> 0.881373587019543


# Math::atan

(from ruby core)
---
    Math.atan(x)    -> Float

---

Computes the arc tangent of `x`. Returns -PI/2..PI/2.

Domain: (-INFINITY, INFINITY)

Codomain: (-PI/2, PI/2)

    Math.atan(0) #=> 0.0


# Math::atan2

(from ruby core)
---
    Math.atan2(y, x)  -> Float

---

Computes the arc tangent given `y` and `x`. Returns a Float in the range
-PI..PI. Return value is a angle in radians between the positive x-axis of
cartesian plane and the point given by the coordinates (`x`, `y`) on it.

Domain: (-INFINITY, INFINITY)

Codomain: [-PI, PI]

    Math.atan2(-0.0, -1.0) #=> -3.141592653589793
    Math.atan2(-1.0, -1.0) #=> -2.356194490192345
    Math.atan2(-1.0, 0.0)  #=> -1.5707963267948966
    Math.atan2(-1.0, 1.0)  #=> -0.7853981633974483
    Math.atan2(-0.0, 1.0)  #=> -0.0
    Math.atan2(0.0, 1.0)   #=> 0.0
    Math.atan2(1.0, 1.0)   #=> 0.7853981633974483
    Math.atan2(1.0, 0.0)   #=> 1.5707963267948966
    Math.atan2(1.0, -1.0)  #=> 2.356194490192345
    Math.atan2(0.0, -1.0)  #=> 3.141592653589793
    Math.atan2(INFINITY, INFINITY)   #=> 0.7853981633974483
    Math.atan2(INFINITY, -INFINITY)  #=> 2.356194490192345
    Math.atan2(-INFINITY, INFINITY)  #=> -0.7853981633974483
    Math.atan2(-INFINITY, -INFINITY) #=> -2.356194490192345


# Math::atanh

(from ruby core)
---
    Math.atanh(x)    -> Float

---

Computes the inverse hyperbolic tangent of `x`.

Domain: (-1, 1)

Codomain: (-INFINITY, INFINITY)

    Math.atanh(1) #=> Infinity


# Math::cbrt

(from ruby core)
---
    Math.cbrt(x)    -> Float

---

Returns the cube root of `x`.

Domain: (-INFINITY, INFINITY)

Codomain: (-INFINITY, INFINITY)

    -9.upto(9) {|x|
      p [x, Math.cbrt(x), Math.cbrt(x)**3]
    }
    #=> [-9, -2.0800838230519, -9.0]
    #   [-8, -2.0, -8.0]
    #   [-7, -1.91293118277239, -7.0]
    #   [-6, -1.81712059283214, -6.0]
    #   [-5, -1.7099759466767, -5.0]
    #   [-4, -1.5874010519682, -4.0]
    #   [-3, -1.44224957030741, -3.0]
    #   [-2, -1.25992104989487, -2.0]
    #   [-1, -1.0, -1.0]
    #   [0, 0.0, 0.0]
    #   [1, 1.0, 1.0]
    #   [2, 1.25992104989487, 2.0]
    #   [3, 1.44224957030741, 3.0]
    #   [4, 1.5874010519682, 4.0]
    #   [5, 1.7099759466767, 5.0]
    #   [6, 1.81712059283214, 6.0]
    #   [7, 1.91293118277239, 7.0]
    #   [8, 2.0, 8.0]
    #   [9, 2.0800838230519, 9.0]


# Math::cos

(from ruby core)
---
    Math.cos(x)    -> Float

---

Computes the cosine of `x` (expressed in radians). Returns a Float in the
range -1.0..1.0.

Domain: (-INFINITY, INFINITY)

Codomain: [-1, 1]

    Math.cos(Math::PI) #=> -1.0


# Math::cosh

(from ruby core)
---
    Math.cosh(x)    -> Float

---

Computes the hyperbolic cosine of `x` (expressed in radians).

Domain: (-INFINITY, INFINITY)

Codomain: [1, INFINITY)

    Math.cosh(0) #=> 1.0


# Math::erf

(from ruby core)
---
    Math.erf(x)  -> Float

---

Calculates the error function of `x`.

Domain: (-INFINITY, INFINITY)

Codomain: (-1, 1)

    Math.erf(0) #=> 0.0


# Math::erfc

(from ruby core)
---
    Math.erfc(x)  -> Float

---

Calculates the complementary error function of x.

Domain: (-INFINITY, INFINITY)

Codomain: (0, 2)

    Math.erfc(0) #=> 1.0


# Math::exp

(from ruby core)
---
    Math.exp(x)    -> Float

---

Returns e**x.

Domain: (-INFINITY, INFINITY)

Codomain: (0, INFINITY)

    Math.exp(0)       #=> 1.0
    Math.exp(1)       #=> 2.718281828459045
    Math.exp(1.5)     #=> 4.4816890703380645


# Math::frexp

(from ruby core)
---
    Math.frexp(x)    -> [fraction, exponent]

---

Returns a two-element array containing the normalized fraction (a Float) and
exponent (an Integer) of `x`.

    fraction, exponent = Math.frexp(1234)   #=> [0.6025390625, 11]
    fraction * 2**exponent                  #=> 1234.0


# Math::gamma

(from ruby core)
---
    Math.gamma(x)  -> Float

---

Calculates the gamma function of x.

Note that gamma(n) is same as fact(n-1) for integer n > 0. However gamma(n)
returns float and can be an approximation.

    def fact(n) (1..n).inject(1) {|r,i| r*i } end
    1.upto(26) {|i| p [i, Math.gamma(i), fact(i-1)] }
    #=> [1, 1.0, 1]
    #   [2, 1.0, 1]
    #   [3, 2.0, 2]
    #   [4, 6.0, 6]
    #   [5, 24.0, 24]
    #   [6, 120.0, 120]
    #   [7, 720.0, 720]
    #   [8, 5040.0, 5040]
    #   [9, 40320.0, 40320]
    #   [10, 362880.0, 362880]
    #   [11, 3628800.0, 3628800]
    #   [12, 39916800.0, 39916800]
    #   [13, 479001600.0, 479001600]
    #   [14, 6227020800.0, 6227020800]
    #   [15, 87178291200.0, 87178291200]
    #   [16, 1307674368000.0, 1307674368000]
    #   [17, 20922789888000.0, 20922789888000]
    #   [18, 355687428096000.0, 355687428096000]
    #   [19, 6.402373705728e+15, 6402373705728000]
    #   [20, 1.21645100408832e+17, 121645100408832000]
    #   [21, 2.43290200817664e+18, 2432902008176640000]
    #   [22, 5.109094217170944e+19, 51090942171709440000]
    #   [23, 1.1240007277776077e+21, 1124000727777607680000]
    #   [24, 2.5852016738885062e+22, 25852016738884976640000]
    #   [25, 6.204484017332391e+23, 620448401733239439360000]
    #   [26, 1.5511210043330954e+25, 15511210043330985984000000]


# Math::hypot

(from ruby core)
---
    Math.hypot(x, y)    -> Float

---

Returns sqrt(x**2 + y**2), the hypotenuse of a right-angled triangle with
sides `x` and `y`.

    Math.hypot(3, 4)   #=> 5.0


# Math::ldexp

(from ruby core)
---
    Math.ldexp(fraction, exponent) -> float

---

Returns the value of `fraction`*(2**`exponent`).

    fraction, exponent = Math.frexp(1234)
    Math.ldexp(fraction, exponent)   #=> 1234.0


# Math::lgamma

(from ruby core)
---
    Math.lgamma(x)  -> [float, -1 or 1]

---

Calculates the logarithmic gamma of `x` and the sign of gamma of `x`.

Math.lgamma(x) is same as
    [Math.log(Math.gamma(x).abs), Math.gamma(x) < 0 ? -1 : 1]

but avoid overflow by Math.gamma(x) for large x.

    Math.lgamma(0) #=> [Infinity, 1]


# Math::log

(from ruby core)
---
    Math.log(x)          -> Float
    Math.log(x, base)    -> Float

---

Returns the logarithm of `x`. If additional second argument is given, it will
be the base of logarithm. Otherwise it is `e` (for the natural logarithm).

Domain: (0, INFINITY)

Codomain: (-INFINITY, INFINITY)

    Math.log(0)          #=> -Infinity
    Math.log(1)          #=> 0.0
    Math.log(Math::E)    #=> 1.0
    Math.log(Math::E**3) #=> 3.0
    Math.log(12, 3)      #=> 2.2618595071429146


# Math::log10

(from ruby core)
---
    Math.log10(x)    -> Float

---

Returns the base 10 logarithm of `x`.

Domain: (0, INFINITY)

Codomain: (-INFINITY, INFINITY)

    Math.log10(1)       #=> 0.0
    Math.log10(10)      #=> 1.0
    Math.log10(10**100) #=> 100.0


# Math::log2

(from ruby core)
---
    Math.log2(x)    -> Float

---

Returns the base 2 logarithm of `x`.

Domain: (0, INFINITY)

Codomain: (-INFINITY, INFINITY)

    Math.log2(1)      #=> 0.0
    Math.log2(2)      #=> 1.0
    Math.log2(32768)  #=> 15.0
    Math.log2(65536)  #=> 16.0


# Math::rsqrt

(from ruby core)
---
    rsqrt(a)

---

Compute square root of a non negative number. This method is internally used
by `Math.sqrt`.


# Math::sin

(from ruby core)
---
    Math.sin(x)    -> Float

---

Computes the sine of `x` (expressed in radians). Returns a Float in the range
-1.0..1.0.

Domain: (-INFINITY, INFINITY)

Codomain: [-1, 1]

    Math.sin(Math::PI/2) #=> 1.0


# Math::sinh

(from ruby core)
---
    Math.sinh(x)    -> Float

---

Computes the hyperbolic sine of `x` (expressed in radians).

Domain: (-INFINITY, INFINITY)

Codomain: (-INFINITY, INFINITY)

    Math.sinh(0) #=> 0.0


# Math::sqrt

(from ruby core)
---
    sqrt(a)

---

Computes the square root of `a`.  It makes use of Complex and Rational to have
no rounding errors if possible.

    Math.sqrt(4/9)      # => 2/3
    Math.sqrt(- 4/9)    # => Complex(0, 2/3)
    Math.sqrt(4.0/9.0)  # => 0.666666666666667


# Math::tan

(from ruby core)
---
    Math.tan(x)    -> Float

---

Computes the tangent of `x` (expressed in radians).

Domain: (-INFINITY, INFINITY)

Codomain: (-INFINITY, INFINITY)

    Math.tan(0) #=> 0.0


# Math::tanh

(from ruby core)
---
    Math.tanh(x)    -> Float

---

Computes the hyperbolic tangent of `x` (expressed in radians).

Domain: (-INFINITY, INFINITY)

Codomain: (-1, 1)

    Math.tanh(0) #=> 0.0


# Math#rsqrt

(from ruby core)
---
    rsqrt(a)

---

Compute square root of a non negative number. This method is internally used
by `Math.sqrt`.


# Math#sqrt

(from ruby core)
---
    sqrt(a)

---

Computes the square root of `a`.  It makes use of Complex and Rational to have
no rounding errors if possible.

    Math.sqrt(4/9)      # => 2/3
    Math.sqrt(- 4/9)    # => Complex(0, 2/3)
    Math.sqrt(4.0/9.0)  # => 0.666666666666667


