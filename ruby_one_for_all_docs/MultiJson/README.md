# MultiJson

---
# Includes:
Options (from gem multi_json-1.12.1)

(from gem multi_json-1.12.1)
---

















---
# Constants:

ALIASES
:   [not documented]
DecodeError
:   [not documented]
REQUIREMENT_MAP
:   [not documented]
VERSION
:   [not documented]


# Instance methods:

    adapter
    adapter=
    current_adapter
    decode
    default_adapter
    default_engine
    default_options
    default_options=
    dump
    encode
    engine
    engine=
    load
    load_adapter
    load_adapter_from_string_name
    use
    with_adapter
    with_engine

# MultiJson#adapter

(from gem multi_json-1.12.1)
---
    adapter()

---

Get the current adapter class.


# MultiJson#adapter=

(from gem multi_json-1.12.1)
---
    adapter=(new_adapter)

---


# MultiJson#current_adapter

(from gem multi_json-1.12.1)
---
    current_adapter(options = {})

---


# MultiJson#decode

(from gem multi_json-1.12.1)
---
    decode(string, options = {})

---


# MultiJson#default_adapter

(from gem multi_json-1.12.1)
---
    default_adapter()

---

The default adapter based on what you currently have loaded and installed.
First checks to see if any adapters are already loaded, then checks to see
which are installed if none are loaded.


# MultiJson#default_engine

(from gem multi_json-1.12.1)
---
    default_engine()

---


# MultiJson#default_options

(from gem multi_json-1.12.1)
---
    default_options()

---


# MultiJson#default_options=

(from gem multi_json-1.12.1)
---
    default_options=(value)

---


# MultiJson#dump

(from gem multi_json-1.12.1)
---
    dump(object, options = {})

---

Encodes a Ruby object as JSON.


# MultiJson#encode

(from gem multi_json-1.12.1)
---
    encode(object, options = {})

---


# MultiJson#engine

(from gem multi_json-1.12.1)
---
    engine()

---


# MultiJson#engine=

(from gem multi_json-1.12.1)
---
    engine=(new_adapter)

---


# MultiJson#load

(from gem multi_json-1.12.1)
---
    load(string, options = {})

---

Decode a JSON string into Ruby.

**Options**

`:symbolize_keys`
:   If true, will use symbols instead of strings for the keys.
`:adapter`
:   If set, the selected adapter will be used for this call.



# MultiJson#load_adapter

(from gem multi_json-1.12.1)
---
    load_adapter(new_adapter)

---


# MultiJson#use

(from gem multi_json-1.12.1)
---
    use(new_adapter)

---

Set the JSON parser utilizing a symbol, string, or class. Supported by default
are:

*   `:oj`
*   `:json_gem`
*   `:json_pure`
*   `:ok_json`
*   `:yajl`
*   `:nsjsonserialization` (MacRuby only)
*   `:gson` (JRuby only)
*   `:jr_jackson` (JRuby only)



# MultiJson#with_adapter

(from gem multi_json-1.12.1)
---
    with_adapter(new_adapter) { || ... }

---

Executes passed block using specified adapter.


# MultiJson#with_engine

(from gem multi_json-1.12.1)
---
    with_engine(new_adapter)

---


# MultiJson#load_adapter_from_string_name

(from gem multi_json-1.12.1)
---
    load_adapter_from_string_name(name)

---


