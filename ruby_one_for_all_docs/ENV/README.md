# ENV < Object

(from ruby core)
---
ENV is a hash-like accessor for environment variables.
---
# Class methods:

    []
    []=
    assoc
    clear
    delete
    delete_if
    each
    each_key
    each_pair
    each_value
    empty?
    fetch
    has_key?
    has_value?
    include?
    index
    inspect
    invert
    keep_if
    key
    key?
    keys
    length
    member?
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
    to_s
    update
    value?
    values
    values_at

# ENV::[]

(from ruby core)
---
    ENV[name] -> value

---

Retrieves the `value` for environment variable `name` as a String.  Returns
`nil` if the named variable does not exist.


# ENV::[]=

(from ruby core)
---
    ENV[name] = value

---

Sets the environment variable `name` to `value`.  If the value given is `nil`
the environment variable is deleted. `name` must be a string.


# ENV::assoc

(from ruby core)
---
    ENV.assoc(name) -> Array or nil

---

Returns an Array of the name and value of the environment variable with `name`
or `nil` if the name cannot be found.


# ENV::clear

(from ruby core)
---
    ENV.clear

---

Removes every environment variable.


# ENV::delete

(from ruby core)
---
    ENV.delete(name)            -> value
    ENV.delete(name) { |name| } -> value

---

Deletes the environment variable with `name` and returns the value of the
variable.  If a block is given it will be called when the named environment
does not exist.


# ENV::delete_if

(from ruby core)
---
    ENV.delete_if { |name, value| } -> Hash
    ENV.delete_if                   -> Enumerator

---

Deletes every environment variable for which the block evaluates to `true`.

If no block is given an enumerator is returned instead.


# ENV::each

(from ruby core)
---
    ENV.each      { |name, value| } -> Hash
    ENV.each                        -> Enumerator
    ENV.each_pair { |name, value| } -> Hash
    ENV.each_pair                   -> Enumerator

---

Yields each environment variable `name` and `value`.

If no block is given an Enumerator is returned.


# ENV::each_key

(from ruby core)
---
    ENV.each_key { |name| } -> Hash
    ENV.each_key            -> Enumerator

---

Yields each environment variable name.

An Enumerator is returned if no block is given.


# ENV::each_pair

(from ruby core)
---
    ENV.each_pair { |name, value| } -> Hash
    ENV.each_pair                   -> Enumerator

---

Yields each environment variable `name` and `value`.

If no block is given an Enumerator is returned.


# ENV::each_value

(from ruby core)
---
    ENV.each_value { |value| } -> Hash
    ENV.each_value             -> Enumerator

---

Yields each environment variable `value`.

An Enumerator is returned if no block was given.


# ENV::empty?

(from ruby core)
---
    ENV.empty? -> true or false

---

Returns true when there are no environment variables


# ENV::fetch

(from ruby core)
---
    ENV.fetch(name)                        -> value
    ENV.fetch(name, default)               -> value
    ENV.fetch(name) { |missing_name| ... } -> value

---

Retrieves the environment variable `name`.

If the given name does not exist and neither `default` nor a block a provided
an IndexError is raised.  If a block is given it is called with the missing
name to provide a value.  If a default value is given it will be returned when
no block is given.


# ENV::has_key?

(from ruby core)
---
    ENV.has_key?(name) -> true or false

---

Returns `true` if there is an environment variable with the given `name`.


# ENV::has_value?

(from ruby core)
---
    ENV.has_value?(value) -> true or false

---

Returns `true` if there is an environment variable with the given `value`.


# ENV::include?

(from ruby core)
---
    ENV.include?(name) -> true or false

---

Returns `true` if there is an environment variable with the given `name`.


# ENV::index

(from ruby core)
---
    ENV.index(value) -> key

---

Deprecated method that is equivalent to ENV.key


# ENV::inspect

(from ruby core)
---
    ENV.inspect -> string

---

Returns the contents of the environment as a String.


# ENV::invert

(from ruby core)
---
    ENV.invert -> Hash

---

Returns a new hash created by using environment variable names as values and
values as names.


# ENV::keep_if

(from ruby core)
---
    ENV.keep_if { |name, value| } -> Hash
    ENV.keep_if                   -> Enumerator

---

Deletes every environment variable where the block evaluates to `false`.

Returns an enumerator if no block was given.


# ENV::key

(from ruby core)
---
    ENV.key(value) -> name

---

Returns the name of the environment variable with `value`.  If the value is
not found `nil` is returned.


# ENV::key?

(from ruby core)
---
    ENV.key?(name)     -> true or false

---

Returns `true` if there is an environment variable with the given `name`.


# ENV::keys

(from ruby core)
---
    ENV.keys -> Array

---

Returns every environment variable name in an Array


# ENV::length

(from ruby core)
---
    ENV.length

---

Returns the number of environment variables.


# ENV::member?

(from ruby core)
---
    ENV.member?(name)  -> true or false

---

Returns `true` if there is an environment variable with the given `name`.


# ENV::rassoc

(from ruby core)
---
    ENV.rassoc(value)

---

Returns an Array of the name and value of the environment variable with
`value` or `nil` if the value cannot be found.


# ENV::rehash

(from ruby core)
---
    ENV.rehash

---

Re-hashing the environment variables does nothing.  It is provided for
compatibility with Hash.


# ENV::reject

(from ruby core)
---
    ENV.reject { |name, value| } -> Hash
    ENV.reject                   -> Enumerator

---

Same as ENV#delete_if, but works on (and returns) a copy of the environment.


# ENV::reject!

(from ruby core)
---
    ENV.reject! { |name, value| } -> ENV or nil
    ENV.reject!                   -> Enumerator

---

Equivalent to ENV#delete_if but returns `nil` if no changes were made.

Returns an Enumerator if no block was given.


# ENV::replace

(from ruby core)
---
    ENV.replace(hash) -> env

---

Replaces the contents of the environment variables with the contents of
`hash`.


# ENV::select

(from ruby core)
---
    ENV.select { |name, value| } -> Hash
    ENV.select                   -> Enumerator

---

Returns a copy of the environment for entries where the block returns true.

Returns an Enumerator if no block was given.


# ENV::select!

(from ruby core)
---
    ENV.select! { |name, value| } -> ENV or nil
    ENV.select!                   -> Enumerator

---

Equivalent to ENV#keep_if but returns `nil` if no changes were made.


# ENV::shift

(from ruby core)
---
    ENV.shift -> Array or nil

---

Removes an environment variable name-value pair from ENV and returns it as an
Array.  Returns `nil` if when the environment is empty.


# ENV::size

(from ruby core)
---
    ENV.size

---

Returns the number of environment variables.


# ENV::store

(from ruby core)
---
    ENV.store(name, value) -> value

---

Sets the environment variable `name` to `value`.  If the value given is `nil`
the environment variable is deleted. `name` must be a string.


# ENV::to_a

(from ruby core)
---
    ENV.to_a -> Array

---

Converts the environment variables into an array of names and value arrays.

    ENV.to_a # => [["TERM", "xterm-color"], ["SHELL", "/bin/bash"], ...]


# ENV::to_h

(from ruby core)
---
    ENV.to_hash -> hash
    ENV.to_h    -> hash

---

Creates a hash with a copy of the environment variables.


# ENV::to_hash

(from ruby core)
---
    ENV.to_hash -> hash

---

Creates a hash with a copy of the environment variables.


# ENV::to_s

(from ruby core)
---
    ENV.to_s -> "ENV"

---

Returns "ENV"


# ENV::update

(from ruby core)
---
    ENV.update(hash)                                  -> Hash
    ENV.update(hash) { |name, old_value, new_value| } -> Hash

---

Adds the contents of `hash` to the environment variables.  If no block is
specified entries with duplicate keys are overwritten, otherwise the value of
each duplicate name is determined by calling the block with the key, its value
from the environment and its value from the hash.


# ENV::value?

(from ruby core)
---
    ENV.value?(value) -> true or false

---

Returns `true` if there is an environment variable with the given `value`.


# ENV::values

(from ruby core)
---
    ENV.values -> Array

---

Returns every environment variable value as an Array


# ENV::values_at

(from ruby core)
---
    ENV.values_at(name, ...) -> Array

---

Returns an array containing the environment variable values associated with
the given names.  See also ENV.select.


