# Range < Object

---
# Includes:
Enumerable (from ruby core)

(from ruby core)
---

A `Range` represents an interval---a set of values with a beginning and an
end. Ranges may be constructed using the *s*`..`*e* and *s*`...`*e* literals,
or with Range::new. Ranges constructed using `..` run from the beginning to
the end inclusively. Those created using `...` exclude the end value. When
used as an iterator, ranges return each value in the sequence.

    (-1..-5).to_a      #=> []
    (-5..-1).to_a      #=> [-5, -4, -3, -2, -1]
    ('a'..'e').to_a    #=> ["a", "b", "c", "d", "e"]
    ('a'...'e').to_a   #=> ["a", "b", "c", "d"]

## Custom Objects in Ranges

Ranges can be constructed using any objects that can be compared using the
`<=>` operator. Methods that treat the range as a sequence (#each and methods
inherited from Enumerable) expect the begin object to implement a `succ`
method to return the next object in sequence. The #step and #include? methods
require the begin object to implement `succ` or to be numeric.

In the `Xs` class below both `<=>` and `succ` are implemented so `Xs` can be
used to construct ranges. Note that the Comparable module is included so the
`==` method is defined in terms of `<=>`.

    class Xs                # represent a string of 'x's
      include Comparable
      attr :length
      def initialize(n)
        @length = n
      end
      def succ
        Xs.new(@length + 1)
      end
      def <=>(other)
        @length <=> other.length
      end
      def to_s
        sprintf "%2d #{inspect}", @length
      end
      def inspect
        'x' * @length
      end
    end

An example of using `Xs` to construct a range:

    r = Xs.new(3)..Xs.new(6)   #=> xxx..xxxxxx
    r.to_a                     #=> [xxx, xxxx, xxxxx, xxxxxx]
    r.member?(Xs.new(5))       #=> true
---
# Class methods:

    json_create
    new

# Instance methods:

    ==
    ===
    as_json
    begin
    bsearch
    cover?
    each
    end
    eql?
    exclude_end?
    first
    hash
    include?
    inspect
    last
    max
    member?
    min
    size
    step
    to_json
    to_s

# Range::json_create

(from ruby core)
---
    json_create(object)

---

Deserializes JSON string by constructing new Range object with arguments `a`
serialized by `to_json`.


# Range::new

(from ruby core)
---
    Range.new(begin, end, exclude_end=false)    -> rng

---

Constructs a range using the given `begin` and `end`. If the `exclude_end`
parameter is omitted or is `false`, the `rng` will include the end object;
otherwise, it will be excluded.


# Range#==

(from ruby core)
---
    rng == obj    -> true or false

---

Returns `true` only if `obj` is a Range, has equivalent begin and end items
(by comparing them with `==`), and has the same #exclude_end? setting as the
range.

    (0..2) == (0..2)            #=> true
    (0..2) == Range.new(0,2)    #=> true
    (0..2) == (0...2)           #=> false


# Range#===

(from ruby core)
---
    rng === obj       ->  true or false

---

Returns `true` if `obj` is an element of the range, `false` otherwise. 
Conveniently, `===` is the comparison operator used by `case` statements.

    case 79
    when 1..50   then   print "low\n"
    when 51..75  then   print "medium\n"
    when 76..100 then   print "high\n"
    end

*produces:*

    high


# Range#as_json

(from ruby core)
---
    as_json(*)

---

Returns a hash, that will be turned into a JSON object and represent this
object.


# Range#begin

(from ruby core)
---
    rng.begin    -> obj

---

Returns the object that defines the beginning of the range.

    (1..10).begin   #=> 1


# Range#bsearch

(from ruby core)
---
    rng.bsearch {|obj| block }  -> value

---

By using binary search, finds a value in range which meets the given condition
in O(log n) where n is the size of the range.

You can use this method in two use cases: a find-minimum mode and a find-any
mode.  In either case, the elements of the range must be monotone (or sorted)
with respect to the block.

In find-minimum mode (this is a good choice for typical use case), the block
must return true or false, and there must be a value x so that:

*   the block returns false for any value which is less than x, and
*   the block returns true for any value which is greater than or equal to x.


If x is within the range, this method returns the value x. Otherwise, it
returns nil.

    ary = [0, 4, 7, 10, 12]
    (0...ary.size).bsearch {|i| ary[i] >= 4 } #=> 1
    (0...ary.size).bsearch {|i| ary[i] >= 6 } #=> 2
    (0...ary.size).bsearch {|i| ary[i] >= 8 } #=> 3
    (0...ary.size).bsearch {|i| ary[i] >= 100 } #=> nil

    (0.0...Float::INFINITY).bsearch {|x| Math.log(x) >= 0 } #=> 1.0

In find-any mode (this behaves like libc's bsearch(3)), the block must return
a number, and there must be two values x and y (x <= y) so that:

*   the block returns a positive number for v if v < x,
*   the block returns zero for v if x <= v < y, and
*   the block returns a negative number for v if y <= v.


This method returns any value which is within the intersection of the given
range and x...y (if any).  If there is no value that satisfies the condition,
it returns nil.

    ary = [0, 100, 100, 100, 200]
    (0..4).bsearch {|i| 100 - ary[i] } #=> 1, 2 or 3
    (0..4).bsearch {|i| 300 - ary[i] } #=> nil
    (0..4).bsearch {|i|  50 - ary[i] } #=> nil

You must not mix the two modes at a time; the block must always return either
true/false, or always return a number.  It is undefined which value is
actually picked up at each iteration.


# Range#cover?

(from ruby core)
---
    rng.cover?(obj)  ->  true or false

---

Returns `true` if `obj` is between the begin and end of the range.

This tests `begin <= obj <= end` when #exclude_end? is `false` and `begin <=
obj < end` when #exclude_end? is `true`.

    ("a".."z").cover?("c")    #=> true
    ("a".."z").cover?("5")    #=> false
    ("a".."z").cover?("cc")   #=> true


# Range#each

(from ruby core)
---
    rng.each {| i | block } -> rng
    rng.each                -> an_enumerator

---

Iterates over the elements of range, passing each in turn to the block.

The `each` method can only be used if the begin object of the range supports
the `succ` method.  A TypeError is raised if the object does not have `succ`
method defined (like Float).

If no block is given, an enumerator is returned instead.

    (10..15).each {|n| print n, ' ' }
    # prints: 10 11 12 13 14 15

    (2.5..5).each {|n| print n, ' ' }
    # raises: TypeError: can't iterate from Float


# Range#end

(from ruby core)
---
    rng.end    -> obj

---

Returns the object that defines the end of the range.

    (1..10).end    #=> 10
    (1...10).end   #=> 10


# Range#eql?

(from ruby core)
---
    rng.eql?(obj)    -> true or false

---

Returns `true` only if `obj` is a Range, has equivalent begin and end items
(by comparing them with `eql?`), and has the same #exclude_end? setting as the
range.

    (0..2).eql?(0..2)            #=> true
    (0..2).eql?(Range.new(0,2))  #=> true
    (0..2).eql?(0...2)           #=> false


# Range#exclude_end?

(from ruby core)
---
    rng.exclude_end?    -> true or false

---

Returns `true` if the range excludes its end value.

    (1..5).exclude_end?     #=> false
    (1...5).exclude_end?    #=> true


# Range#first

(from ruby core)
---
    rng.first    -> obj
    rng.first(n) -> an_array

---

Returns the first object in the range, or an array of the first `n` elements.

    (10..20).first     #=> 10
    (10..20).first(3)  #=> [10, 11, 12]


# Range#hash

(from ruby core)
---
    rng.hash    -> integer

---

Compute a hash-code for this range. Two ranges with equal begin and end points
(using `eql?`), and the same #exclude_end? value will generate the same
hash-code.

See also Object#hash.


# Range#include?

(from ruby core)
---
    rng.include?(obj) ->  true or false

---

Returns `true` if `obj` is an element of the range, `false` otherwise.  If
begin and end are numeric, comparison is done according to the magnitude of
the values.

    ("a".."z").include?("g")   #=> true
    ("a".."z").include?("A")   #=> false
    ("a".."z").include?("cc")  #=> false


# Range#inspect

(from ruby core)
---
    rng.inspect  -> string

---

Convert this range object to a printable form (using `inspect` to convert the
begin and end objects).


# Range#last

(from ruby core)
---
    rng.last    -> obj
    rng.last(n) -> an_array

---

Returns the last object in the range, or an array of the last `n` elements.

Note that with no arguments `last` will return the object that defines the end
of the range even if #exclude_end? is `true`.

    (10..20).last      #=> 20
    (10...20).last     #=> 20
    (10..20).last(3)   #=> [18, 19, 20]
    (10...20).last(3)  #=> [17, 18, 19]


# Range#max

(from ruby core)
---
    rng.max                       -> obj
    rng.max {| a,b | block }      -> obj
    rng.max(n)                    -> obj
    rng.max(n) {| a,b | block }   -> obj

---

Returns the maximum value in the range. Returns `nil` if the begin value of
the range larger than the end value. Returns `nil` if the begin value of an
exclusive range is equal to the end value.

Can be given an optional block to override the default comparison method `a
<=> b`.

    (10..20).max    #=> 20


# Range#member?

(from ruby core)
---
    rng.member?(obj)  ->  true or false

---

Returns `true` if `obj` is an element of the range, `false` otherwise.  If
begin and end are numeric, comparison is done according to the magnitude of
the values.

    ("a".."z").include?("g")   #=> true
    ("a".."z").include?("A")   #=> false
    ("a".."z").include?("cc")  #=> false


# Range#min

(from ruby core)
---
    rng.min                       -> obj
    rng.min {| a,b | block }      -> obj
    rng.min(n)                    -> array
    rng.min(n) {| a,b | block }   -> array

---

Returns the minimum value in the range. Returns `nil` if the begin value of
the range is larger than the end value. Returns `nil` if the begin value of an
exclusive range is equal to the end value.

Can be given an optional block to override the default comparison method `a
<=> b`.

    (10..20).min    #=> 10


# Range#size

(from ruby core)
---
    rng.size                   -> num

---

Returns the number of elements in the range. Both the begin and the end of the
Range must be Numeric, otherwise nil is returned.

    (10..20).size    #=> 11
    ('a'..'z').size  #=> nil
    (-Float::INFINITY..Float::INFINITY).size #=> Infinity


# Range#step

(from ruby core)
---
    rng.step(n=1) {| obj | block }    -> rng
    rng.step(n=1)                     -> an_enumerator

---

Iterates over the range, passing each `n`th element to the block. If begin and
end are numeric, `n` is added for each iteration. Otherwise `step` invokes
`succ` to iterate through range elements.

If no block is given, an enumerator is returned instead.

    range = Xs.new(1)..Xs.new(10)
    range.step(2) {|x| puts x}
    puts
    range.step(3) {|x| puts x}

*produces:*

     1 x
     3 xxx
     5 xxxxx
     7 xxxxxxx
     9 xxxxxxxxx

     1 x
     4 xxxx
     7 xxxxxxx
    10 xxxxxxxxxx

See Range for the definition of class Xs.


# Range#to_json

(from ruby core)
---
    to_json(*args)

---

Stores class name (Range) with JSON array of arguments `a` which include
`first` (integer), `last` (integer), and `exclude_end?` (boolean) as JSON
string.


# Range#to_s

(from ruby core)
---
    rng.to_s   -> string

---

Convert this range object to a printable form (using #to_s to convert the
begin and end objects).


(from gem activesupport-5.1.2)
---

---
# Instance methods:

    overlaps?

# Range#overlaps?

(from gem activesupport-5.1.2)
---
    overlaps?(other)

---

Compare two ranges and see if they overlap each other
    (1..5).overlaps?(4..6) # => true
    (1..5).overlaps?(7..9) # => false


