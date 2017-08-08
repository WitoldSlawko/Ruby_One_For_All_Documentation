# Insertion < Object

(from gem yard-0.9.9)
---
The Insertion class inserts a value before or after another value in a list.

@example
    Insertion.new([1, 2, 3], 4).before(3) # => [1, 2, 4, 3]
---
# Class methods:

    new

# Instance methods:

    after
    after_any
    before
    before_any
    insertion

# Insertion::new

(from gem yard-0.9.9)
---
    new(list, value)

---

Creates an insertion object on a list with a value to be inserted. To finalize
the insertion, call {#before} or {#after} on the object.

@param [Array] list the list to perform the insertion on @param [Object] value
the value to insert


# Insertion#after

(from gem yard-0.9.9)
---
    after(val, recursive = false)

---

Inserts the value after `val`.

@example If subsections are ignored
    Insertion.new([1, [2], 3], :X).after(1) # => [1, [2], :X, 3]

@param [Object] val the object the value will be inserted after @param
[Boolean] recursive look inside sublists


# Insertion#after_any

(from gem yard-0.9.9)
---
    after_any(val)

---

Alias for {#after} with `recursive` set to true @since 0.6.0


# Insertion#before

(from gem yard-0.9.9)
---
    before(val, recursive = false)

---

Inserts the value before `val` @param [Object] val the object the value will
be inserted before @param [Boolean] recursive look inside sublists


# Insertion#before_any

(from gem yard-0.9.9)
---
    before_any(val)

---

Alias for {#before} with `recursive` set to true @since 0.6.0


# Insertion#insertion

(from gem yard-0.9.9)
---
    insertion(val, rel, recursive = false, list = @list)

---

This method performs the actual insertion

@param [Object] val the value to insert @param [Fixnum] rel the relative index
(0 or 1) of where the object
    should be placed

@param [Boolean] recursive look inside sublists @param [Array] list the list
to place objects into


