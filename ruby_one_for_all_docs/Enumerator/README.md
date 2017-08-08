# Enumerator < Object

---
# Includes:
Enumerable (from ruby core)

(from ruby core)
---
A class which allows both internal and external iteration.

An Enumerator can be created by the following methods.
*   Kernel#to_enum
*   Kernel#enum_for
*   Enumerator.new


Most methods have two forms: a block form where the contents are evaluated for
each item in the enumeration, and a non-block form which returns a new
Enumerator wrapping the iteration.

    enumerator = %w(one two three).each
    puts enumerator.class # => Enumerator

    enumerator.each_with_object("foo") do |item, obj|
      puts "#{obj}: #{item}"
    end

    # foo: one
    # foo: two
    # foo: three

    enum_with_obj = enumerator.each_with_object("foo")
    puts enum_with_obj.class # => Enumerator

    enum_with_obj.each do |item, obj|
      puts "#{obj}: #{item}"
    end

    # foo: one
    # foo: two
    # foo: three

This allows you to chain Enumerators together.  For example, you can map a
list's elements to strings containing the index and the element as a string
via:

    puts %w[foo bar baz].map.with_index { |w, i| "#{i}:#{w}" }
    # => ["0:foo", "1:bar", "2:baz"]

An Enumerator can also be used as an external iterator. For example,
Enumerator#next returns the next value of the iterator or raises StopIteration
if the Enumerator is at the end.

    e = [1,2,3].each   # returns an enumerator object.
    puts e.next   # => 1
    puts e.next   # => 2
    puts e.next   # => 3
    puts e.next   # raises StopIteration

You can use this to implement an internal iterator as follows:

    def ext_each(e)
      while true
        begin
          vs = e.next_values
        rescue StopIteration
          return $!.result
        end
        y = yield(*vs)
        e.feed y
      end
    end

    o = Object.new

    def o.each
      puts yield
      puts yield(1)
      puts yield(1, 2)
      3
    end

    # use o.each as an internal iterator directly.
    puts o.each {|*x| puts x; [:b, *x] }
    # => [], [:b], [1], [:b, 1], [1, 2], [:b, 1, 2], 3

    # convert o.each to an external iterator for
    # implementing an internal iterator.
    puts ext_each(o.to_enum) {|*x| puts x; [:b, *x] }
    # => [], [:b], [1], [:b, 1], [1, 2], [:b, 1, 2], 3
---
# Class methods:

    new

# Instance methods:

    each
    each_with_index
    each_with_object
    feed
    inspect
    next
    next_values
    peek
    peek_values
    rewind
    size
    with_index
    with_object

# Enumerator::new

(from ruby core)
---
    Enumerator.new(size = nil) { |yielder| ... }
    Enumerator.new(obj, method = :each, *args)

---

Creates a new Enumerator object, which can be used as an Enumerable.

In the first form, iteration is defined by the given block, in which a
"yielder" object, given as block parameter, can be used to yield a value by
calling the `yield` method (aliased as +<<+):

    fib = Enumerator.new do |y|
      a = b = 1
      loop do
        y << a
        a, b = b, a + b
      end
    end

    p fib.take(10) # => [1, 1, 2, 3, 5, 8, 13, 21, 34, 55]

The optional parameter can be used to specify how to calculate the size in a
lazy fashion (see Enumerator#size). It can either be a value or a callable
object.

In the second, deprecated, form, a generated Enumerator iterates over the
given object using the given method with the given arguments passed.

Use of this form is discouraged.  Use Kernel#enum_for or Kernel#to_enum
instead.

    e = Enumerator.new(ObjectSpace, :each_object)
        #-> ObjectSpace.enum_for(:each_object)

    e.select { |obj| obj.is_a?(Class) }  #=> array of all classes


# Enumerator#each

(from ruby core)
---
    enum.each { |elm| block }                    -> obj
    enum.each                                    -> enum
    enum.each(*appending_args) { |elm| block }   -> obj
    enum.each(*appending_args)                   -> an_enumerator

---

Iterates over the block according to how this Enumerator was constructed. If
no block and no arguments are given, returns self.

### Examples

    "Hello, world!".scan(/\w+/)                     #=> ["Hello", "world"]
    "Hello, world!".to_enum(:scan, /\w+/).to_a      #=> ["Hello", "world"]
    "Hello, world!".to_enum(:scan).each(/\w+/).to_a #=> ["Hello", "world"]

    obj = Object.new

    def obj.each_arg(a, b=:b, *rest)
      yield a
      yield b
      yield rest
      :method_returned
    end

    enum = obj.to_enum :each_arg, :a, :x

    enum.each.to_a                  #=> [:a, :x, []]
    enum.each.equal?(enum)          #=> true
    enum.each { |elm| elm }         #=> :method_returned

    enum.each(:y, :z).to_a          #=> [:a, :x, [:y, :z]]
    enum.each(:y, :z).equal?(enum)  #=> false
    enum.each(:y, :z) { |elm| elm } #=> :method_returned


# Enumerator#each_with_index

(from ruby core)
---
    e.each_with_index {|(*args), idx| ... }
    e.each_with_index

---

Same as Enumerator#with_index(0), i.e. there is no starting offset.

If no block is given, a new Enumerator is returned that includes the index.


# Enumerator#each_with_object

(from ruby core)
---
    e.each_with_object(obj) {|(*args), obj| ... }
    e.each_with_object(obj)

---

Iterates the given block for each element with an arbitrary object, `obj`, and
returns `obj`

If no block is given, returns a new Enumerator.

### Example

    to_three = Enumerator.new do |y|
      3.times do |x|
        y << x
      end
    end

    to_three_with_string = to_three.with_object("foo")
    to_three_with_string.each do |x,string|
      puts "#{string}: #{x}"
    end

    # => foo:0
    # => foo:1
    # => foo:2


# Enumerator#feed

(from ruby core)
---
    e.feed obj   -> nil

---

Sets the value to be returned by the next yield inside `e`.

If the value is not set, the yield returns nil.

This value is cleared after being yielded.

    # Array#map passes the array's elements to "yield" and collects the
    # results of "yield" as an array.
    # Following example shows that "next" returns the passed elements and
    # values passed to "feed" are collected as an array which can be
    # obtained by StopIteration#result.
    e = [1,2,3].map
    p e.next           #=> 1
    e.feed "a"
    p e.next           #=> 2
    e.feed "b"
    p e.next           #=> 3
    e.feed "c"
    begin
      e.next
    rescue StopIteration
      p $!.result      #=> ["a", "b", "c"]
    end

    o = Object.new
    def o.each
      x = yield         # (2) blocks
      p x               # (5) => "foo"
      x = yield         # (6) blocks
      p x               # (8) => nil
      x = yield         # (9) blocks
      p x               # not reached w/o another e.next
    end

    e = o.to_enum
    e.next              # (1)
    e.feed "foo"        # (3)
    e.next              # (4)
    e.next              # (7)
                        # (10)


# Enumerator#inspect

(from ruby core)
---
    e.inspect  -> string

---

Creates a printable version of *e*.


# Enumerator#next

(from ruby core)
---
    e.next   -> object

---

Returns the next object in the enumerator, and move the internal position
forward.  When the position reached at the end, StopIteration is raised.

### Example

    a = [1,2,3]
    e = a.to_enum
    p e.next   #=> 1
    p e.next   #=> 2
    p e.next   #=> 3
    p e.next   #raises StopIteration

Note that enumeration sequence by `next` does not affect other non-external
enumeration methods, unless the underlying iteration methods itself has
side-effect, e.g. IO#each_line.


# Enumerator#next_values

(from ruby core)
---
    e.next_values   -> array

---

Returns the next object as an array in the enumerator, and move the internal
position forward.  When the position reached at the end, StopIteration is
raised.

This method can be used to distinguish `yield` and `yield nil`.

### Example

    o = Object.new
    def o.each
      yield
      yield 1
      yield 1, 2
      yield nil
      yield [1, 2]
    end
    e = o.to_enum
    p e.next_values
    p e.next_values
    p e.next_values
    p e.next_values
    p e.next_values
    e = o.to_enum
    p e.next
    p e.next
    p e.next
    p e.next
    p e.next

    ## yield args       next_values      next
    #  yield            []               nil
    #  yield 1          [1]              1
    #  yield 1, 2       [1, 2]           [1, 2]
    #  yield nil        [nil]            nil
    #  yield [1, 2]     [[1, 2]]         [1, 2]

Note that `next_values` does not affect other non-external enumeration methods
unless underlying iteration method itself has side-effect, e.g. IO#each_line.


# Enumerator#peek

(from ruby core)
---
    e.peek   -> object

---

Returns the next object in the enumerator, but doesn't move the internal
position forward.  If the position is already at the end, StopIteration is
raised.

### Example

    a = [1,2,3]
    e = a.to_enum
    p e.next   #=> 1
    p e.peek   #=> 2
    p e.peek   #=> 2
    p e.peek   #=> 2
    p e.next   #=> 2
    p e.next   #=> 3
    p e.peek   #raises StopIteration


# Enumerator#peek_values

(from ruby core)
---
    e.peek_values   -> array

---

Returns the next object as an array, similar to Enumerator#next_values, but
doesn't move the internal position forward.  If the position is already at the
end, StopIteration is raised.

### Example

    o = Object.new
    def o.each
      yield
      yield 1
      yield 1, 2
    end
    e = o.to_enum
    p e.peek_values    #=> []
    e.next
    p e.peek_values    #=> [1]
    p e.peek_values    #=> [1]
    e.next
    p e.peek_values    #=> [1, 2]
    e.next
    p e.peek_values    # raises StopIteration


# Enumerator#rewind

(from ruby core)
---
    e.rewind   -> e

---

Rewinds the enumeration sequence to the beginning.

If the enclosed object responds to a "rewind" method, it is called.


# Enumerator#size

(from ruby core)
---
    e.size          -> int, Float::INFINITY or nil

---

Returns the size of the enumerator, or `nil` if it can't be calculated lazily.

    (1..100).to_a.permutation(4).size # => 94109400
    loop.size # => Float::INFINITY
    (1..100).drop_while.size # => nil


# Enumerator#with_index

(from ruby core)
---
    e.with_index(offset = 0) {|(*args), idx| ... }
    e.with_index(offset = 0)

---

Iterates the given block for each element with an index, which starts from
`offset`.  If no block is given, returns a new Enumerator that includes the
index, starting from `offset`

`offset`
:   the starting index to use



# Enumerator#with_object

(from ruby core)
---
    e.with_object(obj) {|(*args), obj| ... }
    e.with_object(obj)

---

Iterates the given block for each element with an arbitrary object, `obj`, and
returns `obj`

If no block is given, returns a new Enumerator.

### Example

    to_three = Enumerator.new do |y|
      3.times do |x|
        y << x
      end
    end

    to_three_with_string = to_three.with_object("foo")
    to_three_with_string.each do |x,string|
      puts "#{string}: #{x}"
    end

    # => foo:0
    # => foo:1
    # => foo:2


