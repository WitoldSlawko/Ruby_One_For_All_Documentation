# Array < Object

---
# Includes:
Enumerable (from ruby core)

(from ruby core)
---
Arrays are ordered, integer-indexed collections of any object.

Array indexing starts at 0, as in C or Java.  A negative index is assumed to
be relative to the end of the array---that is, an index of -1 indicates the
last element of the array, -2 is the next to last element in the array, and so
on.

## Creating Arrays

A new array can be created by using the literal constructor `[]`.  Arrays can
contain different types of objects.  For example, the array below contains an
Integer, a String and a Float:

    ary = [1, "two", 3.0] #=> [1, "two", 3.0]

An array can also be created by explicitly calling Array.new with zero, one
(the initial size of the Array) or two arguments (the initial size and a
default object).

    ary = Array.new    #=> []
    Array.new(3)       #=> [nil, nil, nil]
    Array.new(3, true) #=> [true, true, true]

Note that the second argument populates the array with references to the same
object.  Therefore, it is only recommended in cases when you need to
instantiate arrays with natively immutable objects such as Symbols, numbers,
true or false.

To create an array with separate objects a block can be passed instead. This
method is safe to use with mutable objects such as hashes, strings or other
arrays:

    Array.new(4) { Hash.new } #=> [{}, {}, {}, {}]

This is also a quick way to build up multi-dimensional arrays:

    empty_table = Array.new(3) { Array.new(3) }
    #=> [[nil, nil, nil], [nil, nil, nil], [nil, nil, nil]]

An array can also be created by using the Array() method, provided by Kernel,
which tries to call #to_ary, then #to_a on its argument.

    Array({:a => "a", :b => "b"}) #=> [[:a, "a"], [:b, "b"]]

## Example Usage

In addition to the methods it mixes in through the Enumerable module, the
Array class has proprietary methods for accessing, searching and otherwise
manipulating arrays.

Some of the more common ones are illustrated below.

## Accessing Elements

Elements in an array can be retrieved using the Array#[] method.  It can take
a single integer argument (a numeric index), a pair of arguments (start and
length) or a range. Negative indices start counting from the end, with -1
being the last element.

    arr = [1, 2, 3, 4, 5, 6]
    arr[2]    #=> 3
    arr[100]  #=> nil
    arr[-3]   #=> 4
    arr[2, 3] #=> [3, 4, 5]
    arr[1..4] #=> [2, 3, 4, 5]
    arr[1..-3] #=> [2, 3, 4]

Another way to access a particular array element is by using the #at method

    arr.at(0) #=> 1

The #slice method works in an identical manner to Array#[].

To raise an error for indices outside of the array bounds or else to provide a
default value when that happens, you can use #fetch.

    arr = ['a', 'b', 'c', 'd', 'e', 'f']
    arr.fetch(100) #=> IndexError: index 100 outside of array bounds: -6...6
    arr.fetch(100, "oops") #=> "oops"

The special methods #first and #last will return the first and last elements
of an array, respectively.

    arr.first #=> 1
    arr.last  #=> 6

To return the first `n` elements of an array, use #take

    arr.take(3) #=> [1, 2, 3]

#drop does the opposite of #take, by returning the elements after `n` elements
have been dropped:

    arr.drop(3) #=> [4, 5, 6]

## Obtaining Information about an Array

Arrays keep track of their own length at all times.  To query an array about
the number of elements it contains, use #length, #count or #size.

    browsers = ['Chrome', 'Firefox', 'Safari', 'Opera', 'IE']
    browsers.length #=> 5
    browsers.count #=> 5

To check whether an array contains any elements at all

    browsers.empty? #=> false

To check whether a particular item is included in the array

    browsers.include?('Konqueror') #=> false

## Adding Items to Arrays

Items can be added to the end of an array by using either #push or #<<

    arr = [1, 2, 3, 4]
    arr.push(5) #=> [1, 2, 3, 4, 5]
    arr << 6    #=> [1, 2, 3, 4, 5, 6]

#unshift will add a new item to the beginning of an array.

    arr.unshift(0) #=> [0, 1, 2, 3, 4, 5, 6]

With #insert you can add a new element to an array at any position.

    arr.insert(3, 'apple')  #=> [0, 1, 2, 'apple', 3, 4, 5, 6]

Using the #insert method, you can also insert multiple values at once:

    arr.insert(3, 'orange', 'pear', 'grapefruit')
    #=> [0, 1, 2, "orange", "pear", "grapefruit", "apple", 3, 4, 5, 6]

## Removing Items from an Array

The method #pop removes the last element in an array and returns it:

    arr =  [1, 2, 3, 4, 5, 6]
    arr.pop #=> 6
    arr #=> [1, 2, 3, 4, 5]

To retrieve and at the same time remove the first item, use #shift:

    arr.shift #=> 1
    arr #=> [2, 3, 4, 5]

To delete an element at a particular index:

    arr.delete_at(2) #=> 4
    arr #=> [2, 3, 5]

To delete a particular element anywhere in an array, use #delete:

    arr = [1, 2, 2, 3]
    arr.delete(2) #=> 2
    arr #=> [1,3]

A useful method if you need to remove `nil` values from an array is #compact:

    arr = ['foo', 0, nil, 'bar', 7, 'baz', nil]
    arr.compact  #=> ['foo', 0, 'bar', 7, 'baz']
    arr          #=> ['foo', 0, nil, 'bar', 7, 'baz', nil]
    arr.compact! #=> ['foo', 0, 'bar', 7, 'baz']
    arr          #=> ['foo', 0, 'bar', 7, 'baz']

Another common need is to remove duplicate elements from an array.

It has the non-destructive #uniq, and destructive method #uniq!

    arr = [2, 5, 6, 556, 6, 6, 8, 9, 0, 123, 556]
    arr.uniq #=> [2, 5, 6, 556, 8, 9, 0, 123]

## Iterating over Arrays

Like all classes that include the Enumerable module, Array has an each method,
which defines what elements should be iterated over and how.  In case of
Array's #each, all elements in the Array instance are yielded to the supplied
block in sequence.

Note that this operation leaves the array unchanged.

    arr = [1, 2, 3, 4, 5]
    arr.each { |a| print a -= 10, " " }
    # prints: -9 -8 -7 -6 -5
    #=> [1, 2, 3, 4, 5]

Another sometimes useful iterator is #reverse_each which will iterate over the
elements in the array in reverse order.

    words = %w[first second third fourth fifth sixth]
    str = ""
    words.reverse_each { |word| str += "#{word} " }
    p str #=> "sixth fifth fourth third second first "

The #map method can be used to create a new array based on the original array,
but with the values modified by the supplied block:

    arr.map { |a| 2*a }   #=> [2, 4, 6, 8, 10]
    arr                   #=> [1, 2, 3, 4, 5]
    arr.map! { |a| a**2 } #=> [1, 4, 9, 16, 25]
    arr                   #=> [1, 4, 9, 16, 25]

## Selecting Items from an Array

Elements can be selected from an array according to criteria defined in a
block.  The selection can happen in a destructive or a non-destructive manner.
 While the destructive operations will modify the array they were called on,
the non-destructive methods usually return a new array with the selected
elements, but leave the original array unchanged.

### Non-destructive Selection

    arr = [1, 2, 3, 4, 5, 6]
    arr.select { |a| a > 3 }     #=> [4, 5, 6]
    arr.reject { |a| a < 3 }     #=> [3, 4, 5, 6]
    arr.drop_while { |a| a < 4 } #=> [4, 5, 6]
    arr                          #=> [1, 2, 3, 4, 5, 6]

### Destructive Selection

#select! and #reject! are the corresponding destructive methods to #select and
#reject

Similar to #select vs. #reject, #delete_if and #keep_if have the exact
opposite result when supplied with the same block:

    arr.delete_if { |a| a < 4 } #=> [4, 5, 6]
    arr                         #=> [4, 5, 6]

    arr = [1, 2, 3, 4, 5, 6]
    arr.keep_if { |a| a < 4 } #=> [1, 2, 3]
    arr                       #=> [1, 2, 3]



---
# Class methods:

    []
    new
    try_convert

# Instance methods:

    &
    *
    +
    -
    <<
    <=>
    ==
    []
    []=
    abbrev
    any?
    assoc
    at
    bsearch
    bsearch_index
    clear
    collect
    collect!
    combination
    compact
    compact!
    concat
    count
    cycle
    dclone
    delete
    delete_at
    delete_if
    dig
    drop
    drop_while
    each
    each_index
    empty?
    eql?
    fetch
    fill
    find_index
    first
    flatten
    flatten!
    frozen?
    hash
    include?
    index
    initialize_copy
    insert
    inspect
    join
    keep_if
    last
    length
    map
    map!
    max
    min
    pack
    permutation
    pop
    product
    push
    rassoc
    reject
    reject!
    repeated_combination
    repeated_permutation
    replace
    reverse
    reverse!
    reverse_each
    rindex
    rotate
    rotate!
    sample
    select
    select!
    shelljoin
    shift
    shuffle
    shuffle!
    size
    slice
    slice!
    sort
    sort!
    sort_by!
    sum
    take
    take_while
    to_a
    to_ary
    to_h
    to_s
    transpose
    uniq
    uniq!
    unshift
    values_at
    zip
    |

# Array::[]

(from ruby core)
---
    [](*args)

---

Returns a new array populated with the given objects.

    Array.[]( 1, 'a', /^A/ ) # => [1, "a", /^A/]
    Array[ 1, 'a', /^A/ ]    # => [1, "a", /^A/]
    [ 1, 'a', /^A/ ]         # => [1, "a", /^A/]


# Array::new

(from ruby core)
---
    Array.new(size=0, default=nil)
    Array.new(array)
    Array.new(size) {|index| block }

---

Returns a new array.

In the first form, if no arguments are sent, the new array will be empty. When
a `size` and an optional `default` are sent, an array is created with `size`
copies of `default`.  Take notice that all elements will reference the same
object `default`.

The second form creates a copy of the array passed as a parameter (the array
is generated by calling to_ary on the parameter).

    first_array = ["Matz", "Guido"]

    second_array = Array.new(first_array) #=> ["Matz", "Guido"]

    first_array.equal? second_array       #=> false

In the last form, an array of the given size is created.  Each element in this
array is created by passing the element's index to the given block and storing
the return value.

    Array.new(3){ |index| index ** 2 }
    # => [0, 1, 4]

## Common gotchas

When sending the second parameter, the same object will be used as the value
for all the array elements:

    a = Array.new(2, Hash.new)
    # => [{}, {}]

    a[0]['cat'] = 'feline'
    a # => [{"cat"=>"feline"}, {"cat"=>"feline"}]

    a[1]['cat'] = 'Felix'
    a # => [{"cat"=>"Felix"}, {"cat"=>"Felix"}]

Since all the Array elements store the same hash, changes to one of them will
affect them all.

If multiple copies are what you want, you should use the block version which
uses the result of that block each time an element of the array needs to be
initialized:

    a = Array.new(2) { Hash.new }
    a[0]['cat'] = 'feline'
    a # => [{"cat"=>"feline"}, {}]


# Array::try_convert

(from ruby core)
---
    Array.try_convert(obj) -> array or nil

---

Tries to convert `obj` into an array, using `to_ary` method.  Returns the
converted array or `nil` if `obj` cannot be converted for any reason. This
method can be used to check if an argument is an array.

    Array.try_convert([1])   #=> [1]
    Array.try_convert("1")   #=> nil

    if tmp = Array.try_convert(arg)
      # the argument is an array
    elsif tmp = String.try_convert(arg)
      # the argument is a string
    end


# Array#&

(from ruby core)
---
    ary & other_ary      -> new_ary

---

Set Intersection --- Returns a new array containing unique elements common to
the two arrays. The order is preserved from the original array.

It compares elements using their #hash and #eql? methods for efficiency.

    [ 1, 1, 3, 5 ] & [ 3, 2, 1 ]                 #=> [ 1, 3 ]
    [ 'a', 'b', 'b', 'z' ] & [ 'a', 'b', 'c' ]   #=> [ 'a', 'b' ]

See also Array#uniq.


# Array#*

(from ruby core)
---
    ary * int     -> new_ary
    ary * str     -> new_string

---

Repetition --- With a String argument, equivalent to `ary.join(str)`.

Otherwise, returns a new array built by concatenating the `int` copies of
`self`.

    [ 1, 2, 3 ] * 3    #=> [ 1, 2, 3, 1, 2, 3, 1, 2, 3 ]
    [ 1, 2, 3 ] * ","  #=> "1,2,3"


# Array#+

(from ruby core)
---
    ary + other_ary   -> new_ary

---

Concatenation --- Returns a new array built by concatenating the two arrays
together to produce a third array.

    [ 1, 2, 3 ] + [ 4, 5 ]    #=> [ 1, 2, 3, 4, 5 ]
    a = [ "a", "b", "c" ]
    c = a + [ "d", "e", "f" ]
    c                         #=> [ "a", "b", "c", "d", "e", "f" ]
    a                         #=> [ "a", "b", "c" ]

Note that
    x += y

is the same as
    x = x + y

This means that it produces a new array. As a consequence, repeated use of
`+=` on arrays can be quite inefficient.

See also Array#concat.


# Array#-

(from ruby core)
---
    ary - other_ary    -> new_ary

---

Array Difference

Returns a new array that is a copy of the original array, removing any items
that also appear in `other_ary`. The order is preserved from the original
array.

It compares elements using their #hash and #eql? methods for efficiency.

    [ 1, 1, 2, 2, 3, 3, 4, 5 ] - [ 1, 2, 4 ]  #=>  [ 3, 3, 5 ]

If you need set-like behavior, see the library class Set.


# Array#<<

(from ruby core)
---
    ary << obj            -> ary

---

Append---Pushes the given object on to the end of this array. This expression
returns the array itself, so several appends may be chained together.

    [ 1, 2 ] << "c" << "d" << [ 3, 4 ]
            #=>  [ 1, 2, "c", "d", [ 3, 4 ] ]


# Array#<=>

(from ruby core)
---
    ary <=> other_ary   ->  -1, 0, +1 or nil

---

Comparison --- Returns an integer (`-1`, `0`, or `+1`) if this array is less
than, equal to, or greater than `other_ary`.

Each object in each array is compared (using the <=> operator).

Arrays are compared in an "element-wise" manner; the first element of `ary` is
compared with the first one of `other_ary` using the <=> operator, then each
of the second elements, etc... As soon as the result of any such comparison is
non zero (i.e. the two corresponding elements are not equal), that result is
returned for the whole array comparison.

If all the elements are equal, then the result is based on a comparison of the
array lengths. Thus, two arrays are "equal" according to Array#<=> if, and
only if, they have the same length and the value of each element is equal to
the value of the corresponding element in the other array.

`nil` is returned if the `other_ary` is not an array or if the comparison of
two elements returned `nil`.

    [ "a", "a", "c" ]    <=> [ "a", "b", "c" ]   #=> -1
    [ 1, 2, 3, 4, 5, 6 ] <=> [ 1, 2 ]            #=> +1
    [ 1, 2 ]             <=> [ 1, :two ]         #=> nil


# Array#==

(from ruby core)
---
    ary == other_ary   ->   bool

---

Equality --- Two arrays are equal if they contain the same number of elements
and if each element is equal to (according to Object#==) the corresponding
element in `other_ary`.

    [ "a", "c" ]    == [ "a", "c", 7 ]     #=> false
    [ "a", "c", 7 ] == [ "a", "c", 7 ]     #=> true
    [ "a", "c", 7 ] == [ "a", "d", "f" ]   #=> false


# Array#[]

(from ruby core)
---
    ary[index]                -> obj     or nil
    ary[start, length]        -> new_ary or nil
    ary[range]                -> new_ary or nil
    ary.slice(index)          -> obj     or nil
    ary.slice(start, length)  -> new_ary or nil
    ary.slice(range)          -> new_ary or nil

---

Element Reference --- Returns the element at `index`, or returns a subarray
starting at the `start` index and continuing for `length` elements, or returns
a subarray specified by `range` of indices.

Negative indices count backward from the end of the array (-1 is the last
element).  For `start` and `range` cases the starting index is just before an
element.  Additionally, an empty array is returned when the starting index for
an element range is at the end of the array.

Returns `nil` if the index (or starting index) are out of range.

    a = [ "a", "b", "c", "d", "e" ]
    a[2] +  a[0] + a[1]    #=> "cab"
    a[6]                   #=> nil
    a[1, 2]                #=> [ "b", "c" ]
    a[1..3]                #=> [ "b", "c", "d" ]
    a[4..7]                #=> [ "e" ]
    a[6..10]               #=> nil
    a[-3, 3]               #=> [ "c", "d", "e" ]
    # special cases
    a[5]                   #=> nil
    a[6, 1]                #=> nil
    a[5, 1]                #=> []
    a[5..10]               #=> []


# Array#[]=

(from ruby core)
---
    ary[index]         = obj                      ->  obj
    ary[start, length] = obj or other_ary or nil  ->  obj or other_ary or nil
    ary[range]         = obj or other_ary or nil  ->  obj or other_ary or nil

---

Element Assignment --- Sets the element at `index`, or replaces a subarray
from the `start` index for `length` elements, or replaces a subarray specified
by the `range` of indices.

If indices are greater than the current capacity of the array, the array grows
automatically.  Elements are inserted into the array at `start` if `length` is
zero.

Negative indices will count backward from the end of the array.  For `start`
and `range` cases the starting index is just before an element.

An IndexError is raised if a negative index points past the beginning of the
array.

See also Array#push, and Array#unshift.

    a = Array.new
    a[4] = "4";                 #=> [nil, nil, nil, nil, "4"]
    a[0, 3] = [ 'a', 'b', 'c' ] #=> ["a", "b", "c", nil, "4"]
    a[1..2] = [ 1, 2 ]          #=> ["a", 1, 2, nil, "4"]
    a[0, 2] = "?"               #=> ["?", 2, nil, "4"]
    a[0..2] = "A"               #=> ["A", "4"]
    a[-1]   = "Z"               #=> ["A", "Z"]
    a[1..-1] = nil              #=> ["A", nil]
    a[1..-1] = []               #=> ["A"]
    a[0, 0] = [ 1, 2 ]          #=> [1, 2, "A"]
    a[3, 0] = "B"               #=> [1, 2, "A", "B"]


# Array#abbrev

(from ruby core)
---
    abbrev(pattern = nil)

---

Calculates the set of unambiguous abbreviations for the strings in `self`.

    require 'abbrev'
    %w{ car cone }.abbrev
    #=> {"car"=>"car", "ca"=>"car", "cone"=>"cone", "con"=>"cone", "co"=>"cone"}

The optional `pattern` parameter is a pattern or a string. Only input strings
that match the pattern or start with the string are included in the output
hash.

    %w{ fast boat day }.abbrev(/^.a/)
    #=> {"fast"=>"fast", "fas"=>"fast", "fa"=>"fast", "day"=>"day", "da"=>"day"}

    Abbrev.abbrev(%w{car box cone}, "ca")
    #=> {"car"=>"car", "ca"=>"car"}

See also Abbrev.abbrev


# Array#any?

(from ruby core)
---
    ary.any? [{ |obj| block }]   -> true or false

---

See also Enumerable#any?


# Array#assoc

(from ruby core)
---
    ary.assoc(obj)   -> element_ary  or  nil

---

Searches through an array whose elements are also arrays comparing `obj` with
the first element of each contained array using `obj.==`.

Returns the first contained array that matches (that is, the first associated
array), or `nil` if no match is found.

See also Array#rassoc

    s1 = [ "colors", "red", "blue", "green" ]
    s2 = [ "letters", "a", "b", "c" ]
    s3 = "foo"
    a  = [ s1, s2, s3 ]
    a.assoc("letters")  #=> [ "letters", "a", "b", "c" ]
    a.assoc("foo")      #=> nil


# Array#at

(from ruby core)
---
    ary.at(index)   ->   obj  or nil

---

Returns the element at `index`. A negative index counts from the end of
`self`. Returns `nil` if the index is out of range. See also Array#[].

    a = [ "a", "b", "c", "d", "e" ]
    a.at(0)     #=> "a"
    a.at(-1)    #=> "e"


# Array#bsearch

(from ruby core)
---
    ary.bsearch {|x| block }  -> elem

---

By using binary search, finds a value from this array which meets the given
condition in O(log n) where n is the size of the array.

You can use this method in two use cases: a find-minimum mode and a find-any
mode.  In either case, the elements of the array must be monotone (or sorted)
with respect to the block.

In find-minimum mode (this is a good choice for typical use case), the block
must return true or false, and there must be an index i (0 <= i <= ary.size)
so that:

*   the block returns false for any element whose index is less than i, and
*   the block returns true for any element whose index is greater than or
    equal to i.


This method returns the i-th element.  If i is equal to ary.size, it returns
nil.

    ary = [0, 4, 7, 10, 12]
    ary.bsearch {|x| x >=   4 } #=> 4
    ary.bsearch {|x| x >=   6 } #=> 7
    ary.bsearch {|x| x >=  -1 } #=> 0
    ary.bsearch {|x| x >= 100 } #=> nil

In find-any mode (this behaves like libc's bsearch(3)), the block must return
a number, and there must be two indices i and j (0 <= i <= j <= ary.size) so
that:

*   the block returns a positive number for [ary](k) if 0 <= k < i,
*   the block returns zero for [ary](k) if i <= k < j, and
*   the block returns a negative number for [ary](k) if j <= k < ary.size.


Under this condition, this method returns any element whose index is within
i...j.  If i is equal to j (i.e., there is no element that satisfies the
block), this method returns nil.

    ary = [0, 4, 7, 10, 12]
    # try to find v such that 4 <= v < 8
    ary.bsearch {|x| 1 - x / 4 } #=> 4 or 7
    # try to find v such that 8 <= v < 10
    ary.bsearch {|x| 4 - x / 2 } #=> nil

You must not mix the two modes at a time; the block must always return either
true/false, or always return a number.  It is undefined which value is
actually picked up at each iteration.


(from gem parser-2.4.0.0)
---
    bsearch() { |cur = self| ... }

---


# Array#bsearch_index

(from ruby core)
---
    ary.bsearch_index {|x| block }  -> int or nil

---

By using binary search, finds an index of a value from this array which meets
the given condition in O(log n) where n is the size of the array.

It supports two modes, depending on the nature of the block and they are
exactly the same as in the case of #bsearch method with the only difference
being that this method returns the index of the element instead of the element
itself. For more details consult the documentation for #bsearch.


# Array#clear

(from ruby core)
---
    ary.clear    -> ary

---

Removes all elements from `self`.

    a = [ "a", "b", "c", "d", "e" ]
    a.clear    #=> [ ]


# Array#collect

(from ruby core)
---
    ary.collect { |item| block }  -> new_ary
    ary.collect                   -> Enumerator

---

Invokes the given block once for each element of `self`.

Creates a new array containing the values returned by the block.

See also Enumerable#collect.

If no block is given, an Enumerator is returned instead.

    a = [ "a", "b", "c", "d" ]
    a.collect { |x| x + "!" }         #=> ["a!", "b!", "c!", "d!"]
    a.map.with_index { |x, i| x * i } #=> ["", "b", "cc", "ddd"]
    a                                 #=> ["a", "b", "c", "d"]


# Array#collect!

(from ruby core)
---
    ary.collect! {|item| block }   -> ary
    ary.collect!                   -> Enumerator

---

Invokes the given block once for each element of `self`, replacing the element
with the value returned by the block.

See also Enumerable#collect.

If no block is given, an Enumerator is returned instead.

    a = [ "a", "b", "c", "d" ]
    a.map! {|x| x + "!" }
    a #=>  [ "a!", "b!", "c!", "d!" ]
    a.collect!.with_index {|x, i| x[0...i] }
    a #=>  ["", "b", "c!", "d!"]


# Array#combination

(from ruby core)
---
    ary.combination(n) { |c| block }    -> ary
    ary.combination(n)                  -> Enumerator

---

When invoked with a block, yields all combinations of length `n` of elements
from the array and then returns the array itself.

The implementation makes no guarantees about the order in which the
combinations are yielded.

If no block is given, an Enumerator is returned instead.

Examples:

    a = [1, 2, 3, 4]
    a.combination(1).to_a  #=> [[1],[2],[3],[4]]
    a.combination(2).to_a  #=> [[1,2],[1,3],[1,4],[2,3],[2,4],[3,4]]
    a.combination(3).to_a  #=> [[1,2,3],[1,2,4],[1,3,4],[2,3,4]]
    a.combination(4).to_a  #=> [[1,2,3,4]]
    a.combination(0).to_a  #=> [[]] # one combination of length 0
    a.combination(5).to_a  #=> []   # no combinations of length 5


# Array#compact

(from ruby core)
---
    ary.compact     -> new_ary

---

Returns a copy of `self` with all `nil` elements removed.

    [ "a", nil, "b", nil, "c", nil ].compact
                      #=> [ "a", "b", "c" ]


# Array#compact!

(from ruby core)
---
    ary.compact!    -> ary  or  nil

---

Removes `nil` elements from the array.

Returns `nil` if no changes were made, otherwise returns the array.

    [ "a", nil, "b", nil, "c" ].compact! #=> [ "a", "b", "c" ]
    [ "a", "b", "c" ].compact!           #=> nil


# Array#concat

(from ruby core)
---
    ary.concat(other_ary1, other_ary2,...)   -> ary

---

Appends the elements of +other_ary+s to `self`.

    [ "a", "b" ].concat( ["c", "d"] ) #=> [ "a", "b", "c", "d" ]
    [ "a" ].concat( ["b"], ["c", "d"] ) #=> [ "a", "b", "c", "d" ]
    [ "a" ].concat #=> [ "a" ]

    a = [ 1, 2, 3 ]
    a.concat( [ 4, 5 ] )
    a                                 #=> [ 1, 2, 3, 4, 5 ]

    a = [ 1, 2 ]
    a.concat(a, a)                    #=> [1, 2, 1, 2, 1, 2]

See also Array#+.


# Array#count

(from ruby core)
---
    ary.count                   -> int
    ary.count(obj)              -> int
    ary.count { |item| block }  -> int

---

Returns the number of elements.

If an argument is given, counts the number of elements which equal `obj` using
`==`.

If a block is given, counts the number of elements for which the block returns
a true value.

    ary = [1, 2, 4, 2]
    ary.count                  #=> 4
    ary.count(2)               #=> 2
    ary.count { |x| x%2 == 0 } #=> 3


# Array#cycle

(from ruby core)
---
    ary.cycle(n=nil) { |obj| block }  -> nil
    ary.cycle(n=nil)                  -> Enumerator

---

Calls the given block for each element `n` times or forever if `nil` is given.

Does nothing if a non-positive number is given or the array is empty.

Returns `nil` if the loop has finished without getting interrupted.

If no block is given, an Enumerator is returned instead.

    a = ["a", "b", "c"]
    a.cycle { |x| puts x }     # print, a, b, c, a, b, c,.. forever.
    a.cycle(2) { |x| puts x }  # print, a, b, c, a, b, c.


# Array#dclone

(from ruby core)
---
    dclone()

---

provides a unified `clone` operation, for REXML::XPathParser to use across
multiple Object+ types


# Array#delete

(from ruby core)
---
    ary.delete(obj)            -> item or nil
    ary.delete(obj) { block }  -> item or result of block

---

Deletes all items from `self` that are equal to `obj`.

Returns the last deleted item, or `nil` if no matching item is found.

If the optional code block is given, the result of the block is returned if
the item is not found.  (To remove `nil` elements and get an informative
return value, use Array#compact!)

    a = [ "a", "b", "b", "b", "c" ]
    a.delete("b")                   #=> "b"
    a                               #=> ["a", "c"]
    a.delete("z")                   #=> nil
    a.delete("z") { "not found" }   #=> "not found"


# Array#delete_at

(from ruby core)
---
    ary.delete_at(index)  -> obj or nil

---

Deletes the element at the specified `index`, returning that element, or `nil`
if the `index` is out of range.

See also Array#slice!

    a = ["ant", "bat", "cat", "dog"]
    a.delete_at(2)    #=> "cat"
    a                 #=> ["ant", "bat", "dog"]
    a.delete_at(99)   #=> nil


# Array#delete_if

(from ruby core)
---
    ary.delete_if { |item| block }  -> ary
    ary.delete_if                   -> Enumerator

---

Deletes every element of `self` for which block evaluates to `true`.

The array is changed instantly every time the block is called, not after the
iteration is over.

See also Array#reject!

If no block is given, an Enumerator is returned instead.

    scores = [ 97, 42, 75 ]
    scores.delete_if {|score| score < 80 }   #=> [97]


# Array#dig

(from ruby core)
---
    ary.dig(idx, ...)                 -> object

---

Extracts the nested value specified by the sequence of *idx* objects by
calling `dig` at each step, returning `nil` if any intermediate step is `nil`.

    a = [[1, [2, 3]]]

    a.dig(0, 1, 1)                    #=> 3
    a.dig(1, 2, 3)                    #=> nil
    a.dig(0, 0, 0)                    #=> TypeError: Integer does not have #dig method
    [42, {foo: :bar}].dig(1, :foo)    #=> :bar


# Array#drop

(from ruby core)
---
    ary.drop(n)               -> new_ary

---

Drops first `n` elements from `ary` and returns the rest of the elements in an
array.

If a negative number is given, raises an ArgumentError.

See also Array#take

    a = [1, 2, 3, 4, 5, 0]
    a.drop(3)             #=> [4, 5, 0]


# Array#drop_while

(from ruby core)
---
    ary.drop_while { |obj| block }   -> new_ary
    ary.drop_while                  -> Enumerator

---

Drops elements up to, but not including, the first element for which the block
returns `nil` or `false` and returns an array containing the remaining
elements.

If no block is given, an Enumerator is returned instead.

See also Array#take_while

    a = [1, 2, 3, 4, 5, 0]
    a.drop_while {|i| i < 3 }   #=> [3, 4, 5, 0]


# Array#each

(from ruby core)
---
    ary.each { |item| block }  -> ary
    ary.each                   -> Enumerator

---

Calls the given block once for each element in `self`, passing that element as
a parameter.  Returns the array itself.

If no block is given, an Enumerator is returned.

    a = [ "a", "b", "c" ]
    a.each {|x| print x, " -- " }

produces:

    a -- b -- c --


# Array#each_index

(from ruby core)
---
    ary.each_index { |index| block }  -> ary
    ary.each_index                    -> Enumerator

---

Same as Array#each, but passes the `index` of the element instead of the
element itself.

An Enumerator is returned if no block is given.

    a = [ "a", "b", "c" ]
    a.each_index {|x| print x, " -- " }

produces:

    0 -- 1 -- 2 --


# Array#empty?

(from ruby core)
---
    ary.empty?   -> true or false

---

Returns `true` if `self` contains no elements.

    [].empty?   #=> true


# Array#eql?

(from ruby core)
---
    ary.eql?(other)  -> true or false

---

Returns `true` if `self` and `other` are the same object, or are both arrays
with the same content (according to Object#eql?).


# Array#fetch

(from ruby core)
---
    ary.fetch(index)                    -> obj
    ary.fetch(index, default)           -> obj
    ary.fetch(index) { |index| block }  -> obj

---

Tries to return the element at position `index`, but throws an IndexError
exception if the referenced `index` lies outside of the array bounds.  This
error can be prevented by supplying a second argument, which will act as a
`default` value.

Alternatively, if a block is given it will only be executed when an invalid
`index` is referenced.

Negative values of `index` count from the end of the array.

    a = [ 11, 22, 33, 44 ]
    a.fetch(1)               #=> 22
    a.fetch(-1)              #=> 44
    a.fetch(4, 'cat')        #=> "cat"
    a.fetch(100) { |i| puts "#{i} is out of bounds" }
                             #=> "100 is out of bounds"


# Array#fill

(from ruby core)
---
    ary.fill(obj)                                 -> ary
    ary.fill(obj, start [, length])               -> ary
    ary.fill(obj, range )                         -> ary
    ary.fill { |index| block }                    -> ary
    ary.fill(start [, length] ) { |index| block } -> ary
    ary.fill(range) { |index| block }             -> ary

---

The first three forms set the selected elements of `self` (which may be the
entire array) to `obj`.

A `start` of `nil` is equivalent to zero.

A `length` of `nil` is equivalent to the length of the array.

The last three forms fill the array with the value of the given block, which
is passed the absolute index of each element to be filled.

Negative values of `start` count from the end of the array, where `-1` is the
last element.

    a = [ "a", "b", "c", "d" ]
    a.fill("x")              #=> ["x", "x", "x", "x"]
    a.fill("z", 2, 2)        #=> ["x", "x", "z", "z"]
    a.fill("y", 0..1)        #=> ["y", "y", "z", "z"]
    a.fill { |i| i*i }       #=> [0, 1, 4, 9]
    a.fill(-2) { |i| i*i*i } #=> [0, 1, 8, 27]


# Array#find_index

(from ruby core)
---
    ary.find_index(obj)             ->  int or nil
    ary.find_index { |item| block } ->  int or nil
    ary.find_index                  ->  Enumerator

---

Returns the *index* of the first object in `ary` such that the object is `==`
to `obj`.

If a block is given instead of an argument, returns the *index* of the first
object for which the block returns `true`.  Returns `nil` if no match is
found.

See also Array#rindex.

An Enumerator is returned if neither a block nor argument is given.

    a = [ "a", "b", "c" ]
    a.index("b")              #=> 1
    a.index("z")              #=> nil
    a.index { |x| x == "b" }  #=> 1


# Array#first

(from ruby core)
---
    ary.first     ->   obj or nil
    ary.first(n)  ->   new_ary

---

Returns the first element, or the first `n` elements, of the array. If the
array is empty, the first form returns `nil`, and the second form returns an
empty array. See also Array#last for the opposite effect.

    a = [ "q", "r", "s", "t" ]
    a.first     #=> "q"
    a.first(2)  #=> ["q", "r"]


# Array#flatten

(from ruby core)
---
    ary.flatten -> new_ary
    ary.flatten(level) -> new_ary

---

Returns a new array that is a one-dimensional flattening of `self`
(recursively).

That is, for every element that is an array, extract its elements into the new
array.

The optional `level` argument determines the level of recursion to flatten.

    s = [ 1, 2, 3 ]           #=> [1, 2, 3]
    t = [ 4, 5, 6, [7, 8] ]   #=> [4, 5, 6, [7, 8]]
    a = [ s, t, 9, 10 ]       #=> [[1, 2, 3], [4, 5, 6, [7, 8]], 9, 10]
    a.flatten                 #=> [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
    a = [ 1, 2, [3, [4, 5] ] ]
    a.flatten(1)              #=> [1, 2, 3, [4, 5]]


# Array#flatten!

(from ruby core)
---
    ary.flatten!        -> ary or nil
    ary.flatten!(level) -> ary or nil

---

Flattens `self` in place.

Returns `nil` if no modifications were made (i.e., the array contains no
subarrays.)

The optional `level` argument determines the level of recursion to flatten.

    a = [ 1, 2, [3, [4, 5] ] ]
    a.flatten!   #=> [1, 2, 3, 4, 5]
    a.flatten!   #=> nil
    a            #=> [1, 2, 3, 4, 5]
    a = [ 1, 2, [3, [4, 5] ] ]
    a.flatten!(1) #=> [1, 2, 3, [4, 5]]


# Array#frozen?

(from ruby core)
---
    ary.frozen?  -> true or false

---

Return `true` if this array is frozen (or temporarily frozen while being
sorted). See also Object#frozen?


# Array#hash

(from ruby core)
---
    ary.hash   -> integer

---

Compute a hash-code for this array.

Two arrays with the same content will have the same hash code (and will
compare using #eql?).

See also Object#hash.


# Array#include?

(from ruby core)
---
    ary.include?(object)   -> true or false

---

Returns `true` if the given `object` is present in `self` (that is, if any
element `==` `object`), otherwise returns `false`.

    a = [ "a", "b", "c" ]
    a.include?("b")   #=> true
    a.include?("z")   #=> false


# Array#index

(from ruby core)
---
    ary.index(obj)             ->  int or nil
    ary.index { |item| block } ->  int or nil
    ary.index                  ->  Enumerator

---

Returns the *index* of the first object in `ary` such that the object is `==`
to `obj`.

If a block is given instead of an argument, returns the *index* of the first
object for which the block returns `true`.  Returns `nil` if no match is
found.

See also Array#rindex.

An Enumerator is returned if neither a block nor argument is given.

    a = [ "a", "b", "c" ]
    a.index("b")              #=> 1
    a.index("z")              #=> nil
    a.index { |x| x == "b" }  #=> 1


# Array#initialize_copy

(from ruby core)
---
    ary.initialize_copy(other_ary)   -> ary

---

Replaces the contents of `self` with the contents of `other_ary`, truncating
or expanding if necessary.

    a = [ "a", "b", "c", "d", "e" ]
    a.replace([ "x", "y", "z" ])   #=> ["x", "y", "z"]
    a                              #=> ["x", "y", "z"]


# Array#insert

(from ruby core)
---
    ary.insert(index, obj...)  -> ary

---

Inserts the given values before the element with the given `index`.

Negative indices count backwards from the end of the array, where `-1` is the
last element. If a negative index is used, the given values will be inserted
after that element, so using an index of `-1` will insert the values at the
end of the array.

    a = %w{ a b c d }
    a.insert(2, 99)         #=> ["a", "b", 99, "c", "d"]
    a.insert(-2, 1, 2, 3)   #=> ["a", "b", 99, "c", 1, 2, 3, "d"]


# Array#inspect

(from ruby core)
---
    ary.inspect  -> string
    ary.to_s     -> string

---

Creates a string representation of `self`.

    [ "a", "b", "c" ].to_s     #=> "[\"a\", \"b\", \"c\"]"


# Array#join

(from ruby core)
---
    ary.join(separator=$,)    -> str

---

Returns a string created by converting each element of the array to a string,
separated by the given `separator`. If the `separator` is `nil`, it uses
current $,. If both the `separator` and $, are nil, it uses empty string.

    [ "a", "b", "c" ].join        #=> "abc"
    [ "a", "b", "c" ].join("-")   #=> "a-b-c"


# Array#keep_if

(from ruby core)
---
    ary.keep_if { |item| block } -> ary
    ary.keep_if                  -> Enumerator

---

Deletes every element of `self` for which the given block evaluates to
`false`.

See also Array#select!

If no block is given, an Enumerator is returned instead.

    a = %w{ a b c d e f }
    a.keep_if { |v| v =~ /[aeiou]/ }  #=> ["a", "e"]


# Array#last

(from ruby core)
---
    ary.last     ->  obj or nil
    ary.last(n)  ->  new_ary

---

Returns the last element(s) of `self`. If the array is empty, the first form
returns `nil`.

See also Array#first for the opposite effect.

    a = [ "w", "x", "y", "z" ]
    a.last     #=> "z"
    a.last(2)  #=> ["y", "z"]


# Array#length

(from ruby core)
---
    ary.length -> int

---

Returns the number of elements in `self`. May be zero.

    [ 1, 2, 3, 4, 5 ].length   #=> 5
    [].length                  #=> 0


# Array#map

(from ruby core)
---
    ary.map     { |item| block }  -> new_ary
    ary.map                       -> Enumerator

---

Invokes the given block once for each element of `self`.

Creates a new array containing the values returned by the block.

See also Enumerable#collect.

If no block is given, an Enumerator is returned instead.

    a = [ "a", "b", "c", "d" ]
    a.collect { |x| x + "!" }         #=> ["a!", "b!", "c!", "d!"]
    a.map.with_index { |x, i| x * i } #=> ["", "b", "cc", "ddd"]
    a                                 #=> ["a", "b", "c", "d"]


# Array#map!

(from ruby core)
---
    ary.map!     {|item| block }   -> ary
    ary.map!                       -> Enumerator

---

Invokes the given block once for each element of `self`, replacing the element
with the value returned by the block.

See also Enumerable#collect.

If no block is given, an Enumerator is returned instead.

    a = [ "a", "b", "c", "d" ]
    a.map! {|x| x + "!" }
    a #=>  [ "a!", "b!", "c!", "d!" ]
    a.collect!.with_index {|x, i| x[0...i] }
    a #=>  ["", "b", "c!", "d!"]


# Array#max

(from ruby core)
---
    ary.max                     -> obj
    ary.max { |a, b| block }    -> obj
    ary.max(n)                  -> array
    ary.max(n) { |a, b| block } -> array

---

Returns the object in *ary* with the maximum value. The first form assumes all
objects implement `Comparable`; the second uses the block to return *a <=> b*.

    a = %w(albatross dog horse)
    a.max                                   #=> "horse"
    a.max { |a, b| a.length <=> b.length }  #=> "albatross"

If the `n` argument is given, maximum `n` elements are returned as an array.

    a = %w[albatross dog horse]
    a.max(2)                                  #=> ["horse", "dog"]
    a.max(2) {|a, b| a.length <=> b.length }  #=> ["albatross", "horse"]


# Array#min

(from ruby core)
---
    ary.min                     -> obj
    ary.min {| a,b | block }    -> obj
    ary.min(n)                  -> array
    ary.min(n) {| a,b | block } -> array

---

Returns the object in *ary* with the minimum value. The first form assumes all
objects implement `Comparable`; the second uses the block to return *a <=> b*.

    a = %w(albatross dog horse)
    a.min                                   #=> "albatross"
    a.min { |a, b| a.length <=> b.length }  #=> "dog"

If the `n` argument is given, minimum `n` elements are returned as an array.

    a = %w[albatross dog horse]
    a.min(2)                                  #=> ["albatross", "dog"]
    a.min(2) {|a, b| a.length <=> b.length }  #=> ["dog", "horse"]


# Array#pack

(from ruby core)
---
    arr.pack( aTemplateString ) -> aBinaryString
    arr.pack( aTemplateString, buffer: aBufferString ) -> aBufferString

---

Packs the contents of *arr* into a binary sequence according to the directives
in *aTemplateString* (see the table below) Directives ``A,'' ``a,'' and ``Z''
may be followed by a count, which gives the width of the resulting field. The
remaining directives also may take a count, indicating the number of array
elements to convert. If the count is an asterisk (```*`''), all remaining
array elements will be converted. Any of the directives ```sSiIlL`'' may be
followed by an underscore (```_`'') or exclamation mark (```!`'') to use the
underlying platform's native size for the specified type; otherwise, they use
a platform-independent size. Spaces are ignored in the template string. See
also `String#unpack`.

    a = [ "a", "b", "c" ]
    n = [ 65, 66, 67 ]
    a.pack("A3A3A3")   #=> "a  b  c  "
    a.pack("a3a3a3")   #=> "a\000\000b\000\000c\000\000"
    n.pack("ccc")      #=> "ABC"

If *aBufferString* is specified and its capacity is enough, `pack` uses it as
the buffer and returns it. When the offset is specified by the beginning of
*aTemplateString*, the result is filled after the offset. If original contents
of *aBufferString* exists and it's longer than the offset, the rest of
*offsetOfBuffer* are overwritten by the result. If it's shorter, the gap is
filled with ```\0`''.

Note that ``buffer:'' option does not guarantee not to allocate memory in
`pack`.  If the capacity of *aBufferString* is not enough, `pack` allocates
memory.

Directives for `pack`.

    Integer       | Array   |
    Directive     | Element | Meaning
    ----------------------------------------------------------------------------
    C             | Integer | 8-bit unsigned (unsigned char)
    S             | Integer | 16-bit unsigned, native endian (uint16_t)
    L             | Integer | 32-bit unsigned, native endian (uint32_t)
    Q             | Integer | 64-bit unsigned, native endian (uint64_t)
    J             | Integer | pointer width unsigned, native endian (uintptr_t)
                  |         | (J is available since Ruby 2.3.)
                  |         |
    c             | Integer | 8-bit signed (signed char)
    s             | Integer | 16-bit signed, native endian (int16_t)
    l             | Integer | 32-bit signed, native endian (int32_t)
    q             | Integer | 64-bit signed, native endian (int64_t)
    j             | Integer | pointer width signed, native endian (intptr_t)
                  |         | (j is available since Ruby 2.3.)
                  |         |
    S_ S!         | Integer | unsigned short, native endian
    I I_ I!       | Integer | unsigned int, native endian
    L_ L!         | Integer | unsigned long, native endian
    Q_ Q!         | Integer | unsigned long long, native endian (ArgumentError
                  |         | if the platform has no long long type.)
                  |         | (Q_ and Q! is available since Ruby 2.1.)
    J!            | Integer | uintptr_t, native endian (same with J)
                  |         | (J! is available since Ruby 2.3.)
                  |         |
    s_ s!         | Integer | signed short, native endian
    i i_ i!       | Integer | signed int, native endian
    l_ l!         | Integer | signed long, native endian
    q_ q!         | Integer | signed long long, native endian (ArgumentError
                  |         | if the platform has no long long type.)
                  |         | (q_ and q! is available since Ruby 2.1.)
    j!            | Integer | intptr_t, native endian (same with j)
                  |         | (j! is available since Ruby 2.3.)
                  |         |
    S> s> S!> s!> | Integer | same as the directives without ">" except
    L> l> L!> l!> |         | big endian
    I!> i!>       |         | (available since Ruby 1.9.3)
    Q> q> Q!> q!> |         | "S>" is same as "n"
    J> j> J!> j!> |         | "L>" is same as "N"
                  |         |
    S< s< S!< s!< | Integer | same as the directives without "<" except
    L< l< L!< l!< |         | little endian
    I!< i!<       |         | (available since Ruby 1.9.3)
    Q< q< Q!< q!< |         | "S<" is same as "v"
    J< j< J!< j!< |         | "L<" is same as "V"
                  |         |
    n             | Integer | 16-bit unsigned, network (big-endian) byte order
    N             | Integer | 32-bit unsigned, network (big-endian) byte order
    v             | Integer | 16-bit unsigned, VAX (little-endian) byte order
    V             | Integer | 32-bit unsigned, VAX (little-endian) byte order
                  |         |
    U             | Integer | UTF-8 character
    w             | Integer | BER-compressed integer

    Float        | Array   |
    Directive    | Element | Meaning
    ---------------------------------------------------------------------------
    D d          | Float   | double-precision, native format
    F f          | Float   | single-precision, native format
    E            | Float   | double-precision, little-endian byte order
    e            | Float   | single-precision, little-endian byte order
    G            | Float   | double-precision, network (big-endian) byte order
    g            | Float   | single-precision, network (big-endian) byte order

    String       | Array   |
    Directive    | Element | Meaning
    ---------------------------------------------------------------------------
    A            | String  | arbitrary binary string (space padded, count is width)
    a            | String  | arbitrary binary string (null padded, count is width)
    Z            | String  | same as ``a'', except that null is added with *
    B            | String  | bit string (MSB first)
    b            | String  | bit string (LSB first)
    H            | String  | hex string (high nibble first)
    h            | String  | hex string (low nibble first)
    u            | String  | UU-encoded string
    M            | String  | quoted printable, MIME encoding (see RFC2045)
    m            | String  | base64 encoded string (see RFC 2045, count is width)
                 |         | (if count is 0, no line feed are added, see RFC 4648)
    P            | String  | pointer to a structure (fixed-length string)
    p            | String  | pointer to a null-terminated string

    Misc.        | Array   |
    Directive    | Element | Meaning
    ---------------------------------------------------------------------------
    @            | ---     | moves to absolute position
    X            | ---     | back up a byte
    x            | ---     | null byte


# Array#permutation

(from ruby core)
---
    ary.permutation { |p| block }          -> ary
    ary.permutation                        -> Enumerator
    ary.permutation(n) { |p| block }       -> ary
    ary.permutation(n)                     -> Enumerator

---

When invoked with a block, yield all permutations of length `n` of the
elements of the array, then return the array itself.

If `n` is not specified, yield all permutations of all elements.

The implementation makes no guarantees about the order in which the
permutations are yielded.

If no block is given, an Enumerator is returned instead.

Examples:

    a = [1, 2, 3]
    a.permutation.to_a    #=> [[1,2,3],[1,3,2],[2,1,3],[2,3,1],[3,1,2],[3,2,1]]
    a.permutation(1).to_a #=> [[1],[2],[3]]
    a.permutation(2).to_a #=> [[1,2],[1,3],[2,1],[2,3],[3,1],[3,2]]
    a.permutation(3).to_a #=> [[1,2,3],[1,3,2],[2,1,3],[2,3,1],[3,1,2],[3,2,1]]
    a.permutation(0).to_a #=> [[]] # one permutation of length 0
    a.permutation(4).to_a #=> []   # no permutations of length 4


# Array#pop

(from ruby core)
---
    ary.pop    -> obj or nil
    ary.pop(n) -> new_ary

---

Removes the last element from `self` and returns it, or `nil` if the array is
empty.

If a number `n` is given, returns an array of the last `n` elements (or less)
just like `array.slice!(-n, n)` does. See also Array#push for the opposite
effect.

    a = [ "a", "b", "c", "d" ]
    a.pop     #=> "d"
    a.pop(2)  #=> ["b", "c"]
    a         #=> ["a"]


# Array#product

(from ruby core)
---
    ary.product(other_ary, ...)                -> new_ary
    ary.product(other_ary, ...) { |p| block }  -> ary

---

Returns an array of all combinations of elements from all arrays.

The length of the returned array is the product of the length of `self` and
the argument arrays.

If given a block, #product will yield all combinations and return `self`
instead.

    [1,2,3].product([4,5])     #=> [[1,4],[1,5],[2,4],[2,5],[3,4],[3,5]]
    [1,2].product([1,2])       #=> [[1,1],[1,2],[2,1],[2,2]]
    [1,2].product([3,4],[5,6]) #=> [[1,3,5],[1,3,6],[1,4,5],[1,4,6],
                               #     [2,3,5],[2,3,6],[2,4,5],[2,4,6]]
    [1,2].product()            #=> [[1],[2]]
    [1,2].product([])          #=> []


# Array#push

(from ruby core)
---
    ary.push(obj, ... )   -> ary

---

Append --- Pushes the given object(s) on to the end of this array. This
expression returns the array itself, so several appends may be chained
together. See also Array#pop for the opposite effect.

    a = [ "a", "b", "c" ]
    a.push("d", "e", "f")
            #=> ["a", "b", "c", "d", "e", "f"]
    [1, 2, 3].push(4).push(5)
            #=> [1, 2, 3, 4, 5]


# Array#rassoc

(from ruby core)
---
    ary.rassoc(obj) -> element_ary or nil

---

Searches through the array whose elements are also arrays.

Compares `obj` with the second element of each contained array using `obj.==`.

Returns the first contained array that matches `obj`.

See also Array#assoc.

    a = [ [ 1, "one"], [2, "two"], [3, "three"], ["ii", "two"] ]
    a.rassoc("two")    #=> [2, "two"]
    a.rassoc("four")   #=> nil


# Array#reject

(from ruby core)
---
    ary.reject  {|item| block }  -> new_ary
    ary.reject                   -> Enumerator

---

Returns a new array containing the items in `self` for which the given block
is not `true`. The ordering of non-rejected elements is maintained.

See also Array#delete_if

If no block is given, an Enumerator is returned instead.


# Array#reject!

(from ruby core)
---
    ary.reject! { |item| block }  -> ary or nil
    ary.reject!                   -> Enumerator

---

Deletes every element of `self` for which the block evaluates to `true`, if no
changes were made returns `nil`.

The array may not be changed instantly every time the block is called.

See also Enumerable#reject and Array#delete_if.

If no block is given, an Enumerator is returned instead.


# Array#repeated_combination

(from ruby core)
---
    ary.repeated_combination(n) { |c| block } -> ary
    ary.repeated_combination(n)               -> Enumerator

---

When invoked with a block, yields all repeated combinations of length `n` of
elements from the array and then returns the array itself.

The implementation makes no guarantees about the order in which the repeated
combinations are yielded.

If no block is given, an Enumerator is returned instead.

Examples:

    a = [1, 2, 3]
    a.repeated_combination(1).to_a  #=> [[1], [2], [3]]
    a.repeated_combination(2).to_a  #=> [[1,1],[1,2],[1,3],[2,2],[2,3],[3,3]]
    a.repeated_combination(3).to_a  #=> [[1,1,1],[1,1,2],[1,1,3],[1,2,2],[1,2,3],
                                    #    [1,3,3],[2,2,2],[2,2,3],[2,3,3],[3,3,3]]
    a.repeated_combination(4).to_a  #=> [[1,1,1,1],[1,1,1,2],[1,1,1,3],[1,1,2,2],[1,1,2,3],
                                    #    [1,1,3,3],[1,2,2,2],[1,2,2,3],[1,2,3,3],[1,3,3,3],
                                    #    [2,2,2,2],[2,2,2,3],[2,2,3,3],[2,3,3,3],[3,3,3,3]]
    a.repeated_combination(0).to_a  #=> [[]] # one combination of length 0


# Array#repeated_permutation

(from ruby core)
---
    ary.repeated_permutation(n) { |p| block } -> ary
    ary.repeated_permutation(n)               -> Enumerator

---

When invoked with a block, yield all repeated permutations of length `n` of
the elements of the array, then return the array itself.

The implementation makes no guarantees about the order in which the repeated
permutations are yielded.

If no block is given, an Enumerator is returned instead.

Examples:

    a = [1, 2]
    a.repeated_permutation(1).to_a  #=> [[1], [2]]
    a.repeated_permutation(2).to_a  #=> [[1,1],[1,2],[2,1],[2,2]]
    a.repeated_permutation(3).to_a  #=> [[1,1,1],[1,1,2],[1,2,1],[1,2,2],
                                    #    [2,1,1],[2,1,2],[2,2,1],[2,2,2]]
    a.repeated_permutation(0).to_a  #=> [[]] # one permutation of length 0


# Array#replace

(from ruby core)
---
    ary.replace(other_ary)  -> ary

---

Replaces the contents of `self` with the contents of `other_ary`, truncating
or expanding if necessary.

    a = [ "a", "b", "c", "d", "e" ]
    a.replace([ "x", "y", "z" ])   #=> ["x", "y", "z"]
    a                              #=> ["x", "y", "z"]


# Array#reverse

(from ruby core)
---
    ary.reverse    -> new_ary

---

Returns a new array containing `self`'s elements in reverse order.

    [ "a", "b", "c" ].reverse   #=> ["c", "b", "a"]
    [ 1 ].reverse               #=> [1]


# Array#reverse!

(from ruby core)
---
    ary.reverse!   -> ary

---

Reverses `self` in place.

    a = [ "a", "b", "c" ]
    a.reverse!       #=> ["c", "b", "a"]
    a                #=> ["c", "b", "a"]


# Array#reverse_each

(from ruby core)
---
    ary.reverse_each { |item| block }  -> ary
    ary.reverse_each                   -> Enumerator

---

Same as Array#each, but traverses `self` in reverse order.

    a = [ "a", "b", "c" ]
    a.reverse_each {|x| print x, " " }

produces:

    c b a


# Array#rindex

(from ruby core)
---
    ary.rindex(obj)             ->  int or nil
    ary.rindex { |item| block } ->  int or nil
    ary.rindex                  ->  Enumerator

---

Returns the *index* of the last object in `self` `==` to `obj`.

If a block is given instead of an argument, returns the *index* of the first
object for which the block returns `true`, starting from the last object.

Returns `nil` if no match is found.

See also Array#index.

If neither block nor argument is given, an Enumerator is returned instead.

    a = [ "a", "b", "b", "b", "c" ]
    a.rindex("b")             #=> 3
    a.rindex("z")             #=> nil
    a.rindex { |x| x == "b" } #=> 3


# Array#rotate

(from ruby core)
---
    ary.rotate(count=1)    -> new_ary

---

Returns a new array by rotating `self` so that the element at `count` is the
first element of the new array.

If `count` is negative then it rotates in the opposite direction, starting
from the end of `self` where `-1` is the last element.

    a = [ "a", "b", "c", "d" ]
    a.rotate         #=> ["b", "c", "d", "a"]
    a                #=> ["a", "b", "c", "d"]
    a.rotate(2)      #=> ["c", "d", "a", "b"]
    a.rotate(-3)     #=> ["b", "c", "d", "a"]


# Array#rotate!

(from ruby core)
---
    ary.rotate!(count=1)   -> ary

---

Rotates `self` in place so that the element at `count` comes first, and
returns `self`.

If `count` is negative then it rotates in the opposite direction, starting
from the end of the array where `-1` is the last element.

    a = [ "a", "b", "c", "d" ]
    a.rotate!        #=> ["b", "c", "d", "a"]
    a                #=> ["b", "c", "d", "a"]
    a.rotate!(2)     #=> ["d", "a", "b", "c"]
    a.rotate!(-3)    #=> ["a", "b", "c", "d"]


# Array#sample

(from ruby core)
---
    ary.sample                  -> obj
    ary.sample(random: rng)     -> obj
    ary.sample(n)               -> new_ary
    ary.sample(n, random: rng)  -> new_ary

---

Choose a random element or `n` random elements from the array.

The elements are chosen by using random and unique indices into the array in
order to ensure that an element doesn't repeat itself unless the array already
contained duplicate elements.

If the array is empty the first form returns `nil` and the second form returns
an empty array.

The optional `rng` argument will be used as the random number generator.

    a = [ 1, 2, 3, 4, 5, 6, 7, 8, 9, 10 ]
    a.sample         #=> 7
    a.sample(4)      #=> [6, 4, 2, 5]


# Array#select

(from ruby core)
---
    ary.select { |item| block } -> new_ary
    ary.select                  -> Enumerator

---

Returns a new array containing all elements of `ary` for which the given
`block` returns a true value.

If no block is given, an Enumerator is returned instead.

    [1,2,3,4,5].select { |num|  num.even?  }   #=> [2, 4]

    a = %w{ a b c d e f }
    a.select { |v| v =~ /[aeiou]/ }  #=> ["a", "e"]

See also Enumerable#select.


# Array#select!

(from ruby core)
---
    ary.select!  {|item| block } -> ary or nil
    ary.select!                  -> Enumerator

---

Invokes the given block passing in successive elements from `self`, deleting
elements for which the block returns a `false` value.

The array may not be changed instantly every time the block is called.

If changes were made, it will return `self`, otherwise it returns `nil`.

See also Array#keep_if

If no block is given, an Enumerator is returned instead.


# Array#shelljoin

(from ruby core)
---
    array.shelljoin => string

---

Builds a command line string from an argument list `array` joining all
elements escaped for the Bourne shell and separated by a space.

See Shellwords.shelljoin for details.


# Array#shift

(from ruby core)
---
    ary.shift    -> obj or nil
    ary.shift(n) -> new_ary

---

Removes the first element of `self` and returns it (shifting all other
elements down by one). Returns `nil` if the array is empty.

If a number `n` is given, returns an array of the first `n` elements (or less)
just like `array.slice!(0, n)` does. With `ary` containing only the remainder
elements, not including what was shifted to `new_ary`. See also Array#unshift
for the opposite effect.

    args = [ "-m", "-q", "filename" ]
    args.shift     #=> "-m"
    args           #=> ["-q", "filename"]

    args = [ "-m", "-q", "filename" ]
    args.shift(2)  #=> ["-m", "-q"]
    args           #=> ["filename"]


# Array#shuffle

(from ruby core)
---
    ary.shuffle              -> new_ary
    ary.shuffle(random: rng) -> new_ary

---

Returns a new array with elements of `self` shuffled.

    a = [ 1, 2, 3 ]           #=> [1, 2, 3]
    a.shuffle                 #=> [2, 3, 1]
    a                         #=> [1, 2, 3]

The optional `rng` argument will be used as the random number generator.

    a.shuffle(random: Random.new(1))  #=> [1, 3, 2]


# Array#shuffle!

(from ruby core)
---
    ary.shuffle!              -> ary
    ary.shuffle!(random: rng) -> ary

---

Shuffles elements in `self` in place.

    a = [ 1, 2, 3 ]           #=> [1, 2, 3]
    a.shuffle!                #=> [2, 3, 1]
    a                         #=> [2, 3, 1]

The optional `rng` argument will be used as the random number generator.

    a.shuffle!(random: Random.new(1))  #=> [1, 3, 2]


# Array#size

(from ruby core)
---
    size()

---


# Array#slice

(from ruby core)
---
    ary.slice(index)          -> obj     or nil
    ary.slice(start, length)  -> new_ary or nil
    ary.slice(range)          -> new_ary or nil

---

Element Reference --- Returns the element at `index`, or returns a subarray
starting at the `start` index and continuing for `length` elements, or returns
a subarray specified by `range` of indices.

Negative indices count backward from the end of the array (-1 is the last
element).  For `start` and `range` cases the starting index is just before an
element.  Additionally, an empty array is returned when the starting index for
an element range is at the end of the array.

Returns `nil` if the index (or starting index) are out of range.

    a = [ "a", "b", "c", "d", "e" ]
    a[2] +  a[0] + a[1]    #=> "cab"
    a[6]                   #=> nil
    a[1, 2]                #=> [ "b", "c" ]
    a[1..3]                #=> [ "b", "c", "d" ]
    a[4..7]                #=> [ "e" ]
    a[6..10]               #=> nil
    a[-3, 3]               #=> [ "c", "d", "e" ]
    # special cases
    a[5]                   #=> nil
    a[6, 1]                #=> nil
    a[5, 1]                #=> []
    a[5..10]               #=> []


# Array#slice!

(from ruby core)
---
    ary.slice!(index)         -> obj or nil
    ary.slice!(start, length) -> new_ary or nil
    ary.slice!(range)         -> new_ary or nil

---

Deletes the element(s) given by an `index` (optionally up to `length`
elements) or by a `range`.

Returns the deleted object (or objects), or `nil` if the `index` is out of
range.

    a = [ "a", "b", "c" ]
    a.slice!(1)     #=> "b"
    a               #=> ["a", "c"]
    a.slice!(-1)    #=> "c"
    a               #=> ["a"]
    a.slice!(100)   #=> nil
    a               #=> ["a"]


# Array#sort

(from ruby core)
---
    ary.sort                   -> new_ary
    ary.sort { |a, b| block }  -> new_ary

---

Returns a new array created by sorting `self`.

Comparisons for the sort will be done using the `<=>` operator or using an
optional code block.

The block must implement a comparison between `a` and `b` and return an
integer less than 0 when `b` follows `a`, `0` when `a` and `b` are equivalent,
or an integer greater than 0 when `a` follows `b`.

The result is not guaranteed as stable.  When comparison of two elements
returns `0`, the order of the elements is unpredictable.

See also Enumerable#sort_by.

    a = [ "d", "a", "e", "c", "b" ]
    a.sort                    #=> ["a", "b", "c", "d", "e"]
    a.sort { |x,y| y <=> x }  #=> ["e", "d", "c", "b", "a"]


# Array#sort!

(from ruby core)
---
    ary.sort!                   -> ary
    ary.sort! { |a, b| block }  -> ary

---

Sorts `self` in place.

Comparisons for the sort will be done using the `<=>` operator or using an
optional code block.

The block must implement a comparison between `a` and `b` and return an
integer less than 0 when `b` follows `a`, `0` when `a` and `b` are equivalent,
or an integer greater than 0 when `a` follows `b`.

The result is not guaranteed as stable.  When comparison of two elements
returns `0`, the order of the elements is unpredictable.

See also Enumerable#sort_by.

    a = [ "d", "a", "e", "c", "b" ]
    a.sort!                    #=> ["a", "b", "c", "d", "e"]
    a.sort! { |x,y| y <=> x }  #=> ["e", "d", "c", "b", "a"]


# Array#sort_by!

(from ruby core)
---
    ary.sort_by! { |obj| block }    -> ary
    ary.sort_by!                    -> Enumerator

---

Sorts `self` in place using a set of keys generated by mapping the values in
`self` through the given block.

The result is not guaranteed as stable.  When two keys are equal, the order of
the corresponding elements is unpredictable.

If no block is given, an Enumerator is returned instead.


# Array#sum

(from ruby core)
---
    ary.sum(init=0)                    -> number
    ary.sum(init=0) {|e| expr }        -> number

---

Returns the sum of elements. For example, [e1, e2, e3].sum returns init + e1 +
e2 + e3.

If a block is given, the block is applied to each element before addition.

If *ary* is empty, it returns *init*.

    [].sum                             #=> 0
    [].sum(0.0)                        #=> 0.0
    [1, 2, 3].sum                      #=> 6
    [3, 5.5].sum                       #=> 8.5
    [2.5, 3.0].sum(0.0) {|e| e * e }   #=> 15.25
    [Object.new].sum                   #=> TypeError

The (arithmetic) mean value of an array can be obtained as follows.

    mean = ary.sum(0.0) / ary.length

This method can be used for non-numeric objects by explicit *init* argument.

    ["a", "b", "c"].sum("")            #=> "abc"
    [[1], [[2]], [3]].sum([])          #=> [1, [2], 3]

However, Array#join and Array#flatten is faster than Array#sum for array of
strings and array of arrays.

    ["a", "b", "c"].join               #=> "abc"
    [[1], [[2]], [3]].flatten(1)       #=> [1, [2], 3]

Array#sum method may not respect method redefinition of "+" methods such as
Integer#+.


# Array#take

(from ruby core)
---
    ary.take(n)               -> new_ary

---

Returns first `n` elements from the array.

If a negative number is given, raises an ArgumentError.

See also Array#drop

    a = [1, 2, 3, 4, 5, 0]
    a.take(3)             #=> [1, 2, 3]


# Array#take_while

(from ruby core)
---
    ary.take_while { |obj| block }  -> new_ary
    ary.take_while                  -> Enumerator

---

Passes elements to the block until the block returns `nil` or `false`, then
stops iterating and returns an array of all prior elements.

If no block is given, an Enumerator is returned instead.

See also Array#drop_while

    a = [1, 2, 3, 4, 5, 0]
    a.take_while { |i| i < 3 }  #=> [1, 2]


# Array#to_a

(from ruby core)
---
    ary.to_a     -> ary

---

Returns `self`.

If called on a subclass of Array, converts the receiver to an Array object.


# Array#to_ary

(from ruby core)
---
    ary.to_ary -> ary

---

Returns `self`.


# Array#to_h

(from ruby core)
---
    ary.to_h     -> hash

---

Returns the result of interpreting *ary* as an array of `[key, value]` pairs.

    [[:foo, :bar], [1, 2]].to_h
      # => {:foo => :bar, 1 => 2}


# Array#to_s

(from ruby core)
---
    to_s()

---


(from gem activesupport-5.1.2)
---
    to_s(format = :default)

---


# Array#transpose

(from ruby core)
---
    ary.transpose -> new_ary

---

Assumes that `self` is an array of arrays and transposes the rows and columns.

    a = [[1,2], [3,4], [5,6]]
    a.transpose   #=> [[1, 3, 5], [2, 4, 6]]

If the length of the subarrays don't match, an IndexError is raised.


# Array#uniq

(from ruby core)
---
    ary.uniq                -> new_ary
    ary.uniq { |item| ... } -> new_ary

---

Returns a new array by removing duplicate values in `self`.

If a block is given, it will use the return value of the block for comparison.

It compares values using their #hash and #eql? methods for efficiency.

`self` is traversed in order, and the first occurrence is kept.

    a = [ "a", "a", "b", "b", "c" ]
    a.uniq   # => ["a", "b", "c"]

    b = [["student","sam"], ["student","george"], ["teacher","matz"]]
    b.uniq { |s| s.first } # => [["student", "sam"], ["teacher", "matz"]]


# Array#uniq!

(from ruby core)
---
    ary.uniq!                -> ary or nil
    ary.uniq! { |item| ... } -> ary or nil

---

Removes duplicate elements from `self`.

If a block is given, it will use the return value of the block for comparison.

It compares values using their #hash and #eql? methods for efficiency.

`self` is traversed in order, and the first occurrence is kept.

Returns `nil` if no changes are made (that is, no duplicates are found).

    a = [ "a", "a", "b", "b", "c" ]
    a.uniq!   # => ["a", "b", "c"]

    b = [ "a", "b", "c" ]
    b.uniq!   # => nil

    c = [["student","sam"], ["student","george"], ["teacher","matz"]]
    c.uniq! { |s| s.first } # => [["student", "sam"], ["teacher", "matz"]]


# Array#unshift

(from ruby core)
---
    ary.unshift(obj, ...)  -> ary

---

Prepends objects to the front of `self`, moving other elements upwards. See
also Array#shift for the opposite effect.

    a = [ "b", "c", "d" ]
    a.unshift("a")   #=> ["a", "b", "c", "d"]
    a.unshift(1, 2)  #=> [ 1, 2, "a", "b", "c", "d"]


# Array#values_at

(from ruby core)
---
    ary.values_at(selector, ...)  -> new_ary

---

Returns an array containing the elements in `self` corresponding to the given
`selector`(s).

The selectors may be either integer indices or ranges.

See also Array#select.

    a = %w{ a b c d e f }
    a.values_at(1, 3, 5)          # => ["b", "d", "f"]
    a.values_at(1, 3, 5, 7)       # => ["b", "d", "f", nil]
    a.values_at(-1, -2, -2, -7)   # => ["f", "e", "e", nil]
    a.values_at(4..6, 3...6)      # => ["e", "f", nil, "d", "e", "f"]


# Array#zip

(from ruby core)
---
    ary.zip(arg, ...)                  -> new_ary
    ary.zip(arg, ...) { |arr| block }  -> nil

---

Converts any arguments to arrays, then merges elements of `self` with
corresponding elements from each argument.

This generates a sequence of `ary.size` *n*-element arrays, where *n* is one
more than the count of arguments.

If the size of any argument is less than the size of the initial array, `nil`
values are supplied.

If a block is given, it is invoked for each output `array`, otherwise an array
of arrays is returned.

    a = [ 4, 5, 6 ]
    b = [ 7, 8, 9 ]
    [1, 2, 3].zip(a, b)   #=> [[1, 4, 7], [2, 5, 8], [3, 6, 9]]
    [1, 2].zip(a, b)      #=> [[1, 4, 7], [2, 5, 8]]
    a.zip([1, 2], [8])    #=> [[4, 1, 8], [5, 2, nil], [6, nil, nil]]


# Array#|

(from ruby core)
---
    ary | other_ary     -> new_ary

---

Set Union --- Returns a new array by joining `ary` with `other_ary`, excluding
any duplicates and preserving the order from the given arrays.

It compares elements using their #hash and #eql? methods for efficiency.

    [ "a", "b", "c" ] | [ "c", "d", "a" ]    #=> [ "a", "b", "c", "d" ]
    [ "c", "d", "a" ] | [ "a", "b", "c" ]    #=> [ "c", "d", "a", "b" ]

See also Array#uniq.


(from gem activesupport-5.1.2)
---











---
# Class methods:

    wrap

# Instance methods:

    deep_dup
    extract_options!
    fifth
    forty_two
    fourth
    from
    in_groups
    in_groups_of
    inquiry
    second
    second_to_last
    split
    third
    third_to_last
    to
    to_default_s
    to_formatted_s
    to_param
    to_query
    to_s
    to_sentence
    to_xml
    without

# Array::wrap

(from gem activesupport-5.1.2)
---
    wrap(object)

---

Wraps its argument in an array unless it is already an array (or array-like).

Specifically:

*   If the argument is `nil` an empty array is returned.
*   Otherwise, if the argument responds to `to_ary` it is invoked, and its
    result returned.
*   Otherwise, returns an array with the argument as its single element.

        Array.wrap(nil)       # => []
        Array.wrap([1, 2, 3]) # => [1, 2, 3]
        Array.wrap(0)         # => [0]


This method is similar in purpose to `Kernel#Array`, but there are some
differences:

*   If the argument responds to `to_ary` the method is invoked. `Kernel#Array`
    moves on to try `to_a` if the returned value is `nil`, but `Array.wrap`
    returns an array with the argument as its single element right away.
*   If the returned value from `to_ary` is neither `nil` nor an `Array`
    object, `Kernel#Array` raises an exception, while `Array.wrap` does not,
    it just returns the value.
*   It does not call `to_a` on the argument, if the argument does not respond
    to `to_ary` it returns an array with the argument as its single element.


The last point is easily explained with some enumerables:

    Array(foo: :bar)      # => [[:foo, :bar]]
    Array.wrap(foo: :bar) # => [{:foo=>:bar}]

There's also a related idiom that uses the splat operator:

    [*object]

which returns `[]` for `nil`, but calls to `Array(object)` otherwise.

The differences with `Kernel#Array` explained above apply to the rest of
`object`s.


# Array#deep_dup

(from gem activesupport-5.1.2)
---
    deep_dup()

---

Returns a deep copy of array.

    array = [1, [2, 3]]
    dup   = array.deep_dup
    dup[1][2] = 4

    array[1][2] # => nil
    dup[1][2]   # => 4


# Array#extract_options!

(from gem activesupport-5.1.2)
---
    extract_options!()

---

Extracts options from a set of arguments. Removes and returns the last element
in the array if it's a hash, otherwise returns a blank hash.

    def options(*args)
      args.extract_options!
    end

    options(1, 2)        # => {}
    options(1, 2, a: :b) # => {:a=>:b}


# Array#fifth

(from gem activesupport-5.1.2)
---
    fifth()

---

Equal to `self[4]`.

    %w( a b c d e ).fifth # => "e"


# Array#forty_two

(from gem activesupport-5.1.2)
---
    forty_two()

---

Equal to `self[41]`. Also known as accessing "the reddit".

    (1..42).to_a.forty_two # => 42


# Array#fourth

(from gem activesupport-5.1.2)
---
    fourth()

---

Equal to `self[3]`.

    %w( a b c d e ).fourth # => "d"


# Array#from

(from gem activesupport-5.1.2)
---
    from(position)

---

Returns the tail of the array from `position`.

    %w( a b c d ).from(0)  # => ["a", "b", "c", "d"]
    %w( a b c d ).from(2)  # => ["c", "d"]
    %w( a b c d ).from(10) # => []
    %w().from(0)           # => []
    %w( a b c d ).from(-2) # => ["c", "d"]
    %w( a b c ).from(-10)  # => []


# Array#in_groups

(from gem activesupport-5.1.2)
---
    in_groups(number, fill_with = nil) { |g| ... }

---

Splits or iterates over the array in `number` of groups, padding any remaining
slots with `fill_with` unless it is `false`.

    %w(1 2 3 4 5 6 7 8 9 10).in_groups(3) {|group| p group}
    ["1", "2", "3", "4"]
    ["5", "6", "7", nil]
    ["8", "9", "10", nil]

    %w(1 2 3 4 5 6 7 8 9 10).in_groups(3, '&nbsp;') {|group| p group}
    ["1", "2", "3", "4"]
    ["5", "6", "7", "&nbsp;"]
    ["8", "9", "10", "&nbsp;"]

    %w(1 2 3 4 5 6 7).in_groups(3, false) {|group| p group}
    ["1", "2", "3"]
    ["4", "5"]
    ["6", "7"]


# Array#in_groups_of

(from gem activesupport-5.1.2)
---
    in_groups_of(number, fill_with = nil) { |slice| ... }

---

Splits or iterates over the array in groups of size `number`, padding any
remaining slots with `fill_with` unless it is `false`.

    %w(1 2 3 4 5 6 7 8 9 10).in_groups_of(3) {|group| p group}
    ["1", "2", "3"]
    ["4", "5", "6"]
    ["7", "8", "9"]
    ["10", nil, nil]

    %w(1 2 3 4 5).in_groups_of(2, '&nbsp;') {|group| p group}
    ["1", "2"]
    ["3", "4"]
    ["5", "&nbsp;"]

    %w(1 2 3 4 5).in_groups_of(2, false) {|group| p group}
    ["1", "2"]
    ["3", "4"]
    ["5"]


# Array#inquiry

(from gem activesupport-5.1.2)
---
    inquiry()

---

Wraps the array in an `ArrayInquirer` object, which gives a friendlier way to
check its string-like contents.

    pets = [:cat, :dog].inquiry

    pets.cat?     # => true
    pets.ferret?  # => false

    pets.any?(:cat, :ferret)  # => true
    pets.any?(:ferret, :alligator)  # => false


# Array#second

(from gem activesupport-5.1.2)
---
    second()

---

Equal to `self[1]`.

    %w( a b c d e ).second # => "b"


# Array#second_to_last

(from gem activesupport-5.1.2)
---
    second_to_last()

---

Equal to `self[-2]`.

    %w( a b c d e ).second_to_last # => "d"


# Array#split

(from gem activesupport-5.1.2)
---
    split(value = nil)

---

Divides the array into one or more subarrays based on a delimiting `value` or
the result of an optional block.

    [1, 2, 3, 4, 5].split(3)              # => [[1, 2], [4, 5]]
    (1..10).to_a.split { |i| i % 3 == 0 } # => [[1, 2], [4, 5], [7, 8], [10]]


# Array#third

(from gem activesupport-5.1.2)
---
    third()

---

Equal to `self[2]`.

    %w( a b c d e ).third # => "c"


# Array#third_to_last

(from gem activesupport-5.1.2)
---
    third_to_last()

---

Equal to `self[-3]`.

    %w( a b c d e ).third_to_last # => "c"


# Array#to

(from gem activesupport-5.1.2)
---
    to(position)

---

Returns the beginning of the array up to `position`.

    %w( a b c d ).to(0)  # => ["a"]
    %w( a b c d ).to(2)  # => ["a", "b", "c"]
    %w( a b c d ).to(10) # => ["a", "b", "c", "d"]
    %w().to(0)           # => []
    %w( a b c d ).to(-2) # => ["a", "b", "c"]
    %w( a b c ).to(-10)  # => []


# Array#to_default_s

(from gem activesupport-5.1.2)
---
    to_default_s(format = :default)

---


# Array#to_formatted_s

(from gem activesupport-5.1.2)
---
    to_formatted_s(format = :default)

---

Extends `Array#to_s` to convert a collection of elements into a comma
separated id list if `:db` argument is given as the format.

    Blog.all.to_formatted_s(:db)  # => "1,2,3"
    Blog.none.to_formatted_s(:db) # => "null"
    [1,2].to_formatted_s          # => "[1, 2]"


# Array#to_param

(from gem activesupport-5.1.2)
---
    to_param()

---

Calls `to_param` on all its elements and joins the result with slashes. This
is used by `url_for` in Action Pack.


# Array#to_query

(from gem activesupport-5.1.2)
---
    to_query(key)

---

Converts an array into a string suitable for use as a URL query string, using
the given `key` as the param name.

    ['Rails', 'coding'].to_query('hobbies') # => "hobbies%5B%5D=Rails&hobbies%5B%5D=coding"


# Array#to_s

(from ruby core)
---
    to_s()

---


(from gem activesupport-5.1.2)
---
    to_s(format = :default)

---


# Array#to_sentence

(from gem activesupport-5.1.2)
---
    to_sentence(options = {})

---

Converts the array to a comma-separated sentence where the last element is
joined by the connector word.

You can pass the following options to change the default behavior. If you pass
an option key that doesn't exist in the list below, it will raise an
`ArgumentError`.

#### Options

*   `:words_connector` - The sign or word used to join the elements in arrays
    with two or more elements (default: ", ").
*   `:two_words_connector` - The sign or word used to join the elements in
    arrays with two elements (default: " and ").
*   `:last_word_connector` - The sign or word used to join the last element in
    arrays with three or more elements (default: ", and ").
*   `:locale` - If `i18n` is available, you can set a locale and use the
    connector options defined on the 'support.array' namespace in the
    corresponding dictionary file.


#### Examples

    [].to_sentence                      # => ""
    ['one'].to_sentence                 # => "one"
    ['one', 'two'].to_sentence          # => "one and two"
    ['one', 'two', 'three'].to_sentence # => "one, two, and three"

    ['one', 'two'].to_sentence(passing: 'invalid option')
    # => ArgumentError: Unknown key: :passing. Valid keys are: :words_connector, :two_words_connector, :last_word_connector, :locale

    ['one', 'two'].to_sentence(two_words_connector: '-')
    # => "one-two"

    ['one', 'two', 'three'].to_sentence(words_connector: ' or ', last_word_connector: ' or at least ')
    # => "one or two or at least three"

Using `:locale` option:

    # Given this locale dictionary:
    #
    #   es:
    #     support:
    #       array:
    #         words_connector: " o "
    #         two_words_connector: " y "
    #         last_word_connector: " o al menos "

    ['uno', 'dos'].to_sentence(locale: :es)
    # => "uno y dos"

    ['uno', 'dos', 'tres'].to_sentence(locale: :es)
    # => "uno o dos o al menos tres"


# Array#to_xml

(from gem activesupport-5.1.2)
---
    to_xml(options = {}) { |builder| ... }

---

Returns a string that represents the array in XML by invoking `to_xml` on each
element. Active Record collections delegate their representation in XML to
this method.

All elements are expected to respond to `to_xml`, if any of them does not then
an exception is raised.

The root node reflects the class name of the first element in plural if all
elements belong to the same type and that's not Hash:

    customer.projects.to_xml

    <?xml version="1.0" encoding="UTF-8"?>
    <projects type="array">
      <project>
        <amount type="decimal">20000.0</amount>
        <customer-id type="integer">1567</customer-id>
        <deal-date type="date">2008-04-09</deal-date>
        ...
      </project>
      <project>
        <amount type="decimal">57230.0</amount>
        <customer-id type="integer">1567</customer-id>
        <deal-date type="date">2008-04-15</deal-date>
        ...
      </project>
    </projects>

Otherwise the root element is "objects":

    [{ foo: 1, bar: 2}, { baz: 3}].to_xml

    <?xml version="1.0" encoding="UTF-8"?>
    <objects type="array">
      <object>
        <bar type="integer">2</bar>
        <foo type="integer">1</foo>
      </object>
      <object>
        <baz type="integer">3</baz>
      </object>
    </objects>

If the collection is empty the root element is "nil-classes" by default:

    [].to_xml

    <?xml version="1.0" encoding="UTF-8"?>
    <nil-classes type="array"/>

To ensure a meaningful root element use the `:root` option:

    customer_with_no_projects.projects.to_xml(root: 'projects')

    <?xml version="1.0" encoding="UTF-8"?>
    <projects type="array"/>

By default name of the node for the children of root is `root.singularize`.
You can change it with the `:children` option.

The `options` hash is passed downwards:

    Message.all.to_xml(skip_types: true)

    <?xml version="1.0" encoding="UTF-8"?>
    <messages>
      <message>
        <created-at>2008-03-07T09:58:18+01:00</created-at>
        <id>1</id>
        <name>1</name>
        <updated-at>2008-03-07T09:58:18+01:00</updated-at>
        <user-id>1</user-id>
      </message>
    </messages>


# Array#without

(from gem activesupport-5.1.2)
---
    without(*elements)

---

Returns a copy of the Array without the specified elements.

    people = ["David", "Rafael", "Aaron", "Todd"]
    people.without "Aaron", "Todd"
    # => ["David", "Rafael"]

Note: This is an optimization of `Enumerable#without` that uses `Array#-`
instead of `Array#reject` for performance reasons.


(from gem parser-2.4.0.0)
---
# Instance methods:

    bsearch

# Array#bsearch

(from ruby core)
---
    ary.bsearch {|x| block }  -> elem

---

By using binary search, finds a value from this array which meets the given
condition in O(log n) where n is the size of the array.

You can use this method in two use cases: a find-minimum mode and a find-any
mode.  In either case, the elements of the array must be monotone (or sorted)
with respect to the block.

In find-minimum mode (this is a good choice for typical use case), the block
must return true or false, and there must be an index i (0 <= i <= ary.size)
so that:

*   the block returns false for any element whose index is less than i, and
*   the block returns true for any element whose index is greater than or
    equal to i.


This method returns the i-th element.  If i is equal to ary.size, it returns
nil.

    ary = [0, 4, 7, 10, 12]
    ary.bsearch {|x| x >=   4 } #=> 4
    ary.bsearch {|x| x >=   6 } #=> 7
    ary.bsearch {|x| x >=  -1 } #=> 0
    ary.bsearch {|x| x >= 100 } #=> nil

In find-any mode (this behaves like libc's bsearch(3)), the block must return
a number, and there must be two indices i and j (0 <= i <= j <= ary.size) so
that:

*   the block returns a positive number for [ary](k) if 0 <= k < i,
*   the block returns zero for [ary](k) if i <= k < j, and
*   the block returns a negative number for [ary](k) if j <= k < ary.size.


Under this condition, this method returns any element whose index is within
i...j.  If i is equal to j (i.e., there is no element that satisfies the
block), this method returns nil.

    ary = [0, 4, 7, 10, 12]
    # try to find v such that 4 <= v < 8
    ary.bsearch {|x| 1 - x / 4 } #=> 4 or 7
    # try to find v such that 8 <= v < 10
    ary.bsearch {|x| 4 - x / 2 } #=> nil

You must not mix the two modes at a time; the block must always return either
true/false, or always return a number.  It is undefined which value is
actually picked up at each iteration.


(from gem parser-2.4.0.0)
---
    bsearch() { |cur = self| ... }

---


(from gem yard-0.9.9)
---
# Instance methods:

    place

# Array#place

(from gem yard-0.9.9)
---
    place(*values)

---

Places values before or after another object (by value) in an array. This is
used in tandem with the before and after methods of the {Insertion} class.

@example Places an item before another
    [1, 2, 3].place(4).before(3) # => [1, 2, 4, 3]

@example Places an item after another
    [:a, :b, :c].place(:x).after(:a) # => [:a, :x, :b, :c]

@param [Array] values value to insert @return [Insertion] an insertion object
to @see Insertion#before @see Insertion#after


