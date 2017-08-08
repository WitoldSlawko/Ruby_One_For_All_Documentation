# Template < Object

(from gem tilt-2.0.8)
---
Base class for template implementations. Subclasses must implement the
#prepare method and one of the #evaluate or #precompiled_template methods.
---
# Class methods:

    default_mime_type
    default_mime_type=
    metadata
    new

# Instance methods:

    basename
    binary
    compile_template_method
    compiled_method
    data
    default_encoding
    eval_file
    evaluate
    extract_encoding
    extract_magic_comment
    file
    line
    local_extraction
    metadata
    name
    options
    precompiled
    precompiled_postamble
    precompiled_preamble
    precompiled_template
    prepare
    read_template_file
    render
    unbind_compiled_method

# Attributes:

    attr_reader data
    attr_reader file
    attr_reader line
    attr_reader options

# Template::default_mime_type

(from gem tilt-2.0.8)
---
    default_mime_type()

---

@deprecated Use `.[metadata](:mime_type)` instead.


# Template::default_mime_type=

(from gem tilt-2.0.8)
---
    default_mime_type=(value)

---

@deprecated Use `.[metadata](:mime_type) = val` instead.


# Template::metadata

(from gem tilt-2.0.8)
---
    metadata()

---

An empty Hash that the template engine can populate with various metadata.


# Template::new

(from gem tilt-2.0.8)
---
    new(file=nil, line=1, options={}, &block)

---

Create a new template with the file, line, and options specified. By default,
template data is read from the file. When a block is given, it should read
template data and return as a String. When file is nil, a block is required.

All arguments are optional.


# Template#basename

(from gem tilt-2.0.8)
---
    basename(suffix='')

---

The basename of the template file.


# Template#eval_file

(from gem tilt-2.0.8)
---
    eval_file()

---

The filename used in backtraces to describe the template.


# Template#metadata

(from gem tilt-2.0.8)
---
    metadata()

---

An empty Hash that the template engine can populate with various metadata.


# Template#name

(from gem tilt-2.0.8)
---
    name()

---

The template file's basename with all extensions chomped off.


# Template#render

(from gem tilt-2.0.8)
---
    render(scope=nil, locals={}, &block)

---

Render the template in the given scope with the locals specified. If a block
is given, it is typically available within the template via `yield`.


# Template#default_encoding

(from gem tilt-2.0.8)
---
    default_encoding()

---

The encoding of the source data. Defaults to the default_encoding-option if
present. You may override this method in your template class if you have a
better hint of the data's encoding.


# Template#evaluate

(from gem tilt-2.0.8)
---
    evaluate(scope, locals, &block)

---

Execute the compiled template and return the result string. Template
evaluation is guaranteed to be performed in the scope object with the locals
specified and with support for yielding to the block.

This method is only used by source generating templates. Subclasses that
override render() may not support all features.


# Template#precompiled

(from gem tilt-2.0.8)
---
    precompiled(local_keys)

---

Generates all template source by combining the preamble, template, and
postamble and returns a two-tuple of the form: [source, offset], where source
is the string containing (Ruby) source code for the template and offset is the
integer line offset where line reporting should begin.

Template subclasses may override this method when they need complete control
over source generation or want to adjust the default line offset. In most
cases, overriding the #precompiled_template method is easier and more
appropriate.


# Template#precompiled_postamble

(from gem tilt-2.0.8)
---
    precompiled_postamble(local_keys)

---


# Template#precompiled_preamble

(from gem tilt-2.0.8)
---
    precompiled_preamble(local_keys)

---


# Template#precompiled_template

(from gem tilt-2.0.8)
---
    precompiled_template(local_keys)

---

A string containing the (Ruby) source code for the template. The default
Template#evaluate implementation requires either this method or the
#precompiled method be overridden. When defined, the base Template guarantees
correct file/line handling, locals support, custom scopes, proper encoding,
and support for template compilation.


# Template#prepare

(from gem tilt-2.0.8)
---
    prepare()

---

Do whatever preparation is necessary to setup the underlying template engine.
Called immediately after template data is loaded. Instance variables set in
this method are available when #evaluate is called.

Subclasses must provide an implementation of this method.


# Template#binary

(from gem tilt-2.0.8)
---
    binary(string) { || ... }

---


# Template#compile_template_method

(from gem tilt-2.0.8)
---
    compile_template_method(local_keys)

---


# Template#compiled_method

(from gem tilt-2.0.8)
---
    compiled_method(locals_keys)

---

The compiled method for the locals keys provided.


# Template#extract_encoding

(from gem tilt-2.0.8)
---
    extract_encoding(script)

---


# Template#extract_magic_comment

(from gem tilt-2.0.8)
---
    extract_magic_comment(script)

---


# Template#local_extraction

(from gem tilt-2.0.8)
---
    local_extraction(local_keys)

---


# Template#read_template_file

(from gem tilt-2.0.8)
---
    read_template_file()

---

!@endgroup


# Template#unbind_compiled_method

(from gem tilt-2.0.8)
---
    unbind_compiled_method(method_name)

---


