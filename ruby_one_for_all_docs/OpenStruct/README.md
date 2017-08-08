# OpenStruct < Object

(from ruby core)
---

An OpenStruct is a data structure, similar to a Hash, that allows the
definition of arbitrary attributes with their accompanying values. This is
accomplished by using Ruby's metaprogramming to define methods on the class
itself.

## Examples:

    require 'ostruct'

    person = OpenStruct.new
    person.name    = "John Smith"
    person.age     = 70
    person.pension = 300

    puts person.name     # -> "John Smith"
    puts person.age      # -> 70
    puts person.address  # -> nil

An OpenStruct employs a Hash internally to store the methods and values and
can even be initialized with one:

    australia = OpenStruct.new(:country => "Australia", :population => 20_000_000)
    p australia   # -> <OpenStruct country="Australia" population=20000000>

Hash keys with spaces or characters that would normally not be able to use for
method calls (e.g. ()[]*) will not be immediately available on the OpenStruct
object as a method for retrieval or assignment, but can be still be reached
through the Object#send method.

    measurements = OpenStruct.new("length (in inches)" => 24)
    measurements.send("length (in inches)")  # -> 24

    data_point = OpenStruct.new(:queued? => true)
    data_point.queued?                       # -> true
    data_point.send("queued?=",false)
    data_point.queued?                       # -> false

Removing the presence of a method requires the execution the delete_field
method as setting the property value to `nil` will not remove the method.

    first_pet = OpenStruct.new(:name => 'Rowdy', :owner => 'John Smith')
    first_pet.owner = nil
    second_pet = OpenStruct.new(:name => 'Rowdy')

    first_pet == second_pet   # -> false

    first_pet.delete_field(:owner)
    first_pet == second_pet   # -> true

## Implementation:

An OpenStruct utilizes Ruby's method lookup structure to find and define the
necessary methods for properties. This is accomplished through the method
method_missing and define_method.

This should be a consideration if there is a concern about the performance of
the objects that are created, as there is much more overhead in the setting of
these properties compared to using a Hash or a Struct.
---
# Class methods:

    json_create
    new

# Instance methods:

    ==
    []
    []=
    as_json
    delete_field
    dig
    each_pair
    eql?
    freeze
    hash
    initialize_copy
    inspect
    marshal_dump
    marshal_load
    respond_to_missing?
    to_h
    to_json
    to_s

# OpenStruct::json_create

(from ruby core)
---
    json_create(object)

---

Deserializes JSON string by constructing new Struct object with values `t`
serialized by `to_json`.


# OpenStruct::new

(from ruby core)
---
    new(hash=nil)

---

Creates a new OpenStruct object.  By default, the resulting OpenStruct object
will have no attributes.

The optional `hash`, if given, will generate attributes and values (can be a
Hash, an OpenStruct or a Struct). For example:

    require 'ostruct'
    hash = { "country" => "Australia", :population => 20_000_000 }
    data = OpenStruct.new(hash)

    p data        # -> <OpenStruct country="Australia" population=20000000>


# OpenStruct#==

(from ruby core)
---
    ==(other)

---

Compares this object and `other` for equality.  An OpenStruct is equal to
`other` when `other` is an OpenStruct and the two objects' Hash tables are
equal.


# OpenStruct#[]

(from ruby core)
---
    [](name)

---

Returns the value of a member.

    person = OpenStruct.new('name' => 'John Smith', 'age' => 70)
    person[:age] # => 70, same as ostruct.age


# OpenStruct#[]=

(from ruby core)
---
    []=(name, value)

---

Sets the value of a member.

    person = OpenStruct.new('name' => 'John Smith', 'age' => 70)
    person[:age] = 42 # => equivalent to ostruct.age = 42
    person.age # => 42


# OpenStruct#as_json

(from ruby core)
---
    as_json(*)

---

Returns a hash, that will be turned into a JSON object and represent this
object.


# OpenStruct#delete_field

(from ruby core)
---
    delete_field(name)

---

Remove the named field from the object. Returns the value that the field
contained if it was defined.

    require 'ostruct'

    person = OpenStruct.new('name' => 'John Smith', 'age' => 70)

    person.delete_field('name')  # => 'John Smith'


# OpenStruct#dig

(from ruby core)
---
    dig(name, *names)

---

Retrieves the value object corresponding to the each `name` objects
repeatedly.

    address = OpenStruct.new('city' => "Anytown NC", 'zip' => 12345)
    person = OpenStruct.new('name' => 'John Smith', 'address' => address)
    person.dig(:address, 'zip') # => 12345
    person.dig(:business_address, 'zip') # => nil


# OpenStruct#each_pair

(from ruby core)
---
    each_pair() { |p| ... }

---

Yields all attributes (as a symbol) along with the corresponding values or
returns an enumerator if not block is given. Example:

    require 'ostruct'
    data = OpenStruct.new("country" => "Australia", :population => 20_000_000)
    data.each_pair.to_a  # => [[:country, "Australia"], [:population, 20000000]]


# OpenStruct#eql?

(from ruby core)
---
    eql?(other)

---

Compares this object and `other` for equality.  An OpenStruct is eql? to
`other` when `other` is an OpenStruct and the two objects' Hash tables are
eql?.


# OpenStruct#freeze

(from ruby core)
---
    freeze()

---

#### (Uses superclass method RDoc::AnyMethod: Object#freeze)
---


# OpenStruct#hash

(from ruby core)
---
    hash()

---

Compute a hash-code for this OpenStruct. Two hashes with the same content will
have the same hash code (and will be eql?).


# OpenStruct#initialize_copy

(from ruby core)
---
    initialize_copy(orig)

---

Duplicate an OpenStruct object members.


# OpenStruct#inspect

(from ruby core)
---
    inspect()

---

Returns a string containing a detailed summary of the keys and values.


# OpenStruct#marshal_dump

(from ruby core)
---
    marshal_dump()

---

Provides marshalling support for use by the Marshal library.


# OpenStruct#marshal_load

(from ruby core)
---
    marshal_load(x)

---

Provides marshalling support for use by the Marshal library.


# OpenStruct#respond_to_missing?

(from ruby core)
---
    respond_to_missing?(mid, include_private = false)

---

#### (Uses superclass method RDoc::AnyMethod: Object#respond_to_missing?)
---


# OpenStruct#to_h

(from ruby core)
---
    to_h()

---

Converts the OpenStruct to a hash with keys representing each attribute (as
symbols) and their corresponding values Example:

    require 'ostruct'
    data = OpenStruct.new("country" => "Australia", :population => 20_000_000)
    data.to_h   # => {:country => "Australia", :population => 20000000 }


# OpenStruct#to_json

(from ruby core)
---
    to_json(*args)

---

Stores class name (OpenStruct) with this struct's values `v` as a JSON string.


# OpenStruct#to_s

(from ruby core)
---
    to_s()

---


