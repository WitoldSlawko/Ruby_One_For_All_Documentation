# Sprockets

---
# Extended by:
(from gem sprockets-3.7.1)
    ProcessorUtils
    Configuration

(from gem sprockets-3.7.1)
---





































Define some basic Sprockets error classes































---
# Constants:

Index
:   `Cached` is a special cached version of `Environment`.

    The expection is that all of its file system methods are cached for the
    instances lifetime. This makes `Cached` much faster. This behavior is
    ideal in production environments where the file system is immutable.

    `Cached` should not be initialized directly. Instead use
    `Environment#cached`.
SassFunctions
:   Deprecated: Use Sprockets::SassProcessor::Functions instead.
VERSION
:   [not documented]


(from gem sprockets-rails-3.2.0)
---







---
---
Also found in:
    gem sass-rails-5.0.6

