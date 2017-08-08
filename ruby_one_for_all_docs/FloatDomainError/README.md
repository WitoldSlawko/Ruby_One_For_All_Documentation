# FloatDomainError < RangeError

(from ruby core)
---
Raised when attempting to convert special float values (in particular
`infinite` or `NaN`) to numerical classes which don't support them.

    Float::INFINITY.to_r
    #=> FloatDomainError: Infinity
---
