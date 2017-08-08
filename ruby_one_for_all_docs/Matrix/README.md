# Matrix < Object

---
# Includes:
Enumerable (from ruby core)

---
# Extended by:
ConversionHelper (from ruby core)

(from ruby core)
---
The `Matrix` class represents a mathematical matrix. It provides methods for
creating matrices, operating on them arithmetically and algebraically, and
determining their mathematical properties (trace, rank, inverse, determinant).

## Method Catalogue

To create a matrix:
*   [Matrix](*rows)
*   Matrix.[](*rows)
*   Matrix.rows(rows, copy = true)
*   Matrix.columns(columns)
*   Matrix.build(row_count, column_count, &block)
*   Matrix.diagonal(*values)
*   Matrix.scalar(n, value)
*   Matrix.identity(n)
*   Matrix.unit(n)
*   Matrix.I(n)
*   Matrix.zero(n)
*   Matrix.row_vector(row)
*   Matrix.column_vector(column)
*   Matrix.empty(row_count, column_count)
*   Matrix.hstack(*matrices)
*   Matrix.vstack(*matrices)


To access Matrix elements/columns/rows/submatrices/properties:
*   #[](i, j)
*   #row_count (row_size)
*   #column_count (column_size)
*   #row(i)
*   #column(j)
*   #collect
*   #map
*   #each
*   #each_with_index
*   #find_index
*   #minor(*param)
*   #first_minor(row, column)
*   #cofactor(row, column)
*   #adjugate
*   #laplace_expansion(row_or_column: num)
*   #cofactor_expansion(row_or_column: num)


Properties of a matrix:
*   #diagonal?
*   #empty?
*   #hermitian?
*   #lower_triangular?
*   #normal?
*   #orthogonal?
*   #permutation?
*   #real?
*   #regular?
*   #singular?
*   #square?
*   #symmetric?
*   #unitary?
*   #upper_triangular?
*   #zero?


Matrix arithmetic:
*   #*(m)
*   #+(m)
*   #-(m)
*   #/(m)
*   #inverse
*   #inv
*   #**
*   #+@
*   #-@


Matrix functions:
*   #determinant
*   #det
*   #hstack(*matrices)
*   #rank
*   #round
*   #trace
*   #tr
*   #transpose
*   #t
*   #vstack(*matrices)


Matrix decompositions:
*   #eigen
*   #eigensystem
*   #lup
*   #lup_decomposition


Complex arithmetic:
*   conj
*   conjugate
*   imag
*   imaginary
*   real
*   rect
*   rectangular


Conversion to other data types:
*   #coerce(other)
*   #row_vectors
*   #column_vectors
*   #to_a


String representations:
*   #to_s
*   #inspect



---
# Constants:

SELECTORS
:   [not documented]


# Class methods:

    I
    []
    build
    column_vector
    columns
    diagonal
    empty
    hstack
    identity
    new
    row_vector
    rows
    scalar
    unit
    vstack
    zero

# Instance methods:

    *
    **
    +
    +@
    -
    -@
    /
    ==
    []
    []=
    adjugate
    clone
    coerce
    cofactor
    cofactor_expansion
    collect
    column
    column_count
    column_size
    column_vectors
    component
    conj
    conjugate
    det
    det_e
    determinant
    determinant_bareiss
    determinant_e
    diagonal?
    each
    each_with_index
    eigen
    eigensystem
    element
    elements_to_f
    elements_to_i
    elements_to_r
    empty?
    eql?
    find_index
    first_minor
    hash
    hermitian?
    hstack
    imag
    imaginary
    index
    inspect
    inv
    inverse
    laplace_expansion
    lower_triangular?
    lup
    lup_decomposition
    map
    minor
    normal?
    orthogonal?
    permutation?
    rank
    rank_e
    real
    real?
    rect
    rectangular
    regular?
    round
    row
    row_count
    row_size
    row_vectors
    rows
    set_component
    set_element
    singular?
    square?
    symmetric?
    t
    to_a
    to_s
    tr
    trace
    transpose
    unitary?
    upper_triangular?
    vstack
    zero?

# Attributes:

    attr_reader column_count
    attr_reader column_size
    attr_reader rows

# Matrix::[]

(from ruby core)
---
    [](*rows)

---

Creates a matrix where each argument is a row.
    Matrix[ [25, 93], [-1, 66] ]
       =>  25 93
           -1 66


# Matrix::build

(from ruby core)
---
    build(row_count, column_count = row_count) { |i, j| ... }

---

Creates a matrix of size `row_count` x `column_count`. It fills the values by
calling the given block, passing the current row and column. Returns an
enumerator if no block is given.

    m = Matrix.build(2, 4) {|row, col| col - row }
      => Matrix[[0, 1, 2, 3], [-1, 0, 1, 2]]
    m = Matrix.build(3) { rand }
      => a 3x3 matrix with random elements


# Matrix::column_vector

(from ruby core)
---
    column_vector(column)

---

Creates a single-column matrix where the values of that column are as given in
`column`.
    Matrix.column_vector([4,5,6])
      => 4
         5
         6


# Matrix::columns

(from ruby core)
---
    columns(columns)

---

Creates a matrix using `columns` as an array of column vectors.
    Matrix.columns([[25, 93], [-1, 66]])
       =>  25 -1
           93 66


# Matrix::diagonal

(from ruby core)
---
    diagonal(*values)

---

Creates a matrix where the diagonal elements are composed of `values`.
    Matrix.diagonal(9, 5, -3)
      =>  9  0  0
          0  5  0
          0  0 -3


# Matrix::empty

(from ruby core)
---
    empty(row_count = 0, column_count = 0)

---

Creates a empty matrix of `row_count` x `column_count`. At least one of
`row_count` or `column_count` must be 0.

    m = Matrix.empty(2, 0)
    m == Matrix[ [], [] ]
      => true
    n = Matrix.empty(0, 3)
    n == Matrix.columns([ [], [], [] ])
      => true
    m * n
      => Matrix[[0, 0, 0], [0, 0, 0]]


# Matrix::hstack

(from ruby core)
---
    hstack(x, *matrices)

---

Create a matrix by stacking matrices horizontally

    x = Matrix[[1, 2], [3, 4]]
    y = Matrix[[5, 6], [7, 8]]
    Matrix.hstack(x, y) # => Matrix[[1, 2, 5, 6], [3, 4, 7, 8]]


# Matrix::identity

(from ruby core)
---
    identity(n)

---

Creates an `n` by `n` identity matrix.
    Matrix.identity(2)
      => 1 0
         0 1


# Matrix::new

(from ruby core)
---
    new(rows, column_count = rows[0].size)

---

Matrix.new is private; use Matrix.rows, columns, [], etc... to create.


# Matrix::row_vector

(from ruby core)
---
    row_vector(row)

---

Creates a single-row matrix where the values of that row are as given in
`row`.
    Matrix.row_vector([4,5,6])
      => 4 5 6


# Matrix::rows

(from ruby core)
---
    rows(rows, copy = true)

---

Creates a matrix where `rows` is an array of arrays, each of which is a row of
the matrix.  If the optional argument `copy` is false, use the given arrays as
the internal structure of the matrix without copying.
    Matrix.rows([[25, 93], [-1, 66]])
       =>  25 93
           -1 66


# Matrix::scalar

(from ruby core)
---
    scalar(n, value)

---

Creates an `n` by `n` diagonal matrix where each diagonal element is `value`.
    Matrix.scalar(2, 5)
      => 5 0
         0 5


# Matrix::unit

(from ruby core)
---
    unit(n)

---


# Matrix::vstack

(from ruby core)
---
    vstack(x, *matrices)

---

Create a matrix by stacking matrices vertically

    x = Matrix[[1, 2], [3, 4]]
    y = Matrix[[5, 6], [7, 8]]
    Matrix.vstack(x, y) # => Matrix[[1, 2], [3, 4], [5, 6], [7, 8]]


# Matrix::zero

(from ruby core)
---
    zero(row_count, column_count = row_count)

---

Creates a zero matrix.
    Matrix.zero(2)
      => 0 0
         0 0


# Matrix#*

(from ruby core)
---
    *(m)

---

Matrix multiplication.
    Matrix[[2,4], [6,8]] * Matrix.identity(2)
      => 2 4
         6 8


# Matrix#**

(from ruby core)
---
    **(other)

---

Matrix exponentiation. Equivalent to multiplying the matrix by itself N times.
Non integer exponents will be handled by diagonalizing the matrix.

    Matrix[[7,6], [3,9]] ** 2
      => 67 96
         48 99


# Matrix#+

(from ruby core)
---
    +(m)

---

Matrix addition.
    Matrix.scalar(2,5) + Matrix[[1,0], [-4,7]]
      =>  6  0
         -4 12


# Matrix#+@

(from ruby core)
---
    +@()

---


# Matrix#-

(from ruby core)
---
    -(m)

---

Matrix subtraction.
    Matrix[[1,5], [4,2]] - Matrix[[9,3], [-4,1]]
      => -8  2
          8  1


# Matrix#-@

(from ruby core)
---
    -@()

---


# Matrix#/

(from ruby core)
---
    /(other)

---

Matrix division (multiplication by the inverse).
    Matrix[[7,6], [3,9]] / Matrix[[2,9], [3,1]]
      => -7  1
         -3 -6


# Matrix#==

(from ruby core)
---
    ==(other)

---

Returns `true` if and only if the two matrices contain equal elements.


# Matrix#[]

(from ruby core)
---
    [](i, j)

---

Returns element (`i`,`j`) of the matrix.  That is: row `i`, column `j`.


# Matrix#adjugate

(from ruby core)
---
    adjugate()

---

Returns the adjugate of the matrix.

    Matrix[ [7,6],[3,9] ].adjugate
      => 9 -6
         -3 7


# Matrix#clone

(from ruby core)
---
    clone()

---

Returns a clone of the matrix, so that the contents of each do not reference
identical objects. There should be no good reason to do this since Matrices
are immutable.


# Matrix#coerce

(from ruby core)
---
    coerce(other)

---

The coerce method provides support for Ruby type coercion. This coercion
mechanism is used by Ruby to handle mixed-type numeric operations: it is
intended to find a compatible common type between the two operands of the
operator. See also Numeric#coerce.


# Matrix#cofactor

(from ruby core)
---
    cofactor(row, column)

---

Returns the (row, column) cofactor which is obtained by multiplying the first
minor by (-1)**(row + column).

    Matrix.diagonal(9, 5, -3, 4).cofactor(1, 1)
      => -108


# Matrix#cofactor_expansion

(from ruby core)
---
    cofactor_expansion(row: nil, column: nil)

---


# Matrix#collect

(from ruby core)
---
    collect() { |e| ... }

---

Returns a matrix that is the result of iteration of the given block over all
elements of the matrix.
    Matrix[ [1,2], [3,4] ].collect { |e| e**2 }
      => 1  4
         9 16


# Matrix#column

(from ruby core)
---
    column(j) { |e| ... }

---

Returns column vector number `j` of the matrix as a Vector (starting at 0 like
an array).  When a block is given, the elements of that vector are iterated.


# Matrix#column_vectors

(from ruby core)
---
    column_vectors()

---

Returns an array of the column vectors of the matrix.  See Vector.


# Matrix#component

(from ruby core)
---
    component(i, j)

---


# Matrix#conj

(from ruby core)
---
    conj()

---


# Matrix#conjugate

(from ruby core)
---
    conjugate()

---

Returns the conjugate of the matrix.
    Matrix[[Complex(1,2), Complex(0,1), 0], [1, 2, 3]]
      => 1+2i   i  0
            1   2  3
    Matrix[[Complex(1,2), Complex(0,1), 0], [1, 2, 3]].conjugate
      => 1-2i  -i  0
            1   2  3


# Matrix#det

(from ruby core)
---
    det()

---


# Matrix#det_e

(from ruby core)
---
    det_e()

---


# Matrix#determinant

(from ruby core)
---
    determinant()

---

Returns the determinant of the matrix.

Beware that using Float values can yield erroneous results because of their
lack of precision. Consider using exact types like Rational or BigDecimal
instead.

    Matrix[[7,6], [3,9]].determinant
      => 45


# Matrix#determinant_e

(from ruby core)
---
    determinant_e()

---

deprecated; use Matrix#determinant


# Matrix#diagonal?

(from ruby core)
---
    diagonal?()

---

Returns `true` if this is a diagonal matrix. Raises an error if matrix is not
square.


# Matrix#each

(from ruby core)
---
    each(which = :all) { |e| ... }

---

Yields all elements of the matrix, starting with those of the first row, or
returns an Enumerator if no block given. Elements can be restricted by passing
an argument:
*   :all (default): yields all elements
*   :diagonal: yields only elements on the diagonal
*   :off_diagonal: yields all elements except on the diagonal
*   :lower: yields only elements on or below the diagonal
*   :strict_lower: yields only elements below the diagonal
*   :strict_upper: yields only elements above the diagonal
*   :upper: yields only elements on or above the diagonal

    Matrix[ [1,2], [3,4] ].each { |e| puts e }
        # => prints the numbers 1 to 4

    Matrix[ [1,2], [3,4] ].each(:strict_lower).to_a # => [3]



# Matrix#each_with_index

(from ruby core)
---
    each_with_index(which = :all) { |e, row, column| ... }

---

Same as #each, but the row index and column index in addition to the element

    Matrix[ [1,2], [3,4] ].each_with_index do |e, row, col|
      puts "#{e} at #{row}, #{col}"
    end
      # => Prints:
      #    1 at 0, 0
      #    2 at 0, 1
      #    3 at 1, 0
      #    4 at 1, 1


# Matrix#eigen

(from ruby core)
---
    eigen()

---


# Matrix#eigensystem

(from ruby core)
---
    eigensystem()

---

Returns the Eigensystem of the matrix; see `EigenvalueDecomposition`.
    m = Matrix[[1, 2], [3, 4]]
    v, d, v_inv = m.eigensystem
    d.diagonal? # => true
    v.inv == v_inv # => true
    (v * d * v_inv).round(5) == m # => true


# Matrix#element

(from ruby core)
---
    element(i, j)

---


# Matrix#elements_to_f

(from ruby core)
---
    elements_to_f()

---


# Matrix#elements_to_i

(from ruby core)
---
    elements_to_i()

---


# Matrix#elements_to_r

(from ruby core)
---
    elements_to_r()

---


# Matrix#empty?

(from ruby core)
---
    empty?()

---

Returns `true` if this is an empty matrix, i.e. if the number of rows or the
number of columns is 0.


# Matrix#eql?

(from ruby core)
---
    eql?(other)

---


# Matrix#find_index

(from ruby core)
---
    find_index(*args)

---


# Matrix#first_minor

(from ruby core)
---
    first_minor(row, column)

---

Returns the submatrix obtained by deleting the specified row and column.

    Matrix.diagonal(9, 5, -3, 4).first_minor(1, 2)
      => 9 0 0
         0 0 0
         0 0 4


# Matrix#hash

(from ruby core)
---
    hash()

---

Returns a hash-code for the matrix.


# Matrix#hermitian?

(from ruby core)
---
    hermitian?()

---

Returns `true` if this is an hermitian matrix. Raises an error if matrix is
not square.


# Matrix#hstack

(from ruby core)
---
    hstack(*matrices)

---

Returns a new matrix resulting by stacking horizontally the receiver with the
given matrices

    x = Matrix[[1, 2], [3, 4]]
    y = Matrix[[5, 6], [7, 8]]
    x.hstack(y) # => Matrix[[1, 2, 5, 6], [3, 4, 7, 8]]


# Matrix#imag

(from ruby core)
---
    imag()

---


# Matrix#imaginary

(from ruby core)
---
    imaginary()

---

Returns the imaginary part of the matrix.
    Matrix[[Complex(1,2), Complex(0,1), 0], [1, 2, 3]]
      => 1+2i  i  0
            1  2  3
    Matrix[[Complex(1,2), Complex(0,1), 0], [1, 2, 3]].imaginary
      =>   2i  i  0
            0  0  0


# Matrix#index

(from ruby core)
---
    index(value, selector = :all) -> [row, column]
    index(selector = :all){ block } -> [row, column]
    index(selector = :all) -> an_enumerator

---

The index method is specialized to return the index as [row, column] It also
accepts an optional `selector` argument, see #each for details.

    Matrix[ [1,2], [3,4] ].index(&:even?) # => [0, 1]
    Matrix[ [1,1], [1,1] ].index(1, :strict_lower) # => [1, 0]


# Matrix#inspect

(from ruby core)
---
    inspect()

---

Overrides Object#inspect


# Matrix#inv

(from ruby core)
---
    inv()

---


# Matrix#inverse

(from ruby core)
---
    inverse()

---

Returns the inverse of the matrix.
    Matrix[[-1, -1], [0, -1]].inverse
      => -1  1
          0 -1


# Matrix#laplace_expansion

(from ruby core)
---
    laplace_expansion(row: nil, column: nil)

---

Returns the Laplace expansion along given row or column.

    Matrix[[7,6], [3,9]].laplace_expansion(column: 1)
     => 45

    Matrix[[Vector[1, 0], Vector[0, 1]], [2, 3]].laplace_expansion(row: 0)
     => Vector[3, -2]


# Matrix#lower_triangular?

(from ruby core)
---
    lower_triangular?()

---

Returns `true` if this is a lower triangular matrix.


# Matrix#lup

(from ruby core)
---
    lup()

---

Returns the LUP decomposition of the matrix; see `LUPDecomposition`.
    a = Matrix[[1, 2], [3, 4]]
    l, u, p = a.lup
    l.lower_triangular? # => true
    u.upper_triangular? # => true
    p.permutation?      # => true
    l * u == p * a      # => true
    a.lup.solve([2, 5]) # => Vector[(1/1), (1/2)]


# Matrix#lup_decomposition

(from ruby core)
---
    lup_decomposition()

---


# Matrix#map

(from ruby core)
---
    map()

---


# Matrix#minor

(from ruby core)
---
    minor(*param)

---

Returns a section of the matrix.  The parameters are either:
*   start_row, nrows, start_col, ncols; OR
*   row_range, col_range


    Matrix.diagonal(9, 5, -3).minor(0..1, 0..2)
      => 9 0 0
         0 5 0

Like Array#[], negative indices count backward from the end of the row or
column (-1 is the last element). Returns nil if the starting row or column is
greater than row_count or column_count respectively.


# Matrix#normal?

(from ruby core)
---
    normal?()

---

Returns `true` if this is a normal matrix. Raises an error if matrix is not
square.


# Matrix#orthogonal?

(from ruby core)
---
    orthogonal?()

---

Returns `true` if this is an orthogonal matrix Raises an error if matrix is
not square.


# Matrix#permutation?

(from ruby core)
---
    permutation?()

---

Returns `true` if this is a permutation matrix Raises an error if matrix is
not square.


# Matrix#rank

(from ruby core)
---
    rank()

---

Returns the rank of the matrix. Beware that using Float values can yield
erroneous results because of their lack of precision. Consider using exact
types like Rational or BigDecimal instead.

    Matrix[[7,6], [3,9]].rank
      => 2


# Matrix#rank_e

(from ruby core)
---
    rank_e()

---

deprecated; use Matrix#rank


# Matrix#real

(from ruby core)
---
    real()

---

Returns the real part of the matrix.
    Matrix[[Complex(1,2), Complex(0,1), 0], [1, 2, 3]]
      => 1+2i  i  0
            1  2  3
    Matrix[[Complex(1,2), Complex(0,1), 0], [1, 2, 3]].real
      =>    1  0  0
            1  2  3


# Matrix#real?

(from ruby core)
---
    real?()

---

Returns `true` if all entries of the matrix are real.


# Matrix#rect

(from ruby core)
---
    rect()

---

Returns an array containing matrices corresponding to the real and imaginary
parts of the matrix

m.rect == [m.real, m.imag]  # ==> true for all matrices m


# Matrix#rectangular

(from ruby core)
---
    rectangular()

---


# Matrix#regular?

(from ruby core)
---
    regular?()

---

Returns `true` if this is a regular (i.e. non-singular) matrix.


# Matrix#round

(from ruby core)
---
    round(ndigits=0)

---

Returns a matrix with entries rounded to the given precision (see Float#round)


# Matrix#row

(from ruby core)
---
    row(i) { |e| ... }

---

Returns row vector number `i` of the matrix as a Vector (starting at 0 like an
array).  When a block is given, the elements of that vector are iterated.


# Matrix#row_count

(from ruby core)
---
    row_count()

---

Returns the number of rows.


# Matrix#row_size

(from ruby core)
---
    row_size()

---


# Matrix#row_vectors

(from ruby core)
---
    row_vectors()

---

Returns an array of the row vectors of the matrix.  See Vector.


# Matrix#singular?

(from ruby core)
---
    singular?()

---

Returns `true` if this is a singular matrix.


# Matrix#square?

(from ruby core)
---
    square?()

---

Returns `true` if this is a square matrix.


# Matrix#symmetric?

(from ruby core)
---
    symmetric?()

---

Returns `true` if this is a symmetric matrix. Raises an error if matrix is not
square.


# Matrix#t

(from ruby core)
---
    t()

---


# Matrix#to_a

(from ruby core)
---
    to_a()

---

Returns an array of arrays that describe the rows of the matrix.


# Matrix#to_s

(from ruby core)
---
    to_s()

---

Overrides Object#to_s


# Matrix#tr

(from ruby core)
---
    tr()

---


# Matrix#trace

(from ruby core)
---
    trace()

---

Returns the trace (sum of diagonal elements) of the matrix.
    Matrix[[7,6], [3,9]].trace
      => 16


# Matrix#transpose

(from ruby core)
---
    transpose()

---

Returns the transpose of the matrix.
    Matrix[[1,2], [3,4], [5,6]]
      => 1 2
         3 4
         5 6
    Matrix[[1,2], [3,4], [5,6]].transpose
      => 1 3 5
         2 4 6


# Matrix#unitary?

(from ruby core)
---
    unitary?()

---

Returns `true` if this is a unitary matrix Raises an error if matrix is not
square.


# Matrix#upper_triangular?

(from ruby core)
---
    upper_triangular?()

---

Returns `true` if this is an upper triangular matrix.


# Matrix#vstack

(from ruby core)
---
    vstack(*matrices)

---

Returns a new matrix resulting by stacking vertically the receiver with the
given matrices

    x = Matrix[[1, 2], [3, 4]]
    y = Matrix[[5, 6], [7, 8]]
    x.vstack(y) # => Matrix[[1, 2], [3, 4], [5, 6], [7, 8]]


# Matrix#zero?

(from ruby core)
---
    zero?()

---

Returns `true` if this is a matrix with only zero elements


# Matrix#[]=

(from ruby core)
---
    []=(i, j, v)

---


# Matrix#determinant_bareiss

(from ruby core)
---
    determinant_bareiss()

---

Private. Use Matrix#determinant

Returns the determinant of the matrix, using Bareiss' multistep
integer-preserving gaussian elimination. It has the same computational cost
order O(n^3) as standard Gaussian elimination. Intermediate results are
fraction free and of lower complexity. A matrix of Integers will have thus
intermediate results that are also Integers, with smaller bignums (if any),
while a matrix of Float will usually have intermediate results with better
precision.


# Matrix#set_component

(from ruby core)
---
    set_component(i, j, v)

---


# Matrix#set_element

(from ruby core)
---
    set_element(i, j, v)

---


