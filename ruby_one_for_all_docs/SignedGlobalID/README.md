# SignedGlobalID < GlobalID

(from gem globalid-0.4.0)
---
# Constants:

DEFAULT_PURPOSE
:   [not documented]


# Class methods:

    expires_in
    new
    parse
    pick_purpose
    pick_verifier
    raise_if_expired
    verifier
    verify

# Instance methods:

    ==
    encoded_expiration
    expires_at
    pick_expiration
    purpose
    to_h
    to_param
    to_s
    verifier

# Attributes:

    attr_accessor expires_in
    attr_accessor verifier
    attr_reader expires_at
    attr_reader purpose
    attr_reader verifier

# SignedGlobalID::new

(from gem globalid-0.4.0)
---
    new(gid, options = {})

---

#### (Uses superclass method RDoc::AnyMethod: GlobalID::new)
---


# SignedGlobalID::parse

(from gem globalid-0.4.0)
---
    parse(sgid, options = {})

---

#### (Uses superclass method RDoc::AnyMethod: GlobalID::parse)
---


# SignedGlobalID::pick_purpose

(from gem globalid-0.4.0)
---
    pick_purpose(options)

---


# SignedGlobalID::pick_verifier

(from gem globalid-0.4.0)
---
    pick_verifier(options)

---

Grab the verifier from options and fall back to SignedGlobalID.verifier. Raise
ArgumentError if neither is available.


# SignedGlobalID::raise_if_expired

(from gem globalid-0.4.0)
---
    raise_if_expired(expires_at)

---


# SignedGlobalID::verify

(from gem globalid-0.4.0)
---
    verify(sgid, options)

---


# SignedGlobalID#==

(from gem globalid-0.4.0)
---
    ==(other)

---

#### (Uses superclass method RDoc::AnyMethod: GlobalID#==)
---


# SignedGlobalID#to_h

(from gem globalid-0.4.0)
---
    to_h()

---


# SignedGlobalID#to_param

(from gem globalid-0.4.0)
---
    to_param()

---


# SignedGlobalID#to_s

(from gem globalid-0.4.0)
---
    to_s()

---


# SignedGlobalID#encoded_expiration

(from gem globalid-0.4.0)
---
    encoded_expiration()

---


# SignedGlobalID#pick_expiration

(from gem globalid-0.4.0)
---
    pick_expiration(options)

---


