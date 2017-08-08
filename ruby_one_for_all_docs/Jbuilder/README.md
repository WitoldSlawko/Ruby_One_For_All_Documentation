# Jbuilder < Object

(from gem jbuilder-2.7.0)
---





---
# Constants:

BLANK
:   [not documented]
DependencyTracker
:   [not documented]
NON_ENUMERABLES
:   [not documented]


# Class methods:

    encode
    ignore_nil
    key_format
    new

# Instance methods:

    _blank?
    _extract_hash_values
    _extract_method_values
    _is_collection?
    _key
    _map_collection
    _merge_block
    _merge_values
    _object_respond_to?
    _scope
    _set_value
    array!
    attributes!
    call
    child!
    extract!
    ignore_nil!
    key_format!
    merge!
    method_missing
    nil!
    null!
    set!
    target!

# Jbuilder::encode

(from gem jbuilder-2.7.0)
---
    encode(*args, &block)

---

Yields a builder and automatically turns the result into a JSON string


# Jbuilder::ignore_nil

(from gem jbuilder-2.7.0)
---
    ignore_nil(value = true)

---

Same as instance method ignore_nil! except sets the default.


# Jbuilder::key_format

(from gem jbuilder-2.7.0)
---
    key_format(*args)

---

Same as the instance method key_format! except sets the default.


# Jbuilder::new

(from gem jbuilder-2.7.0)
---
    new(options = {}) { |self| ... }

---


# Jbuilder#array!

(from gem jbuilder-2.7.0)
---
    array!(collection = [], *attributes)

---

Turns the current element into an array and iterates over the passed
collection, adding each iteration as an element of the resulting array.

Example:

    json.array!(@people) do |person|
      json.name person.name
      json.age calculate_age(person.birthday)
    end

    [ { "name": David", "age": 32 }, { "name": Jamie", "age": 31 } ]

If you are using Ruby 1.9+, you can use the call syntax instead of an explicit
extract! call:

    json.(@people) { |person| ... }

It's generally only needed to use this method for top-level arrays. If you
have named arrays, you can do:

    json.people(@people) do |person|
      json.name person.name
      json.age calculate_age(person.birthday)
    end

    { "people": [ { "name": David", "age": 32 }, { "name": Jamie", "age": 31 } ] }

If you omit the block then you can set the top level array directly:

    json.array! [1, 2, 3]

    [1,2,3]


# Jbuilder#attributes!

(from gem jbuilder-2.7.0)
---
    attributes!()

---

Returns the attributes of the current builder.


# Jbuilder#call

(from gem jbuilder-2.7.0)
---
    call(object, *attributes)

---


# Jbuilder#child!

(from gem jbuilder-2.7.0)
---
    child!() { |self| ... }

---

Turns the current element into an array and yields a builder to add a hash.

Example:

    json.comments do
      json.child! { json.content "hello" }
      json.child! { json.content "world" }
    end

    { "comments": [ { "content": "hello" }, { "content": "world" } ]}

More commonly, you'd use the combined iterator, though:

    json.comments(@post.comments) do |comment|
      json.content comment.formatted_content
    end


# Jbuilder#extract!

(from gem jbuilder-2.7.0)
---
    extract!(object, *attributes)

---

Extracts the mentioned attributes or hash elements from the passed object and
turns them into attributes of the JSON.

Example:

    @person = Struct.new(:name, :age).new('David', 32)

    or you can utilize a Hash

    @person = { name: 'David', age: 32 }

    json.extract! @person, :name, :age

    { "name": David", "age": 32 }, { "name": Jamie", "age": 31 }

You can also use the call syntax instead of an explicit extract! call:

    json.(@person, :name, :age)


# Jbuilder#ignore_nil!

(from gem jbuilder-2.7.0)
---
    ignore_nil!(value = true)

---

If you want to skip adding nil values to your JSON hash. This is useful for
JSON clients that don't deal well with nil values, and would prefer not to
receive keys which have null values.

Example:
    json.ignore_nil! false
    json.id User.new.id

    { "id": null }

    json.ignore_nil!
    json.id User.new.id

    {}


# Jbuilder#key_format!

(from gem jbuilder-2.7.0)
---
    key_format!(*args)

---

Specifies formatting to be applied to the key. Passing in a name of a function
will cause that function to be called on the key.  So :upcase will upper case
the key.  You can also pass in lambdas for more complex transformations.

Example:

    json.key_format! :upcase
    json.author do
      json.name "David"
      json.age 32
    end

    { "AUTHOR": { "NAME": "David", "AGE": 32 } }

You can pass parameters to the method using a hash pair.

    json.key_format! camelize: :lower
    json.first_name "David"

    { "firstName": "David" }

Lambdas can also be used.

    json.key_format! ->(key){ "_" + key }
    json.first_name "David"

    { "_first_name": "David" }


# Jbuilder#merge!

(from gem jbuilder-2.7.0)
---
    merge!(hash_or_array)

---

Merges hash or array into current builder.


# Jbuilder#method_missing

(from gem jbuilder-2.7.0)
---
    method_missing(*args)

---


# Jbuilder#nil!

(from gem jbuilder-2.7.0)
---
    nil!()

---

Returns the nil JSON.


# Jbuilder#null!

(from gem jbuilder-2.7.0)
---
    null!()

---


# Jbuilder#set!

(from gem jbuilder-2.7.0)
---
    set!(key, value = BLANK, *args) { |self| ... }

---


# Jbuilder#target!

(from gem jbuilder-2.7.0)
---
    target!()

---

Encodes the current builder as JSON.


# Jbuilder#_blank?

(from gem jbuilder-2.7.0)
---
    _blank?(value=@attributes)

---


# Jbuilder#_extract_hash_values

(from gem jbuilder-2.7.0)
---
    _extract_hash_values(object, attributes)

---


# Jbuilder#_extract_method_values

(from gem jbuilder-2.7.0)
---
    _extract_method_values(object, attributes)

---


# Jbuilder#_is_collection?

(from gem jbuilder-2.7.0)
---
    _is_collection?(object)

---


# Jbuilder#_key

(from gem jbuilder-2.7.0)
---
    _key(key)

---


# Jbuilder#_map_collection

(from gem jbuilder-2.7.0)
---
    _map_collection(collection) { |element| ... }

---


# Jbuilder#_merge_block

(from gem jbuilder-2.7.0)
---
    _merge_block(key) { |self| ... }

---


# Jbuilder#_merge_values

(from gem jbuilder-2.7.0)
---
    _merge_values(current_value, updates)

---


# Jbuilder#_object_respond_to?

(from gem jbuilder-2.7.0)
---
    _object_respond_to?(object, *methods)

---


# Jbuilder#_scope

(from gem jbuilder-2.7.0)
---
    _scope() { || ... }

---


# Jbuilder#_set_value

(from gem jbuilder-2.7.0)
---
    _set_value(key, value)

---


