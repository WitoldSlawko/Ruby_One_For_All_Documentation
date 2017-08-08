# Jacobian

(from ruby core)
---
require 'bigdecimal/jacobian'

Provides methods to compute the Jacobian matrix of a set of equations at a
point x. In the methods below:

f is an Object which is used to compute the Jacobian matrix of the equations.
It must provide the following methods:

f.values(x)
:   returns the values of all functions at x

f.zero
:   returns 0.0
f.one
:   returns 1.0
f.two
:   returns 2.0
f.ten
:   returns 10.0

f.eps
:   returns the convergence criterion (epsilon value) used to determine
    whether two values are considered equal. If |a-b| < epsilon, the two
    values are considered equal.


x is the point at which to compute the Jacobian.

fx is f.values(x).
---
# Instance methods:

    dfdxi
    isEqual
    jacobian

# Jacobian#dfdxi

(from ruby core)
---
    dfdxi(f,fx,x,i)

---

Computes the derivative of [f](i) at [x](i). fx is the value of f at x.


# Jacobian#isEqual

(from ruby core)
---
    isEqual(a,b,zero=0.0,e=1.0e-8)

---

Determines the equality of two numbers by comparing to zero, or using the
epsilon value


# Jacobian#jacobian

(from ruby core)
---
    jacobian(f,fx,x)

---

Computes the Jacobian of f at x. fx is the value of f at x.


