# RuntimeError < StandardError

(from ruby core)
---
A generic error class raised when an invalid operation is attempted.

    [1, 2, 3].freeze << 4

*raises the exception:*

    RuntimeError: can't modify frozen Array

Kernel.raise will raise a RuntimeError if no Exception class is specified.

    raise "ouch"

*raises the exception:*

    RuntimeError: ouch
---
