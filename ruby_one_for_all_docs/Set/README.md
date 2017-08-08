# Set < Object

---
# Includes:
Enumerable (from ruby core)

(from ruby core)
---
Set implements a collection of unordered values with no duplicates. This is a
hybrid of Array's intuitive inter-operation facilities and Hash's fast lookup.

Set is easy to use with Enumerable objects (implementing `each`). Most of the
initializer methods and binary operators accept generic Enumerable objects
besides sets and arrays.  An Enumerable object can be converted to Set using
the `to_set` method.

Set uses Hash as storage, so you must note the following points:

*   Equality of elements is determined according to Object#eql? and
    Object#hash.  Use Set#compare_by_identity to make a set compare its
    elements by their identity.
*   Set assumes that the identity of each element does not change while it is
    stored.  Modifying an element of a set will render the set to an
    unreliable state.
*   When a string is to be stored, a frozen copy of the string is stored
    instead unless the original string is already frozen.


## Comparison

The comparison operators <, >, <= and >= are implemented as shorthand for the
{proper_,}{subset?,superset?} methods.  However, the <=> operator is
intentionally left out because not every pair of sets is comparable. ({x,y}
vs. {x,z} for example)

## Example

    require 'set'
    s1 = Set.new [1, 2]                   # -> #<Set: {1, 2}>
    s2 = [1, 2].to_set                    # -> #<Set: {1, 2}>
    s1 == s2                              # -> true
    s1.add("foo")                         # -> #<Set: {1, 2, "foo"}>
    s1.merge([2, 6])                      # -> #<Set: {1, 2, "foo", 6}>
    s1.subset? s2                         # -> false
    s2.subset? s1                         # -> true

## Contact

    - Akinori MUSHA <knu@iDaemons.org> (current maintainer)
---
# Class methods:

    []
    new

# Instance methods:

    &
    +
    -
    <
    <<
    <=
    ==
    >
    >=
    ^
    add
    add?
    classify
    clear
    collect!
    compare_by_identity
    compare_by_identity?
    delete
    delete?
    delete_if
    difference
    disjoint?
    divide
    each
    empty?
    flatten
    flatten!
    include?
    initialize_clone
    initialize_dup
    inspect
    intersect?
    intersection
    keep_if
    length
    map!
    member?
    merge
    proper_subset?
    proper_superset?
    reject!
    replace
    select!
    size
    subset?
    subtract
    superset?
    to_a
    to_set
    union
    |

# Set::[]

(from ruby core)
---
    [](*ary)

---

Creates a new set containing the given objects.


# Set::new

(from ruby core)
---
    new(enum = nil) { |o| ... }

---

Creates a new set containing the elements of the given enumerable object.

If a block is given, the elements of enum are preprocessed by the given block.


# Set#&

(from ruby core)
---
    &(enum)

---

Returns a new set containing elements common to the set and the given
enumerable object.


# Set#+

(from ruby core)
---
    +(enum)

---


# Set#-

(from ruby core)
---
    -(enum)

---

Returns a new set built by duplicating the set, removing every element that
appears in the given enumerable object.


# Set#<

(from ruby core)
---
    <(set)

---


# Set#<<

(from ruby core)
---
    <<(o)

---


# Set#<=

(from ruby core)
---
    <=(set)

---


# Set#==

(from ruby core)
---
    ==(other)

---

Returns true if two sets are equal.  The equality of each couple of elements
is defined according to Object#eql?.


# Set#>

(from ruby core)
---
    >(set)

---


# Set#>=

(from ruby core)
---
    >=(set)

---


# Set#^

(from ruby core)
---
    ^(enum)

---

Returns a new set containing elements exclusive between the set and the given
enumerable object.  (set ^ enum) is equivalent to ((set | enum) - (set &
enum)).


# Set#add

(from ruby core)
---
    add(o)

---

Adds the given object to the set and returns self.  Use `merge` to add many
elements at once.


# Set#add?

(from ruby core)
---
    add?(o)

---

Adds the given object to the set and returns self.  If the object is already
in the set, returns nil.


# Set#classify

(from ruby core)
---
    classify() { |o| ... }

---

Classifies the set by the return value of the given block and returns a hash
of {value => set of elements} pairs.  The block is called once for each
element of the set, passing the element as parameter.

e.g.:

    require 'set'
    files = Set.new(Dir.glob("*.rb"))
    hash = files.classify { |f| File.mtime(f).year }
    p hash    # => {2000=>#<Set: {"a.rb", "b.rb"}>,
              #     2001=>#<Set: {"c.rb", "d.rb", "e.rb"}>,
              #     2002=>#<Set: {"f.rb"}>}

Returns an enumerator if no block is given.


# Set#clear

(from ruby core)
---
    clear()

---

Removes all elements and returns self.


# Set#collect!

(from ruby core)
---
    collect!() { |o| ... }

---

Replaces the elements with ones returned by collect(). Returns an enumerator
if no block is given.


# Set#compare_by_identity

(from ruby core)
---
    compare_by_identity()

---

Makes the set compare its elements by their identity and returns self.  This
method may not be supported by all subclasses of Set.


# Set#compare_by_identity?

(from ruby core)
---
    compare_by_identity?()

---

Returns true if the set will compare its elements by their identity.  Also see
Set#compare_by_identity.


# Set#delete

(from ruby core)
---
    delete(o)

---

Deletes the given object from the set and returns self.  Use `subtract` to
delete many items at once.


# Set#delete?

(from ruby core)
---
    delete?(o)

---

Deletes the given object from the set and returns self.  If the object is not
in the set, returns nil.


# Set#delete_if

(from ruby core)
---
    delete_if() { |o| ... }

---

Deletes every element of the set for which block evaluates to true, and
returns self. Returns an enumerator if no block is given.


# Set#difference

(from ruby core)
---
    difference(enum)

---


# Set#disjoint?

(from ruby core)
---
    disjoint?(set)

---

Returns true if the set and the given set have no element in common.  This
method is the opposite of `intersect?`.

e.g.:

    require 'set'
    Set[1, 2, 3].disjoint? Set[3, 4] # => false
    Set[1, 2, 3].disjoint? Set[4, 5] # => true


# Set#divide

(from ruby core)
---
    divide(&func)

---

Divides the set into a set of subsets according to the commonality defined by
the given block.

If the arity of the block is 2, elements o1 and o2 are in common if
block.call(o1, o2) is true.  Otherwise, elements o1 and o2 are in common if
block.call(o1) == block.call(o2).

e.g.:

    require 'set'
    numbers = Set[1, 3, 4, 6, 9, 10, 11]
    set = numbers.divide { |i,j| (i - j).abs == 1 }
    p set     # => #<Set: {#<Set: {1}>,
              #            #<Set: {11, 9, 10}>,
              #            #<Set: {3, 4}>,
              #            #<Set: {6}>}>

Returns an enumerator if no block is given.


# Set#each

(from ruby core)
---
    each(&block)

---

Calls the given block once for each element in the set, passing the element as
parameter.  Returns an enumerator if no block is given.


# Set#empty?

(from ruby core)
---
    empty?()

---

Returns true if the set contains no elements.


# Set#flatten

(from ruby core)
---
    flatten()

---

Returns a new set that is a copy of the set, flattening each containing set
recursively.


# Set#flatten!

(from ruby core)
---
    flatten!()

---

Equivalent to Set#flatten, but replaces the receiver with the result in place.
 Returns nil if no modifications were made.


# Set#include?

(from ruby core)
---
    include?(o)

---

Returns true if the set contains the given object.

Note that `include?` and `member?` do not test member equality using `==` as
do other Enumerables.

See also Enumerable#include?


# Set#initialize_clone

(from ruby core)
---
    initialize_clone(orig)

---

Clone internal hash.


# Set#initialize_dup

(from ruby core)
---
    initialize_dup(orig)

---

Dup internal hash.


# Set#inspect

(from ruby core)
---
    inspect()

---

Returns a string containing a human-readable representation of the set.
("#<Set: {element1, element2, ...}>")


# Set#intersect?

(from ruby core)
---
    intersect?(set)

---

Returns true if the set and the given set have at least one element in common.

e.g.:

    require 'set'
    Set[1, 2, 3].intersect? Set[4, 5] # => false
    Set[1, 2, 3].intersect? Set[3, 4] # => true


# Set#intersection

(from ruby core)
---
    intersection(enum)

---


# Set#keep_if

(from ruby core)
---
    keep_if() { |o| ... }

---

Deletes every element of the set for which block evaluates to false, and
returns self. Returns an enumerator if no block is given.


# Set#length

(from ruby core)
---
    length()

---


# Set#map!

(from ruby core)
---
    map!()

---


# Set#member?

(from ruby core)
---
    member?(o)

---


# Set#merge

(from ruby core)
---
    merge(enum)

---

Merges the elements of the given enumerable object to the set and returns
self.


# Set#proper_subset?

(from ruby core)
---
    proper_subset?(set)

---

Returns true if the set is a proper subset of the given set.


# Set#proper_superset?

(from ruby core)
---
    proper_superset?(set)

---

Returns true if the set is a proper superset of the given set.


# Set#reject!

(from ruby core)
---
    reject!(&block)

---

Equivalent to Set#delete_if, but returns nil if no changes were made. Returns
an enumerator if no block is given.


# Set#replace

(from ruby core)
---
    replace(enum)

---

Replaces the contents of the set with the contents of the given enumerable
object and returns self.


# Set#select!

(from ruby core)
---
    select!(&block)

---

Equivalent to Set#keep_if, but returns nil if no changes were made. Returns an
enumerator if no block is given.


# Set#size

(from ruby core)
---
    size()

---

Returns the number of elements.


# Set#subset?

(from ruby core)
---
    subset?(set)

---

Returns true if the set is a subset of the given set.


# Set#subtract

(from ruby core)
---
    subtract(enum)

---

Deletes every element that appears in the given enumerable object and returns
self.


# Set#superset?

(from ruby core)
---
    superset?(set)

---

Returns true if the set is a superset of the given set.


# Set#to_a

(from ruby core)
---
    to_a()

---

Converts the set to an array.  The order of elements is uncertain.


# Set#to_set

(from ruby core)
---
    to_set(klass = Set, *args, &block)

---

Returns self if no arguments are given.  Otherwise, converts the set to
another with klass.new(self, *args, &block).

In subclasses, returns klass.new(self, *args, &block) unless overridden.


# Set#union

(from ruby core)
---
    union(enum)

---


# Set#|

(from ruby core)
---
    |(enum)

---

Returns a new set built by merging the set and the elements of the given
enumerable object.


