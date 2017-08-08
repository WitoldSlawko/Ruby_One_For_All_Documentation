# TempIO < Tempfile

(from ruby core)
---
A StringIO duck-typed class that uses Tempfile instead of String as the
backing store.

This is available when rubygems/test_utilities is required.
---
# Class methods:

    new

# Instance methods:

    string

# TempIO::new

(from ruby core)
---
    new(string = '')

---

#### (Uses superclass method RDoc::AnyMethod: Tempfile::new)
---

Creates a new TempIO that will be initialized to contain `string`.


# TempIO#string

(from ruby core)
---
    string()

---

The content of the TempIO as a String.


