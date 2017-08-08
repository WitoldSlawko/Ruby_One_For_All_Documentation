# BinaryWriterMixin

(from gem postgres-pr-0.7.0)
---
# Instance methods:

    pw
    write_byte
    write_int16_little
    write_int16_native
    write_int16_network
    write_int32_little
    write_int32_native
    write_int32_network
    write_int8
    write_word16_little
    write_word16_native
    write_word16_network
    write_word32_little
    write_word32_native
    write_word32_network
    write_word8

# BinaryWriterMixin#write_byte

(from gem postgres-pr-0.7.0)
---
    write_byte(val)

---


# BinaryWriterMixin#write_int16_little

(from gem postgres-pr-0.7.0)
---
    write_int16_little(val)

---


# BinaryWriterMixin#write_int16_native

(from gem postgres-pr-0.7.0)
---
    write_int16_native(val)

---

### Signed


# BinaryWriterMixin#write_int16_network

(from gem postgres-pr-0.7.0)
---
    write_int16_network(val)

---


# BinaryWriterMixin#write_int32_little

(from gem postgres-pr-0.7.0)
---
    write_int32_little(val)

---


# BinaryWriterMixin#write_int32_native

(from gem postgres-pr-0.7.0)
---
    write_int32_native(val)

---

### Signed


# BinaryWriterMixin#write_int32_network

(from gem postgres-pr-0.7.0)
---
    write_int32_network(val)

---


# BinaryWriterMixin#write_int8

(from gem postgres-pr-0.7.0)
---
    write_int8(val)

---


# BinaryWriterMixin#write_word16_little

(from gem postgres-pr-0.7.0)
---
    write_word16_little(val)

---


# BinaryWriterMixin#write_word16_native

(from gem postgres-pr-0.7.0)
---
    write_word16_native(val)

---

### Unsigned


# BinaryWriterMixin#write_word16_network

(from gem postgres-pr-0.7.0)
---
    write_word16_network(val)

---


# BinaryWriterMixin#write_word32_little

(from gem postgres-pr-0.7.0)
---
    write_word32_little(val)

---


# BinaryWriterMixin#write_word32_native

(from gem postgres-pr-0.7.0)
---
    write_word32_native(val)

---

### Unsigned


# BinaryWriterMixin#write_word32_network

(from gem postgres-pr-0.7.0)
---
    write_word32_network(val)

---


# BinaryWriterMixin#write_word8

(from gem postgres-pr-0.7.0)
---
    write_word8(val)

---

no byteorder for 8 bit!


# BinaryWriterMixin#pw

(from gem postgres-pr-0.7.0)
---
    pw(val, template)

---

shortcut for pack and write


