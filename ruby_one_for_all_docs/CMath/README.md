# CMath

---
# Includes:
Math (from ruby core)

(from ruby core)
---
# Trigonometric and transcendental functions for complex numbers.

CMath is a library that provides trigonometric and transcendental functions
for complex numbers. The functions in this module accept integers,
floating-point numbers or complex numbers as arguments.

Note that the selection of functions is similar, but not identical, to that in
module math. The reason for having two modules is that some users aren't
interested in complex numbers, and perhaps don't even know what they are. They
would rather have Math.sqrt(-1) raise an exception than return a complex
number.

For more information you can see Complex class.

## Usage

To start using this library, simply require cmath library:

    require "cmath"
---
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
    exp
    log
    log10
    log2
    sin
    sinh
    sqrt
    tan
    tanh

# Instance methods:

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
    exp
    log
    log10
    log2
    sin
    sinh
    sqrt
    tan
    tanh

# CMath::acos

(from ruby core)
---
    acos(z)

---

Returns the arc cosine of `z`

    CMath.acos(1 + 1i) #=> (0.9045568943023813-1.0612750619050357i)


# CMath::acosh

(from ruby core)
---
    acosh(z)

---

returns the inverse hyperbolic cosine of `z`

    CMath.acosh(1 + 1i) #=> (1.0612750619050357+0.9045568943023813i)


# CMath::asin

(from ruby core)
---
    asin(z)

---

Returns the arc sine of `z`

    CMath.asin(1 + 1i) #=> (0.6662394324925153+1.0612750619050355i)


# CMath::asinh

(from ruby core)
---
    asinh(z)

---

returns the inverse hyperbolic sine of `z`

    CMath.asinh(1 + 1i) #=> (1.0612750619050357+0.6662394324925153i)


# CMath::atan

(from ruby core)
---
    atan(z)

---

Returns the arc tangent of `z`

    CMath.atan(1 + 1i) #=> (1.0172219678978514+0.4023594781085251i)


# CMath::atan2

(from ruby core)
---
    atan2(y,x)

---

returns the arc tangent of `y` divided by `x` using the signs of `y` and `x`
to determine the quadrant

    CMath.atan2(1 + 1i, 0) #=> (1.5707963267948966+0.0i)


# CMath::atanh

(from ruby core)
---
    atanh(z)

---

returns the inverse hyperbolic tangent of `z`

    CMath.atanh(1 + 1i) #=> (0.4023594781085251+1.0172219678978514i)


# CMath::cbrt

(from ruby core)
---
    cbrt(z)

---

Returns the principal value of the cube root of `z`

    CMath.cbrt(1 + 4i) #=> (1.449461632813119+0.6858152562177092i)


# CMath::cos

(from ruby core)
---
    cos(z)

---

Returns the cosine of `z`, where `z` is given in radians

    CMath.cos(1 + 1i) #=> (0.8337300251311491-0.9888977057628651i)


# CMath::cosh

(from ruby core)
---
    cosh(z)

---

Returns the hyperbolic cosine of `z`, where `z` is given in radians

    CMath.cosh(1 + 1i) #=> (0.8337300251311491+0.9888977057628651i)


# CMath::exp

(from ruby core)
---
    exp(z)

---

Math::E raised to the `z` power

    CMath.exp(1.i * Math::PI) #=> (-1.0+1.2246467991473532e-16i)


# CMath::log

(from ruby core)
---
    log(z, b=::Math::E)

---

Returns the natural logarithm of Complex. If a second argument is given, it
will be the base of logarithm.

    CMath.log(1 + 4i)     #=> (1.416606672028108+1.3258176636680326i)
    CMath.log(1 + 4i, 10) #=> (0.6152244606891369+0.5757952953408879i)


# CMath::log10

(from ruby core)
---
    log10(z)

---

Returns the base 10 logarithm of `z`

    CMath.log10(-1) #=> (0.0+1.3643763538418412i)


# CMath::log2

(from ruby core)
---
    log2(z)

---

Returns the base 2 logarithm of `z`

    CMath.log2(-1) => (0.0+4.532360141827194i)


# CMath::sin

(from ruby core)
---
    sin(z)

---

Returns the sine of `z`, where `z` is given in radians

    CMath.sin(1 + 1i) #=> (1.2984575814159773+0.6349639147847361i)


# CMath::sinh

(from ruby core)
---
    sinh(z)

---

Returns the hyperbolic sine of `z`, where `z` is given in radians

    CMath.sinh(1 + 1i) #=> (0.6349639147847361+1.2984575814159773i)


# CMath::sqrt

(from ruby core)
---
    sqrt(z)

---

Returns the non-negative square root of Complex.

    CMath.sqrt(-1 + 0i) #=> 0.0+1.0i


# CMath::tan

(from ruby core)
---
    tan(z)

---

Returns the tangent of `z`, where `z` is given in radians

    CMath.tan(1 + 1i) #=> (0.27175258531951174+1.0839233273386943i)


# CMath::tanh

(from ruby core)
---
    tanh(z)

---

Returns the hyperbolic tangent of `z`, where `z` is given in radians

    CMath.tanh(1 + 1i) #=> (1.0839233273386943+0.27175258531951174i)


# CMath#acos

(from ruby core)
---
    acos(z)

---

Returns the arc cosine of `z`

    CMath.acos(1 + 1i) #=> (0.9045568943023813-1.0612750619050357i)


# CMath#acosh

(from ruby core)
---
    acosh(z)

---

returns the inverse hyperbolic cosine of `z`

    CMath.acosh(1 + 1i) #=> (1.0612750619050357+0.9045568943023813i)


# CMath#asin

(from ruby core)
---
    asin(z)

---

Returns the arc sine of `z`

    CMath.asin(1 + 1i) #=> (0.6662394324925153+1.0612750619050355i)


# CMath#asinh

(from ruby core)
---
    asinh(z)

---

returns the inverse hyperbolic sine of `z`

    CMath.asinh(1 + 1i) #=> (1.0612750619050357+0.6662394324925153i)


# CMath#atan

(from ruby core)
---
    atan(z)

---

Returns the arc tangent of `z`

    CMath.atan(1 + 1i) #=> (1.0172219678978514+0.4023594781085251i)


# CMath#atan2

(from ruby core)
---
    atan2(y,x)

---

returns the arc tangent of `y` divided by `x` using the signs of `y` and `x`
to determine the quadrant

    CMath.atan2(1 + 1i, 0) #=> (1.5707963267948966+0.0i)


# CMath#atanh

(from ruby core)
---
    atanh(z)

---

returns the inverse hyperbolic tangent of `z`

    CMath.atanh(1 + 1i) #=> (0.4023594781085251+1.0172219678978514i)


# CMath#cbrt

(from ruby core)
---
    cbrt(z)

---

Returns the principal value of the cube root of `z`

    CMath.cbrt(1 + 4i) #=> (1.449461632813119+0.6858152562177092i)


# CMath#cos

(from ruby core)
---
    cos(z)

---

Returns the cosine of `z`, where `z` is given in radians

    CMath.cos(1 + 1i) #=> (0.8337300251311491-0.9888977057628651i)


# CMath#cosh

(from ruby core)
---
    cosh(z)

---

Returns the hyperbolic cosine of `z`, where `z` is given in radians

    CMath.cosh(1 + 1i) #=> (0.8337300251311491+0.9888977057628651i)


# CMath#exp

(from ruby core)
---
    exp(z)

---

Math::E raised to the `z` power

    CMath.exp(1.i * Math::PI) #=> (-1.0+1.2246467991473532e-16i)


# CMath#log

(from ruby core)
---
    log(z, b=::Math::E)

---

Returns the natural logarithm of Complex. If a second argument is given, it
will be the base of logarithm.

    CMath.log(1 + 4i)     #=> (1.416606672028108+1.3258176636680326i)
    CMath.log(1 + 4i, 10) #=> (0.6152244606891369+0.5757952953408879i)


# CMath#log10

(from ruby core)
---
    log10(z)

---

Returns the base 10 logarithm of `z`

    CMath.log10(-1) #=> (0.0+1.3643763538418412i)


# CMath#log2

(from ruby core)
---
    log2(z)

---

Returns the base 2 logarithm of `z`

    CMath.log2(-1) => (0.0+4.532360141827194i)


# CMath#sin

(from ruby core)
---
    sin(z)

---

Returns the sine of `z`, where `z` is given in radians

    CMath.sin(1 + 1i) #=> (1.2984575814159773+0.6349639147847361i)


# CMath#sinh

(from ruby core)
---
    sinh(z)

---

Returns the hyperbolic sine of `z`, where `z` is given in radians

    CMath.sinh(1 + 1i) #=> (0.6349639147847361+1.2984575814159773i)


# CMath#sqrt

(from ruby core)
---
    sqrt(z)

---

Returns the non-negative square root of Complex.

    CMath.sqrt(-1 + 0i) #=> 0.0+1.0i


# CMath#tan

(from ruby core)
---
    tan(z)

---

Returns the tangent of `z`, where `z` is given in radians

    CMath.tan(1 + 1i) #=> (0.27175258531951174+1.0839233273386943i)


# CMath#tanh

(from ruby core)
---
    tanh(z)

---

Returns the hyperbolic tangent of `z`, where `z` is given in radians

    CMath.tanh(1 + 1i) #=> (1.0839233273386943+0.27175258531951174i)


