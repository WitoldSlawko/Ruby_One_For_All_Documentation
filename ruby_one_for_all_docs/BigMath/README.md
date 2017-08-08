# BigMath

(from ruby core)
---

Provides mathematical functions.

Example:

    require "bigdecimal/math"

    include BigMath

    a = BigDecimal((PI(100)/2).to_s)
    puts sin(a,100) # => 0.99999999999999999999......e0
---
# Class methods:

    exp
    log

# Instance methods:

    E
    PI
    atan
    cos
    sin
    sqrt

# BigMath::exp

(from ruby core)
---
    BigMath.exp(decimal, numeric)    -> BigDecimal

---

Computes the value of e (the base of natural logarithms) raised to the power
of `decimal`, to the specified number of digits of precision.

If `decimal` is infinity, returns Infinity.

If `decimal` is NaN, returns NaN.


# BigMath::log

(from ruby core)
---
    BigMath.log(decimal, numeric)    -> BigDecimal

---

Computes the natural logarithm of `decimal` to the specified number of digits
of precision, `numeric`.

If `decimal` is zero or negative, raises Math::DomainError.

If `decimal` is positive infinity, returns Infinity.

If `decimal` is NaN, returns NaN.


# BigMath#E

(from ruby core)
---
    E(numeric) -> BigDecimal

---

Computes e (the base of natural logarithms) to the specified number of digits
of precision, `numeric`.

    BigMath.E(10).to_s
    #=> "0.271828182845904523536028752390026306410273e1"


# BigMath#PI

(from ruby core)
---
    PI(numeric) -> BigDecimal

---

Computes the value of pi to the specified number of digits of precision,
`numeric`.

    BigMath.PI(10).to_s
    #=> "0.3141592653589793238462643388813853786957412e1"


# BigMath#atan

(from ruby core)
---
    atan(decimal, numeric) -> BigDecimal

---

Computes the arctangent of `decimal` to the specified number of digits of
precision, `numeric`.

If `decimal` is NaN, returns NaN.

    BigMath.atan(BigDecimal.new('-1'), 16).to_s
    #=> "-0.785398163397448309615660845819878471907514682065e0"


# BigMath#cos

(from ruby core)
---
    cos(decimal, numeric) -> BigDecimal

---

Computes the cosine of `decimal` to the specified number of digits of
precision, `numeric`.

If `decimal` is Infinity or NaN, returns NaN.

    BigMath.cos(BigMath.PI(4), 16).to_s
    #=> "-0.999999999999999999999999999999856613163740061349e0"


# BigMath#sin

(from ruby core)
---
    sin(decimal, numeric) -> BigDecimal

---

Computes the sine of `decimal` to the specified number of digits of precision,
`numeric`.

If `decimal` is Infinity or NaN, returns NaN.

    BigMath.sin(BigMath.PI(5)/4, 5).to_s
    #=> "0.70710678118654752440082036563292800375e0"


# BigMath#sqrt

(from ruby core)
---
    sqrt(decimal, numeric) -> BigDecimal

---

Computes the square root of `decimal` to the specified number of digits of
precision, `numeric`.

    BigMath.sqrt(BigDecimal.new('2'), 16).to_s
    #=> "0.1414213562373095048801688724e1"


