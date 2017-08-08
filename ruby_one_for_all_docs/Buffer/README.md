# Buffer < Object

---
# Includes:
(from gem postgres-pr-0.7.0)
    BinaryWriterMixin
    BinaryReaderMixin

(from gem postgres-pr-0.7.0)
---
Fixed size buffer.
---
# Constants:

NUL
:   [not documented]


# Class methods:

    from_string
    new
    of_size

# Instance methods:

    at_end?
    content
    copy_from_stream
    position
    position=
    read
    read_cstring
    read_rest
    size
    write
    write_cstring

# Buffer::from_string

(from gem postgres-pr-0.7.0)
---
    from_string(str)

---


# Buffer::new

(from gem postgres-pr-0.7.0)
---
    new(content)

---


# Buffer::of_size

(from gem postgres-pr-0.7.0)
---
    of_size(size)

---


# Buffer#at_end?

(from gem postgres-pr-0.7.0)
---
    at_end?()

---


# Buffer#content

(from gem postgres-pr-0.7.0)
---
    content()

---


# Buffer#copy_from_stream

(from gem postgres-pr-0.7.0)
---
    copy_from_stream(stream, n)

---


# Buffer#position

(from gem postgres-pr-0.7.0)
---
    position()

---


# Buffer#position=

(from gem postgres-pr-0.7.0)
---
    position=(new_pos)

---


# Buffer#read

(from gem postgres-pr-0.7.0)
---
    read(n)

---


# Buffer#read_cstring

(from gem postgres-pr-0.7.0)
---
    read_cstring()

---

returns a Ruby string without the trailing NUL character


# Buffer#read_rest

(from gem postgres-pr-0.7.0)
---
    read_rest()

---

read till the end of the buffer


# Buffer#size

(from gem postgres-pr-0.7.0)
---
    size()

---


# Buffer#write

(from gem postgres-pr-0.7.0)
---
    write(str)

---


# Buffer#write_cstring

(from gem postgres-pr-0.7.0)
---
    write_cstring(cstr)

---


