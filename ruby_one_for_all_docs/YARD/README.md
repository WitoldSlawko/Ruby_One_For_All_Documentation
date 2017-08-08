# YARD

(from gem yard-0.9.9)
---


























Backward compatability for gem specification lookup @see Gem::SourceIndex




































Gem::YARDoc provides methods to generate YARDoc and yri data for installed
gems upon gem installation.

This file is automatically required by RubyGems 1.9 and newer.





















































---
# Constants:

CONFIG_DIR
:   @deprecated Use {Config::CONFIG_DIR}
ROOT
:   The root path for YARD source libraries
TEMPLATE_ROOT
:   The root path for YARD builtin templates
VERSION
:   [not documented]


# Class methods:

    load_plugins
    parse
    parse_string
    ruby18?
    ruby19?
    ruby2?
    windows?

# Instance methods:

    anchor_for
    charset
    convert_method_to_overload
    format_object_name_list
    format_types
    insert_include
    link_file
    link_include_file
    link_include_object
    link_object
    link_url
    mtime
    mtime_url
    parse_codeblocks
    parse_lang_for_codeblock
    signature
    signature_types
    tag_attrs
    url_for
    url_for_file
    url_for_frameset
    url_for_index
    url_for_list
    url_for_main

# YARD::load_plugins

(from gem yard-0.9.9)
---
    load_plugins()

---

(see YARD::Config.load_plugins) @deprecated Use {Config.load_plugins}


# YARD::parse

(from gem yard-0.9.9)
---
    parse(*args)

---

An alias to {Parser::SourceParser}'s parsing method

@example Parse a glob of files
    YARD.parse('lib   /*.rb')

@see Parser::SourceParser.parse


# YARD::parse_string

(from gem yard-0.9.9)
---
    parse_string(*args)

---

An alias to {Parser::SourceParser}'s parsing method

@example Parse a string of input
    YARD.parse_string('class Foo; end')

@see Parser::SourceParser.parse_string


# YARD::ruby18?

(from gem yard-0.9.9)
---
    ruby18?()

---

@return [Boolean] whether YARD is being run in Ruby 1.8 mode


# YARD::ruby19?

(from gem yard-0.9.9)
---
    ruby19?()

---

@return [Boolean] whether YARD is being run in Ruby 1.9 mode


# YARD::ruby2?

(from gem yard-0.9.9)
---
    ruby2?()

---

@return [Boolean] whether YARD is being run in Ruby 2.0


# YARD::windows?

(from gem yard-0.9.9)
---
    windows?()

---

@return [Boolean] whether YARD is being run inside of Windows


# YARD#anchor_for

(from gem yard-0.9.9)
---
    anchor_for(object)

---

@param [CodeObjects::Base] object the object to get an anchor for @return
[String] the anchor for a specific object


# YARD#charset

(from gem yard-0.9.9)
---
    charset()

---

Returns the current character set. The default value can be overridden by
setting the `LANG` environment variable or by overriding this method. In Ruby
1.9 you can also modify this value by setting `Encoding.default_external`.

@return [String] the current character set @since 0.5.4


# YARD#format_object_name_list

(from gem yard-0.9.9)
---
    format_object_name_list(objects)

---

Formats a list of objects and links them @return [String] a formatted list of
objects


# YARD#format_types

(from gem yard-0.9.9)
---
    format_types(typelist, brackets = true)

---

Formats a list of types from a tag.

@param [Array<String>, FalseClass] typelist
    the list of types to be formatted.

@param [Boolean] brackets omits the surrounding
    brackets if +brackets+ is set to +false+.

@return [String] the list of types formatted
    as [Type1, Type2, ...] with the types linked
    to their respective descriptions.


# YARD#insert_include

(from gem yard-0.9.9)
---
    insert_include(text, markup = options.markup)

---

Inserts an include link while respecting inlining


# YARD#link_file

(from gem yard-0.9.9)
---
    link_file(filename, title = nil, anchor = nil)

---

(see BaseHelper#link_file)


# YARD#link_include_file

(from gem yard-0.9.9)
---
    link_include_file(file)

---

(see BaseHelper#link_include_file)


# YARD#link_include_object

(from gem yard-0.9.9)
---
    link_include_object(obj)

---

(see BaseHelper#link_include_object)


# YARD#link_object

(from gem yard-0.9.9)
---
    link_object(obj, title = nil, anchor = nil, relative = true)

---

(see BaseHelper#link_object)


# YARD#link_url

(from gem yard-0.9.9)
---
    link_url(url, title = nil, params = {})

---

(see BaseHelper#link_url)


# YARD#mtime

(from gem yard-0.9.9)
---
    mtime(_file)

---


# YARD#mtime_url

(from gem yard-0.9.9)
---
    mtime_url(obj, anchor = nil, relative = true)

---


# YARD#signature

(from gem yard-0.9.9)
---
    signature(meth, link = true, show_extras = true, full_attr_name = true)

---

Formats the signature of method `meth`.

@param [CodeObjects::MethodObject] meth the method object to list
    the signature of

@param [Boolean] link whether to link the method signature to the details view
@param [Boolean] show_extras whether to show extra meta-data (visibility,
attribute info) @param [Boolean] full_attr_name whether to show the full
attribute name
    ("name=" instead of "name")

@return [String] the formatted method signature


# YARD#signature_types

(from gem yard-0.9.9)
---
    signature_types(meth, link = true)

---

Get the return types for a method signature.

@param [CodeObjects::MethodObject] meth the method object @param [Boolean]
link whether to link the types @return [String] the signature types @since
0.5.3


# YARD#url_for

(from gem yard-0.9.9)
---
    url_for(obj, anchor = nil, relative = true)

---

Returns the URL for an object.

@param [String, CodeObjects::Base] obj the object (or object path) to link to
@param [String] anchor the anchor to link to @param [Boolean] relative use a
relative or absolute link @return [String] the URL location of the object


# YARD#url_for_file

(from gem yard-0.9.9)
---
    url_for_file(filename, anchor = nil)

---

Returns the URL for a specific file

@param [String, CodeObjects::ExtraFileObject] filename the filename to link to
@param [String] anchor optional anchor @return [String] the URL pointing to
the file


# YARD#url_for_frameset

(from gem yard-0.9.9)
---
    url_for_frameset()

---

Returns the URL for the frameset page

@return [String] the URL pointing to the frames page @since 0.8.0


# YARD#url_for_index

(from gem yard-0.9.9)
---
    url_for_index()

---

Returns the URL for the alphabetic index page

@return [String] the URL pointing to the first main page the
    user should see.


# YARD#url_for_list

(from gem yard-0.9.9)
---
    url_for_list(type)

---

Returns the URL for a list type

@param [String, Symbol] type the list type to generate a URL for @return
[String] the URL pointing to the list @since 0.8.0


# YARD#url_for_main

(from gem yard-0.9.9)
---
    url_for_main()

---

Returns the URL for the main page (README or alphabetic index)

@return [String] the URL pointing to the first main page the
    user should see.


# YARD#convert_method_to_overload

(from gem yard-0.9.9)
---
    convert_method_to_overload(meth)

---

Converts a {CodeObjects::MethodObject} into an overload object @since 0.5.3


# YARD#parse_codeblocks

(from gem yard-0.9.9)
---
    parse_codeblocks(html)

---

Parses code blocks out of html and performs syntax highlighting on code inside
of the blocks.

@param [String] html the html to search for code in @return [String]
highlighted html @see #html_syntax_highlight


# YARD#parse_lang_for_codeblock

(from gem yard-0.9.9)
---
    parse_lang_for_codeblock(source)

---

Parses !!!lang out of codeblock, returning the codeblock language followed by
the source code.

@param [String] source the source code whose language to determine @return
[Array(String, String)] the language, if any, and the
    remaining source

@since 0.7.5


# YARD#tag_attrs

(from gem yard-0.9.9)
---
    tag_attrs(opts = {})

---

Converts a set of hash options into HTML attributes for a tag

@param [Hash{String => String}] opts the tag options @return [String] the tag
attributes of an HTML tag


---
Also found in:
    gem solargraph-0.9.2

