# Tilt

(from gem tilt-2.0.8)
---
Namespace for Tilt. This module is not intended to be included anywhere.

AsciiDoc see: http://asciidoc.org/




































---
# Constants:

RedcarpetTemplate
:   Future proof mode for Redcarpet 2.x (not yet released)
TOPOBJECT
:   @private
VERSION
:   Current version.


# Class methods:

    []
    current_template
    default_mapping
    lazy_map
    new
    prefer
    register
    register_lazy
    registered?
    template_for
    templates_for

# Tilt::[]

(from gem tilt-2.0.8)
---
    [](file)

---

@see Tilt::Mapping#[]


# Tilt::current_template

(from gem tilt-2.0.8)
---
    current_template()

---

@return the template object that is currently rendering.

@example
    tmpl = Tilt['index.erb'].new { '<%= Tilt.current_template %>' }
    tmpl.render == tmpl.to_s

@note This is currently an experimental feature and might return nil
    in the future.


# Tilt::default_mapping

(from gem tilt-2.0.8)
---
    default_mapping()

---

@return [Tilt::Mapping] the main mapping object


# Tilt::lazy_map

(from gem tilt-2.0.8)
---
    lazy_map()

---

@private


# Tilt::new

(from gem tilt-2.0.8)
---
    new(file, line=nil, options={}, &block)

---

@see Tilt::Mapping#new


# Tilt::prefer

(from gem tilt-2.0.8)
---
    prefer(template_class, *extensions)

---

@deprecated Use {register} instead.


# Tilt::register

(from gem tilt-2.0.8)
---
    register(template_class, *extensions)

---

@see Tilt::Mapping#register


# Tilt::register_lazy

(from gem tilt-2.0.8)
---
    register_lazy(class_name, file, *extensions)

---

@see Tilt::Mapping#register_lazy


# Tilt::registered?

(from gem tilt-2.0.8)
---
    registered?(ext)

---

@see Tilt::Mapping#registered?


# Tilt::template_for

(from gem tilt-2.0.8)
---
    template_for(file)

---

@see Tilt::Mapping#template_for


# Tilt::templates_for

(from gem tilt-2.0.8)
---
    templates_for(file)

---

@see Tilt::Mapping#templates_for


