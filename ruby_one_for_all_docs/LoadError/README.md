# LoadError < ScriptError

(from ruby core)
---
Raised when a file required (a Ruby script, extension library, ...) fails to
load.

    require 'this/file/does/not/exist'

*raises the exception:*

    LoadError: no such file to load -- this/file/does/not/exist
---
# Instance methods:

    path

# Attributes:

    attr_reader path

(from gem activesupport-5.1.2)
---
# Constants:

REGEXPS
:   [not documented]


# Instance methods:

    is_missing?

# LoadError#is_missing?

(from gem activesupport-5.1.2)
---
    is_missing?(location)

---

Returns true if the given path name (except perhaps for the ".rb" extension)
is the missing file which caused the exception to be raised.


