# SecureRandom

(from ruby core)
---
## Secure random number generator interface.

This library is an interface to secure random number generators which are
suitable for generating session keys in HTTP cookies, etc.

You can use this library in your application by requiring it:

    require 'securerandom'

It supports the following secure random number generators:

*   openssl
*   /dev/urandom
*   Win32


### Examples

Generate random hexadecimal strings:

    require 'securerandom'

    p SecureRandom.hex(10) #=> "52750b30ffbc7de3b362"
    p SecureRandom.hex(10) #=> "92b15d6c8dc4beb5f559"
    p SecureRandom.hex(13) #=> "39b290146bea6ce975c37cfc23"

Generate random base64 strings:

    p SecureRandom.base64(10) #=> "EcmTPZwWRAozdA=="
    p SecureRandom.base64(10) #=> "KO1nIU+p9DKxGg=="
    p SecureRandom.base64(12) #=> "7kJSM/MzBJI+75j8"

Generate random binary strings:

    p SecureRandom.random_bytes(10) #=> "\016\t{\370g\310pbr\301"
    p SecureRandom.random_bytes(10) #=> "\323U\030TO\234\357\020\a\337"

Generate UUIDs:

    p SecureRandom.uuid #=> "2d931510-d99f-494a-8c67-87feb05e1594"
    p SecureRandom.uuid #=> "bad85eb9-0713-4da7-8d36-07a8e4b00eab"
---
# Class methods:

    bytes
    gen_random

# SecureRandom::bytes

(from ruby core)
---
    bytes(n)

---


# SecureRandom::gen_random

(from ruby core)
---
    gen_random(n)

---


(from gem activesupport-5.1.2)
---
# Constants:

BASE58_ALPHABET
:   [not documented]


# Class methods:

    base58

# SecureRandom::base58

(from gem activesupport-5.1.2)
---
    base58(n = 16)

---

SecureRandom.base58 generates a random base58 string.

The argument *n* specifies the length, of the random string to be generated.

If *n* is not specified or is `nil`, 16 is assumed. It may be larger in the
future.

The result may contain alphanumeric characters except 0, O, I and l

    p SecureRandom.base58 # => "4kUgL2pdQMSCQtjE"
    p SecureRandom.base58(24) # => "77TMHrHJFvFDwodq8w7Ev2m7"


