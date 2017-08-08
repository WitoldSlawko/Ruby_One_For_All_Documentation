# SymbolHash < Hash

(from gem yard-0.9.9)
---
A subclass of Hash where all keys are converted into Symbols, and optionally,
all String values are converted into Symbols.
---
# Class methods:

    []
    new

# Instance methods:

    []
    []=
    delete
    has_key?
    key?
    merge
    merge!
    update

# SymbolHash::[]

(from gem yard-0.9.9)
---
    [](*hsh)

---

@overload [](hash)
    Creates a SymbolHash object from an existing Hash

    @example
      SymbolHash['x' => 1, :y => 2] # => #<SymbolHash:0x...>
    @param [Hash] hash the hash object
    @return [SymbolHash] a new SymbolHash from a hash object

@overload [](*list)
    Creates a SymbolHash from an even list of keys and values

    @example
      SymbolHash[key1, value1, key2, value2, ...]
    @param [Array] list an even list of key followed by value
    @return [SymbolHash] a new SymbolHash object


# SymbolHash::new

(from gem yard-0.9.9)
---
    new(symbolize_value = true)

---

Creates a new SymbolHash object

@param [Boolean] symbolize_value converts any String values into Symbols
    if this is set to +true+.


# SymbolHash#[]

(from gem yard-0.9.9)
---
    [](key)

---

#### (Uses superclass method RDoc::AnyMethod: Hash::[])
---

Accessed a symbolized key @param [#to_sym] key the key to access @return
[Object] the value associated with the key


# SymbolHash#[]=

(from gem yard-0.9.9)
---
    []=(key, value)

---

Assigns a value to a symbolized key @param [#to_sym] key the key @param
[Object] value the value to be assigned. If this is a String and
    values are set to be symbolized, it will be converted into a Symbol.


# SymbolHash#delete

(from gem yard-0.9.9)
---
    delete(key)

---

Deleted a key and value associated with it @param [#to_sym] key the key to
delete @return [void]


# SymbolHash#has_key?

(from gem yard-0.9.9)
---
    has_key?(key)

---


# SymbolHash#key?

(from gem yard-0.9.9)
---
    key?(key)

---

Tests if a symbolized key exists @param [#to_sym] key the key to test @return
[Boolean] whether the key exists


# SymbolHash#merge

(from gem yard-0.9.9)
---
    merge(hash)

---

Merges the contents of another hash into a new SymbolHash object

@param [Hash] hash the hash of objects to copy @return [SymbolHash] a new
SymbolHash containing the merged data


# SymbolHash#merge!

(from gem yard-0.9.9)
---
    merge!(hash)

---


# SymbolHash#update

(from gem yard-0.9.9)
---
    update(hash)

---

Updates the object with the contents of another Hash object. This method
modifies the original SymbolHash object

@param [Hash] hash the hash object to copy the values from @return
[SymbolHash] self


