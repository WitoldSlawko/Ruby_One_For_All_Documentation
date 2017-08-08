# Loofah

(from gem loofah-2.0.3)
---
## Strings and IO Objects as Input

Loofah.document and Loofah.fragment accept any IO object in addition to
accepting a string. That IO object could be a file, or a socket, or a
StringIO, or anything that responds to `read` and `close`. Which makes it
particularly easy to sanitize mass quantities of docs.












---
# Constants:

VERSION
:   The version of Loofah you are using


# Class methods:

    document
    fragment
    remove_extraneous_whitespace
    scrub_document
    scrub_fragment
    scrub_xml_document
    scrub_xml_fragment
    xml_document
    xml_fragment

# Loofah::document

(from gem loofah-2.0.3)
---
    document(*args, &block)

---

Shortcut for Loofah::HTML::Document.parse This method accepts the same
parameters as Nokogiri::HTML::Document.parse


# Loofah::fragment

(from gem loofah-2.0.3)
---
    fragment(*args, &block)

---

Shortcut for Loofah::HTML::DocumentFragment.parse This method accepts the same
parameters as Nokogiri::HTML::DocumentFragment.parse


# Loofah::remove_extraneous_whitespace

(from gem loofah-2.0.3)
---
    remove_extraneous_whitespace(string)

---

A helper to remove extraneous whitespace from text-ified HTML


# Loofah::scrub_document

(from gem loofah-2.0.3)
---
    scrub_document(string_or_io, method)

---

Shortcut for Loofah.document(string_or_io).scrub!(method)


# Loofah::scrub_fragment

(from gem loofah-2.0.3)
---
    scrub_fragment(string_or_io, method)

---

Shortcut for Loofah.fragment(string_or_io).scrub!(method)


# Loofah::scrub_xml_document

(from gem loofah-2.0.3)
---
    scrub_xml_document(string_or_io, method)

---

Shortcut for Loofah.xml_document(string_or_io).scrub!(method)


# Loofah::scrub_xml_fragment

(from gem loofah-2.0.3)
---
    scrub_xml_fragment(string_or_io, method)

---

Shortcut for Loofah.xml_fragment(string_or_io).scrub!(method)


# Loofah::xml_document

(from gem loofah-2.0.3)
---
    xml_document(*args, &block)

---

Shortcut for Loofah::XML::Document.parse This method accepts the same
parameters as Nokogiri::XML::Document.parse


# Loofah::xml_fragment

(from gem loofah-2.0.3)
---
    xml_fragment(*args, &block)

---

Shortcut for Loofah::XML::DocumentFragment.parse This method accepts the same
parameters as Nokogiri::XML::DocumentFragment.parse


