# Vector < Object

---
# Includes:
Enumerable (from ruby core)

---
# Extended by:
Matrix::ConversionHelper (from ruby core)

(from ruby core)
---
The `Vector` class represents a mathematical vector, which is useful in its
own right, and also constitutes a row or column of a Matrix.

## Method Catalogue

To create a Vector:
*   Vector.[](*array)
*   Vector.elements(array, copy = true)
*   Vector.basis(size: n, index: k)


To access elements:
*   #[](i)


To enumerate the elements:
*   #each2(v)
*   #collect2(v)


Properties of vectors:
*   #angle_with(v)
*   Vector.independent?(*vs)
*   #independent?(*vs)


Vector arithmetic:
*   #*(x) "is matrix or number"
*   #+(v)
*   #-(v)
*   #/(v)
*   #+@
*   #-@


Vector functions:
*   #inner_product(v), dot(v)
*   #cross_product(v), cross(v)
*   #collect
*   #magnitude
*   #map
*   #map2(v)
*   #norm
*   #normalize
*   #r
*   #round
*   #size


Conversion to other data types:
*   #covector
*   #to_a
*   #coerce(other)


String representations:
*   #to_s
*   #inspect

---
# Class methods:

    []
    basis
    elements
    independent?
    new

# Instance methods:

    *
    +
    +@
    -
    -@
    /
    ==
    []
    []=
    angle_with
    clone
    coerce
    collect
    collect2
    component
    covector
    cross
    cross_product
    dot
    each
    each2
    element
    elements
    elements_to_f
    elements_to_i
    elements_to_r
    eql?
    hash
    independent?
    inner_product
    inspect
    magnitude
    map
    map2
    norm
    normalize
    r
    round
    set_component
    set_element
    size
    to_a
    to_s

# Attributes:

    attr_reader elements

# Vector::[]

(from ruby core)
---
    [](*array)

---

Creates a Vector from a list of elements.
    Vector[7, 4, ...]


# Vector::basis

(from ruby core)
---
    basis(size:, index:)

---

Returns a standard basis `n`-vector, where k is the index.

    Vector.basis(size:, index:) # => Vector[0, 1, 0]


# Vector::elements

(from ruby core)
---
    elements(array, copy = true)

---

Creates a vector from an Array.  The optional second argument specifies
whether the array itself or a copy is used internally.


# Vector::independent?

(from ruby core)
---
    independent?(*vs)

---

Returns `true` iff all of vectors are linearly independent.

    Vector.independent?(Vector[1,0], Vector[0,1])
      => true

    Vector.independent?(Vector[1,2], Vector[2,4])
      => false


# Vector::new

(from ruby core)
---
    new(array)

---

Vector.new is private; use Vector[] or Vector.elements to create.


# Vector#*

(from ruby core)
---
    *(x)

---

Multiplies the vector by `x`, where `x` is a number or a matrix.


# Vector#+

(from ruby core)
---
    +(v)

---

Vector addition.


# Vector#+@

(from ruby core)
---
    +@()

---


# Vector#-

(from ruby core)
---
    -(v)

---

Vector subtraction.


# Vector#-@

(from ruby core)
---
    -@()

---


# Vector#/

(from ruby core)
---
    /(x)

---

Vector division.


# Vector#==

(from ruby core)
---
    ==(other)

---

Returns `true` iff the two vectors have the same elements in the same order.


# Vector#[]

(from ruby core)
---
    [](i)

---

Returns element number `i` (starting at zero) of the vector.


# Vector#angle_with

(from ruby core)
---
    angle_with(v)

---

Returns an angle with another vector. Result is within the [0...Math::PI].
    Vector[1,0].angle_with(Vector[0,1])
    # => Math::PI / 2


# Vector#clone

(from ruby core)
---
    clone()

---

Returns a copy of the vector.


# Vector#coerce

(from ruby core)
---
    coerce(other)

---

The coerce method provides support for Ruby type coercion. This coercion
mechanism is used by Ruby to handle mixed-type numeric operations: it is
intended to find a compatible common type between the two operands of the
operator. See also Numeric#coerce.


# Vector#collect

(from ruby core)
---
    collect() { |e| ... }

---

Like Array#collect.


# Vector#collect2

(from ruby core)
---
    collect2(v) { |e1, e2| ... }

---

Collects (as in Enumerable#collect) over the elements of this vector and `v`
in conjunction.


# Vector#component

(from ruby core)
---
    component(i)

---


# Vector#covector

(from ruby core)
---
    covector()

---

Creates a single-row matrix from this vector.


# Vector#cross

(from ruby core)
---
    cross(*vs)

---


# Vector#cross_product

(from ruby core)
---
    cross_product(*vs)

---

Returns the cross product of this vector with the others.
    Vector[1, 0, 0].cross_product Vector[0, 1, 0]   => Vector[0, 0, 1]

It is generalized to other dimensions to return a vector perpendicular to the
arguments.
    Vector[1, 2].cross_product # => Vector[-2, 1]
    Vector[1, 0, 0, 0].cross_product(
       Vector[0, 1, 0, 0],
       Vector[0, 0, 1, 0]
    )  #=> Vector[0, 0, 0, 1]


# Vector#dot

(from ruby core)
---
    dot(v)

---


# Vector#each

(from ruby core)
---
    each(&block)

---

Iterate over the elements of this vector


# Vector#each2

(from ruby core)
---
    each2(v) { |e1, e2| ... }

---

Iterate over the elements of this vector and `v` in conjunction.


# Vector#element

(from ruby core)
---
    element(i)

---


# Vector#elements_to_f

(from ruby core)
---
    elements_to_f()

---


# Vector#elements_to_i

(from ruby core)
---
    elements_to_i()

---


# Vector#elements_to_r

(from ruby core)
---
    elements_to_r()

---


# Vector#eql?

(from ruby core)
---
    eql?(other)

---


# Vector#hash

(from ruby core)
---
    hash()

---

Returns a hash-code for the vector.


# Vector#independent?

(from ruby core)
---
    independent?(*vs)

---

Returns `true` iff all of vectors are linearly independent.

    Vector[1,0].independent?(Vector[0,1])
      => true

    Vector[1,2].independent?(Vector[2,4])
      => false


# Vector#inner_product

(from ruby core)
---
    inner_product(v)

---

Returns the inner product of this vector with the other.
    Vector[4,7].inner_product Vector[10,1]  => 47


# Vector#inspect

(from ruby core)
---
    inspect()

---

Overrides Object#inspect


# Vector#magnitude

(from ruby core)
---
    magnitude()

---

Returns the modulus (Pythagorean distance) of the vector.
    Vector[5,8,2].r => 9.643650761


# Vector#map

(from ruby core)
---
    map()

---


# Vector#map2

(from ruby core)
---
    map2(v) { |e1, e2| ... }

---

Like Vector#collect2, but returns a Vector instead of an Array.


# Vector#norm

(from ruby core)
---
    norm()

---


# Vector#normalize

(from ruby core)
---
    normalize()

---

Returns a new vector with the same direction but with norm 1.
    v = Vector[5,8,2].normalize
    # => Vector[0.5184758473652127, 0.8295613557843402, 0.20739033894608505]
    v.norm => 1.0


# Vector#r

(from ruby core)
---
    r()

---


# Vector#round

(from ruby core)
---
    round(ndigits=0)

---

Returns a vector with entries rounded to the given precision (see Float#round)


# Vector#size

(from ruby core)
---
    size()

---

Returns the number of elements in the vector.


# Vector#to_a

(from ruby core)
---
    to_a()

---

Returns the elements of the vector in an array.


# Vector#to_s

(from ruby core)
---
    to_s()

---

Overrides Object#to_s


# Vector#[]=

(from ruby core)
---
    []=(i, v)

---


# Vector#set_component

(from ruby core)
---
    set_component(i, v)

---


# Vector#set_element

(from ruby core)
---
    set_element(i, v)

---


