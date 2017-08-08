# Base64

(from ruby core)
---
The Base64 module provides for the encoding (#encode64, #strict_encode64,
#urlsafe_encode64) and decoding (#decode64, #strict_decode64,
#urlsafe_decode64) of binary data using a Base64 representation.

## Example

A simple encoding and decoding.

    require "base64"

    enc   = Base64.encode64('Send reinforcements')
                        # -> "U2VuZCByZWluZm9yY2VtZW50cw==\n"
    plain = Base64.decode64(enc)
                        # -> "Send reinforcements"

The purpose of using base64 to encode data is that it translates any binary
data into purely printable characters.
---
# Instance methods:

    decode64
    encode64
    strict_decode64
    strict_encode64
    urlsafe_decode64
    urlsafe_encode64

# Base64#decode64

(from ruby core)
---
    decode64(str)

---

Returns the Base64-decoded version of `str`. This method complies with RFC
2045. Characters outside the base alphabet are ignored.

    require 'base64'
    str = 'VGhpcyBpcyBsaW5lIG9uZQpUaGlzIG' +
          'lzIGxpbmUgdHdvClRoaXMgaXMgbGlu' +
          'ZSB0aHJlZQpBbmQgc28gb24uLi4K'
    puts Base64.decode64(str)

*Generates:*

    This is line one
    This is line two
    This is line three
    And so on...


# Base64#encode64

(from ruby core)
---
    encode64(bin)

---

Returns the Base64-encoded version of `bin`. This method complies with RFC
2045. Line feeds are added to every 60 encoded characters.

    require 'base64'
    Base64.encode64("Now is the time for all good coders\nto learn Ruby")

*Generates:*

    Tm93IGlzIHRoZSB0aW1lIGZvciBhbGwgZ29vZCBjb2RlcnMKdG8gbGVhcm4g
    UnVieQ==


# Base64#strict_decode64

(from ruby core)
---
    strict_decode64(str)

---

Returns the Base64-decoded version of `str`. This method complies with RFC
4648. ArgumentError is raised if `str` is incorrectly padded or contains
non-alphabet characters.  Note that CR or LF are also rejected.


# Base64#strict_encode64

(from ruby core)
---
    strict_encode64(bin)

---

Returns the Base64-encoded version of `bin`. This method complies with RFC
4648. No line feeds are added.


# Base64#urlsafe_decode64

(from ruby core)
---
    urlsafe_decode64(str)

---

Returns the Base64-decoded version of `str`. This method complies with ``Base
64 Encoding with URL and Filename Safe Alphabet'' in RFC 4648. The alphabet
uses '-' instead of '+' and '_' instead of '/'.

The padding character is optional. This method accepts both correctly-padded
and unpadded input. Note that it still rejects incorrectly-padded input.


# Base64#urlsafe_encode64

(from ruby core)
---
    urlsafe_encode64(bin, padding: true)

---

Returns the Base64-encoded version of `bin`. This method complies with ``Base
64 Encoding with URL and Filename Safe Alphabet'' in RFC 4648. The alphabet
uses '-' instead of '+' and '_' instead of '/'. Note that the result can still
contain '='. You can remove the padding by setting `padding` as false.


