# Encoding < Object

(from ruby core)
---
An Encoding instance represents a character encoding usable in Ruby. It is
defined as a constant under the Encoding namespace. It has a name and
optionally, aliases:

    Encoding::ISO_8859_1.name
    #=> "ISO-8859-1"

    Encoding::ISO_8859_1.names
    #=> ["ISO-8859-1", "ISO8859-1"]

Ruby methods dealing with encodings return or accept Encoding instances as
arguments (when a method accepts an Encoding instance as an argument, it can
be passed an Encoding name or alias instead).

    "some string".encoding
    #=> #<Encoding:UTF-8>

    string = "some string".encode(Encoding::ISO_8859_1)
    #=> "some string"
    string.encoding
    #=> #<Encoding:ISO-8859-1>

    "some string".encode "ISO-8859-1"
    #=> "some string"

`Encoding::ASCII_8BIT` is a special encoding that is usually used for a byte
string, not a character string. But as the name insists, its characters in the
range of ASCII are considered as ASCII characters. This is useful when you use
ASCII-8BIT characters with other ASCII compatible characters.

## Changing an encoding

The associated Encoding of a String can be changed in two different ways.

First, it is possible to set the Encoding of a string to a new Encoding
without changing the internal byte representation of the string, with
String#force_encoding. This is how you can tell Ruby the correct encoding of a
string.

    string
    #=> "R\xC3\xA9sum\xC3\xA9"
    string.encoding
    #=> #<Encoding:ISO-8859-1>
    string.force_encoding(Encoding::UTF_8)
    #=> "R\u00E9sum\u00E9"

Second, it is possible to transcode a string, i.e. translate its internal byte
representation to another encoding. Its associated encoding is also set to the
other encoding. See String#encode for the various forms of transcoding, and
the Encoding::Converter class for additional control over the transcoding
process.

    string
    #=> "R\u00E9sum\u00E9"
    string.encoding
    #=> #<Encoding:UTF-8>
    string = string.encode!(Encoding::ISO_8859_1)
    #=> "R\xE9sum\xE9"
    string.encoding
    #=> #<Encoding::ISO-8859-1>

## Script encoding

All Ruby script code has an associated Encoding which any String literal
created in the source code will be associated to.

The default script encoding is `Encoding::UTF-8` after v2.0, but it can be
changed by a magic comment on the first line of the source code file (or
second line, if there is a shebang line on the first). The comment must
contain the word `coding` or `encoding`, followed by a colon, space and the
Encoding name or alias:

    # encoding: UTF-8

    "some string".encoding
    #=> #<Encoding:UTF-8>

The `__ENCODING__` keyword returns the script encoding of the file which the
keyword is written:

    # encoding: ISO-8859-1

    __ENCODING__
    #=> #<Encoding:ISO-8859-1>

`ruby -K` will change the default locale encoding, but this is not
recommended. Ruby source files should declare its script encoding by a magic
comment even when they only depend on US-ASCII strings or regular expressions.

## Locale encoding

The default encoding of the environment. Usually derived from locale.

see Encoding.locale_charmap, Encoding.find('locale')

## Filesystem encoding

The default encoding of strings from the filesystem of the environment. This
is used for strings of file names or paths.

see Encoding.find('filesystem')

## External encoding

Each IO object has an external encoding which indicates the encoding that Ruby
will use to read its data. By default Ruby sets the external encoding of an IO
object to the default external encoding. The default external encoding is set
by locale encoding or the interpreter `-E` option. Encoding.default_external
returns the current value of the external encoding.

    ENV["LANG"]
    #=> "UTF-8"
    Encoding.default_external
    #=> #<Encoding:UTF-8>

    $ ruby -E ISO-8859-1 -e "p Encoding.default_external"
    #<Encoding:ISO-8859-1>

    $ LANG=C ruby -e 'p Encoding.default_external'
    #<Encoding:US-ASCII>

The default external encoding may also be set through
Encoding.default_external=, but you should not do this as strings created
before and after the change will have inconsistent encodings.  Instead use
`ruby -E` to invoke ruby with the correct external encoding.

When you know that the actual encoding of the data of an IO object is not the
default external encoding, you can reset its external encoding with
IO#set_encoding or set it at IO object creation (see IO.new options).

## Internal encoding

To process the data of an IO object which has an encoding different from its
external encoding, you can set its internal encoding. Ruby will use this
internal encoding to transcode the data when it is read from the IO object.

Conversely, when data is written to the IO object it is transcoded from the
internal encoding to the external encoding of the IO object.

The internal encoding of an IO object can be set with IO#set_encoding or at IO
object creation (see IO.new options).

The internal encoding is optional and when not set, the Ruby default internal
encoding is used. If not explicitly set this default internal encoding is
`nil` meaning that by default, no transcoding occurs.

The default internal encoding can be set with the interpreter option `-E`.
Encoding.default_internal returns the current internal encoding.

    $ ruby -e 'p Encoding.default_internal'
    nil

    $ ruby -E ISO-8859-1:UTF-8 -e "p [Encoding.default_external, \
      Encoding.default_internal]"
    [#<Encoding:ISO-8859-1>, #<Encoding:UTF-8>]

The default internal encoding may also be set through
Encoding.default_internal=, but you should not do this as strings created
before and after the change will have inconsistent encodings.  Instead use
`ruby -E` to invoke ruby with the correct internal encoding.

## IO encoding example

In the following example a UTF-8 encoded string "Ru00E9sumu00E9" is transcoded
for output to ISO-8859-1 encoding, then read back in and transcoded to UTF-8:

    string = "R\u00E9sum\u00E9"

    open("transcoded.txt", "w:ISO-8859-1") do |io|
      io.write(string)
    end

    puts "raw text:"
    p File.binread("transcoded.txt")
    puts

    open("transcoded.txt", "r:ISO-8859-1:UTF-8") do |io|
      puts "transcoded text:"
      p io.read
    end

While writing the file, the internal encoding is not specified as it is only
necessary for reading.  While reading the file both the internal and external
encoding must be specified to obtain the correct result.

    $ ruby t.rb
    raw text:
    "R\xE9sum\xE9"

    transcoded text:
    "R\u00E9sum\u00E9"

---
# Class methods:

    aliases
    compatible?
    default_external
    default_external=
    default_internal
    default_internal=
    find
    list
    locale_charmap
    name_list

# Instance methods:

    ascii_compatible?
    dummy?
    inspect
    name
    names
    replicate
    to_s

# Encoding::aliases

(from ruby core)
---
    Encoding.aliases -> {"alias1" => "orig1", "alias2" => "orig2", ...}

---

Returns the hash of available encoding alias and original encoding name.

    Encoding.aliases
    #=> {"BINARY"=>"ASCII-8BIT", "ASCII"=>"US-ASCII", "ANSI_X3.4-1986"=>"US-ASCII",
          "SJIS"=>"Shift_JIS", "eucJP"=>"EUC-JP", "CP932"=>"Windows-31J"}


# Encoding::compatible?

(from ruby core)
---
    Encoding.compatible?(obj1, obj2) -> enc or nil

---

Checks the compatibility of two objects.

If the objects are both strings they are compatible when they are
concatenatable.  The encoding of the concatenated string will be returned if
they are compatible, nil if they are not.

    Encoding.compatible?("\xa1".force_encoding("iso-8859-1"), "b")
    #=> #<Encoding:ISO-8859-1>

    Encoding.compatible?(
      "\xa1".force_encoding("iso-8859-1"),
      "\xa1\xa1".force_encoding("euc-jp"))
    #=> nil

If the objects are non-strings their encodings are compatible when they have
an encoding and:
*   Either encoding is US-ASCII compatible
*   One of the encodings is a 7-bit encoding



# Encoding::default_external

(from ruby core)
---
    Encoding.default_external -> enc

---

Returns default external encoding.

The default external encoding is used by default for strings created from the
following locations:

*   CSV
*   File data read from disk
*   SDBM
*   StringIO
*   Zlib::GzipReader
*   Zlib::GzipWriter
*   String#inspect
*   Regexp#inspect


While strings created from these locations will have this encoding, the
encoding may not be valid.  Be sure to check String#valid_encoding?.

File data written to disk will be transcoded to the default external encoding
when written.

The default external encoding is initialized by the locale or -E option.


# Encoding::default_external=

(from ruby core)
---
    Encoding.default_external = enc

---

Sets default external encoding.  You should not set Encoding::default_external
in ruby code as strings created before changing the value may have a different
encoding from strings created after the value was changed., instead you should
use `ruby -E` to invoke ruby with the correct default_external.

See Encoding::default_external for information on how the default external
encoding is used.


# Encoding::default_internal

(from ruby core)
---
    Encoding.default_internal -> enc

---

Returns default internal encoding.  Strings will be transcoded to the default
internal encoding in the following places if the default internal encoding is
not nil:

*   CSV
*   Etc.sysconfdir and Etc.systmpdir
*   File data read from disk
*   File names from Dir
*   Integer#chr
*   String#inspect and Regexp#inspect
*   Strings returned from Readline
*   Strings returned from SDBM
*   Time#zone
*   Values from ENV
*   Values in ARGV including $PROGRAM_NAME


Additionally String#encode and String#encode! use the default internal
encoding if no encoding is given.

The locale encoding (__ENCODING__), not default_internal, is used as the
encoding of created strings.

Encoding::default_internal is initialized by the source file's
internal_encoding or -E option.


# Encoding::default_internal=

(from ruby core)
---
    Encoding.default_internal = enc or nil

---

Sets default internal encoding or removes default internal encoding when
passed nil.  You should not set Encoding::default_internal in ruby code as
strings created before changing the value may have a different encoding from
strings created after the change.  Instead you should use `ruby -E` to invoke
ruby with the correct default_internal.

See Encoding::default_internal for information on how the default internal
encoding is used.


# Encoding::find

(from ruby core)
---
    Encoding.find(string) -> enc

---

Search the encoding with specified *name*. *name* should be a string.

    Encoding.find("US-ASCII")  #=> #<Encoding:US-ASCII>

Names which this method accept are encoding names and aliases including
following special aliases

"external"
:   default external encoding
"internal"
:   default internal encoding
"locale"
:   locale encoding
"filesystem"
:   filesystem encoding


An ArgumentError is raised when no encoding with *name*. Only
`Encoding.find("internal")` however returns nil when no encoding named
"internal", in other words, when Ruby has no default internal encoding.


# Encoding::list

(from ruby core)
---
    Encoding.list -> [enc1, enc2, ...]

---

Returns the list of loaded encodings.

    Encoding.list
    #=> [#<Encoding:ASCII-8BIT>, #<Encoding:UTF-8>,
          #<Encoding:ISO-2022-JP (dummy)>]

    Encoding.find("US-ASCII")
    #=> #<Encoding:US-ASCII>

    Encoding.list
    #=> [#<Encoding:ASCII-8BIT>, #<Encoding:UTF-8>,
          #<Encoding:US-ASCII>, #<Encoding:ISO-2022-JP (dummy)>]


# Encoding::locale_charmap

(from ruby core)
---
    Encoding.locale_charmap -> string

---

Returns the locale charmap name. It returns nil if no appropriate information.

    Debian GNU/Linux
      LANG=C
        Encoding.locale_charmap  #=> "ANSI_X3.4-1968"
      LANG=ja_JP.EUC-JP
        Encoding.locale_charmap  #=> "EUC-JP"

    SunOS 5
      LANG=C
        Encoding.locale_charmap  #=> "646"
      LANG=ja
        Encoding.locale_charmap  #=> "eucJP"

The result is highly platform dependent. So
Encoding.find(Encoding.locale_charmap) may cause an error. If you need some
encoding object even for unknown locale, Encoding.find("locale") can be used.


# Encoding::name_list

(from ruby core)
---
    Encoding.name_list -> ["enc1", "enc2", ...]

---

Returns the list of available encoding names.

    Encoding.name_list
    #=> ["US-ASCII", "ASCII-8BIT", "UTF-8",
          "ISO-8859-1", "Shift_JIS", "EUC-JP",
          "Windows-31J",
          "BINARY", "CP932", "eucJP"]


# Encoding#ascii_compatible?

(from ruby core)
---
    enc.ascii_compatible? -> true or false

---

Returns whether ASCII-compatible or not.

    Encoding::UTF_8.ascii_compatible?     #=> true
    Encoding::UTF_16BE.ascii_compatible?  #=> false


# Encoding#dummy?

(from ruby core)
---
    enc.dummy? -> true or false

---

Returns true for dummy encodings. A dummy encoding is an encoding for which
character handling is not properly implemented. It is used for stateful
encodings.

    Encoding::ISO_2022_JP.dummy?       #=> true
    Encoding::UTF_8.dummy?             #=> false


# Encoding#inspect

(from ruby core)
---
    enc.inspect -> string

---

Returns a string which represents the encoding for programmers.

    Encoding::UTF_8.inspect       #=> "#<Encoding:UTF-8>"
    Encoding::ISO_2022_JP.inspect #=> "#<Encoding:ISO-2022-JP (dummy)>"


# Encoding#name

(from ruby core)
---
    enc.name -> string

---

Returns the name of the encoding.

    Encoding::UTF_8.name      #=> "UTF-8"


# Encoding#names

(from ruby core)
---
    enc.names -> array

---

Returns the list of name and aliases of the encoding.

    Encoding::WINDOWS_31J.names  #=> ["Windows-31J", "CP932", "csWindows31J"]


# Encoding#replicate

(from ruby core)
---
    enc.replicate(name) -> encoding

---

Returns a replicated encoding of *enc* whose name is *name*. The new encoding
should have the same byte structure of *enc*. If *name* is used by another
encoding, raise ArgumentError.


# Encoding#to_s

(from ruby core)
---
    enc.to_s -> string

---

Returns the name of the encoding.

    Encoding::UTF_8.name      #=> "UTF-8"


