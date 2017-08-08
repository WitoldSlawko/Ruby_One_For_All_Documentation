# LUSolve

(from ruby core)
---
Solves a*x = b for x, using LU decomposition.
---
# Instance methods:

    ludecomp
    lusolve

# LUSolve#ludecomp

(from ruby core)
---
    ludecomp(a,n,zero=0,one=1)

---

Performs LU decomposition of the n by n matrix a.


# LUSolve#lusolve

(from ruby core)
---
    lusolve(a,b,ps,zero=0.0)

---

Solves a*x = b for x, using LU decomposition.

a is a matrix, b is a constant vector, x is the solution vector.

ps is the pivot, a vector which indicates the permutation of rows performed
during LU decomposition.


