# Prime < Object

---
# Includes:
(from ruby core)
    Enumerable
    Singleton

---
# Extended by:
Forwardable (from ruby core)

(from ruby core)
---
The set of all prime numbers.

## Example

    Prime.each(100) do |prime|
      p prime  #=> 2, 3, 5, 7, 11, ...., 97
    end

Prime is Enumerable:

    Prime.first 5 # => [2, 3, 5, 7, 11]

## Retrieving the instance

For convenience, each instance method of `Prime`.instance can be accessed as a
class method of `Prime`.

e.g.
    Prime.instance.prime?(2)  #=> true
    Prime.prime?(2)           #=> true

## Generators

A "generator" provides an implementation of enumerating pseudo-prime numbers
and it remembers the position of enumeration and upper bound. Furthermore, it
is an external iterator of prime enumeration which is compatible with an
Enumerator.

`Prime`::`PseudoPrimeGenerator` is the base class for generators. There are
few implementations of generator.

`Prime`::`EratosthenesGenerator`
:   Uses eratosthenes' sieve.
`Prime`::`TrialDivisionGenerator`
:   Uses the trial division method.
`Prime`::`Generator23`
:   Generates all positive integers which are not divisible by either 2 or 3.
    This sequence is very bad as a pseudo-prime sequence. But this is faster
    and uses much less memory than the other generators. So, it is suitable
    for factorizing an integer which is not large but has many prime factors.
    e.g. for Prime#prime? .

---
# Instance methods:

    each
    int_from_prime_division
    prime?
    prime_division

# Prime#each

(from ruby core)
---
    each(ubound = nil, generator = EratosthenesGenerator.new, &block)

---

Iterates the given block over all prime numbers.

## Parameters

`ubound`
:   Optional. An arbitrary positive number. The upper bound of enumeration.
    The method enumerates prime numbers infinitely if `ubound` is nil.
`generator`
:   Optional. An implementation of pseudo-prime generator.


## Return value

An evaluated value of the given block at the last time. Or an enumerator which
is compatible to an `Enumerator` if no block given.

## Description

Calls `block` once for each prime number, passing the prime as a parameter.

`ubound`
:   Upper bound of prime numbers. The iterator stops after it yields all prime
    numbers p <= `ubound`.



# Prime#int_from_prime_division

(from ruby core)
---
    int_from_prime_division(pd)

---

Re-composes a prime factorization and returns the product.

## Parameters
`pd`
:   Array of pairs of integers. The each internal pair consists of a prime
    number -- a prime factor -- and a natural number -- an exponent.


## Example
For `[[p_1, e_1], [p_2, e_2], ...., [p_n, e_n]]`, it returns:

    p_1**e_1 * p_2**e_2 * .... * p_n**e_n.

    Prime.int_from_prime_division([[2,2], [3,1]])  #=> 12


# Prime#prime?

(from ruby core)
---
    prime?(value, generator = Prime::Generator23.new)

---

Returns true if `value` is a prime number, else returns false.

## Parameters

`value`
:   an arbitrary integer to be checked.
`generator`
:   optional. A pseudo-prime generator.



# Prime#prime_division

(from ruby core)
---
    prime_division(value, generator = Prime::Generator23.new)

---

Returns the factorization of `value`.

## Parameters
`value`
:   An arbitrary integer.
`generator`
:   Optional. A pseudo-prime generator. `generator`.succ must return the next
    pseudo-prime number in the ascending order. It must generate all prime
    numbers, but may also generate non prime numbers too.


### Exceptions
`ZeroDivisionError`
:   when `value` is zero.


## Example
For an arbitrary integer:

    n = p_1**e_1 * p_2**e_2 * .... * p_n**e_n,

prime_division(n) returns:

    [[p_1, e_1], [p_2, e_2], ...., [p_n, e_n]].

    Prime.prime_division(12) #=> [[2,2], [3,1]]


