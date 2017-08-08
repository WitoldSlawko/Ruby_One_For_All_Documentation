# BinaryReaderMixin

(from gem postgres-pr-0.7.0)
---
This mixin solely depends on method read(n), which must be defined in the
class/module where you mixin this module.
---
# Instance methods:

    read_byte
    read_int16_big
    read_int16_little
    read_int16_native
    read_int32_big
    read_int32_little
    read_int32_native
    read_int8
    read_uint8
    read_word16_big
    read_word16_little
    read_word16_native
    read_word32_big
    read_word32_little
    read_word32_native
    read_word8
    readn
    ru
    ru_swap

# BinaryReaderMixin#read_byte

(from gem postgres-pr-0.7.0)
---
    read_byte()

---


# BinaryReaderMixin#read_int16_big

(from gem postgres-pr-0.7.0)
---
    read_int16_big()

---


# BinaryReaderMixin#read_int16_little

(from gem postgres-pr-0.7.0)
---
    read_int16_little()

---


# BinaryReaderMixin#read_int16_native

(from gem postgres-pr-0.7.0)
---
    read_int16_native()

---

### Signed


# BinaryReaderMixin#read_int32_big

(from gem postgres-pr-0.7.0)
---
    read_int32_big()

---


# BinaryReaderMixin#read_int32_little

(from gem postgres-pr-0.7.0)
---
    read_int32_little()

---


# BinaryReaderMixin#read_int32_native

(from gem postgres-pr-0.7.0)
---
    read_int32_native()

---

### Signed


# BinaryReaderMixin#read_int8

(from gem postgres-pr-0.7.0)
---
    read_int8()

---


# BinaryReaderMixin#read_uint8

(from gem postgres-pr-0.7.0)
---
    read_uint8()

---

## Aliases


# BinaryReaderMixin#read_word16_big

(from gem postgres-pr-0.7.0)
---
    read_word16_big()

---


# BinaryReaderMixin#read_word16_little

(from gem postgres-pr-0.7.0)
---
    read_word16_little()

---


# BinaryReaderMixin#read_word16_native

(from gem postgres-pr-0.7.0)
---
    read_word16_native()

---

### Unsigned


# BinaryReaderMixin#read_word32_big

(from gem postgres-pr-0.7.0)
---
    read_word32_big()

---


# BinaryReaderMixin#read_word32_little

(from gem postgres-pr-0.7.0)
---
    read_word32_little()

---


# BinaryReaderMixin#read_word32_native

(from gem postgres-pr-0.7.0)
---
    read_word32_native()

---

### Unsigned


# BinaryReaderMixin#read_word8

(from gem postgres-pr-0.7.0)
---
    read_word8()

---

no byteorder for 8 bit!


# BinaryReaderMixin#readn

(from gem postgres-pr-0.7.0)
---
    readn(n)

---

read exactly n characters, otherwise raise an exception.


# BinaryReaderMixin#ru

(from gem postgres-pr-0.7.0)
---
    ru(size, template)

---

shortcut method for readn+unpack


# BinaryReaderMixin#ru_swap

(from gem postgres-pr-0.7.0)
---
    ru_swap(size, template, byteorder)

---

same as method `ru`, but swap bytes if native byteorder == *byteorder*



