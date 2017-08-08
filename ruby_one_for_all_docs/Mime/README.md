# Mime

(from gem actionpack-5.1.2)
---
# Constants:

ALL
:   ALL isn't a real MIME type, so we don't register it for lookup with the
    other concrete types. It's a wildcard match that we use for `respond_to`
    negotiation internals.
EXTENSION_LOOKUP
:   [not documented]
LOOKUP
:   [not documented]
SET
:   [not documented]


# Class methods:

    []
    fetch

# Mime::[]

(from gem actionpack-5.1.2)
---
    [](type)

---


# Mime::fetch

(from gem actionpack-5.1.2)
---
    fetch(type) { |k| ... }

---


---
Also found in:
    gem actionmailer-5.1.2

