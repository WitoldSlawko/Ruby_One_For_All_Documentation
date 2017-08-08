# Hash < Object

---
# Includes:
Enumerable (from ruby core)

(from ruby core)
---
A Hash is a dictionary-like collection of unique keys and their values. Also
called associative arrays, they are similar to Arrays, but where an Array uses
integers as its index, a Hash allows you to use any object type.

Hashes enumerate their values in the order that the corresponding keys were
inserted.

A Hash can be easily created by using its implicit form:

    grades = { "Jane Doe" => 10, "Jim Doe" => 6 }

Hashes allow an alternate syntax for keys that are symbols. Instead of

    options = { :font_size => 10, :font_family => "Arial" }

You could write it as:

    options = { font_size: 10, font_family: "Arial" }

Each named key is a symbol you can access in hash:

    options[:font_size]  # => 10

A Hash can also be created through its ::new method:

    grades = Hash.new
    grades["Dorothy Doe"] = 9

Hashes have a *default value* that is returned when accessing keys that do not
exist in the hash. If no default is set `nil` is used. You can set the default
value by sending it as an argument to Hash.new:

    grades = Hash.new(0)

Or by using the #default= method:

    grades = {"Timmy Doe" => 8}
    grades.default = 0

Accessing a value in a Hash requires using its key:

    puts grades["Jane Doe"] # => 0

### Common Uses

Hashes are an easy way to represent data structures, such as

    books         = {}
    books[:matz]  = "The Ruby Language"
    books[:black] = "The Well-Grounded Rubyist"

Hashes are also commonly used as a way to have named parameters in functions.
Note that no brackets are used below. If a hash is the last argument on a
method call, no braces are needed, thus creating a really clean interface:

    Person.create(name: "John Doe", age: 27)

    def self.create(params)
      @name = params[:name]
      @age  = params[:age]
    end

### Hash Keys

Two objects refer to the same hash key when their `hash` value is identical
and the two objects are `eql?` to each other.

A user-defined class may be used as a hash key if the `hash` and `eql?`
methods are overridden to provide meaningful behavior.  By default, separate
instances refer to separate hash keys.

A typical implementation of `hash` is based on the object's data while `eql?`
is usually aliased to the overridden `==` method:

    class Book
      attr_reader :author, :title

      def initialize(author, title)
        @author = author
        @title = title
      end

      def ==(other)
        self.class === other and
          other.author == @author and
          other.title == @title
      end

      alias eql? ==

      def hash
        @author.hash ^ @title.hash # XOR
      end
    end

    book1 = Book.new 'matz', 'Ruby in a Nutshell'
    book2 = Book.new 'matz', 'Ruby in a Nutshell'

    reviews = {}

    reviews[book1] = 'Great reference!'
    reviews[book2] = 'Nice and compact!'

    reviews.length #=> 1

See also Object#hash and Object#eql?
---
# Class methods:

    []
    new
    try_convert

# Instance methods:

    <
    <=
    ==
    >
    >=
    []
    []=
    any?
    assoc
    clear
    compact
    compact!
    compare_by_identity
    compare_by_identity?
    default
    default=
    default_proc
    default_proc=
    delete
    delete_if
    dig
    each
    each_key
    each_pair
    each_value
    empty?
    eql?
    fetch
    fetch_values
    flatten
    has_key?
    has_value?
    hash
    include?
    inspect
    invert
    keep_if
    key
    key?
    keys
    length
    member?
    merge
    merge!
    rassoc
    rehash
    reject
    reject!
    replace
    select
    select!
    shift
    size
    store
    to_a
    to_h
    to_hash
    to_proc
    to_s
    transform_values
    transform_values!
    update
    value?
    values
    values_at

# Hash::[]

(from ruby core)
---
    Hash[ key, value, ... ]         -> new_hash
    Hash[ [ [key, value], ... ] ]   -> new_hash
    Hash[ object ]                  -> new_hash

---

Creates a new hash populated with the given objects.

Similar to the literal `{ *key* => *value*, ... }`. In the first form, keys
and values occur in pairs, so there must be an even number of arguments.

The second and third form take a single argument which is either an array of
key-value pairs or an object convertible to a hash.

    Hash["a", 100, "b", 200]             #=> {"a"=>100, "b"=>200}
    Hash[ [ ["a", 100], ["b", 200] ] ]   #=> {"a"=>100, "b"=>200}
    Hash["a" => 100, "b" => 200]         #=> {"a"=>100, "b"=>200}


(from gem yard-0.9.9)
---
    [](*args)

---


# Hash::new

(from ruby core)
---
    Hash.new                          -> new_hash
    Hash.new(obj)                     -> new_hash
    Hash.new {|hash, key| block }     -> new_hash

---

Returns a new, empty hash. If this hash is subsequently accessed by a key that
doesn't correspond to a hash entry, the value returned depends on the style of
`new` used to create the hash. In the first form, the access returns `nil`. If
*obj* is specified, this single object will be used for all *default values*.
If a block is specified, it will be called with the hash object and the key,
and should return the default value. It is the block's responsibility to store
the value in the hash if required.

    h = Hash.new("Go Fish")
    h["a"] = 100
    h["b"] = 200
    h["a"]           #=> 100
    h["c"]           #=> "Go Fish"
    # The following alters the single default object
    h["c"].upcase!   #=> "GO FISH"
    h["d"]           #=> "GO FISH"
    h.keys           #=> ["a", "b"]

    # While this creates a new default object each time
    h = Hash.new { |hash, key| hash[key] = "Go Fish: #{key}" }
    h["c"]           #=> "Go Fish: c"
    h["c"].upcase!   #=> "GO FISH: C"
    h["d"]           #=> "Go Fish: d"
    h.keys           #=> ["c", "d"]


# Hash::try_convert

(from ruby core)
---
    Hash.try_convert(obj) -> hash or nil

---

Try to convert *obj* into a hash, using to_hash method. Returns converted hash
or nil if *obj* cannot be converted for any reason.

    Hash.try_convert({1=>2})   # => {1=>2}
    Hash.try_convert("1=>2")   # => nil


# Hash#<

(from ruby core)
---
    hash < other -> true or false

---

Returns `true` if *hash* is subset of *other*.

    h1 = {a:1, b:2}
    h2 = {a:1, b:2, c:3}
    h1 < h2    #=> true
    h2 < h1    #=> false
    h1 < h1    #=> false


# Hash#<=

(from ruby core)
---
    hash <= other -> true or false

---

Returns `true` if *hash* is subset of *other* or equals to *other*.

    h1 = {a:1, b:2}
    h2 = {a:1, b:2, c:3}
    h1 <= h2   #=> true
    h2 <= h1   #=> false
    h1 <= h1   #=> true


# Hash#==

(from ruby core)
---
    hsh == other_hash    -> true or false

---

Equality---Two hashes are equal if they each contain the same number of keys
and if each key-value pair is equal to (according to `Object#==`) the
corresponding elements in the other hash.

    h1 = { "a" => 1, "c" => 2 }
    h2 = { 7 => 35, "c" => 2, "a" => 1 }
    h3 = { "a" => 1, "c" => 2, 7 => 35 }
    h4 = { "a" => 1, "d" => 2, "f" => 35 }
    h1 == h2   #=> false
    h2 == h3   #=> true
    h3 == h4   #=> false

The orders of each hashes are not compared.

    h1 = { "a" => 1, "c" => 2 }
    h2 = { "c" => 2, "a" => 1 }
    h1 == h2   #=> true


# Hash#>

(from ruby core)
---
    hash > other -> true or false

---

Returns `true` if *other* is subset of *hash*.

    h1 = {a:1, b:2}
    h2 = {a:1, b:2, c:3}
    h1 > h2    #=> false
    h2 > h1    #=> true
    h1 > h1    #=> false


# Hash#>=

(from ruby core)
---
    hash >= other -> true or false

---

Returns `true` if *other* is subset of *hash* or equals to *hash*.

    h1 = {a:1, b:2}
    h2 = {a:1, b:2, c:3}
    h1 >= h2   #=> false
    h2 >= h1   #=> true
    h1 >= h1   #=> true


# Hash#[]

(from ruby core)
---
    hsh[key]    ->  value

---

Element Reference---Retrieves the *value* object corresponding to the *key*
object. If not found, returns the default value (see `Hash::new` for details).

    h = { "a" => 100, "b" => 200 }
    h["a"]   #=> 100
    h["c"]   #=> nil


# Hash#[]=

(from ruby core)
---
    hsh[key] = value        -> value

---

## Element Assignment

Associates the value given by `value` with the key given by `key`.

    h = { "a" => 100, "b" => 200 }
    h["a"] = 9
    h["c"] = 4
    h   #=> {"a"=>9, "b"=>200, "c"=>4}
    h.store("d", 42) #=> 42
    h   #=> {"a"=>9, "b"=>200, "c"=>4, "d"=>42}

`key` should not have its value changed while it is in use as a key (an
`unfrozen String` passed as a key will be duplicated and frozen).

    a = "a"
    b = "b".freeze
    h = { a => 100, b => 200 }
    h.key(100).equal? a #=> false
    h.key(200).equal? b #=> true


# Hash#any?

(from ruby core)
---
    hsh.any? [{ |(key, value)| block }]   -> true or false

---

See also Enumerable#any?


# Hash#assoc

(from ruby core)
---
    hash.assoc(obj)   ->  an_array  or  nil

---

Searches through the hash comparing *obj* with the key using `==`. Returns the
key-value pair (two elements array) or `nil` if no match is found.  See
`Array#assoc`.

    h = {"colors"  => ["red", "blue", "green"],
         "letters" => ["a", "b", "c" ]}
    h.assoc("letters")  #=> ["letters", ["a", "b", "c"]]
    h.assoc("foo")      #=> nil


# Hash#clear

(from ruby core)
---
    hsh.clear -> hsh

---

Removes all key-value pairs from *hsh*.

    h = { "a" => 100, "b" => 200 }   #=> {"a"=>100, "b"=>200}
    h.clear                          #=> {}


# Hash#compact

(from ruby core)
---
    hsh.compact -> new_hash

---

Returns a new hash with the nil values/key pairs removed

    h = { a: 1, b: false, c: nil }
    h.compact     #=> { a: 1, b: false }
    h             #=> { a: 1, b: false, c: nil }


(from gem activesupport-5.1.2)
---
    compact()

---

Returns a hash with non `nil` values.

    hash = { a: true, b: false, c: nil }
    hash.compact        # => { a: true, b: false }
    hash                # => { a: true, b: false, c: nil }
    { c: nil }.compact  # => {}
    { c: true }.compact # => { c: true }


# Hash#compact!

(from ruby core)
---
    hsh.compact! -> hsh

---

Removes all nil values from the hash. Returns the hash.

    h = { a: 1, b: false, c: nil }
    h.compact!     #=> { a: 1, b: false }


(from gem activesupport-5.1.2)
---
    compact!()

---

Replaces current hash with non `nil` values. Returns `nil` if no changes were
made, otherwise returns the hash.

    hash = { a: true, b: false, c: nil }
    hash.compact!        # => { a: true, b: false }
    hash                 # => { a: true, b: false }
    { c: true }.compact! # => nil


# Hash#compare_by_identity

(from ruby core)
---
    hsh.compare_by_identity -> hsh

---

Makes *hsh* compare its keys by their identity, i.e. it will consider exact
same objects as same keys.

    h1 = { "a" => 100, "b" => 200, :c => "c" }
    h1["a"]        #=> 100
    h1.compare_by_identity
    h1.compare_by_identity? #=> true
    h1["a".dup]    #=> nil  # different objects.
    h1[:c]         #=> "c"  # same symbols are all same.


# Hash#compare_by_identity?

(from ruby core)
---
    hsh.compare_by_identity? -> true or false

---

Returns `true` if *hsh* will compare its keys by their identity.  Also see
`Hash#compare_by_identity`.


# Hash#default

(from ruby core)
---
    hsh.default(key=nil)   -> obj

---

Returns the default value, the value that would be returned by *[hsh](key)* if
*key* did not exist in *hsh*. See also `Hash::new` and `Hash#default=`.

    h = Hash.new                            #=> {}
    h.default                               #=> nil
    h.default(2)                            #=> nil

    h = Hash.new("cat")                     #=> {}
    h.default                               #=> "cat"
    h.default(2)                            #=> "cat"

    h = Hash.new {|h,k| h[k] = k.to_i*10}   #=> {}
    h.default                               #=> nil
    h.default(2)                            #=> 20


# Hash#default=

(from ruby core)
---
    hsh.default = obj     -> obj

---

Sets the default value, the value returned for a key that does not exist in
the hash. It is not possible to set the default to a `Proc` that will be
executed on each key lookup.

    h = { "a" => 100, "b" => 200 }
    h.default = "Go fish"
    h["a"]     #=> 100
    h["z"]     #=> "Go fish"
    # This doesn't do what you might hope...
    h.default = proc do |hash, key|
      hash[key] = key + key
    end
    h[2]       #=> #<Proc:0x401b3948@-:6>
    h["cat"]   #=> #<Proc:0x401b3948@-:6>


# Hash#default_proc

(from ruby core)
---
    hsh.default_proc -> anObject

---

If `Hash::new` was invoked with a block, return that block, otherwise return
`nil`.

    h = Hash.new {|h,k| h[k] = k*k }   #=> {}
    p = h.default_proc                 #=> #<Proc:0x401b3d08@-:1>
    a = []                             #=> []
    p.call(a, 2)
    a                                  #=> [nil, nil, 4]


# Hash#default_proc=

(from ruby core)
---
    hsh.default_proc = proc_obj or nil

---

Sets the default proc to be executed on each failed key lookup.

    h.default_proc = proc do |hash, key|
      hash[key] = key + key
    end
    h[2]       #=> 4
    h["cat"]   #=> "catcat"


# Hash#delete

(from ruby core)
---
    hsh.delete(key)                   -> value
    hsh.delete(key) {| key | block }  -> value

---

Deletes the key-value pair and returns the value from *hsh* whose key is equal
to *key*. If the key is not found, it returns *nil*. If the optional code
block is given and the key is not found, pass in the key and return the result
of *block*.

    h = { "a" => 100, "b" => 200 }
    h.delete("a")                              #=> 100
    h.delete("z")                              #=> nil
    h.delete("z") { |el| "#{el} not found" }   #=> "z not found"


# Hash#delete_if

(from ruby core)
---
    hsh.delete_if {| key, value | block }  -> hsh
    hsh.delete_if                          -> an_enumerator

---

Deletes every key-value pair from *hsh* for which *block* evaluates to `true`.

If no block is given, an enumerator is returned instead.

    h = { "a" => 100, "b" => 200, "c" => 300 }
    h.delete_if {|key, value| key >= "b" }   #=> {"a"=>100}


# Hash#dig

(from ruby core)
---
    hsh.dig(key, ...)                 -> object

---

Extracts the nested value specified by the sequence of *idx* objects by
calling `dig` at each step, returning `nil` if any intermediate step is `nil`.

    h = { foo: {bar: {baz: 1}}}

    h.dig(:foo, :bar, :baz)           #=> 1
    h.dig(:foo, :zot, :xyz)           #=> nil

    g = { foo: [10, 11, 12] }
    g.dig(:foo, 1)                    #=> 11
    g.dig(:foo, 1, 0)                 #=> TypeError: Integer does not have #dig method
    g.dig(:foo, :bar)                 #=> TypeError: no implicit conversion of Symbol into Integer


# Hash#each

(from ruby core)
---
    hsh.each      {| key, value | block } -> hsh
    hsh.each_pair {| key, value | block } -> hsh
    hsh.each                              -> an_enumerator
    hsh.each_pair                         -> an_enumerator

---

Calls *block* once for each key in *hsh*, passing the key-value pair as
parameters.

If no block is given, an enumerator is returned instead.

    h = { "a" => 100, "b" => 200 }
    h.each {|key, value| puts "#{key} is #{value}" }

*produces:*

    a is 100
    b is 200


# Hash#each_key

(from ruby core)
---
    hsh.each_key {| key | block } -> hsh
    hsh.each_key                  -> an_enumerator

---

Calls *block* once for each key in *hsh*, passing the key as a parameter.

If no block is given, an enumerator is returned instead.

    h = { "a" => 100, "b" => 200 }
    h.each_key {|key| puts key }

*produces:*

    a
    b


# Hash#each_pair

(from ruby core)
---
    hsh.each_pair {| key, value | block } -> hsh
    hsh.each_pair                         -> an_enumerator

---

Calls *block* once for each key in *hsh*, passing the key-value pair as
parameters.

If no block is given, an enumerator is returned instead.

    h = { "a" => 100, "b" => 200 }
    h.each {|key, value| puts "#{key} is #{value}" }

*produces:*

    a is 100
    b is 200


# Hash#each_value

(from ruby core)
---
    hsh.each_value {| value | block } -> hsh
    hsh.each_value                    -> an_enumerator

---

Calls *block* once for each key in *hsh*, passing the value as a parameter.

If no block is given, an enumerator is returned instead.

    h = { "a" => 100, "b" => 200 }
    h.each_value {|value| puts value }

*produces:*

    100
    200


# Hash#empty?

(from ruby core)
---
    hsh.empty?    -> true or false

---

Returns `true` if *hsh* contains no key-value pairs.

    {}.empty?   #=> true


# Hash#eql?

(from ruby core)
---
    hash.eql?(other)  -> true or false

---

Returns `true` if *hash* and *other* are both hashes with the same content.
The orders of each hashes are not compared.


# Hash#fetch

(from ruby core)
---
    hsh.fetch(key [, default] )       -> obj
    hsh.fetch(key) {| key | block }   -> obj

---

Returns a value from the hash for the given key. If the key can't be found,
there are several options: With no other arguments, it will raise an
`KeyError` exception; if *default* is given, then that will be returned; if
the optional code block is specified, then that will be run and its result
returned.

    h = { "a" => 100, "b" => 200 }
    h.fetch("a")                            #=> 100
    h.fetch("z", "go fish")                 #=> "go fish"
    h.fetch("z") { |el| "go fish, #{el}"}   #=> "go fish, z"

The following example shows that an exception is raised if the key is not
found and a default value is not supplied.

    h = { "a" => 100, "b" => 200 }
    h.fetch("z")

*produces:*

    prog.rb:2:in `fetch': key not found (KeyError)
     from prog.rb:2


# Hash#fetch_values

(from ruby core)
---
    hsh.fetch_values(key, ...)                 -> array
    hsh.fetch_values(key, ...) { |key| block } -> array

---

Returns an array containing the values associated with the given keys but also
raises `KeyError` when one of keys can't be found. Also see `Hash#values_at`
and `Hash#fetch`.

    h = { "cat" => "feline", "dog" => "canine", "cow" => "bovine" }

    h.fetch_values("cow", "cat")                   #=> ["bovine", "feline"]
    h.fetch_values("cow", "bird")                  # raises KeyError
    h.fetch_values("cow", "bird") { |k| k.upcase } #=> ["bovine", "BIRD"]


# Hash#flatten

(from ruby core)
---
    hash.flatten -> an_array
    hash.flatten(level) -> an_array

---

Returns a new array that is a one-dimensional flattening of this hash. That
is, for every key or value that is an array, extract its elements into the new
array.  Unlike Array#flatten, this method does not flatten recursively by
default.  The optional *level* argument determines the level of recursion to
flatten.

    a =  {1=> "one", 2 => [2,"two"], 3 => "three"}
    a.flatten    # => [1, "one", 2, [2, "two"], 3, "three"]
    a.flatten(2) # => [1, "one", 2, 2, "two", 3, "three"]


# Hash#has_key?

(from ruby core)
---
    hsh.has_key?(key)    -> true or false

---

Returns `true` if the given key is present in *hsh*.

    h = { "a" => 100, "b" => 200 }
    h.has_key?("a")   #=> true
    h.has_key?("z")   #=> false

Note that `include?` and `member?` do not test member equality using `==` as
do other Enumerables.

See also Enumerable#include?


# Hash#has_value?

(from ruby core)
---
    hsh.has_value?(value)    -> true or false

---

Returns `true` if the given value is present for some key in *hsh*.

    h = { "a" => 100, "b" => 200 }
    h.value?(100)   #=> true
    h.value?(999)   #=> false


# Hash#hash

(from ruby core)
---
    hsh.hash   -> integer

---

Compute a hash-code for this hash. Two hashes with the same content will have
the same hash code (and will compare using `eql?`).

See also Object#hash.


# Hash#include?

(from ruby core)
---
    hsh.include?(key)    -> true or false

---

Returns `true` if the given key is present in *hsh*.

    h = { "a" => 100, "b" => 200 }
    h.has_key?("a")   #=> true
    h.has_key?("z")   #=> false

Note that `include?` and `member?` do not test member equality using `==` as
do other Enumerables.

See also Enumerable#include?


# Hash#inspect

(from ruby core)
---
    hsh.to_s     -> string
    hsh.inspect  -> string

---

Return the contents of this hash as a string.

    h = { "c" => 300, "a" => 100, "d" => 400, "c" => 300  }
    h.to_s   #=> "{\"c\"=>300, \"a\"=>100, \"d\"=>400}"


# Hash#invert

(from ruby core)
---
    hsh.invert -> new_hash

---

Returns a new hash created by using *hsh*'s values as keys, and the keys as
values. If a key with the same value already exists in the *hsh*, then the
last one defined will be used, the earlier value(s) will be discarded.

    h = { "n" => 100, "m" => 100, "y" => 300, "d" => 200, "a" => 0 }
    h.invert   #=> {0=>"a", 100=>"m", 200=>"d", 300=>"y"}

If there is no key with the same value, Hash#invert is involutive.

    h = { a: 1, b: 3, c: 4 }
    h.invert.invert == h #=> true

The condition, no key with the same value, can be tested by comparing the size
of inverted hash.

    # no key with the same value
    h = { a: 1, b: 3, c: 4 }
    h.size == h.invert.size #=> true

    # two (or more) keys has the same value
    h = { a: 1, b: 3, c: 1 }
    h.size == h.invert.size #=> false


# Hash#keep_if

(from ruby core)
---
    hsh.keep_if {| key, value | block }  -> hsh
    hsh.keep_if                          -> an_enumerator

---

Deletes every key-value pair from *hsh* for which *block* evaluates to false.

If no block is given, an enumerator is returned instead.


# Hash#key

(from ruby core)
---
    hsh.key(value)    -> key

---

Returns the key of an occurrence of a given value. If the value is not found,
returns `nil`.

    h = { "a" => 100, "b" => 200, "c" => 300, "d" => 300 }
    h.key(200)   #=> "b"
    h.key(300)   #=> "c"
    h.key(999)   #=> nil


# Hash#key?

(from ruby core)
---
    hsh.key?(key)        -> true or false

---

Returns `true` if the given key is present in *hsh*.

    h = { "a" => 100, "b" => 200 }
    h.has_key?("a")   #=> true
    h.has_key?("z")   #=> false

Note that `include?` and `member?` do not test member equality using `==` as
do other Enumerables.

See also Enumerable#include?


# Hash#keys

(from ruby core)
---
    hsh.keys    -> array

---

Returns a new array populated with the keys from this hash. See also
`Hash#values`.

    h = { "a" => 100, "b" => 200, "c" => 300, "d" => 400 }
    h.keys   #=> ["a", "b", "c", "d"]


# Hash#length

(from ruby core)
---
    hsh.length    ->  integer

---

Returns the number of key-value pairs in the hash.

    h = { "d" => 100, "a" => 200, "v" => 300, "e" => 400 }
    h.length        #=> 4
    h.delete("a")   #=> 200
    h.length        #=> 3


# Hash#member?

(from ruby core)
---
    hsh.member?(key)     -> true or false

---

Returns `true` if the given key is present in *hsh*.

    h = { "a" => 100, "b" => 200 }
    h.has_key?("a")   #=> true
    h.has_key?("z")   #=> false

Note that `include?` and `member?` do not test member equality using `==` as
do other Enumerables.

See also Enumerable#include?


# Hash#merge

(from ruby core)
---
    hsh.merge(other_hash)                              -> new_hash
    hsh.merge(other_hash){|key, oldval, newval| block} -> new_hash

---

Returns a new hash containing the contents of *other_hash* and the contents of
*hsh*. If no block is specified, the value for entries with duplicate keys
will be that of *other_hash*. Otherwise the value for each duplicate key is
determined by calling the block with the key, its value in *hsh* and its value
in *other_hash*.

    h1 = { "a" => 100, "b" => 200 }
    h2 = { "b" => 254, "c" => 300 }
    h1.merge(h2)   #=> {"a"=>100, "b"=>254, "c"=>300}
    h1.merge(h2){|key, oldval, newval| newval - oldval}
                   #=> {"a"=>100, "b"=>54,  "c"=>300}
    h1             #=> {"a"=>100, "b"=>200}


# Hash#merge!

(from ruby core)
---
    hsh.merge!(other_hash)                                 -> hsh
    hsh.merge!(other_hash){|key, oldval, newval| block}    -> hsh

---

Adds the contents of *other_hash* to *hsh*.  If no block is specified, entries
with duplicate keys are overwritten with the values from *other_hash*,
otherwise the value of each duplicate key is determined by calling the block
with the key, its value in *hsh* and its value in *other_hash*.

    h1 = { "a" => 100, "b" => 200 }
    h2 = { "b" => 254, "c" => 300 }
    h1.merge!(h2)   #=> {"a"=>100, "b"=>254, "c"=>300}

    h1 = { "a" => 100, "b" => 200 }
    h2 = { "b" => 254, "c" => 300 }
    h1.merge!(h2) { |key, v1, v2| v1 }
                    #=> {"a"=>100, "b"=>200, "c"=>300}


# Hash#rassoc

(from ruby core)
---
    hash.rassoc(obj) -> an_array or nil

---

Searches through the hash comparing *obj* with the value using `==`. Returns
the first key-value pair (two-element array) that matches. See also
`Array#rassoc`.

    a = {1=> "one", 2 => "two", 3 => "three", "ii" => "two"}
    a.rassoc("two")    #=> [2, "two"]
    a.rassoc("four")   #=> nil


# Hash#rehash

(from ruby core)
---
    hsh.rehash -> hsh

---

Rebuilds the hash based on the current hash values for each key. If values of
key objects have changed since they were inserted, this method will reindex
*hsh*. If `Hash#rehash` is called while an iterator is traversing the hash, a
`RuntimeError` will be raised in the iterator.

    a = [ "a", "b" ]
    c = [ "c", "d" ]
    h = { a => 100, c => 300 }
    h[a]       #=> 100
    a[0] = "z"
    h[a]       #=> nil
    h.rehash   #=> {["z", "b"]=>100, ["c", "d"]=>300}
    h[a]       #=> 100


# Hash#reject

(from ruby core)
---
    hsh.reject {|key, value| block}   -> a_hash
    hsh.reject                        -> an_enumerator

---

Returns a new hash consisting of entries for which the block returns false.

If no block is given, an enumerator is returned instead.

    h = { "a" => 100, "b" => 200, "c" => 300 }
    h.reject {|k,v| k < "b"}  #=> {"b" => 200, "c" => 300}
    h.reject {|k,v| v > 100}  #=> {"a" => 100}


# Hash#reject!

(from ruby core)
---
    hsh.reject! {| key, value | block }  -> hsh or nil
    hsh.reject!                          -> an_enumerator

---

Equivalent to `Hash#delete_if`, but returns `nil` if no changes were made.


# Hash#replace

(from ruby core)
---
    hsh.replace(other_hash) -> hsh

---

Replaces the contents of *hsh* with the contents of *other_hash*.

    h = { "a" => 100, "b" => 200 }
    h.replace({ "c" => 300, "d" => 400 })   #=> {"c"=>300, "d"=>400}


# Hash#select

(from ruby core)
---
    hsh.select {|key, value| block}   -> a_hash
    hsh.select                        -> an_enumerator

---

Returns a new hash consisting of entries for which the block returns true.

If no block is given, an enumerator is returned instead.

    h = { "a" => 100, "b" => 200, "c" => 300 }
    h.select {|k,v| k > "a"}  #=> {"b" => 200, "c" => 300}
    h.select {|k,v| v < 200}  #=> {"a" => 100}


# Hash#select!

(from ruby core)
---
    hsh.select! {| key, value | block }  -> hsh or nil
    hsh.select!                          -> an_enumerator

---

Equivalent to `Hash#keep_if`, but returns `nil` if no changes were made.


# Hash#shift

(from ruby core)
---
    hsh.shift -> anArray or obj

---

Removes a key-value pair from *hsh* and returns it as the two-item array `[`
*key, value* `]`, or the hash's default value if the hash is empty.

    h = { 1 => "a", 2 => "b", 3 => "c" }
    h.shift   #=> [1, "a"]
    h         #=> {2=>"b", 3=>"c"}


# Hash#size

(from ruby core)
---
    hsh.size      ->  integer

---

Returns the number of key-value pairs in the hash.

    h = { "d" => 100, "a" => 200, "v" => 300, "e" => 400 }
    h.length        #=> 4
    h.delete("a")   #=> 200
    h.length        #=> 3


# Hash#store

(from ruby core)
---
    hsh.store(key, value)   -> value

---

## Element Assignment

Associates the value given by `value` with the key given by `key`.

    h = { "a" => 100, "b" => 200 }
    h["a"] = 9
    h["c"] = 4
    h   #=> {"a"=>9, "b"=>200, "c"=>4}
    h.store("d", 42) #=> 42
    h   #=> {"a"=>9, "b"=>200, "c"=>4, "d"=>42}

`key` should not have its value changed while it is in use as a key (an
`unfrozen String` passed as a key will be duplicated and frozen).

    a = "a"
    b = "b".freeze
    h = { a => 100, b => 200 }
    h.key(100).equal? a #=> false
    h.key(200).equal? b #=> true


# Hash#to_a

(from ruby core)
---
    hsh.to_a -> array

---

Converts *hsh* to a nested array of `[` *key, value* `]` arrays.

    h = { "c" => 300, "a" => 100, "d" => 400, "c" => 300  }
    h.to_a   #=> [["c", 300], ["a", 100], ["d", 400]]


# Hash#to_h

(from ruby core)
---
    hsh.to_h     -> hsh or new_hash

---

Returns `self`. If called on a subclass of Hash, converts the receiver to a
Hash object.


# Hash#to_hash

(from ruby core)
---
    hsh.to_hash   => hsh

---

Returns `self`.


# Hash#to_proc

(from ruby core)
---
    to_proc()

---


# Hash#to_s

(from ruby core)
---
    to_s()

---


# Hash#transform_values

(from ruby core)
---
    hsh.transform_values {|value| block } -> hsh
    hsh.transform_values                  -> an_enumerator

---

Return a new with the results of running block once for every value. This
method does not change the keys.

    h = { a: 1, b: 2, c: 3 }
    h.transform_values {|v| v * v + 1 }  #=> { a: 2, b: 5, c: 10 }
    h.transform_values(&:to_s)           #=> { a: "1", b: "2", c: "3" }
    h.transform_values.with_index {|v, i| "#{v}.#{i}" }
                                         #=> { a: "1.0", b: "2.1", c: "3.2" }

If no block is given, an enumerator is returned instead.


(from gem activesupport-5.1.2)
---
    transform_values() { |value| ... }

---

Returns a new hash with the results of running `block` once for every value.
The keys are unchanged.

    { a: 1, b: 2, c: 3 }.transform_values { |x| x * 2 } # => { a: 2, b: 4, c: 6 }

If you do not provide a `block`, it will return an Enumerator for chaining
with other methods:

    { a: 1, b: 2 }.transform_values.with_index { |v, i| [v, i].join.to_i } # => { a: 10, b: 21 }


# Hash#transform_values!

(from ruby core)
---
    hsh.transform_values! {|value| block } -> hsh
    hsh.transform_values!                  -> an_enumerator

---

Return a new with the results of running block once for every value. This
method does not change the keys.

    h = { a: 1, b: 2, c: 3 }
    h.transform_values! {|v| v * v + 1 }  #=> { a: 2, b: 5, c: 10 }
    h.transform_values!(&:to_s)           #=> { a: "1", b: "2", c: "3" }
    h.transform_values!.with_index {|v, i| "#{v}.#{i}" }
                                          #=> { a: "1.0", b: "2.1", c: "3.2" }

If no block is given, an enumerator is returned instead.


(from gem activesupport-5.1.2)
---
    transform_values!() { |value| ... }

---

Destructively converts all values using the `block` operations. Same as
`transform_values` but modifies `self`.


# Hash#update

(from ruby core)
---
    hsh.update(other_hash)                                 -> hsh
    hsh.update(other_hash){|key, oldval, newval| block}    -> hsh

---

Adds the contents of *other_hash* to *hsh*.  If no block is specified, entries
with duplicate keys are overwritten with the values from *other_hash*,
otherwise the value of each duplicate key is determined by calling the block
with the key, its value in *hsh* and its value in *other_hash*.

    h1 = { "a" => 100, "b" => 200 }
    h2 = { "b" => 254, "c" => 300 }
    h1.merge!(h2)   #=> {"a"=>100, "b"=>254, "c"=>300}

    h1 = { "a" => 100, "b" => 200 }
    h2 = { "b" => 254, "c" => 300 }
    h1.merge!(h2) { |key, v1, v2| v1 }
                    #=> {"a"=>100, "b"=>200, "c"=>300}


# Hash#value?

(from ruby core)
---
    hsh.value?(value)        -> true or false

---

Returns `true` if the given value is present for some key in *hsh*.

    h = { "a" => 100, "b" => 200 }
    h.value?(100)   #=> true
    h.value?(999)   #=> false


# Hash#values

(from ruby core)
---
    hsh.values    -> array

---

Returns a new array populated with the values from *hsh*. See also
`Hash#keys`.

    h = { "a" => 100, "b" => 200, "c" => 300 }
    h.values   #=> [100, 200, 300]


# Hash#values_at

(from ruby core)
---
    hsh.values_at(key, ...)   -> array

---

Return an array containing the values associated with the given keys. Also see
`Hash.select`.

    h = { "cat" => "feline", "dog" => "canine", "cow" => "bovine" }
    h.values_at("cow", "cat")  #=> ["bovine", "feline"]


(from gem activesupport-5.1.2)
---













---
# Class methods:

    from_trusted_xml
    from_xml

# Instance methods:

    _deep_transform_keys_in_object
    _deep_transform_keys_in_object!
    assert_valid_keys
    compact
    compact!
    deep_dup
    deep_merge
    deep_merge!
    deep_stringify_keys
    deep_stringify_keys!
    deep_symbolize_keys
    deep_symbolize_keys!
    deep_transform_keys
    deep_transform_keys!
    except
    except!
    extract!
    extractable_options?
    nested_under_indifferent_access
    reverse_merge
    reverse_merge!
    reverse_update
    slice
    slice!
    stringify_keys
    stringify_keys!
    symbolize_keys
    symbolize_keys!
    to_options
    to_options!
    to_param
    to_query
    to_xml
    transform_keys
    transform_keys!
    transform_values
    transform_values!
    with_indifferent_access

# Hash::from_trusted_xml

(from gem activesupport-5.1.2)
---
    from_trusted_xml(xml)

---

Builds a Hash from XML just like `Hash.from_xml`, but also allows Symbol and
YAML.


# Hash::from_xml

(from gem activesupport-5.1.2)
---
    from_xml(xml, disallowed_types = nil)

---

Returns a Hash containing a collection of pairs when the key is the node name
and the value is its content

    xml = <<-XML
      <?xml version="1.0" encoding="UTF-8"?>
        <hash>
          <foo type="integer">1</foo>
          <bar type="integer">2</bar>
        </hash>
    XML

    hash = Hash.from_xml(xml)
    # => {"hash"=>{"foo"=>1, "bar"=>2}}

`DisallowedType` is raised if the XML contains attributes with `type="yaml"`
or `type="symbol"`. Use `Hash.from_trusted_xml` to parse this XML.

Custom `disallowed_types` can also be passed in the form of an array.

    xml = <<-XML
      <?xml version="1.0" encoding="UTF-8"?>
        <hash>
          <foo type="integer">1</foo>
          <bar type="string">"David"</bar>
        </hash>
    XML

    hash = Hash.from_xml(xml, ['integer'])
    # => ActiveSupport::XMLConverter::DisallowedType: Disallowed type attribute: "integer"

Note that passing custom disallowed types will override the default types,
which are Symbol and YAML.


# Hash#assert_valid_keys

(from gem activesupport-5.1.2)
---
    assert_valid_keys(*valid_keys)

---

Validates all keys in a hash match `*valid_keys`, raising `ArgumentError` on a
mismatch.

Note that keys are treated differently than HashWithIndifferentAccess, meaning
that string and symbol keys will not match.

    { name: 'Rob', years: '28' }.assert_valid_keys(:name, :age) # => raises "ArgumentError: Unknown key: :years. Valid keys are: :name, :age"
    { name: 'Rob', age: '28' }.assert_valid_keys('name', 'age') # => raises "ArgumentError: Unknown key: :name. Valid keys are: 'name', 'age'"
    { name: 'Rob', age: '28' }.assert_valid_keys(:name, :age)   # => passes, raises nothing


# Hash#compact

(from ruby core)
---
    hsh.compact -> new_hash

---

Returns a new hash with the nil values/key pairs removed

    h = { a: 1, b: false, c: nil }
    h.compact     #=> { a: 1, b: false }
    h             #=> { a: 1, b: false, c: nil }


(from gem activesupport-5.1.2)
---
    compact()

---

Returns a hash with non `nil` values.

    hash = { a: true, b: false, c: nil }
    hash.compact        # => { a: true, b: false }
    hash                # => { a: true, b: false, c: nil }
    { c: nil }.compact  # => {}
    { c: true }.compact # => { c: true }


# Hash#compact!

(from ruby core)
---
    hsh.compact! -> hsh

---

Removes all nil values from the hash. Returns the hash.

    h = { a: 1, b: false, c: nil }
    h.compact!     #=> { a: 1, b: false }


(from gem activesupport-5.1.2)
---
    compact!()

---

Replaces current hash with non `nil` values. Returns `nil` if no changes were
made, otherwise returns the hash.

    hash = { a: true, b: false, c: nil }
    hash.compact!        # => { a: true, b: false }
    hash                 # => { a: true, b: false }
    { c: true }.compact! # => nil


# Hash#deep_dup

(from gem activesupport-5.1.2)
---
    deep_dup()

---

Returns a deep copy of hash.

    hash = { a: { b: 'b' } }
    dup  = hash.deep_dup
    dup[:a][:c] = 'c'

    hash[:a][:c] # => nil
    dup[:a][:c]  # => "c"


# Hash#deep_merge

(from gem activesupport-5.1.2)
---
    deep_merge(other_hash, &block)

---

Returns a new hash with `self` and `other_hash` merged recursively.

    h1 = { a: true, b: { c: [1, 2, 3] } }
    h2 = { a: false, b: { x: [3, 4, 5] } }

    h1.deep_merge(h2) # => { a: false, b: { c: [1, 2, 3], x: [3, 4, 5] } }

Like with Hash#merge in the standard library, a block can be provided to merge
values:

    h1 = { a: 100, b: 200, c: { c1: 100 } }
    h2 = { b: 250, c: { c1: 200 } }
    h1.deep_merge(h2) { |key, this_val, other_val| this_val + other_val }
    # => { a: 100, b: 450, c: { c1: 300 } }


# Hash#deep_merge!

(from gem activesupport-5.1.2)
---
    deep_merge!(other_hash, &block)

---

Same as `deep_merge`, but modifies `self`.


(from gem i18n-0.8.6)
---
    deep_merge!(data)

---


# Hash#deep_stringify_keys

(from gem activesupport-5.1.2)
---
    deep_stringify_keys()

---

Returns a new hash with all keys converted to strings. This includes the keys
from the root hash and from all nested hashes and arrays.

    hash = { person: { name: 'Rob', age: '28' } }

    hash.deep_stringify_keys
    # => {"person"=>{"name"=>"Rob", "age"=>"28"}}


# Hash#deep_stringify_keys!

(from gem activesupport-5.1.2)
---
    deep_stringify_keys!()

---

Destructively converts all keys to strings. This includes the keys from the
root hash and from all nested hashes and arrays.


# Hash#deep_symbolize_keys

(from gem activesupport-5.1.2)
---
    deep_symbolize_keys()

---

Returns a new hash with all keys converted to symbols, as long as they respond
to `to_sym`. This includes the keys from the root hash and from all nested
hashes and arrays.

    hash = { 'person' => { 'name' => 'Rob', 'age' => '28' } }

    hash.deep_symbolize_keys
    # => {:person=>{:name=>"Rob", :age=>"28"}}


(from gem i18n-0.8.6)
---
    deep_symbolize_keys()

---


# Hash#deep_symbolize_keys!

(from gem activesupport-5.1.2)
---
    deep_symbolize_keys!()

---

Destructively converts all keys to symbols, as long as they respond to
`to_sym`. This includes the keys from the root hash and from all nested hashes
and arrays.


# Hash#deep_transform_keys

(from gem activesupport-5.1.2)
---
    deep_transform_keys(&block)

---

Returns a new hash with all keys converted by the block operation. This
includes the keys from the root hash and from all nested hashes and arrays.

    hash = { person: { name: 'Rob', age: '28' } }

    hash.deep_transform_keys{ |key| key.to_s.upcase }
    # => {"PERSON"=>{"NAME"=>"Rob", "AGE"=>"28"}}


# Hash#deep_transform_keys!

(from gem activesupport-5.1.2)
---
    deep_transform_keys!(&block)

---

Destructively converts all keys by using the block operation. This includes
the keys from the root hash and from all nested hashes and arrays.


# Hash#except

(from gem activesupport-5.1.2)
---
    except(*keys)

---

Returns a hash that includes everything except given keys.
    hash = { a: true, b: false, c: nil }
    hash.except(:c)     # => { a: true, b: false }
    hash.except(:a, :b) # => { c: nil }
    hash                # => { a: true, b: false, c: nil }

This is useful for limiting a set of parameters to everything but a few known
toggles:
    @person.update(params[:person].except(:admin))


(from gem i18n-0.8.6)
---
    except(*less_keys)

---


# Hash#except!

(from gem activesupport-5.1.2)
---
    except!(*keys)

---

Removes the given keys from hash and returns it.
    hash = { a: true, b: false, c: nil }
    hash.except!(:c) # => { a: true, b: false }
    hash             # => { a: true, b: false }


# Hash#extract!

(from gem activesupport-5.1.2)
---
    extract!(*keys)

---

Removes and returns the key/value pairs matching the given keys.

    { a: 1, b: 2, c: 3, d: 4 }.extract!(:a, :b) # => {:a=>1, :b=>2}
    { a: 1, b: 2 }.extract!(:a, :x)             # => {:a=>1}


# Hash#extractable_options?

(from gem activesupport-5.1.2)
---
    extractable_options?()

---

By default, only instances of Hash itself are extractable. Subclasses of Hash
may implement this method and return true to declare themselves as
extractable. If a Hash is extractable, Array#extract_options! pops it from the
Array when it is the last element of the Array.


# Hash#nested_under_indifferent_access

(from gem activesupport-5.1.2)
---
    nested_under_indifferent_access()

---

Called when object is nested under an object that receives
#with_indifferent_access. This method will be called on the current object by
the enclosing object and is aliased to #with_indifferent_access by default.
Subclasses of Hash may overwrite this method to return `self` if converting to
an `ActiveSupport::HashWithIndifferentAccess` would not be desirable.

    b = { b: 1 }
    { a: b }.with_indifferent_access['a'] # calls b.nested_under_indifferent_access
    # => {"b"=>1}


# Hash#reverse_merge

(from gem activesupport-5.1.2)
---
    reverse_merge(other_hash)

---

Merges the caller into `other_hash`. For example,

    options = options.reverse_merge(size: 25, velocity: 10)

is equivalent to

    options = { size: 25, velocity: 10 }.merge(options)

This is particularly useful for initializing an options hash with default
values.


# Hash#reverse_merge!

(from gem activesupport-5.1.2)
---
    reverse_merge!(other_hash)

---

Destructive `reverse_merge`.


# Hash#reverse_update

(from gem activesupport-5.1.2)
---
    reverse_update(other_hash)

---


# Hash#slice

(from gem activesupport-5.1.2)
---
    slice(*keys)

---

Slices a hash to include only the given keys. Returns a hash containing the
given keys.

    { a: 1, b: 2, c: 3, d: 4 }.slice(:a, :b)
    # => {:a=>1, :b=>2}

This is useful for limiting an options hash to valid keys before passing to a
method:

    def search(criteria = {})
      criteria.assert_valid_keys(:mass, :velocity, :time)
    end

    search(options.slice(:mass, :velocity, :time))

If you have an array of keys you want to limit to, you should splat them:

    valid_keys = [:mass, :velocity, :time]
    search(options.slice(*valid_keys))


(from gem i18n-0.8.6)
---
    slice(*keep_keys)

---


# Hash#slice!

(from gem activesupport-5.1.2)
---
    slice!(*keys)

---

Replaces the hash with only the given keys. Returns a hash containing the
removed key/value pairs.

    { a: 1, b: 2, c: 3, d: 4 }.slice!(:a, :b)
    # => {:c=>3, :d=>4}


# Hash#stringify_keys

(from gem activesupport-5.1.2)
---
    stringify_keys()

---

Returns a new hash with all keys converted to strings.

    hash = { name: 'Rob', age: '28' }

    hash.stringify_keys
    # => {"name"=>"Rob", "age"=>"28"}


# Hash#stringify_keys!

(from gem activesupport-5.1.2)
---
    stringify_keys!()

---

Destructively converts all keys to strings. Same as `stringify_keys`, but
modifies `self`.


# Hash#symbolize_keys

(from gem activesupport-5.1.2)
---
    symbolize_keys()

---

Returns a new hash with all keys converted to symbols, as long as they respond
to `to_sym`.

    hash = { 'name' => 'Rob', 'age' => '28' }

    hash.symbolize_keys
    # => {:name=>"Rob", :age=>"28"}


# Hash#symbolize_keys!

(from gem activesupport-5.1.2)
---
    symbolize_keys!()

---

Destructively converts all keys to symbols, as long as they respond to
`to_sym`. Same as `symbolize_keys`, but modifies `self`.


# Hash#to_options

(from gem activesupport-5.1.2)
---
    to_options()

---


# Hash#to_options!

(from gem activesupport-5.1.2)
---
    to_options!()

---


# Hash#to_param

(from gem activesupport-5.1.2)
---
    to_param(namespace = nil)

---


# Hash#to_query

(from gem activesupport-5.1.2)
---
    to_query(namespace = nil)

---

Returns a string representation of the receiver suitable for use as a URL
query string:

    {name: 'David', nationality: 'Danish'}.to_query
    # => "name=David&nationality=Danish"

An optional namespace can be passed to enclose key names:

    {name: 'David', nationality: 'Danish'}.to_query('user')
    # => "user%5Bname%5D=David&user%5Bnationality%5D=Danish"

The string pairs "key=value" that conform the query string are sorted
lexicographically in ascending order.

This method is also aliased as `to_param`.


# Hash#to_xml

(from gem activesupport-5.1.2)
---
    to_xml(options = {}) { |builder| ... }

---

Returns a string containing an XML representation of its receiver:

    { foo: 1, bar: 2 }.to_xml
    # =>
    # <?xml version="1.0" encoding="UTF-8"?>
    # <hash>
    #   <foo type="integer">1</foo>
    #   <bar type="integer">2</bar>
    # </hash>

To do so, the method loops over the pairs and builds nodes that depend on the
*values*. Given a pair `key`, `value`:

*   If `value` is a hash there's a recursive call with `key` as `:root`.

*   If `value` is an array there's a recursive call with `key` as `:root`, and
    `key` singularized as `:children`.

*   If `value` is a callable object it must expect one or two arguments.
    Depending on the arity, the callable is invoked with the `options` hash as
    first argument with `key` as `:root`, and `key` singularized as second
    argument. The callable can add nodes by using `options[:builder]`.

        {foo: lambda { |options, key| options[:builder].b(key) }}.to_xml
        # => "<b>foo</b>"

*   If `value` responds to `to_xml` the method is invoked with `key` as
    `:root`.

        class Foo
          def to_xml(options)
            options[:builder].bar 'fooing!'
          end
        end

        { foo: Foo.new }.to_xml(skip_instruct: true)
        # =>
        # <hash>
        #   <bar>fooing!</bar>
        # </hash>

*   Otherwise, a node with `key` as tag is created with a string
    representation of `value` as text node. If `value` is `nil` an attribute
    "nil" set to "true" is added. Unless the option `:skip_types` exists and
    is true, an attribute "type" is added as well according to the following
    mapping:

        XML_TYPE_NAMES = {
          "Symbol"     => "symbol",
          "Integer"    => "integer",
          "BigDecimal" => "decimal",
          "Float"      => "float",
          "TrueClass"  => "boolean",
          "FalseClass" => "boolean",
          "Date"       => "date",
          "DateTime"   => "dateTime",
          "Time"       => "dateTime"
        }


By default the root node is "hash", but that's configurable via the `:root`
option.

The default XML builder is a fresh instance of `Builder::XmlMarkup`. You can
configure your own builder with the `:builder` option. The method also accepts
options like `:dasherize` and friends, they are forwarded to the builder.


# Hash#transform_keys

(from gem activesupport-5.1.2)
---
    transform_keys() { |key| ... }

---

Returns a new hash with all keys converted using the `block` operation.

    hash = { name: 'Rob', age: '28' }

    hash.transform_keys { |key| key.to_s.upcase } # => {"NAME"=>"Rob", "AGE"=>"28"}

If you do not provide a `block`, it will return an Enumerator for chaining
with other methods:

    hash.transform_keys.with_index { |k, i| [k, i].join } # => {"name0"=>"Rob", "age1"=>"28"}


# Hash#transform_keys!

(from gem activesupport-5.1.2)
---
    transform_keys!() { |key| ... }

---

Destructively converts all keys using the `block` operations. Same as
`transform_keys` but modifies `self`.


# Hash#transform_values

(from ruby core)
---
    hsh.transform_values {|value| block } -> hsh
    hsh.transform_values                  -> an_enumerator

---

Return a new with the results of running block once for every value. This
method does not change the keys.

    h = { a: 1, b: 2, c: 3 }
    h.transform_values {|v| v * v + 1 }  #=> { a: 2, b: 5, c: 10 }
    h.transform_values(&:to_s)           #=> { a: "1", b: "2", c: "3" }
    h.transform_values.with_index {|v, i| "#{v}.#{i}" }
                                         #=> { a: "1.0", b: "2.1", c: "3.2" }

If no block is given, an enumerator is returned instead.


(from gem activesupport-5.1.2)
---
    transform_values() { |value| ... }

---

Returns a new hash with the results of running `block` once for every value.
The keys are unchanged.

    { a: 1, b: 2, c: 3 }.transform_values { |x| x * 2 } # => { a: 2, b: 4, c: 6 }

If you do not provide a `block`, it will return an Enumerator for chaining
with other methods:

    { a: 1, b: 2 }.transform_values.with_index { |v, i| [v, i].join.to_i } # => { a: 10, b: 21 }


# Hash#transform_values!

(from ruby core)
---
    hsh.transform_values! {|value| block } -> hsh
    hsh.transform_values!                  -> an_enumerator

---

Return a new with the results of running block once for every value. This
method does not change the keys.

    h = { a: 1, b: 2, c: 3 }
    h.transform_values! {|v| v * v + 1 }  #=> { a: 2, b: 5, c: 10 }
    h.transform_values!(&:to_s)           #=> { a: "1", b: "2", c: "3" }
    h.transform_values!.with_index {|v, i| "#{v}.#{i}" }
                                          #=> { a: "1.0", b: "2.1", c: "3.2" }

If no block is given, an enumerator is returned instead.


(from gem activesupport-5.1.2)
---
    transform_values!() { |value| ... }

---

Destructively converts all values using the `block` operations. Same as
`transform_values` but modifies `self`.


# Hash#with_indifferent_access

(from gem activesupport-5.1.2)
---
    with_indifferent_access()

---

Returns an `ActiveSupport::HashWithIndifferentAccess` out of its receiver:

    { a: 1 }.with_indifferent_access['a'] # => 1


# Hash#_deep_transform_keys_in_object

(from gem activesupport-5.1.2)
---
    _deep_transform_keys_in_object(object) { |key| ... }

---

support methods for deep transforming nested hashes and arrays


# Hash#_deep_transform_keys_in_object!

(from gem activesupport-5.1.2)
---
    _deep_transform_keys_in_object!(object) { |key| ... }

---


(from gem i18n-0.8.6)
---
# Constants:

MERGER
:   deep_merge_hash! by Stefan Rusterholz, see
    http://www.ruby-forum.com/topic/142809


# Instance methods:

    deep_merge!
    deep_symbolize_keys
    except
    slice

# Hash#deep_merge!

(from gem activesupport-5.1.2)
---
    deep_merge!(other_hash, &block)

---

Same as `deep_merge`, but modifies `self`.


(from gem i18n-0.8.6)
---
    deep_merge!(data)

---


# Hash#deep_symbolize_keys

(from gem activesupport-5.1.2)
---
    deep_symbolize_keys()

---

Returns a new hash with all keys converted to symbols, as long as they respond
to `to_sym`. This includes the keys from the root hash and from all nested
hashes and arrays.

    hash = { 'person' => { 'name' => 'Rob', 'age' => '28' } }

    hash.deep_symbolize_keys
    # => {:person=>{:name=>"Rob", :age=>"28"}}


(from gem i18n-0.8.6)
---
    deep_symbolize_keys()

---


# Hash#except

(from gem activesupport-5.1.2)
---
    except(*keys)

---

Returns a hash that includes everything except given keys.
    hash = { a: true, b: false, c: nil }
    hash.except(:c)     # => { a: true, b: false }
    hash.except(:a, :b) # => { c: nil }
    hash                # => { a: true, b: false, c: nil }

This is useful for limiting a set of parameters to everything but a few known
toggles:
    @person.update(params[:person].except(:admin))


(from gem i18n-0.8.6)
---
    except(*less_keys)

---


# Hash#slice

(from gem activesupport-5.1.2)
---
    slice(*keys)

---

Slices a hash to include only the given keys. Returns a hash containing the
given keys.

    { a: 1, b: 2, c: 3, d: 4 }.slice(:a, :b)
    # => {:a=>1, :b=>2}

This is useful for limiting an options hash to valid keys before passing to a
method:

    def search(criteria = {})
      criteria.assert_valid_keys(:mass, :velocity, :time)
    end

    search(options.slice(:mass, :velocity, :time))

If you have an array of keys you want to limit to, you should splat them:

    valid_keys = [:mass, :velocity, :time]
    search(options.slice(*valid_keys))


(from gem i18n-0.8.6)
---
    slice(*keep_keys)

---


(from gem yard-0.9.9)
---
# Class methods:

    []
    create
    create_186

# Hash::[]

(from ruby core)
---
    Hash[ key, value, ... ]         -> new_hash
    Hash[ [ [key, value], ... ] ]   -> new_hash
    Hash[ object ]                  -> new_hash

---

Creates a new hash populated with the given objects.

Similar to the literal `{ *key* => *value*, ... }`. In the first form, keys
and values occur in pairs, so there must be an even number of arguments.

The second and third form take a single argument which is either an array of
key-value pairs or an object convertible to a hash.

    Hash["a", 100, "b", 200]             #=> {"a"=>100, "b"=>200}
    Hash[ [ ["a", 100], ["b", 200] ] ]   #=> {"a"=>100, "b"=>200}
    Hash["a" => 100, "b" => 200]         #=> {"a"=>100, "b"=>200}


(from gem yard-0.9.9)
---
    [](*args)

---


# Hash::create

(from gem yard-0.9.9)
---
    create(*args)

---


# Hash::create_186

(from gem yard-0.9.9)
---
    create_186(*args)

---


