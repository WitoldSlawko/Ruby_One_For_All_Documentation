# ActiveSupport

---
# Extended by:
(from gem activesupport-5.1.2)
    ActiveSupport::Autoload
    LazyLoadHooks

(from gem activesupport-5.1.2)
---


















The JSON gem adds a few modules to Ruby core classes containing :to_json
definition, overwriting their default behavior. That said, we need to define
the basic to_json method in all of them, otherwise they will always use
to_json gem implementation, which is backwards incompatible in several cases
(for instance, the JSON implementation for Hash does not work) with
inheritance and consequently classes as ActiveSupport::OrderedHash cannot be
serialized to json.

On the other hand, we should avoid conflict with ::JSON.{generate,dump}(obj).
Unfortunately, the JSON gem's encoder relies on its own to_json implementation
to encode objects. Since it always passes a ::JSON::State object as the only
argument to to_json, we can detect that and forward the calls to the original
to_json method.

It should be noted that when using ::JSON.{generate,dump} directly,
ActiveSupport's encoder is bypassed completely. This means that as_json won't
be invoked and the JSON gem will simply ignore any options it does not
natively understand. This also means that ::JSON.{generate,dump} should give
exactly the same results with or without active support.





















































































---
# Class methods:

    eager_load!
    gem_version
    halt_callback_chains_on_return_false
    halt_callback_chains_on_return_false=
    to_time_preserves_timezone
    to_time_preserves_timezone=
    version

# ActiveSupport::eager_load!

(from gem activesupport-5.1.2)
---
    eager_load!()

---


# ActiveSupport::gem_version

(from gem activesupport-5.1.2)
---
    gem_version()

---

Returns the version of the currently loaded Active Support as a
`Gem::Version`.


# ActiveSupport::halt_callback_chains_on_return_false

(from gem activesupport-5.1.2)
---
    halt_callback_chains_on_return_false()

---


# ActiveSupport::halt_callback_chains_on_return_false=

(from gem activesupport-5.1.2)
---
    halt_callback_chains_on_return_false=(value)

---


# ActiveSupport::to_time_preserves_timezone

(from gem activesupport-5.1.2)
---
    to_time_preserves_timezone()

---


# ActiveSupport::to_time_preserves_timezone=

(from gem activesupport-5.1.2)
---
    to_time_preserves_timezone=(value)

---


# ActiveSupport::version

(from gem activesupport-5.1.2)
---
    version()

---

Returns the version of the currently loaded ActiveSupport as a `Gem::Version`


---
Also found in:
    gem actionview-5.1.2

