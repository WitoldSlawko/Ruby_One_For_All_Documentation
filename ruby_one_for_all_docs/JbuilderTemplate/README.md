# JbuilderTemplate < Jbuilder

(from gem jbuilder-2.7.0)
---
# Class methods:

    new
    template_lookup_options

# Instance methods:

    _cache_fragment_for
    _read_fragment_cache
    _render_partial
    _render_partial_with_options
    _write_fragment_cache
    array!
    cache!
    cache_if!
    cache_root!
    partial!
    set!
    target!

# Attributes:

    attr_accessor template_lookup_options

# JbuilderTemplate::new

(from gem jbuilder-2.7.0)
---
    new(context, *args)

---

#### (Uses superclass method RDoc::AnyMethod: Jbuilder::new)
---


# JbuilderTemplate#array!

(from gem jbuilder-2.7.0)
---
    array!(collection = [], *args)

---

#### (Uses superclass method RDoc::AnyMethod: Jbuilder#array!)
---


# JbuilderTemplate#cache!

(from gem jbuilder-2.7.0)
---
    cache!(key=nil, options={}) { |self| ... }

---

Caches the json constructed within the block passed. Has the same signature as
the `cache` helper method in `ActionView::Helpers::CacheHelper` and so can be
used in the same way.

Example:

    json.cache! ['v1', @person], expires_in: 10.minutes do
      json.extract! @person, :name, :age
    end


# JbuilderTemplate#cache_if!

(from gem jbuilder-2.7.0)
---
    cache_if!(condition, *args) { || ... }

---

Conditionally caches the json depending in the condition given as first
parameter. Has the same signature as the `cache` helper method in
`ActionView::Helpers::CacheHelper` and so can be used in the same way.

Example:

    json.cache_if! !admin?, @person, expires_in: 10.minutes do
      json.extract! @person, :name, :age
    end


# JbuilderTemplate#cache_root!

(from gem jbuilder-2.7.0)
---
    cache_root!(key=nil, options={}) { || ... }

---

Caches the json structure at the root using a string rather than the hash
structure. This is considerably faster, but the drawback is that it only
works, as the name hints, at the root. So you cannot use this approach to
cache deeper inside the hierarchy, like in partials or such. Continue to use
#cache! there.

Example:

    json.cache_root! @person do
      json.extract! @person, :name, :age
    end

    # json.extra 'This will not work either, the root must be exclusive'


# JbuilderTemplate#partial!

(from gem jbuilder-2.7.0)
---
    partial!(*args)

---


# JbuilderTemplate#set!

(from gem jbuilder-2.7.0)
---
    set!(name, object = BLANK, *args)

---

#### (Uses superclass method RDoc::AnyMethod: Jbuilder#set!)
---


# JbuilderTemplate#target!

(from gem jbuilder-2.7.0)
---
    target!()

---

#### (Uses superclass method RDoc::AnyMethod: Jbuilder#target!)
---


# JbuilderTemplate#_cache_fragment_for

(from gem jbuilder-2.7.0)
---
    _cache_fragment_for(key, options, &block)

---


# JbuilderTemplate#_read_fragment_cache

(from gem jbuilder-2.7.0)
---
    _read_fragment_cache(key, options = nil)

---


# JbuilderTemplate#_render_partial

(from gem jbuilder-2.7.0)
---
    _render_partial(options)

---


# JbuilderTemplate#_render_partial_with_options

(from gem jbuilder-2.7.0)
---
    _render_partial_with_options(options)

---


# JbuilderTemplate#_write_fragment_cache

(from gem jbuilder-2.7.0)
---
    _write_fragment_cache(key, options = nil) { || ... }

---


