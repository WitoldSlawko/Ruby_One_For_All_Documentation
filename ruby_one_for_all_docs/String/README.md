# String < Object

---
# Includes:
Comparable (from ruby core)

(from ruby core)
---
BigDecimal extends the native String class to provide the #to_d method.

When you require BigDecimal in your application, this method will be available
on String objects.




additions to class String for Unicode normalization

A `String` object holds and manipulates an arbitrary sequence of bytes,
typically representing characters. String objects may be created using
`String::new` or as literals.

Because of aliasing issues, users of strings should be aware of the methods
that modify the contents of a `String` object.  Typically, methods with names
ending in ``!'' modify their receiver, while those without a ``!'' return a
new `String`.  However, there are exceptions, such as `String#[]=`.
---
# Class methods:

    new
    try_convert

# Instance methods:

    %
    *
    +
    +@
    -@
    <<
    <=>
    ==
    ===
    =~
    []
    []=
    ascii_only?
    b
    block_scanf
    bytes
    bytesize
    byteslice
    capitalize
    capitalize!
    casecmp
    casecmp?
    center
    chars
    chomp
    chomp!
    chop
    chop!
    chr
    clear
    codepoints
    concat
    count
    crypt
    delete
    delete!
    downcase
    downcase!
    dump
    each_byte
    each_char
    each_codepoint
    each_line
    empty?
    encode
    encode!
    encoding
    end_with?
    eql?
    force_encoding
    freeze
    getbyte
    gsub
    gsub!
    hash
    hex
    include?
    index
    initialize_copy
    insert
    inspect
    intern
    iseuc
    isjis
    issjis
    isutf8
    kconv
    length
    lines
    ljust
    lstrip
    lstrip!
    match
    match?
    next
    next!
    oct
    ord
    partition
    prepend
    replace
    reverse
    reverse!
    rindex
    rjust
    rpartition
    rstrip
    rstrip!
    scan
    scanf
    scrub
    scrub!
    setbyte
    shellescape
    shellsplit
    size
    slice
    slice!
    split
    squeeze
    squeeze!
    start_with?
    strip
    strip!
    sub
    sub!
    succ
    succ!
    sum
    swapcase
    swapcase!
    to_c
    to_d
    to_f
    to_i
    to_r
    to_s
    to_str
    to_sym
    toeuc
    tojis
    tolocale
    tosjis
    toutf16
    toutf32
    toutf8
    tr
    tr!
    tr_s
    tr_s!
    unicode_normalize
    unicode_normalize!
    unicode_normalized?
    unpack
    unpack1
    upcase
    upcase!
    upto
    valid_encoding?

# String::new

(from ruby core)
---
    String.new(str="")   -> new_str
    String.new(str="", encoding: enc) -> new_str
    String.new(str="", capacity: size) -> new_str

---

Returns a new string object containing a copy of *str*.

The optional *enc* argument specifies the encoding of the new string. If not
specified, the encoding of *str* (or ASCII-8BIT, if *str* is not specified) is
used.

The optional *size* argument specifies the size of internal buffer. This may
improve performance, when the string will be concatenated many times (and call
many realloc).


# String::try_convert

(from ruby core)
---
    String.try_convert(obj) -> string or nil

---

Try to convert *obj* into a String, using to_str method. Returns converted
string or nil if *obj* cannot be converted for any reason.

    String.try_convert("str")     #=> "str"
    String.try_convert(/re/)      #=> nil


# String#%

(from ruby core)
---
    str % arg   -> new_str

---

Format---Uses *str* as a format specification, and returns the result of
applying it to *arg*. If the format specification contains more than one
substitution, then *arg* must be an `Array` or `Hash` containing the values to
be substituted. See `Kernel::sprintf` for details of the format string.

    "%05d" % 123                              #=> "00123"
    "%-5s: %08x" % [ "ID", self.object_id ]   #=> "ID   : 200e14d6"
    "foo = %{foo}" % { :foo => 'bar' }        #=> "foo = bar"


(from gem parser-2.4.0.0)
---
    %(arg, *args)

---


# String#*

(from ruby core)
---
    str * integer   -> new_str

---

Copy --- Returns a new String containing `integer` copies of the receiver.
`integer` must be greater than or equal to 0.

    "Ho! " * 3   #=> "Ho! Ho! Ho! "
    "Ho! " * 0   #=> ""


# String#+

(from ruby core)
---
    str + other_str   -> new_str

---

Concatenation---Returns a new `String` containing *other_str* concatenated to
*str*.

    "Hello from " + self.to_s   #=> "Hello from main"


# String#+@

(from ruby core)
---
    +str  -> str (mutable)

---

If the string is frozen, then return duplicated mutable string.

If the string is not frozen, then return the string itself.


# String#-@

(from ruby core)
---
    -str  -> str (frozen)

---

If the string is frozen, then return the string itself.

If the string is not frozen, then duplicate the string freeze it and return
it.


# String#<<

(from ruby core)
---
    <<(p1)

---


# String#<=>

(from ruby core)
---
    string <=> other_string   -> -1, 0, +1 or nil

---

Comparison---Returns -1, 0, +1 or nil depending on whether `string` is less
than, equal to, or greater than `other_string`.

`nil` is returned if the two values are incomparable.

If the strings are of different lengths, and the strings are equal when
compared up to the shortest length, then the longer string is considered
greater than the shorter one.

`<=>` is the basis for the methods `<`, `<=`, `>`, `>=`, and `between?`,
included from module Comparable. The method String#== does not use
Comparable#==.

    "abcdef" <=> "abcde"     #=> 1
    "abcdef" <=> "abcdef"    #=> 0
    "abcdef" <=> "abcdefg"   #=> -1
    "abcdef" <=> "ABCDEF"    #=> 1
    "abcdef" <=> 1           #=> nil


# String#==

(from ruby core)
---
    str == obj    -> true or false

---

### Equality

Returns whether `str` == `obj`, similar to Object#==.

If `obj` is not an instance of String but responds to `to_str`, then the two
strings are compared using `obj.==`.

Otherwise, returns similarly to String#eql?, comparing length and content.


# String#===

(from ruby core)
---
    str === obj   -> true or false

---

### Equality

Returns whether `str` == `obj`, similar to Object#==.

If `obj` is not an instance of String but responds to `to_str`, then the two
strings are compared using `obj.==`.

Otherwise, returns similarly to String#eql?, comparing length and content.


# String#=~

(from ruby core)
---
    str =~ obj   -> integer or nil

---

Match---If *obj* is a `Regexp`, use it as a pattern to match against *str*,and
returns the position the match starts, or `nil` if there is no match.
Otherwise, invokes *obj.=~*, passing *str* as an argument. The default `=~` in
`Object` returns `nil`.

Note: `str =~ regexp` is not the same as `regexp =~ str`. Strings captured
from named capture groups are assigned to local variables only in the second
case.

    "cat o' 9 tails" =~ /\d/   #=> 7
    "cat o' 9 tails" =~ 9      #=> nil


# String#[]

(from ruby core)
---
    str[index]                 -> new_str or nil
    str[start, length]         -> new_str or nil
    str[range]                 -> new_str or nil
    str[regexp]                -> new_str or nil
    str[regexp, capture]       -> new_str or nil
    str[match_str]             -> new_str or nil

---

Element Reference --- If passed a single `index`, returns a substring of one
character at that index. If passed a `start` index and a `length`, returns a
substring containing `length` characters starting at the `start` index. If
passed a `range`, its beginning and end are interpreted as offsets delimiting
the substring to be returned.

In these three cases, if an index is negative, it is counted from the end of
the string.  For the `start` and `range` cases the starting index is just
before a character and an index matching the string's size. Additionally, an
empty string is returned when the starting index for a character range is at
the end of the string.

Returns `nil` if the initial index falls outside the string or the length is
negative.

If a `Regexp` is supplied, the matching portion of the string is returned.  If
a `capture` follows the regular expression, which may be a capture group index
or name, follows the regular expression that component of the MatchData is
returned instead.

If a `match_str` is given, that string is returned if it occurs in the string.

Returns `nil` if the regular expression does not match or the match string
cannot be found.

    a = "hello there"

    a[1]                   #=> "e"
    a[2, 3]                #=> "llo"
    a[2..3]                #=> "ll"

    a[-3, 2]               #=> "er"
    a[7..-2]               #=> "her"
    a[-4..-2]              #=> "her"
    a[-2..-4]              #=> ""

    a[11, 0]               #=> ""
    a[11]                  #=> nil
    a[12, 0]               #=> nil
    a[12..-1]              #=> nil

    a[/[aeiou](.)\1/]      #=> "ell"
    a[/[aeiou](.)\1/, 0]   #=> "ell"
    a[/[aeiou](.)\1/, 1]   #=> "l"
    a[/[aeiou](.)\1/, 2]   #=> nil

    a[/(?<vowel>[aeiou])(?<non_vowel>[^aeiou])/, "non_vowel"] #=> "l"
    a[/(?<vowel>[aeiou])(?<non_vowel>[^aeiou])/, "vowel"]     #=> "e"

    a["lo"]                #=> "lo"
    a["bye"]               #=> nil


# String#[]=

(from ruby core)
---
    str[integer] = new_str
    str[integer, integer] = new_str
    str[range] = aString
    str[regexp] = new_str
    str[regexp, integer] = new_str
    str[regexp, name] = new_str
    str[other_str] = new_str

---

Element Assignment---Replaces some or all of the content of *str*. The portion
of the string affected is determined using the same criteria as `String#[]`.
If the replacement string is not the same length as the text it is replacing,
the string will be adjusted accordingly. If the regular expression or string
is used as the index doesn't match a position in the string, `IndexError` is
raised. If the regular expression form is used, the optional second `Integer`
allows you to specify which portion of the match to replace (effectively using
the `MatchData` indexing rules. The forms that take an `Integer` will raise an
`IndexError` if the value is out of range; the `Range` form will raise a
`RangeError`, and the `Regexp` and `String` will raise an `IndexError` on
negative match.


# String#ascii_only?

(from ruby core)
---
    str.ascii_only?  -> true or false

---

Returns true for a string which has only ASCII characters.

    "abc".force_encoding("UTF-8").ascii_only?          #=> true
    "abc\u{6666}".force_encoding("UTF-8").ascii_only?  #=> false


# String#b

(from ruby core)
---
    str.b   -> str

---

Returns a copied string whose encoding is ASCII-8BIT.


# String#block_scanf

(from ruby core)
---
    block_scanf(fstr) { |current_match| ... }

---

Scans the current string until the match is exhausted yielding each match as
it is encountered in the string. A block is not necessary as the results will
simply be aggregated into the final array.

    "123 456".block_scanf("%d")
    # => [123, 456]

If a block is given, the value from that is returned from the yield is added
to an output array.

    "123 456".block_scanf("%d) do |digit,| # the ',' unpacks the Array
      digit + 100
    end
    # => [223, 556]

See Scanf for details on creating a format string.

You will need to require 'scanf' to use String#block_scanf


# String#bytes

(from ruby core)
---
    str.bytes    -> an_array

---

Returns an array of bytes in *str*.  This is a shorthand for
`str.each_byte.to_a`.

If a block is given, which is a deprecated form, works the same as
`each_byte`.


# String#bytesize

(from ruby core)
---
    str.bytesize  -> integer

---

Returns the length of `str` in bytes.

    "\x80\u3042".bytesize  #=> 4
    "hello".bytesize       #=> 5


# String#byteslice

(from ruby core)
---
    str.byteslice(integer)           -> new_str or nil
    str.byteslice(integer, integer)   -> new_str or nil
    str.byteslice(range)            -> new_str or nil

---

Byte Reference---If passed a single `Integer`, returns a substring of one byte
at that position. If passed two `Integer` objects, returns a substring
starting at the offset given by the first, and a length given by the second.
If given a `Range`, a substring containing bytes at offsets given by the range
is returned. In all three cases, if an offset is negative, it is counted from
the end of *str*. Returns `nil` if the initial offset falls outside the
string, the length is negative, or the beginning of the range is greater than
the end. The encoding of the resulted string keeps original encoding.

    "hello".byteslice(1)     #=> "e"
    "hello".byteslice(-1)    #=> "o"
    "hello".byteslice(1, 2)  #=> "el"
    "\x80\u3042".byteslice(1, 3) #=> "\u3042"
    "\x03\u3042\xff".byteslice(1..3) #=> "\u3042"


(from gem puma-3.9.1)
---
    byteslice(*arg)

---


# String#capitalize

(from ruby core)
---
    str.capitalize              -> new_str
    str.capitalize([options])   -> new_str

---

Returns a copy of *str* with the first character converted to uppercase and
the remainder to lowercase.

See String#downcase for meaning of `options` and use with different encodings.

    "hello".capitalize    #=> "Hello"
    "HELLO".capitalize    #=> "Hello"
    "123ABC".capitalize   #=> "123abc"


# String#capitalize!

(from ruby core)
---
    str.capitalize!              -> str or nil
    str.capitalize!([options])   -> str or nil

---

Modifies *str* by converting the first character to uppercase and the
remainder to lowercase. Returns `nil` if no changes are made.

See String#downcase for meaning of `options` and use with different encodings.

    a = "hello"
    a.capitalize!   #=> "Hello"
    a               #=> "Hello"
    a.capitalize!   #=> nil


# String#casecmp

(from ruby core)
---
    str.casecmp(other_str)   -> -1, 0, +1 or nil

---

Case-insensitive version of `String#<=>`. Currently, case-insensitivity only
works on characters A-Z/a-z, not all of Unicode. This is different from
`casecmp?`.

    "abcdef".casecmp("abcde")     #=> 1
    "aBcDeF".casecmp("abcdef")    #=> 0
    "abcdef".casecmp("abcdefg")   #=> -1
    "abcdef".casecmp("ABCDEF")    #=> 0


# String#casecmp?

(from ruby core)
---
    str.casecmp?(other_str)   -> true, false, or nil

---

Returns true if str and other_other_str are equal after Unicode case folding,
false if they are not equal, and nil if other_str is not a string.

    "abcdef".casecmp?("abcde")     #=> false
    "aBcDeF".casecmp?("abcdef")    #=> true
    "abcdef".casecmp?("abcdefg")   #=> false
    "abcdef".casecmp?("ABCDEF")    #=> true
    "\u{e4 f6 fc}".casecmp?("\u{c4 d6 dc}") #=> true


# String#center

(from ruby core)
---
    str.center(width, padstr=' ')   -> new_str

---

Centers `str` in `width`.  If `width` is greater than the length of `str`,
returns a new String of length `width` with `str` centered and padded with
`padstr`; otherwise, returns `str`.

    "hello".center(4)         #=> "hello"
    "hello".center(20)        #=> "       hello        "
    "hello".center(20, '123') #=> "1231231hello12312312"


# String#chars

(from ruby core)
---
    str.chars    -> an_array

---

Returns an array of characters in *str*.  This is a shorthand for
`str.each_char.to_a`.

If a block is given, which is a deprecated form, works the same as
`each_char`.


# String#chomp

(from ruby core)
---
    str.chomp(separator=$/)   -> new_str

---

Returns a new `String` with the given record separator removed from the end of
*str* (if present). If `$/` has not been changed from the default Ruby record
separator, then `chomp` also removes carriage return characters (that is it
will remove `\n`, `\r`, and `\r\n`). If `$/` is an empty string, it will
remove all trailing newlines from the string.

    "hello".chomp                #=> "hello"
    "hello\n".chomp              #=> "hello"
    "hello\r\n".chomp            #=> "hello"
    "hello\n\r".chomp            #=> "hello\n"
    "hello\r".chomp              #=> "hello"
    "hello \n there".chomp       #=> "hello \n there"
    "hello".chomp("llo")         #=> "he"
    "hello\r\n\r\n".chomp('')    #=> "hello"
    "hello\r\n\r\r\n".chomp('')  #=> "hello\r\n\r"


# String#chomp!

(from ruby core)
---
    str.chomp!(separator=$/)   -> str or nil

---

Modifies *str* in place as described for `String#chomp`, returning *str*, or
`nil` if no modifications were made.


# String#chop

(from ruby core)
---
    str.chop   -> new_str

---

Returns a new `String` with the last character removed.  If the string ends
with `\r\n`, both characters are removed. Applying `chop` to an empty string
returns an empty string. `String#chomp` is often a safer alternative, as it
leaves the string unchanged if it doesn't end in a record separator.

    "string\r\n".chop   #=> "string"
    "string\n\r".chop   #=> "string\n"
    "string\n".chop     #=> "string"
    "string".chop       #=> "strin"
    "x".chop.chop       #=> ""


# String#chop!

(from ruby core)
---
    str.chop!   -> str or nil

---

Processes *str* as for `String#chop`, returning *str*, or `nil` if *str* is
the empty string.  See also `String#chomp!`.


# String#chr

(from ruby core)
---
    string.chr    ->  string

---

Returns a one-character string at the beginning of the string.

    a = "abcde"
    a.chr    #=> "a"


# String#clear

(from ruby core)
---
    string.clear    ->  string

---

Makes string empty.

    a = "abcde"
    a.clear    #=> ""


# String#codepoints

(from ruby core)
---
    str.codepoints   -> an_array

---

Returns an array of the `Integer` ordinals of the characters in *str*.  This
is a shorthand for `str.each_codepoint.to_a`.

If a block is given, which is a deprecated form, works the same as
`each_codepoint`.


# String#concat

(from ruby core)
---
    str << integer                      -> str
    str.concat(integer1, integer2,...)  -> str
    str << obj                          -> str
    str.concat(obj1, obj2,...)          -> str

---

Append---Concatenates the given object to *str*. If the object is an
`Integer`, it is considered as a codepoint, and is converted to a character
before concatenation. Concat can take multiple arguments. All the arguments
are concatenated in order.

    a = "hello "
    a << "world"   #=> "hello world"
    a.concat(33)   #=> "hello world!"
    a              #=> "hollo world!"

    b = "sn"
    b.concat(b, b)    #=> "snsnsn"


# String#count

(from ruby core)
---
    str.count([other_str]+)   -> integer

---

Each `other_str` parameter defines a set of characters to count.  The
intersection of these sets defines the characters to count in `str`.  Any
`other_str` that starts with a caret `^` is negated.  The sequence `c1-c2`
means all characters between c1 and c2.  The backslash character `\` can be
used to escape `^` or `-` and is otherwise ignored unless it appears at the
end of a sequence or the end of a `other_str`.

    a = "hello world"
    a.count "lo"                   #=> 5
    a.count "lo", "o"              #=> 2
    a.count "hello", "^l"          #=> 4
    a.count "ej-m"                 #=> 4

    "hello^world".count "\\^aeiou" #=> 4
    "hello-world".count "a\\-eo"   #=> 4

    c = "hello world\\r\\n"
    c.count "\\"                   #=> 2
    c.count "\\A"                  #=> 0
    c.count "X-\\w"                #=> 3


# String#crypt

(from ruby core)
---
    str.crypt(salt_str)   -> new_str

---

Applies a one-way cryptographic hash to *str* by invoking the standard library
function `crypt(3)` with the given salt string.  While the format and the
result are system and implementation dependent, using a salt matching the
regular expression `\A[a-zA-Z0-9./]{2}` should be valid and safe on any
platform, in which only the first two characters are significant.

This method is for use in system specific scripts, so if you want a
cross-platform hash function consider using Digest or OpenSSL instead.


# String#delete

(from ruby core)
---
    str.delete([other_str]+)   -> new_str

---

Returns a copy of *str* with all characters in the intersection of its
arguments deleted. Uses the same rules for building the set of characters as
`String#count`.

    "hello".delete "l","lo"        #=> "heo"
    "hello".delete "lo"            #=> "he"
    "hello".delete "aeiou", "^e"   #=> "hell"
    "hello".delete "ej-m"          #=> "ho"


# String#delete!

(from ruby core)
---
    str.delete!([other_str]+)   -> str or nil

---

Performs a `delete` operation in place, returning *str*, or `nil` if *str* was
not modified.


# String#downcase

(from ruby core)
---
    str.downcase              -> new_str
    str.downcase([options])   -> new_str

---

Returns a copy of *str* with all uppercase letters replaced with their
lowercase counterparts. Which letters exactly are replaced, and by which other
letters, depends on the presence or absence of options, and on the `encoding`
of the string.

The meaning of the `options` is as follows:

No option
:   Full Unicode case mapping, suitable for most languages (see :turkic and
    :lithuanian options below for exceptions). Context-dependent case mapping
    as described in Table 3-14 of the Unicode standard is currently not
    supported.
:ascii
:   Only the ASCII region, i.e. the characters ``A'' to ``Z'' and ``a'' to
    ``z'', are affected. This option cannot be combined with any other option.
:turkic
:   Full Unicode case mapping, adapted for Turkic languages (Turkish,
    Aserbaijani,...). This means that upper case I is mapped to lower case
    dotless i, and so on.
:lithuanian
:   Currently, just full Unicode case mapping. In the future, full Unicode
    case mapping adapted for Lithuanian (keeping the dot on the lower case i
    even if there is an accent on top).
:fold
:   Only available on `downcase` and `downcase!`. Unicode case **folding**,
    which is more far-reaching than Unicode case mapping. This option
    currently cannot be combined with any other option (i.e. there is currenty
    no variant for turkic languages).


Please note that several assumptions that are valid for ASCII-only case
conversions do not hold for more general case conversions. For example, the
length of the result may not be the same as the length of the input (neither
in characters nor in bytes), some roundtrip assumptions (e.g. str.downcase ==
str.upcase.downcase) may not apply, and Unicode normalization (i.e.
String#unicode_normalize) is not necessarily maintained by case mapping
operations.

Non-ASCII case mapping/folding is currently supported for UTF-8, UTF-16BE/LE,
UTF-32BE/LE, and ISO-8859-1~16 Strings/Symbols. This support will be extended
to other encodings.

    "hEllO".downcase   #=> "hello"


# String#downcase!

(from ruby core)
---
    str.downcase!             -> str or nil
    str.downcase!([options])  -> str or nil

---

Downcases the contents of *str*, returning `nil` if no changes were made.

See String#downcase for meaning of `options` and use with different encodings.


# String#dump

(from ruby core)
---
    str.dump   -> new_str

---

Produces a version of `str` with all non-printing characters replaced by
`\nnn` notation and all special characters escaped.

    "hello \n ''".dump  #=> "\"hello \\n ''\"


# String#each_byte

(from ruby core)
---
    str.each_byte {|integer| block }    -> str
    str.each_byte                      -> an_enumerator

---

Passes each byte in *str* to the given block, or returns an enumerator if no
block is given.

    "hello".each_byte {|c| print c, ' ' }

*produces:*

    104 101 108 108 111


# String#each_char

(from ruby core)
---
    str.each_char {|cstr| block }    -> str
    str.each_char                    -> an_enumerator

---

Passes each character in *str* to the given block, or returns an enumerator if
no block is given.

    "hello".each_char {|c| print c, ' ' }

*produces:*

    h e l l o


# String#each_codepoint

(from ruby core)
---
    str.each_codepoint {|integer| block }    -> str
    str.each_codepoint                       -> an_enumerator

---

Passes the `Integer` ordinal of each character in *str*, also known as a
*codepoint* when applied to Unicode strings to the given block.

If no block is given, an enumerator is returned instead.

    "hello\u0639".each_codepoint {|c| print c, ' ' }

*produces:*

    104 101 108 108 111 1593


# String#each_line

(from ruby core)
---
    str.each_line(separator=$/) {|substr| block }   -> str
    str.each_line(separator=$/)                     -> an_enumerator

---

Splits *str* using the supplied parameter as the record separator (`$/` by
default), passing each substring in turn to the supplied block.  If a
zero-length record separator is supplied, the string is split into paragraphs
delimited by multiple successive newlines.

If no block is given, an enumerator is returned instead.

    print "Example one\n"
    "hello\nworld".each_line {|s| p s}
    print "Example two\n"
    "hello\nworld".each_line('l') {|s| p s}
    print "Example three\n"
    "hello\n\n\nworld".each_line('') {|s| p s}

*produces:*

    Example one
    "hello\n"
    "world"
    Example two
    "hel"
    "l"
    "o\nworl"
    "d"
    Example three
    "hello\n\n\n"
    "world"


# String#empty?

(from ruby core)
---
    str.empty?   -> true or false

---

Returns `true` if *str* has a length of zero.

    "hello".empty?   #=> false
    " ".empty?       #=> false
    "".empty?        #=> true


# String#encode

(from ruby core)
---
    str.encode(encoding [, options] )   -> str
    str.encode(dst_encoding, src_encoding [, options] )   -> str
    str.encode([options])   -> str

---

The first form returns a copy of `str` transcoded to encoding `encoding`. The
second form returns a copy of `str` transcoded from src_encoding to
dst_encoding. The last form returns a copy of `str` transcoded to
`Encoding.default_internal`.

By default, the first and second form raise Encoding::UndefinedConversionError
for characters that are undefined in the destination encoding, and
Encoding::InvalidByteSequenceError for invalid byte sequences in the source
encoding. The last form by default does not raise exceptions but uses
replacement strings.

The `options` Hash gives details for conversion and can have the following
keys:

:invalid
:   If the value is `:replace`, #encode replaces invalid byte sequences in
    `str` with the replacement character.  The default is to raise the
    Encoding::InvalidByteSequenceError exception
:undef
:   If the value is `:replace`, #encode replaces characters which are
    undefined in the destination encoding with the replacement character. The
    default is to raise the Encoding::UndefinedConversionError.
:replace
:   Sets the replacement string to the given value. The default replacement
    string is "uFFFD" for Unicode encoding forms, and "?" otherwise.
:fallback
:   Sets the replacement string by the given object for undefined character. 
    The object should be a Hash, a Proc, a Method, or an object which has []
    method. Its key is an undefined character encoded in the source encoding
    of current transcoder. Its value can be any encoding until it can be
    converted into the destination encoding of the transcoder.
:xml
:   The value must be `:text` or `:attr`. If the value is `:text` #encode
    replaces undefined characters with their (upper-case hexadecimal) numeric
    character references. '&', '<', and '>' are converted to "&amp;", "&lt;",
    and "&gt;", respectively. If the value is `:attr`, #encode also quotes the
    replacement result (using '"'), and replaces '"' with "&quot;".
:cr_newline
:   Replaces LF ("n") with CR ("r") if value is true.
:crlf_newline
:   Replaces LF ("n") with CRLF ("r\n") if value is true.
:universal_newline
:   Replaces CRLF ("r\n") and CR ("r") with LF ("n") if value is true.



# String#encode!

(from ruby core)
---
    str.encode!(encoding [, options] )   -> str
    str.encode!(dst_encoding, src_encoding [, options] )   -> str

---

The first form transcodes the contents of *str* from str.encoding to
`encoding`. The second form transcodes the contents of *str* from src_encoding
to dst_encoding. The options Hash gives details for conversion. See
String#encode for details. Returns the string even if no changes were made.


# String#encoding

(from ruby core)
---
    obj.encoding   -> encoding

---

Returns the Encoding object that represents the encoding of obj.


# String#end_with?

(from ruby core)
---
    str.end_with?([suffixes]+)   -> true or false

---

Returns true if `str` ends with one of the `suffixes` given.

    "hello".end_with?("ello")               #=> true

    # returns true if one of the +suffixes+ matches.
    "hello".end_with?("heaven", "ello")     #=> true
    "hello".end_with?("heaven", "paradise") #=> false


# String#eql?

(from ruby core)
---
    str.eql?(other)   -> true or false

---

Two strings are equal if they have the same length and content.


# String#force_encoding

(from ruby core)
---
    str.force_encoding(encoding)   -> str

---

Changes the encoding to `encoding` and returns self.


# String#freeze

(from ruby core)
---
    freeze()

---


# String#getbyte

(from ruby core)
---
    str.getbyte(index)          -> 0 .. 255

---

returns the *index*th byte as an integer.


# String#gsub

(from ruby core)
---
    str.gsub(pattern, replacement)       -> new_str
    str.gsub(pattern, hash)              -> new_str
    str.gsub(pattern) {|match| block }   -> new_str
    str.gsub(pattern)                    -> enumerator

---

Returns a copy of *str* with the *all* occurrences of *pattern* substituted
for the second argument. The *pattern* is typically a `Regexp`; if given as a
`String`, any regular expression metacharacters it contains will be
interpreted literally, e.g. `'\\\d'` will match a backslash followed by 'd',
instead of a digit.

If *replacement* is a `String` it will be substituted for the matched text. It
may contain back-references to the pattern's capture groups of the form
`\\\d`, where *d* is a group number, or `\\\k<n>`, where *n* is a group name.
If it is a double-quoted string, both back-references must be preceded by an
additional backslash. However, within *replacement* the special match
variables, such as `$&`, will not refer to the current match.

If the second argument is a `Hash`, and the matched text is one of its keys,
the corresponding value is the replacement string.

In the block form, the current match string is passed in as a parameter, and
variables such as `$1`, `$2`, `$``, `$&`, and `$'` will be set appropriately.
The value returned by the block will be substituted for the match on each
call.

The result inherits any tainting in the original string or any supplied
replacement string.

When neither a block nor a second argument is supplied, an `Enumerator` is
returned.

    "hello".gsub(/[aeiou]/, '*')                  #=> "h*ll*"
    "hello".gsub(/([aeiou])/, '<\1>')             #=> "h<e>ll<o>"
    "hello".gsub(/./) {|s| s.ord.to_s + ' '}      #=> "104 101 108 108 111 "
    "hello".gsub(/(?<foo>[aeiou])/, '{\k<foo>}')  #=> "h{e}ll{o}"
    'hello'.gsub(/[eo]/, 'e' => 3, 'o' => '*')    #=> "h3ll*"


# String#gsub!

(from ruby core)
---
    str.gsub!(pattern, replacement)        -> str or nil
    str.gsub!(pattern, hash)               -> str or nil
    str.gsub!(pattern) {|match| block }    -> str or nil
    str.gsub!(pattern)                     -> an_enumerator

---

Performs the substitutions of `String#gsub` in place, returning *str*, or
`nil` if no substitutions were performed. If no block and no *replacement* is
given, an enumerator is returned instead.


# String#hash

(from ruby core)
---
    str.hash   -> integer

---

Return a hash based on the string's length, content and encoding.

See also Object#hash.


# String#hex

(from ruby core)
---
    str.hex   -> integer

---

Treats leading characters from *str* as a string of hexadecimal digits (with
an optional sign and an optional `0x`) and returns the corresponding number.
Zero is returned on error.

    "0x0a".hex     #=> 10
    "-1234".hex    #=> -4660
    "0".hex        #=> 0
    "wombat".hex   #=> 0


# String#include?

(from ruby core)
---
    str.include? other_str   -> true or false

---

Returns `true` if *str* contains the given string or character.

    "hello".include? "lo"   #=> true
    "hello".include? "ol"   #=> false
    "hello".include? ?h     #=> true


# String#index

(from ruby core)
---
    str.index(substring [, offset])   -> integer or nil
    str.index(regexp [, offset])      -> integer or nil

---

Returns the index of the first occurrence of the given *substring* or pattern
(*regexp*) in *str*. Returns `nil` if not found. If the second parameter is
present, it specifies the position in the string to begin the search.

    "hello".index('e')             #=> 1
    "hello".index('lo')            #=> 3
    "hello".index('a')             #=> nil
    "hello".index(?e)              #=> 1
    "hello".index(/[aeiou]/, -3)   #=> 4


# String#initialize_copy

(from ruby core)
---
    str.replace(other_str)   -> str

---

Replaces the contents and taintedness of *str* with the corresponding values
in *other_str*.

    s = "hello"         #=> "hello"
    s.replace "world"   #=> "world"


# String#insert

(from ruby core)
---
    str.insert(index, other_str)   -> str

---

Inserts *other_str* before the character at the given *index*, modifying
*str*. Negative indices count from the end of the string, and insert *after*
the given character. The intent is insert *aString* so that it starts at the
given *index*.

    "abcd".insert(0, 'X')    #=> "Xabcd"
    "abcd".insert(3, 'X')    #=> "abcXd"
    "abcd".insert(4, 'X')    #=> "abcdX"
    "abcd".insert(-3, 'X')   #=> "abXcd"
    "abcd".insert(-1, 'X')   #=> "abcdX"


# String#inspect

(from ruby core)
---
    str.inspect   -> string

---

Returns a printable version of *str*, surrounded by quote marks, with special
characters escaped.

    str = "hello"
    str[3] = "\b"
    str.inspect       #=> "\"hel\\bo\""


# String#intern

(from ruby core)
---
    str.intern   -> symbol

---

Returns the `Symbol` corresponding to *str*, creating the symbol if it did not
previously exist. See `Symbol#id2name`.

    "Koala".intern         #=> :Koala
    s = 'cat'.to_sym       #=> :cat
    s == :cat              #=> true
    s = '@cat'.to_sym      #=> :@cat
    s == :@cat             #=> true

This can also be used to create symbols that cannot be represented using the
`:xxx` notation.

    'cat and dog'.to_sym   #=> :"cat and dog"


# String#iseuc

(from ruby core)
---
    String#iseuc   => true or false

---

Returns whether `self`'s encoding is EUC-JP or not.


# String#isjis

(from ruby core)
---
    String#isjis   => true or false

---

Returns whether `self`'s encoding is ISO-2022-JP or not.


# String#issjis

(from ruby core)
---
    String#issjis   => true or false

---

Returns whether `self`'s encoding is Shift_JIS or not.


# String#isutf8

(from ruby core)
---
    String#isutf8   => true or false

---

Returns whether `self`'s encoding is UTF-8 or not.


# String#kconv

(from ruby core)
---
    String#kconv(to_enc, from_enc)

---

Convert `self` to `to_enc`. `to_enc` and `from_enc` are given as constants of
Kconv or Encoding objects.


# String#length

(from ruby core)
---
    str.length   -> integer

---

Returns the character length of *str*.


# String#lines

(from ruby core)
---
    str.lines(separator=$/)  -> an_array

---

Returns an array of lines in *str* split using the supplied record separator
(`$/` by default).  This is a shorthand for `str.each_line(separator).to_a`.

If a block is given, which is a deprecated form, works the same as
`each_line`.


# String#ljust

(from ruby core)
---
    str.ljust(integer, padstr=' ')   -> new_str

---

If *integer* is greater than the length of *str*, returns a new `String` of
length *integer* with *str* left justified and padded with *padstr*;
otherwise, returns *str*.

    "hello".ljust(4)            #=> "hello"
    "hello".ljust(20)           #=> "hello               "
    "hello".ljust(20, '1234')   #=> "hello123412341234123"


# String#lstrip

(from ruby core)
---
    str.lstrip   -> new_str

---

Returns a copy of *str* with leading whitespace removed. See also
`String#rstrip` and `String#strip`.

Refer to `strip` for the definition of whitespace.

    "  hello  ".lstrip   #=> "hello  "
    "hello".lstrip       #=> "hello"


# String#lstrip!

(from ruby core)
---
    str.lstrip!   -> self or nil

---

Removes leading whitespace from *str*, returning `nil` if no change was made.
See also `String#rstrip!` and `String#strip!`.

Refer to `strip` for the definition of whitespace.

    "  hello  ".lstrip!  #=> "hello  "
    "hello  ".lstrip!    #=> nil
    "hello".lstrip!      #=> nil


# String#match

(from ruby core)
---
    str.match(pattern)        -> matchdata or nil
    str.match(pattern, pos)   -> matchdata or nil

---

Converts *pattern* to a `Regexp` (if it isn't already one), then invokes its
`match` method on *str*.  If the second parameter is present, it specifies the
position in the string to begin the search.

    'hello'.match('(.)\1')      #=> #<MatchData "ll" 1:"l">
    'hello'.match('(.)\1')[0]   #=> "ll"
    'hello'.match(/(.)\1/)[0]   #=> "ll"
    'hello'.match('xx')         #=> nil

If a block is given, invoke the block with MatchData if match succeed, so that
you can write

    str.match(pat) {|m| ...}

instead of

    if m = str.match(pat)
      ...
    end

The return value is a value from block execution in this case.


# String#match?

(from ruby core)
---
    str.match?(pattern)        -> true or false
    str.match?(pattern, pos)   -> true or false

---

Converts *pattern* to a `Regexp` (if it isn't already one), then returns a
`true` or `false` indicates whether the regexp is matched *str* or not without
updating `$~` and other related variables.  If the second parameter is
present, it specifies the position in the string to begin the search.

    "Ruby".match?(/R.../)    #=> true
    "Ruby".match?(/R.../, 1) #=> false
    "Ruby".match?(/P.../)    #=> false
    $&                       #=> nil


# String#next

(from ruby core)
---
    str.next   -> new_str

---

Returns the successor to *str*. The successor is calculated by incrementing
characters starting from the rightmost alphanumeric (or the rightmost
character if there are no alphanumerics) in the string. Incrementing a digit
always results in another digit, and incrementing a letter results in another
letter of the same case. Incrementing nonalphanumerics uses the underlying
character set's collating sequence.

If the increment generates a ``carry,'' the character to the left of it is
incremented. This process repeats until there is no carry, adding an
additional character if necessary.

    "abcd".succ        #=> "abce"
    "THX1138".succ     #=> "THX1139"
    "<<koala>>".succ   #=> "<<koalb>>"
    "1999zzz".succ     #=> "2000aaa"
    "ZZZ9999".succ     #=> "AAAA0000"
    "***".succ         #=> "**+"


# String#next!

(from ruby core)
---
    str.next!   -> str

---

Equivalent to `String#succ`, but modifies the receiver in place.


# String#oct

(from ruby core)
---
    str.oct   -> integer

---

Treats leading characters of *str* as a string of octal digits (with an
optional sign) and returns the corresponding number.  Returns 0 if the
conversion fails.

    "123".oct       #=> 83
    "-377".oct      #=> -255
    "bad".oct       #=> 0
    "0377bad".oct   #=> 255

If `str` starts with `0`, radix indicators are honored. See Kernel#Integer.


# String#ord

(from ruby core)
---
    str.ord   -> integer

---

Return the `Integer` ordinal of a one-character string.

    "a".ord         #=> 97


# String#partition

(from ruby core)
---
    str.partition(sep)              -> [head, sep, tail]
    str.partition(regexp)           -> [head, match, tail]

---

Searches *sep* or pattern (*regexp*) in the string and returns the part before
it, the match, and the part after it. If it is not found, returns two empty
strings and *str*.

    "hello".partition("l")         #=> ["he", "l", "lo"]
    "hello".partition("x")         #=> ["hello", "", ""]
    "hello".partition(/.l/)        #=> ["h", "el", "lo"]


# String#prepend

(from ruby core)
---
    str.prepend(other_str1, other_str2,...)  -> str

---

Prepend---Prepend the given strings to *str*.

    a = "!"
    a.prepend("hello ", "world") #=> "hello world!"
    a                            #=> "hello world!"

See also String#concat.


# String#replace

(from ruby core)
---
    str.replace(other_str)   -> str

---

Replaces the contents and taintedness of *str* with the corresponding values
in *other_str*.

    s = "hello"         #=> "hello"
    s.replace "world"   #=> "world"


# String#reverse

(from ruby core)
---
    str.reverse   -> new_str

---

Returns a new string with the characters from *str* in reverse order.

    "stressed".reverse   #=> "desserts"


# String#reverse!

(from ruby core)
---
    str.reverse!   -> str

---

Reverses *str* in place.


# String#rindex

(from ruby core)
---
    str.rindex(substring [, integer])   -> integer or nil
    str.rindex(regexp [, integer])   -> integer or nil

---

Returns the index of the last occurrence of the given *substring* or pattern
(*regexp*) in *str*. Returns `nil` if not found. If the second parameter is
present, it specifies the position in the string to end the
search---characters beyond this point will not be considered.

    "hello".rindex('e')             #=> 1
    "hello".rindex('l')             #=> 3
    "hello".rindex('a')             #=> nil
    "hello".rindex(?e)              #=> 1
    "hello".rindex(/[aeiou]/, -2)   #=> 1


# String#rjust

(from ruby core)
---
    str.rjust(integer, padstr=' ')   -> new_str

---

If *integer* is greater than the length of *str*, returns a new `String` of
length *integer* with *str* right justified and padded with *padstr*;
otherwise, returns *str*.

    "hello".rjust(4)            #=> "hello"
    "hello".rjust(20)           #=> "               hello"
    "hello".rjust(20, '1234')   #=> "123412341234123hello"


# String#rpartition

(from ruby core)
---
    str.rpartition(sep)             -> [head, sep, tail]
    str.rpartition(regexp)          -> [head, match, tail]

---

Searches *sep* or pattern (*regexp*) in the string from the end of the string,
and returns the part before it, the match, and the part after it. If it is not
found, returns two empty strings and *str*.

    "hello".rpartition("l")         #=> ["hel", "l", "o"]
    "hello".rpartition("x")         #=> ["", "", "hello"]
    "hello".rpartition(/.l/)        #=> ["he", "ll", "o"]


# String#rstrip

(from ruby core)
---
    str.rstrip   -> new_str

---

Returns a copy of *str* with trailing whitespace removed. See also
`String#lstrip` and `String#strip`.

Refer to `strip` for the definition of whitespace.

    "  hello  ".rstrip   #=> "  hello"
    "hello".rstrip       #=> "hello"


# String#rstrip!

(from ruby core)
---
    str.rstrip!   -> self or nil

---

Removes trailing whitespace from *str*, returning `nil` if no change was made.
See also `String#lstrip!` and `String#strip!`.

Refer to `strip` for the definition of whitespace.

    "  hello  ".rstrip!  #=> "  hello"
    "  hello".rstrip!    #=> nil
    "hello".rstrip!      #=> nil


# String#scan

(from ruby core)
---
    str.scan(pattern)                         -> array
    str.scan(pattern) {|match, ...| block }   -> str

---

Both forms iterate through *str*, matching the pattern (which may be a
`Regexp` or a `String`). For each match, a result is generated and either
added to the result array or passed to the block. If the pattern contains no
groups, each individual result consists of the matched string, `$&`.  If the
pattern contains groups, each individual result is itself an array containing
one entry per group.

    a = "cruel world"
    a.scan(/\w+/)        #=> ["cruel", "world"]
    a.scan(/.../)        #=> ["cru", "el ", "wor"]
    a.scan(/(...)/)      #=> [["cru"], ["el "], ["wor"]]
    a.scan(/(..)(..)/)   #=> [["cr", "ue"], ["l ", "wo"]]

And the block form:

    a.scan(/\w+/) {|w| print "<<#{w}>> " }
    print "\n"
    a.scan(/(.)(.)/) {|x,y| print y, x }
    print "\n"

*produces:*

    <<cruel>> <<world>>
    rceu lowlr


# String#scanf

(from ruby core)
---
    scanf(fstr) { |current_match| ... }

---

Scans the current string. If a block is given, it functions exactly like
block_scanf.

    arr = "123 456".scanf("%d%d")
    # => [123, 456]

    require 'pp'

    "this 123 read that 456 other".scanf("%s%d%s") {|m| pp m}

    # ["this", 123, "read"]
    # ["that", 456, "other"]
    # => [["this", 123, "read"], ["that", 456, "other"]]

See Scanf for details on creating a format string.

You will need to require 'scanf' to use String#scanf


# String#scrub

(from ruby core)
---
    str.scrub -> new_str
    str.scrub(repl) -> new_str
    str.scrub{|bytes|} -> new_str

---

If the string is invalid byte sequence then replace invalid bytes with given
replacement character, else returns self. If block is given, replace invalid
bytes with returned value of the block.

    "abc\u3042\x81".scrub #=> "abc\u3042\uFFFD"
    "abc\u3042\x81".scrub("*") #=> "abc\u3042*"
    "abc\u3042\xE3\x80".scrub{|bytes| '<'+bytes.unpack('H*')[0]+'>' } #=> "abc\u3042<e380>"


# String#scrub!

(from ruby core)
---
    str.scrub! -> str
    str.scrub!(repl) -> str
    str.scrub!{|bytes|} -> str

---

If the string is invalid byte sequence then replace invalid bytes with given
replacement character, else returns self. If block is given, replace invalid
bytes with returned value of the block.

    "abc\u3042\x81".scrub! #=> "abc\u3042\uFFFD"
    "abc\u3042\x81".scrub!("*") #=> "abc\u3042*"
    "abc\u3042\xE3\x80".scrub!{|bytes| '<'+bytes.unpack('H*')[0]+'>' } #=> "abc\u3042<e380>"


# String#setbyte

(from ruby core)
---
    str.setbyte(index, integer) -> integer

---

modifies the *index*th byte as *integer*.


# String#shellescape

(from ruby core)
---
    str.shellescape => string

---

Escapes `str` so that it can be safely used in a Bourne shell command line.

See Shellwords.shellescape for details.


# String#shellsplit

(from ruby core)
---
    str.shellsplit => array

---

Splits `str` into an array of tokens in the same way the UNIX Bourne shell
does.

See Shellwords.shellsplit for details.


# String#size

(from ruby core)
---
    str.size     -> integer

---

Returns the character length of *str*.


# String#slice

(from ruby core)
---
    str.slice(index)           -> new_str or nil
    str.slice(start, length)   -> new_str or nil
    str.slice(range)           -> new_str or nil
    str.slice(regexp)          -> new_str or nil
    str.slice(regexp, capture) -> new_str or nil
    str.slice(match_str)       -> new_str or nil

---

Element Reference --- If passed a single `index`, returns a substring of one
character at that index. If passed a `start` index and a `length`, returns a
substring containing `length` characters starting at the `start` index. If
passed a `range`, its beginning and end are interpreted as offsets delimiting
the substring to be returned.

In these three cases, if an index is negative, it is counted from the end of
the string.  For the `start` and `range` cases the starting index is just
before a character and an index matching the string's size. Additionally, an
empty string is returned when the starting index for a character range is at
the end of the string.

Returns `nil` if the initial index falls outside the string or the length is
negative.

If a `Regexp` is supplied, the matching portion of the string is returned.  If
a `capture` follows the regular expression, which may be a capture group index
or name, follows the regular expression that component of the MatchData is
returned instead.

If a `match_str` is given, that string is returned if it occurs in the string.

Returns `nil` if the regular expression does not match or the match string
cannot be found.

    a = "hello there"

    a[1]                   #=> "e"
    a[2, 3]                #=> "llo"
    a[2..3]                #=> "ll"

    a[-3, 2]               #=> "er"
    a[7..-2]               #=> "her"
    a[-4..-2]              #=> "her"
    a[-2..-4]              #=> ""

    a[11, 0]               #=> ""
    a[11]                  #=> nil
    a[12, 0]               #=> nil
    a[12..-1]              #=> nil

    a[/[aeiou](.)\1/]      #=> "ell"
    a[/[aeiou](.)\1/, 0]   #=> "ell"
    a[/[aeiou](.)\1/, 1]   #=> "l"
    a[/[aeiou](.)\1/, 2]   #=> nil

    a[/(?<vowel>[aeiou])(?<non_vowel>[^aeiou])/, "non_vowel"] #=> "l"
    a[/(?<vowel>[aeiou])(?<non_vowel>[^aeiou])/, "vowel"]     #=> "e"

    a["lo"]                #=> "lo"
    a["bye"]               #=> nil


# String#slice!

(from ruby core)
---
    str.slice!(integer)           -> new_str or nil
    str.slice!(integer, integer)   -> new_str or nil
    str.slice!(range)            -> new_str or nil
    str.slice!(regexp)           -> new_str or nil
    str.slice!(other_str)        -> new_str or nil

---

Deletes the specified portion from *str*, and returns the portion deleted.

    string = "this is a string"
    string.slice!(2)        #=> "i"
    string.slice!(3..6)     #=> " is "
    string.slice!(/s.*t/)   #=> "sa st"
    string.slice!("r")      #=> "r"
    string                  #=> "thing"


# String#split

(from ruby core)
---
    str.split(pattern=nil, [limit])   -> anArray

---

Divides *str* into substrings based on a delimiter, returning an array of
these substrings.

If *pattern* is a `String`, then its contents are used as the delimiter when
splitting *str*. If *pattern* is a single space, *str* is split on whitespace,
with leading whitespace and runs of contiguous whitespace characters ignored.

If *pattern* is a `Regexp`, *str* is divided where the pattern matches.
Whenever the pattern matches a zero-length string, *str* is split into
individual characters. If *pattern* contains groups, the respective matches
will be returned in the array as well.

If *pattern* is `nil`, the value of `$;` is used. If `$;` is `nil` (which is
the default), *str* is split on whitespace as if ' ' were specified.

If the *limit* parameter is omitted, trailing null fields are suppressed. If
*limit* is a positive number, at most that number of fields will be returned
(if *limit* is `1`, the entire string is returned as the only entry in an
array). If negative, there is no limit to the number of fields returned, and
trailing null fields are not suppressed.

When the input `str` is empty an empty Array is returned as the string is
considered to have no fields to split.

    " now's  the time".split        #=> ["now's", "the", "time"]
    " now's  the time".split(' ')   #=> ["now's", "the", "time"]
    " now's  the time".split(/ /)   #=> ["", "now's", "", "the", "time"]
    "1, 2.34,56, 7".split(%r{,\s*}) #=> ["1", "2.34", "56", "7"]
    "hello".split(//)               #=> ["h", "e", "l", "l", "o"]
    "hello".split(//, 3)            #=> ["h", "e", "llo"]
    "hi mom".split(%r{\s*})         #=> ["h", "i", "m", "o", "m"]

    "mellow yellow".split("ello")   #=> ["m", "w y", "w"]
    "1,2,,3,4,,".split(',')         #=> ["1", "2", "", "3", "4"]
    "1,2,,3,4,,".split(',', 4)      #=> ["1", "2", "", "3,4,,"]
    "1,2,,3,4,,".split(',', -4)     #=> ["1", "2", "", "3", "4", "", ""]

    "".split(',', -1)               #=> []


# String#squeeze

(from ruby core)
---
    str.squeeze([other_str]*)    -> new_str

---

Builds a set of characters from the *other_str* parameter(s) using the
procedure described for `String#count`. Returns a new string where runs of the
same character that occur in this set are replaced by a single character. If
no arguments are given, all runs of identical characters are replaced by a
single character.

    "yellow moon".squeeze                  #=> "yelow mon"
    "  now   is  the".squeeze(" ")         #=> " now is the"
    "putters shoot balls".squeeze("m-z")   #=> "puters shot balls"


# String#squeeze!

(from ruby core)
---
    str.squeeze!([other_str]*)   -> str or nil

---

Squeezes *str* in place, returning either *str*, or `nil` if no changes were
made.


# String#start_with?

(from ruby core)
---
    str.start_with?([prefixes]+)   -> true or false

---

Returns true if `str` starts with one of the `prefixes` given.

    "hello".start_with?("hell")               #=> true

    # returns true if one of the prefixes matches.
    "hello".start_with?("heaven", "hell")     #=> true
    "hello".start_with?("heaven", "paradise") #=> false


# String#strip

(from ruby core)
---
    str.strip   -> new_str

---

Returns a copy of *str* with leading and trailing whitespace removed.

Whitespace is defined as any of the following characters: null, horizontal
tab, line feed, vertical tab, form feed, carriage return, space.

    "    hello    ".strip   #=> "hello"
    "\tgoodbye\r\n".strip   #=> "goodbye"
    "\x00\t\n\v\f\r ".strip #=> ""


# String#strip!

(from ruby core)
---
    str.strip!   -> str or nil

---

Removes leading and trailing whitespace from *str*. Returns `nil` if *str* was
not altered.

Refer to `strip` for the definition of whitespace.


# String#sub

(from ruby core)
---
    str.sub(pattern, replacement)         -> new_str
    str.sub(pattern, hash)                -> new_str
    str.sub(pattern) {|match| block }     -> new_str

---

Returns a copy of `str` with the *first* occurrence of `pattern` replaced by
the second argument. The `pattern` is typically a Regexp; if given as a
String, any regular expression metacharacters it contains will be interpreted
literally, e.g. `'\\\d'` will match a backslash followed by 'd', instead of a
digit.

If `replacement` is a String it will be substituted for the matched text. It
may contain back-references to the pattern's capture groups of the form
`"\\d"`, where *d* is a group number, or `"\\k<n>"`, where *n* is a group
name. If it is a double-quoted string, both back-references must be preceded
by an additional backslash. However, within `replacement` the special match
variables, such as `$&`, will not refer to the current match. If `replacement`
is a String that looks like a pattern's capture group but is actually not a
pattern capture group e.g. `"\\'"`, then it will have to be preceded by two
backslashes like so `"\\\\'"`.

If the second argument is a Hash, and the matched text is one of its keys, the
corresponding value is the replacement string.

In the block form, the current match string is passed in as a parameter, and
variables such as `$1`, `$2`, `$``, `$&`, and `$'` will be set appropriately.
The value returned by the block will be substituted for the match on each
call.

The result inherits any tainting in the original string or any supplied
replacement string.

    "hello".sub(/[aeiou]/, '*')                  #=> "h*llo"
    "hello".sub(/([aeiou])/, '<\1>')             #=> "h<e>llo"
    "hello".sub(/./) {|s| s.ord.to_s + ' ' }     #=> "104 ello"
    "hello".sub(/(?<foo>[aeiou])/, '*\k<foo>*')  #=> "h*e*llo"
    'Is SHELL your preferred shell?'.sub(/[[:upper:]]{2,}/, ENV)
     #=> "Is /bin/bash your preferred shell?"


# String#sub!

(from ruby core)
---
    str.sub!(pattern, replacement)          -> str or nil
    str.sub!(pattern) {|match| block }      -> str or nil

---

Performs the same substitution as String#sub in-place.

Returns `str` if a substitution was performed or `nil` if no substitution was
performed.


# String#succ

(from ruby core)
---
    str.succ   -> new_str

---

Returns the successor to *str*. The successor is calculated by incrementing
characters starting from the rightmost alphanumeric (or the rightmost
character if there are no alphanumerics) in the string. Incrementing a digit
always results in another digit, and incrementing a letter results in another
letter of the same case. Incrementing nonalphanumerics uses the underlying
character set's collating sequence.

If the increment generates a ``carry,'' the character to the left of it is
incremented. This process repeats until there is no carry, adding an
additional character if necessary.

    "abcd".succ        #=> "abce"
    "THX1138".succ     #=> "THX1139"
    "<<koala>>".succ   #=> "<<koalb>>"
    "1999zzz".succ     #=> "2000aaa"
    "ZZZ9999".succ     #=> "AAAA0000"
    "***".succ         #=> "**+"


# String#succ!

(from ruby core)
---
    str.succ!   -> str

---

Equivalent to `String#succ`, but modifies the receiver in place.


# String#sum

(from ruby core)
---
    str.sum(n=16)   -> integer

---

Returns a basic *n*-bit checksum of the characters in *str*, where *n* is the
optional `Integer` parameter, defaulting to 16. The result is simply the sum
of the binary value of each byte in *str* modulo `2**n - 1`. This is not a
particularly good checksum.


# String#swapcase

(from ruby core)
---
    str.swapcase              -> new_str
    str.swapcase([options])   -> new_str

---

Returns a copy of *str* with uppercase alphabetic characters converted to
lowercase and lowercase characters converted to uppercase.

See String#downcase for meaning of `options` and use with different encodings.

    "Hello".swapcase          #=> "hELLO"
    "cYbEr_PuNk11".swapcase   #=> "CyBeR_pUnK11"


# String#swapcase!

(from ruby core)
---
    str.swapcase!              -> str or nil
    str.swapcase!([options])   -> str or nil

---

Equivalent to `String#swapcase`, but modifies the receiver in place, returning
*str*, or `nil` if no changes were made.

See String#downcase for meaning of `options` and use with different encodings.


# String#to_c

(from ruby core)
---
    str.to_c  ->  complex

---

Returns a complex which denotes the string form.  The parser ignores leading
whitespaces and trailing garbage.  Any digit sequences can be separated by an
underscore.  Returns zero for null or garbage string.

    '9'.to_c           #=> (9+0i)
    '2.5'.to_c         #=> (2.5+0i)
    '2.5/1'.to_c       #=> ((5/2)+0i)
    '-3/2'.to_c        #=> ((-3/2)+0i)
    '-i'.to_c          #=> (0-1i)
    '45i'.to_c         #=> (0+45i)
    '3-4i'.to_c        #=> (3-4i)
    '-4e2-4e-2i'.to_c  #=> (-400.0-0.04i)
    '-0.0-0.0i'.to_c   #=> (-0.0-0.0i)
    '1/2+3/4i'.to_c    #=> ((1/2)+(3/4)*i)
    'ruby'.to_c        #=> (0+0i)

See Kernel.Complex.


# String#to_d

(from ruby core)
---
    string.to_d  -> bigdecimal

---

Convert `string` to a BigDecimal and return it.

    require 'bigdecimal'
    require 'bigdecimal/util'

    "0.5".to_d
    # => 0.5e0


# String#to_f

(from ruby core)
---
    str.to_f   -> float

---

Returns the result of interpreting leading characters in *str* as a floating
point number. Extraneous characters past the end of a valid number are
ignored. If there is not a valid number at the start of *str*, `0.0` is
returned. This method never raises an exception.

    "123.45e1".to_f        #=> 1234.5
    "45.67 degrees".to_f   #=> 45.67
    "thx1138".to_f         #=> 0.0


# String#to_i

(from ruby core)
---
    str.to_i(base=10)   -> integer

---

Returns the result of interpreting leading characters in *str* as an integer
base *base* (between 2 and 36). Extraneous characters past the end of a valid
number are ignored. If there is not a valid number at the start of *str*, `0`
is returned. This method never raises an exception when *base* is valid.

    "12345".to_i             #=> 12345
    "99 red balloons".to_i   #=> 99
    "0a".to_i                #=> 0
    "0a".to_i(16)            #=> 10
    "hello".to_i             #=> 0
    "1100101".to_i(2)        #=> 101
    "1100101".to_i(8)        #=> 294977
    "1100101".to_i(10)       #=> 1100101
    "1100101".to_i(16)       #=> 17826049


# String#to_r

(from ruby core)
---
    str.to_r  ->  rational

---

Returns a rational which denotes the string form.  The parser ignores leading
whitespaces and trailing garbage.  Any digit sequences can be separated by an
underscore.  Returns zero for null or garbage string.

NOTE: '0.3'.to_r isn't the same as 0.3.to_r.  The former is equivalent to
'3/10'.to_r, but the latter isn't so.

    '  2  '.to_r       #=> (2/1)
    '300/2'.to_r       #=> (150/1)
    '-9.2'.to_r        #=> (-46/5)
    '-9.2e2'.to_r      #=> (-920/1)
    '1_234_567'.to_r   #=> (1234567/1)
    '21 june 09'.to_r  #=> (21/1)
    '21/06/09'.to_r    #=> (7/2)
    'bwv 1079'.to_r    #=> (0/1)

See Kernel.Rational.


# String#to_s

(from ruby core)
---
    str.to_s     -> str
    str.to_str   -> str

---

Returns `self`.

If called on a subclass of String, converts the receiver to a String object.


# String#to_str

(from ruby core)
---
    str.to_str   -> str

---

Returns `self`.

If called on a subclass of String, converts the receiver to a String object.


# String#to_sym

(from ruby core)
---
    str.to_sym   -> symbol

---

Returns the `Symbol` corresponding to *str*, creating the symbol if it did not
previously exist. See `Symbol#id2name`.

    "Koala".intern         #=> :Koala
    s = 'cat'.to_sym       #=> :cat
    s == :cat              #=> true
    s = '@cat'.to_sym      #=> :@cat
    s == :@cat             #=> true

This can also be used to create symbols that cannot be represented using the
`:xxx` notation.

    'cat and dog'.to_sym   #=> :"cat and dog"


# String#toeuc

(from ruby core)
---
    String#toeuc   => string

---

Convert `self` to EUC-JP


# String#tojis

(from ruby core)
---
    String#tojis   => string

---

Convert `self` to ISO-2022-JP


# String#tolocale

(from ruby core)
---
    String#tolocale   => string

---

Convert `self` to locale encoding


# String#tosjis

(from ruby core)
---
    String#tosjis   => string

---

Convert `self` to Shift_JIS


# String#toutf16

(from ruby core)
---
    String#toutf16   => string

---

Convert `self` to UTF-16


# String#toutf32

(from ruby core)
---
    String#toutf32   => string

---

Convert `self` to UTF-32


# String#toutf8

(from ruby core)
---
    String#toutf8   => string

---

Convert `self` to UTF-8


# String#tr

(from ruby core)
---
    str.tr(from_str, to_str)   => new_str

---

Returns a copy of `str` with the characters in `from_str` replaced by the
corresponding characters in `to_str`.  If `to_str` is shorter than `from_str`,
it is padded with its last character in order to maintain the correspondence.

    "hello".tr('el', 'ip')      #=> "hippo"
    "hello".tr('aeiou', '*')    #=> "h*ll*"
    "hello".tr('aeiou', 'AA*')  #=> "hAll*"

Both strings may use the `c1-c2` notation to denote ranges of characters, and
`from_str` may start with a `^`, which denotes all characters except those
listed.

    "hello".tr('a-y', 'b-z')    #=> "ifmmp"
    "hello".tr('^aeiou', '*')   #=> "*e**o"

The backslash character `\` can be used to escape `^` or `-` and is otherwise
ignored unless it appears at the end of a range or the end of the `from_str`
or `to_str`:

    "hello^world".tr("\\^aeiou", "*") #=> "h*ll**w*rld"
    "hello-world".tr("a\\-eo", "*")   #=> "h*ll**w*rld"

    "hello\r\nworld".tr("\r", "")   #=> "hello\nworld"
    "hello\r\nworld".tr("\\r", "")  #=> "hello\r\nwold"
    "hello\r\nworld".tr("\\\r", "") #=> "hello\nworld"

    "X['\\b']".tr("X\\", "")   #=> "['b']"
    "X['\\b']".tr("X-\\]", "") #=> "'b'"


# String#tr!

(from ruby core)
---
    str.tr!(from_str, to_str)   -> str or nil

---

Translates *str* in place, using the same rules as `String#tr`. Returns *str*,
or `nil` if no changes were made.


# String#tr_s

(from ruby core)
---
    str.tr_s(from_str, to_str)   -> new_str

---

Processes a copy of *str* as described under `String#tr`, then removes
duplicate characters in regions that were affected by the translation.

    "hello".tr_s('l', 'r')     #=> "hero"
    "hello".tr_s('el', '*')    #=> "h*o"
    "hello".tr_s('el', 'hx')   #=> "hhxo"


# String#tr_s!

(from ruby core)
---
    str.tr_s!(from_str, to_str)   -> str or nil

---

Performs `String#tr_s` processing on *str* in place, returning *str*, or `nil`
if no changes were made.


# String#unicode_normalize

(from ruby core)
---
    str.unicode_normalize(form=:nfc)

---

### Unicode Normalization

Returns a normalized form of `str`, using Unicode normalizations NFC, NFD,
NFKC, or NFKD. The normalization form used is determined by `form`, which is
any of the four values :nfc, :nfd, :nfkc, or :nfkd. The default is :nfc.

If the string is not in a Unicode Encoding, then an Exception is raised. In
this context, 'Unicode Encoding' means any of  UTF-8, UTF-16BE/LE, and
UTF-32BE/LE, as well as GB18030, UCS_2BE, and UCS_4BE. Anything else than
UTF-8 is implemented by converting to UTF-8, which makes it slower than UTF-8.

*Examples*

    "a\u0300".unicode_normalize        #=> 'à' (same as "\u00E0")
    "a\u0300".unicode_normalize(:nfc)  #=> 'à' (same as "\u00E0")
    "\u00E0".unicode_normalize(:nfd)   #=> 'à' (same as "a\u0300")
    "\xE0".force_encoding('ISO-8859-1').unicode_normalize(:nfd)
                                       #=> Encoding::CompatibilityError raised


# String#unicode_normalize!

(from ruby core)
---
    str.unicode_normalize!(form=:nfc)

---

Destructive version of String#unicode_normalize, doing Unicode normalization
in place.


# String#unicode_normalized?

(from ruby core)
---
    str.unicode_normalized?(form=:nfc)

---

Checks whether `str` is in Unicode normalization form `form`, which is any of
the four values :nfc, :nfd, :nfkc, or :nfkd. The default is :nfc.

If the string is not in a Unicode Encoding, then an Exception is raised. For
details, see String#unicode_normalize.

*Examples*

    "a\u0300".unicode_normalized?        #=> false
    "a\u0300".unicode_normalized?(:nfd)  #=> true
    "\u00E0".unicode_normalized?         #=> true
    "\u00E0".unicode_normalized?(:nfd)   #=> false
    "\xE0".force_encoding('ISO-8859-1').unicode_normalized?
                                         #=> Encoding::CompatibilityError raised


# String#unpack

(from ruby core)
---
    str.unpack(format)    ->  anArray

---

Decodes *str* (which may contain binary data) according to the format string,
returning an array of each value extracted. The format string consists of a
sequence of single-character directives, summarized in the table at the end of
this entry. Each directive may be followed by a number, indicating the number
of times to repeat with this directive. An asterisk (```*`'') will use up all
remaining elements. The directives `sSiIlL` may each be followed by an
underscore (```_`'') or exclamation mark (```!`'') to use the underlying
platform's native size for the specified type; otherwise, it uses a
platform-independent consistent size. Spaces are ignored in the format string.
See also `String#unpack1`,  `Array#pack`.

    "abc \0\0abc \0\0".unpack('A6Z6')   #=> ["abc", "abc "]
    "abc \0\0".unpack('a3a3')           #=> ["abc", " \000\000"]
    "abc \0abc \0".unpack('Z*Z*')       #=> ["abc ", "abc "]
    "aa".unpack('b8B8')                 #=> ["10000110", "01100001"]
    "aaa".unpack('h2H2c')               #=> ["16", "61", 97]
    "\xfe\xff\xfe\xff".unpack('sS')     #=> [-2, 65534]
    "now=20is".unpack('M*')             #=> ["now is"]
    "whole".unpack('xax2aX2aX1aX2a')    #=> ["h", "e", "l", "l", "o"]

This table summarizes the various formats and the Ruby classes returned by
each.

    Integer       |         |
    Directive     | Returns | Meaning
    ------------------------------------------------------------------
    C             | Integer | 8-bit unsigned (unsigned char)
    S             | Integer | 16-bit unsigned, native endian (uint16_t)
    L             | Integer | 32-bit unsigned, native endian (uint32_t)
    Q             | Integer | 64-bit unsigned, native endian (uint64_t)
    J             | Integer | pointer width unsigned, native endian (uintptr_t)
                  |         |
    c             | Integer | 8-bit signed (signed char)
    s             | Integer | 16-bit signed, native endian (int16_t)
    l             | Integer | 32-bit signed, native endian (int32_t)
    q             | Integer | 64-bit signed, native endian (int64_t)
    j             | Integer | pointer width signed, native endian (intptr_t)
                  |         |
    S_ S!         | Integer | unsigned short, native endian
    I I_ I!       | Integer | unsigned int, native endian
    L_ L!         | Integer | unsigned long, native endian
    Q_ Q!         | Integer | unsigned long long, native endian (ArgumentError
                  |         | if the platform has no long long type.)
    J!            | Integer | uintptr_t, native endian (same with J)
                  |         |
    s_ s!         | Integer | signed short, native endian
    i i_ i!       | Integer | signed int, native endian
    l_ l!         | Integer | signed long, native endian
    q_ q!         | Integer | signed long long, native endian (ArgumentError
                  |         | if the platform has no long long type.)
    j!            | Integer | intptr_t, native endian (same with j)
                  |         |
    S> s> S!> s!> | Integer | same as the directives without ">" except
    L> l> L!> l!> |         | big endian
    I!> i!>       |         |
    Q> q> Q!> q!> |         | "S>" is same as "n"
    J> j> J!> j!> |         | "L>" is same as "N"
                  |         |
    S< s< S!< s!< | Integer | same as the directives without "<" except
    L< l< L!< l!< |         | little endian
    I!< i!<       |         |
    Q< q< Q!< q!< |         | "S<" is same as "v"
    J< j< J!< j!< |         | "L<" is same as "V"
                  |         |
    n             | Integer | 16-bit unsigned, network (big-endian) byte order
    N             | Integer | 32-bit unsigned, network (big-endian) byte order
    v             | Integer | 16-bit unsigned, VAX (little-endian) byte order
    V             | Integer | 32-bit unsigned, VAX (little-endian) byte order
                  |         |
    U             | Integer | UTF-8 character
    w             | Integer | BER-compressed integer (see Array.pack)

    Float        |         |
    Directive    | Returns | Meaning
    -----------------------------------------------------------------
    D d          | Float   | double-precision, native format
    F f          | Float   | single-precision, native format
    E            | Float   | double-precision, little-endian byte order
    e            | Float   | single-precision, little-endian byte order
    G            | Float   | double-precision, network (big-endian) byte order
    g            | Float   | single-precision, network (big-endian) byte order

    String       |         |
    Directive    | Returns | Meaning
    -----------------------------------------------------------------
    A            | String  | arbitrary binary string (remove trailing nulls and ASCII spaces)
    a            | String  | arbitrary binary string
    Z            | String  | null-terminated string
    B            | String  | bit string (MSB first)
    b            | String  | bit string (LSB first)
    H            | String  | hex string (high nibble first)
    h            | String  | hex string (low nibble first)
    u            | String  | UU-encoded string
    M            | String  | quoted-printable, MIME encoding (see RFC2045)
    m            | String  | base64 encoded string (RFC 2045) (default)
                 |         | base64 encoded string (RFC 4648) if followed by 0
    P            | String  | pointer to a structure (fixed-length string)
    p            | String  | pointer to a null-terminated string

    Misc.        |         |
    Directive    | Returns | Meaning
    -----------------------------------------------------------------
    @            | ---     | skip to the offset given by the length argument
    X            | ---     | skip backward one byte
    x            | ---     | skip forward one byte

HISTORY

*   J, J! j, and j! are available since Ruby 2.3.
*   Q_, Q!, q_, and q! are available since Ruby 2.1.
*   I!<, i!<, I!>, and i!> are available since Ruby 1.9.3.



# String#unpack1

(from ruby core)
---
    str.unpack1(format)    ->  obj

---

Decodes *str* (which may contain binary data) according to the format string,
returning the first value extracted. See also `String#unpack`, `Array#pack`.


# String#upcase

(from ruby core)
---
    str.upcase              -> new_str
    str.upcase([options])   -> new_str

---

Returns a copy of *str* with all lowercase letters replaced with their
uppercase counterparts.

See String#downcase for meaning of `options` and use with different encodings.

    "hEllO".upcase   #=> "HELLO"


# String#upcase!

(from ruby core)
---
    str.upcase!              -> str or nil
    str.upcase!([options])   -> str or nil

---

Upcases the contents of *str*, returning `nil` if no changes were made.

See String#downcase for meaning of `options` and use with different encodings.


# String#upto

(from ruby core)
---
    str.upto(other_str, exclusive=false) {|s| block }   -> str
    str.upto(other_str, exclusive=false)                -> an_enumerator

---

Iterates through successive values, starting at *str* and ending at
*other_str* inclusive, passing each value in turn to the block. The
`String#succ` method is used to generate each value.  If optional second
argument exclusive is omitted or is false, the last value will be included;
otherwise it will be excluded.

If no block is given, an enumerator is returned instead.

    "a8".upto("b6") {|s| print s, ' ' }
    for s in "a8".."b6"
      print s, ' '
    end

*produces:*

    a8 a9 b0 b1 b2 b3 b4 b5 b6
    a8 a9 b0 b1 b2 b3 b4 b5 b6

If *str* and *other_str* contains only ascii numeric characters, both are
recognized as decimal numbers. In addition, the width of string (e.g. leading
zeros) is handled appropriately.

    "9".upto("11").to_a   #=> ["9", "10", "11"]
    "25".upto("5").to_a   #=> []
    "07".upto("11").to_a  #=> ["07", "08", "09", "10", "11"]


# String#valid_encoding?

(from ruby core)
---
    str.valid_encoding?  -> true or false

---

Returns true for a string which is encoded correctly.

    "\xc2\xa1".force_encoding("UTF-8").valid_encoding?  #=> true
    "\xc2".force_encoding("UTF-8").valid_encoding?      #=> false
    "\x80".force_encoding("UTF-8").valid_encoding?      #=> false


(from gem activesupport-5.1.2)
---








String inflections define new methods on the String class to transform names
for different purposes. For instance, you can figure out the name of a table
from the name of a class.

    'ScaleScore'.tableize # => "scale_scores"






---
# Constants:

BLANK_RE
:   [not documented]


# Instance methods:

    acts_like_string?
    at
    blank?
    camelcase
    camelize
    classify
    constantize
    dasherize
    deconstantize
    demodulize
    exclude?
    first
    foreign_key
    from
    html_safe
    humanize
    in_time_zone
    indent
    indent!
    inquiry
    is_utf8?
    last
    mb_chars
    parameterize
    pluralize
    remove
    remove!
    safe_constantize
    singularize
    squish
    squish!
    strip_heredoc
    tableize
    titlecase
    titleize
    to
    to_date
    to_datetime
    to_time
    truncate
    truncate_words
    underscore
    upcase_first

# String#acts_like_string?

(from gem activesupport-5.1.2)
---
    acts_like_string?()

---

Enables more predictable duck-typing on String-like classes. See
`Object#acts_like?`.


# String#at

(from gem activesupport-5.1.2)
---
    at(position)

---

If you pass a single integer, returns a substring of one character at that
position. The first character of the string is at position 0, the next at
position 1, and so on. If a range is supplied, a substring containing
characters at offsets given by the range is returned. In both cases, if an
offset is negative, it is counted from the end of the string. Returns `nil` if
the initial offset falls outside the string. Returns an empty string if the
beginning of the range is greater than the end of the string.

    str = "hello"
    str.at(0)      # => "h"
    str.at(1..3)   # => "ell"
    str.at(-2)     # => "l"
    str.at(-2..-1) # => "lo"
    str.at(5)      # => nil
    str.at(5..-1)  # => ""

If a Regexp is given, the matching portion of the string is returned. If a
String is given, that given string is returned if it occurs in the string. In
both cases, `nil` is returned if there is no match.

    str = "hello"
    str.at(/lo/) # => "lo"
    str.at(/ol/) # => nil
    str.at("lo") # => "lo"
    str.at("ol") # => nil


(from gem mail-2.6.6)
---
    at(position)

---

Returns the character at the `position` treating the string as an array (where
0 is the first character).

Examples:
    "hello".at(0)  # => "h"
    "hello".at(4)  # => "o"
    "hello".at(10) # => ERROR if < 1.9, nil in 1.9


# String#blank?

(from gem activesupport-5.1.2)
---
    blank?()

---

A string is blank if it's empty or contains whitespaces only:

    ''.blank?       # => true
    '   '.blank?    # => true
    "\t\n\r".blank? # => true
    ' blah '.blank? # => false

Unicode whitespace is supported:

    "\u00a0".blank? # => true

@return [true, false]


# String#camelcase

(from gem activesupport-5.1.2)
---
    camelcase(first_letter = :upper)

---


# String#camelize

(from gem activesupport-5.1.2)
---
    camelize(first_letter = :upper)

---

By default, `camelize` converts strings to UpperCamelCase. If the argument to
camelize is set to `:lower` then camelize produces lowerCamelCase.

`camelize` will also convert '/' to '::' which is useful for converting paths
to namespaces.

    'active_record'.camelize                # => "ActiveRecord"
    'active_record'.camelize(:lower)        # => "activeRecord"
    'active_record/errors'.camelize         # => "ActiveRecord::Errors"
    'active_record/errors'.camelize(:lower) # => "activeRecord::Errors"


# String#classify

(from gem activesupport-5.1.2)
---
    classify()

---

Creates a class name from a plural table name like Rails does for table names
to models. Note that this returns a string and not a class. (To convert to an
actual class follow `classify` with `constantize`.)

    'ham_and_eggs'.classify # => "HamAndEgg"
    'posts'.classify        # => "Post"


# String#constantize

(from gem activesupport-5.1.2)
---
    constantize()

---

`constantize` tries to find a declared constant with the name specified in the
string. It raises a NameError when the name is not in CamelCase or is not
initialized.  See ActiveSupport::Inflector.constantize

    'Module'.constantize  # => Module
    'Class'.constantize   # => Class
    'blargle'.constantize # => NameError: wrong constant name blargle


(from gem mail-2.6.6)
---
    constantize()

---

Tries to find a constant with the name specified in the argument string:

    "Module".constantize     # => Module
    "Test::Unit".constantize # => Test::Unit

The name is assumed to be the one of a top-level constant, no matter whether
it starts with "::" or not. No lexical context is taken into account:

    C = 'outside'
    module M
      C = 'inside'
      C               # => 'inside'
      "C".constantize # => 'outside', same as ::C
    end

NameError is raised when the name is not in CamelCase or the constant is
unknown.


# String#dasherize

(from gem activesupport-5.1.2)
---
    dasherize()

---

Replaces underscores with dashes in the string.

    'puni_puni'.dasherize # => "puni-puni"


# String#deconstantize

(from gem activesupport-5.1.2)
---
    deconstantize()

---

Removes the rightmost segment from the constant expression in the string.

    'Net::HTTP'.deconstantize   # => "Net"
    '::Net::HTTP'.deconstantize # => "::Net"
    'String'.deconstantize      # => ""
    '::String'.deconstantize    # => ""
    ''.deconstantize            # => ""

See also `demodulize`.


# String#demodulize

(from gem activesupport-5.1.2)
---
    demodulize()

---

Removes the module part from the constant expression in the string.

    'ActiveSupport::Inflector::Inflections'.demodulize # => "Inflections"
    'Inflections'.demodulize                           # => "Inflections"
    '::Inflections'.demodulize                         # => "Inflections"
    ''.demodulize                                      # => ''

See also `deconstantize`.


# String#exclude?

(from gem activesupport-5.1.2)
---
    exclude?(string)

---

The inverse of `String#include?`. Returns true if the string does not include
the other string.

    "hello".exclude? "lo" # => false
    "hello".exclude? "ol" # => true
    "hello".exclude? ?h   # => false


# String#first

(from gem activesupport-5.1.2)
---
    first(limit = 1)

---

Returns the first character. If a limit is supplied, returns a substring from
the beginning of the string until it reaches the limit value. If the given
limit is greater than or equal to the string length, returns a copy of self.

    str = "hello"
    str.first    # => "h"
    str.first(1) # => "h"
    str.first(2) # => "he"
    str.first(0) # => ""
    str.first(6) # => "hello"


(from gem mail-2.6.6)
---
    first(limit = 1)

---

Returns the first character of the string or the first `limit` characters.

Examples:
    "hello".first     # => "h"
    "hello".first(2)  # => "he"
    "hello".first(10) # => "hello"


# String#foreign_key

(from gem activesupport-5.1.2)
---
    foreign_key(separate_class_name_and_id_with_underscore = true)

---

Creates a foreign key name from a class name.
`separate_class_name_and_id_with_underscore` sets whether the method should
put '_' between the name and 'id'.

    'Message'.foreign_key        # => "message_id"
    'Message'.foreign_key(false) # => "messageid"
    'Admin::Post'.foreign_key    # => "post_id"


# String#from

(from gem activesupport-5.1.2)
---
    from(position)

---

Returns a substring from the given position to the end of the string. If the
position is negative, it is counted from the end of the string.

    str = "hello"
    str.from(0)  # => "hello"
    str.from(3)  # => "lo"
    str.from(-2) # => "lo"

You can mix it with `to` method and do fun things like:

    str = "hello"
    str.from(0).to(-1) # => "hello"
    str.from(1).to(-2) # => "ell"


(from gem mail-2.6.6)
---
    from(position)

---

Returns the remaining of the string from the `position` treating the string as
an array (where 0 is the first character).

Examples:
    "hello".from(0)  # => "hello"
    "hello".from(2)  # => "llo"
    "hello".from(10) # => "" if < 1.9, nil in 1.9


# String#html_safe

(from gem activesupport-5.1.2)
---
    html_safe()

---

Marks a string as trusted safe. It will be inserted into HTML with no
additional escaping performed. It is your responsibility to ensure that the
string contains no malicious content. This method is equivalent to the `raw`
helper in views. It is recommended that you use `sanitize` instead of this
method. It should never be called on user input.


# String#humanize

(from gem activesupport-5.1.2)
---
    humanize(options = {})

---

Capitalizes the first word, turns underscores into spaces, and strips a
trailing '_id' if present. Like `titleize`, this is meant for creating pretty
output.

The capitalization of the first word can be turned off by setting the optional
parameter `capitalize` to false. By default, this parameter is true.

    'employee_salary'.humanize              # => "Employee salary"
    'author_id'.humanize                    # => "Author"
    'author_id'.humanize(capitalize: false) # => "author"
    '_id'.humanize                          # => "Id"


# String#in_time_zone

(from gem activesupport-5.1.2)
---
    in_time_zone(zone = ::Time.zone)

---

Converts String to a TimeWithZone in the current zone if Time.zone or
Time.zone_default is set, otherwise converts String to a Time via
String#to_time


# String#indent

(from gem activesupport-5.1.2)
---
    indent(amount, indent_string = nil, indent_empty_lines = false)

---

Indents the lines in the receiver:

    <<EOS.indent(2)
    def some_method
      some_code
    end
    EOS
    # =>
      def some_method
        some_code
      end

The second argument, `indent_string`, specifies which indent string to use.
The default is `nil`, which tells the method to make a guess by peeking at the
first indented line, and fallback to a space if there is none.

    "  foo".indent(2)        # => "    foo"
    "foo\n\t\tbar".indent(2) # => "\t\tfoo\n\t\t\t\tbar"
    "foo".indent(2, "\t")    # => "\t\tfoo"

While `indent_string` is typically one space or tab, it may be any string.

The third argument, `indent_empty_lines`, is a flag that says whether empty
lines should be indented. Default is false.

    "foo\n\nbar".indent(2)            # => "  foo\n\n  bar"
    "foo\n\nbar".indent(2, nil, true) # => "  foo\n  \n  bar"


# String#indent!

(from gem activesupport-5.1.2)
---
    indent!(amount, indent_string = nil, indent_empty_lines = false)

---

Same as `indent`, except it indents the receiver in-place.

Returns the indented string, or `nil` if there was nothing to indent.


# String#inquiry

(from gem activesupport-5.1.2)
---
    inquiry()

---

Wraps the current string in the `ActiveSupport::StringInquirer` class, which
gives you a prettier way to test for equality.

    env = 'production'.inquiry
    env.production?  # => true
    env.development? # => false


# String#is_utf8?

(from gem activesupport-5.1.2)
---
    is_utf8?()

---

Returns `true` if string has utf_8 encoding.

    utf_8_str = "some string".encode "UTF-8"
    iso_str = "some string".encode "ISO-8859-1"

    utf_8_str.is_utf8? # => true
    iso_str.is_utf8?   # => false


(from gem mail-2.6.6)
---
    is_utf8?()

---


# String#last

(from gem activesupport-5.1.2)
---
    last(limit = 1)

---

Returns the last character of the string. If a limit is supplied, returns a
substring from the end of the string until it reaches the limit value
(counting backwards). If the given limit is greater than or equal to the
string length, returns a copy of self.

    str = "hello"
    str.last    # => "o"
    str.last(1) # => "o"
    str.last(2) # => "lo"
    str.last(0) # => ""
    str.last(6) # => "hello"


(from gem mail-2.6.6)
---
    last(limit = 1)

---

Returns the last character of the string or the last `limit` characters.

Examples:
    "hello".last     # => "o"
    "hello".last(2)  # => "lo"
    "hello".last(10) # => "hello"


# String#mb_chars

(from gem activesupport-5.1.2)
---
    mb_chars()

---

## Multibyte proxy

`mb_chars` is a multibyte safe proxy for string methods.

It creates and returns an instance of the ActiveSupport::Multibyte::Chars
class which encapsulates the original string. A Unicode safe version of all
the String methods are defined on this proxy class. If the proxy class doesn't
respond to a certain method, it's forwarded to the encapsulated string.

    >> "ǉ".upcase
    => "ǉ"
    >> "ǉ".mb_chars.upcase.to_s
    => "Ǉ"

## Method chaining

All the methods on the Chars proxy which normally return a string will return
a Chars object. This allows method chaining on the result of any of these
methods.

    name.mb_chars.reverse.length # => 12

## Interoperability and configuration

The Chars object tries to be as interchangeable with String objects as
possible: sorting and comparing between String and Char work like expected.
The bang! methods change the internal string representation in the Chars
object. Interoperability problems can be resolved easily with a `to_s` call.

For more information about the methods defined on the Chars proxy see
ActiveSupport::Multibyte::Chars. For information about how to change the
default Multibyte behavior see ActiveSupport::Multibyte.


(from gem mail-2.6.6)
---
    mb_chars()

---

## Multibyte proxy

`mb_chars` is a multibyte safe proxy for string methods.

In Ruby 1.8 and older it creates and returns an instance of the
Mail::Multibyte::Chars class which encapsulates the original string. A Unicode
safe version of all the String methods are defined on this proxy class. If the
proxy class doesn't respond to a certain method, it's forwarded to the
encapsuled string.

    name = 'Claus Müller'
    name.reverse # => "rell??M sualC"
    name.length  # => 13

    name.mb_chars.reverse.to_s # => "rellüM sualC"
    name.mb_chars.length       # => 12

In Ruby 1.9 and newer `mb_chars` returns `self` because String is (mostly)
encoding aware. This means that it becomes easy to run one version of your
code on multiple Ruby versions.

## Method chaining

All the methods on the Chars proxy which normally return a string will return
a Chars object. This allows method chaining on the result of any of these
methods.

    name.mb_chars.reverse.length # => 12

## Interoperability and configuration

The Chars object tries to be as interchangeable with String objects as
possible: sorting and comparing between String and Char work like expected.
The bang! methods change the internal string representation in the Chars
object. Interoperability problems can be resolved easily with a `to_s` call.

For more information about the methods defined on the Chars proxy see
Mail::Multibyte::Chars. For information about how to change the default
Multibyte behaviour see Mail::Multibyte.


# String#parameterize

(from gem activesupport-5.1.2)
---
    parameterize(separator: "-", preserve_case: false)

---

Replaces special characters in a string so that it may be used as part of a
'pretty' URL.

    class Person
      def to_param
        "#{id}-#{name.parameterize}"
      end
    end

    @person = Person.find(1)
    # => #<Person id: 1, name: "Donald E. Knuth">

    <%= link_to(@person.name, person_path) %>
    # => <a href="/person/1-donald-e-knuth">Donald E. Knuth</a>

To preserve the case of the characters in a string, use the `preserve_case`
argument.

    class Person
      def to_param
        "#{id}-#{name.parameterize(preserve_case: true)}"
      end
    end

    @person = Person.find(1)
    # => #<Person id: 1, name: "Donald E. Knuth">

    <%= link_to(@person.name, person_path) %>
    # => <a href="/person/1-Donald-E-Knuth">Donald E. Knuth</a>


# String#pluralize

(from gem activesupport-5.1.2)
---
    pluralize(count = nil, locale = :en)

---

Returns the plural form of the word in the string.

If the optional parameter `count` is specified, the singular form will be
returned if `count == 1`. For any other value of `count` the plural will be
returned.

If the optional parameter `locale` is specified, the word will be pluralized
as a word of that language. By default, this parameter is set to `:en`. You
must define your own inflection rules for languages other than English.

    'post'.pluralize             # => "posts"
    'octopus'.pluralize          # => "octopi"
    'sheep'.pluralize            # => "sheep"
    'words'.pluralize            # => "words"
    'the blue mailman'.pluralize # => "the blue mailmen"
    'CamelOctopus'.pluralize     # => "CamelOctopi"
    'apple'.pluralize(1)         # => "apple"
    'apple'.pluralize(2)         # => "apples"
    'ley'.pluralize(:es)         # => "leyes"
    'ley'.pluralize(1, :es)      # => "ley"


# String#remove

(from gem activesupport-5.1.2)
---
    remove(*patterns)

---

Returns a new string with all occurrences of the patterns removed.
    str = "foo bar test"
    str.remove(" test")                 # => "foo bar"
    str.remove(" test", /bar/)          # => "foo "
    str                                 # => "foo bar test"


# String#remove!

(from gem activesupport-5.1.2)
---
    remove!(*patterns)

---

Alters the string by removing all occurrences of the patterns.
    str = "foo bar test"
    str.remove!(" test", /bar/)         # => "foo "
    str                                 # => "foo "


# String#safe_constantize

(from gem activesupport-5.1.2)
---
    safe_constantize()

---

`safe_constantize` tries to find a declared constant with the name specified
in the string. It returns `nil` when the name is not in CamelCase or is not
initialized.  See ActiveSupport::Inflector.safe_constantize

    'Module'.safe_constantize  # => Module
    'Class'.safe_constantize   # => Class
    'blargle'.safe_constantize # => nil


# String#singularize

(from gem activesupport-5.1.2)
---
    singularize(locale = :en)

---

The reverse of `pluralize`, returns the singular form of a word in a string.

If the optional parameter `locale` is specified, the word will be singularized
as a word of that language. By default, this parameter is set to `:en`. You
must define your own inflection rules for languages other than English.

    'posts'.singularize            # => "post"
    'octopi'.singularize           # => "octopus"
    'sheep'.singularize            # => "sheep"
    'word'.singularize             # => "word"
    'the blue mailmen'.singularize # => "the blue mailman"
    'CamelOctopi'.singularize      # => "CamelOctopus"
    'leyes'.singularize(:es)       # => "ley"


# String#squish

(from gem activesupport-5.1.2)
---
    squish()

---

Returns the string, first removing all whitespace on both ends of the string,
and then changing remaining consecutive whitespace groups into one space each.

Note that it handles both ASCII and Unicode whitespace.

    %{ Multi-line
       string }.squish                   # => "Multi-line string"
    " foo   bar    \n   \t   boo".squish # => "foo bar boo"


# String#squish!

(from gem activesupport-5.1.2)
---
    squish!()

---

Performs a destructive squish. See String#squish.
    str = " foo   bar    \n   \t   boo"
    str.squish!                         # => "foo bar boo"
    str                                 # => "foo bar boo"


# String#strip_heredoc

(from gem activesupport-5.1.2)
---
    strip_heredoc()

---

Strips indentation in heredocs.

For example in

    if options[:usage]
      puts <<-USAGE.strip_heredoc
        This command does such and such.

        Supported options are:
          -h         This message
          ...
      USAGE
    end

the user would see the usage message aligned against the left margin.

Technically, it looks for the least indented non-empty line in the whole
string, and removes that amount of leading whitespace.


# String#tableize

(from gem activesupport-5.1.2)
---
    tableize()

---

Creates the name of a table like Rails does for models to table names. This
method uses the `pluralize` method on the last word in the string.

    'RawScaledScorer'.tableize # => "raw_scaled_scorers"
    'ham_and_egg'.tableize     # => "ham_and_eggs"
    'fancyCategory'.tableize   # => "fancy_categories"


# String#titlecase

(from gem activesupport-5.1.2)
---
    titlecase()

---


# String#titleize

(from gem activesupport-5.1.2)
---
    titleize()

---

Capitalizes all the words and replaces some characters in the string to create
a nicer looking title. `titleize` is meant for creating pretty output. It is
not used in the Rails internals.

`titleize` is also aliased as `titlecase`.

    'man from the boondocks'.titleize # => "Man From The Boondocks"
    'x-men: the last stand'.titleize  # => "X Men: The Last Stand"


# String#to

(from gem activesupport-5.1.2)
---
    to(position)

---

Returns a substring from the beginning of the string to the given position. If
the position is negative, it is counted from the end of the string.

    str = "hello"
    str.to(0)  # => "h"
    str.to(3)  # => "hell"
    str.to(-2) # => "hell"

You can mix it with `from` method and do fun things like:

    str = "hello"
    str.from(0).to(-1) # => "hello"
    str.from(1).to(-2) # => "ell"


(from gem mail-2.6.6)
---
    to(position)

---

Returns the beginning of the string up to the `position` treating the string
as an array (where 0 is the first character).

Examples:
    "hello".to(0)  # => "h"
    "hello".to(2)  # => "hel"
    "hello".to(10) # => "hello"


# String#to_date

(from gem activesupport-5.1.2)
---
    to_date()

---

Converts a string to a Date value.

    "1-1-2012".to_date   # => Sun, 01 Jan 2012
    "01/01/2012".to_date # => Sun, 01 Jan 2012
    "2012-12-13".to_date # => Thu, 13 Dec 2012
    "12/13/2012".to_date # => ArgumentError: invalid date


# String#to_datetime

(from gem activesupport-5.1.2)
---
    to_datetime()

---

Converts a string to a DateTime value.

    "1-1-2012".to_datetime            # => Sun, 01 Jan 2012 00:00:00 +0000
    "01/01/2012 23:59:59".to_datetime # => Sun, 01 Jan 2012 23:59:59 +0000
    "2012-12-13 12:50".to_datetime    # => Thu, 13 Dec 2012 12:50:00 +0000
    "12/13/2012".to_datetime          # => ArgumentError: invalid date


# String#to_time

(from gem activesupport-5.1.2)
---
    to_time(form = :local)

---

Converts a string to a Time value. The `form` can be either :utc or :local
(default :local).

The time is parsed using Time.parse method. If `form` is :local, then the time
is in the system timezone. If the date part is missing then the current date
is used and if the time part is missing then it is assumed to be 00:00:00.

    "13-12-2012".to_time               # => 2012-12-13 00:00:00 +0100
    "06:12".to_time                    # => 2012-12-13 06:12:00 +0100
    "2012-12-13 06:12".to_time         # => 2012-12-13 06:12:00 +0100
    "2012-12-13T06:12".to_time         # => 2012-12-13 06:12:00 +0100
    "2012-12-13T06:12".to_time(:utc)   # => 2012-12-13 06:12:00 UTC
    "12/13/2012".to_time               # => ArgumentError: argument out of range


# String#truncate

(from gem activesupport-5.1.2)
---
    truncate(truncate_at, options = {})

---

Truncates a given `text` after a given `length` if `text` is longer than
`length`:

    'Once upon a time in a world far far away'.truncate(27)
    # => "Once upon a time in a wo..."

Pass a string or regexp `:separator` to truncate `text` at a natural break:

    'Once upon a time in a world far far away'.truncate(27, separator: ' ')
    # => "Once upon a time in a..."

    'Once upon a time in a world far far away'.truncate(27, separator: /\s/)
    # => "Once upon a time in a..."

The last characters will be replaced with the `:omission` string (defaults to
"...") for a total length not exceeding `length`:

    'And they found that many people were sleeping better.'.truncate(25, omission: '... (continued)')
    # => "And they f... (continued)"


# String#truncate_words

(from gem activesupport-5.1.2)
---
    truncate_words(words_count, options = {})

---

Truncates a given `text` after a given number of words (`words_count`):

    'Once upon a time in a world far far away'.truncate_words(4)
    # => "Once upon a time..."

Pass a string or regexp `:separator` to specify a different separator of
words:

    'Once<br>upon<br>a<br>time<br>in<br>a<br>world'.truncate_words(5, separator: '<br>')
    # => "Once<br>upon<br>a<br>time<br>in..."

The last characters will be replaced with the `:omission` string (defaults to
"..."):

    'And they found that many people were sleeping better.'.truncate_words(5, omission: '... (continued)')
    # => "And they found that many... (continued)"


# String#underscore

(from gem activesupport-5.1.2)
---
    underscore()

---

The reverse of `camelize`. Makes an underscored, lowercase form from the
expression in the string.

`underscore` will also change '::' to '/' to convert namespaces to paths.

    'ActiveModel'.underscore         # => "active_model"
    'ActiveModel::Errors'.underscore # => "active_model/errors"


# String#upcase_first

(from gem activesupport-5.1.2)
---
    upcase_first()

---

Converts just the first character to uppercase.

    'what a Lovely Day'.upcase_first # => "What a Lovely Day"
    'w'.upcase_first                 # => "W"
    ''.upcase_first                  # => ""


(from gem builder-3.2.3)
---
    Permission is granted for use, copying, modification, distribution,
    and distribution of modified versions of this work as long as the
    above copyright notice is included.

++

Enhance the String class with a XML escaped character version of to_s.
---
# Instance methods:

    _blankslate_as_name
    to_xs

# String#_blankslate_as_name

(from gem builder-3.2.3)
---
    _blankslate_as_name()

---


# String#to_xs

(from gem builder-3.2.3)
---
    to_xs(escape=true)

---

XML escaped version of to_s. When `escape` is set to false the CP1252 fix is
still applied but utf-8 characters are not converted to character entities.


(from gem mail-2.6.6)
---
This is an almost cut and paste from ActiveSupport v3.0.6, copied in here so
that Mail itself does not depend on ActiveSupport to avoid versioning
conflicts

---
# Instance methods:

    at
    constantize
    first
    from
    is_utf8?
    last
    mb_chars
    to

# String#at

(from gem activesupport-5.1.2)
---
    at(position)

---

If you pass a single integer, returns a substring of one character at that
position. The first character of the string is at position 0, the next at
position 1, and so on. If a range is supplied, a substring containing
characters at offsets given by the range is returned. In both cases, if an
offset is negative, it is counted from the end of the string. Returns `nil` if
the initial offset falls outside the string. Returns an empty string if the
beginning of the range is greater than the end of the string.

    str = "hello"
    str.at(0)      # => "h"
    str.at(1..3)   # => "ell"
    str.at(-2)     # => "l"
    str.at(-2..-1) # => "lo"
    str.at(5)      # => nil
    str.at(5..-1)  # => ""

If a Regexp is given, the matching portion of the string is returned. If a
String is given, that given string is returned if it occurs in the string. In
both cases, `nil` is returned if there is no match.

    str = "hello"
    str.at(/lo/) # => "lo"
    str.at(/ol/) # => nil
    str.at("lo") # => "lo"
    str.at("ol") # => nil


(from gem mail-2.6.6)
---
    at(position)

---

Returns the character at the `position` treating the string as an array (where
0 is the first character).

Examples:
    "hello".at(0)  # => "h"
    "hello".at(4)  # => "o"
    "hello".at(10) # => ERROR if < 1.9, nil in 1.9


# String#constantize

(from gem activesupport-5.1.2)
---
    constantize()

---

`constantize` tries to find a declared constant with the name specified in the
string. It raises a NameError when the name is not in CamelCase or is not
initialized.  See ActiveSupport::Inflector.constantize

    'Module'.constantize  # => Module
    'Class'.constantize   # => Class
    'blargle'.constantize # => NameError: wrong constant name blargle


(from gem mail-2.6.6)
---
    constantize()

---

Tries to find a constant with the name specified in the argument string:

    "Module".constantize     # => Module
    "Test::Unit".constantize # => Test::Unit

The name is assumed to be the one of a top-level constant, no matter whether
it starts with "::" or not. No lexical context is taken into account:

    C = 'outside'
    module M
      C = 'inside'
      C               # => 'inside'
      "C".constantize # => 'outside', same as ::C
    end

NameError is raised when the name is not in CamelCase or the constant is
unknown.


# String#first

(from gem activesupport-5.1.2)
---
    first(limit = 1)

---

Returns the first character. If a limit is supplied, returns a substring from
the beginning of the string until it reaches the limit value. If the given
limit is greater than or equal to the string length, returns a copy of self.

    str = "hello"
    str.first    # => "h"
    str.first(1) # => "h"
    str.first(2) # => "he"
    str.first(0) # => ""
    str.first(6) # => "hello"


(from gem mail-2.6.6)
---
    first(limit = 1)

---

Returns the first character of the string or the first `limit` characters.

Examples:
    "hello".first     # => "h"
    "hello".first(2)  # => "he"
    "hello".first(10) # => "hello"


# String#from

(from gem activesupport-5.1.2)
---
    from(position)

---

Returns a substring from the given position to the end of the string. If the
position is negative, it is counted from the end of the string.

    str = "hello"
    str.from(0)  # => "hello"
    str.from(3)  # => "lo"
    str.from(-2) # => "lo"

You can mix it with `to` method and do fun things like:

    str = "hello"
    str.from(0).to(-1) # => "hello"
    str.from(1).to(-2) # => "ell"


(from gem mail-2.6.6)
---
    from(position)

---

Returns the remaining of the string from the `position` treating the string as
an array (where 0 is the first character).

Examples:
    "hello".from(0)  # => "hello"
    "hello".from(2)  # => "llo"
    "hello".from(10) # => "" if < 1.9, nil in 1.9


# String#is_utf8?

(from gem activesupport-5.1.2)
---
    is_utf8?()

---

Returns `true` if string has utf_8 encoding.

    utf_8_str = "some string".encode "UTF-8"
    iso_str = "some string".encode "ISO-8859-1"

    utf_8_str.is_utf8? # => true
    iso_str.is_utf8?   # => false


(from gem mail-2.6.6)
---
    is_utf8?()

---


# String#last

(from gem activesupport-5.1.2)
---
    last(limit = 1)

---

Returns the last character of the string. If a limit is supplied, returns a
substring from the end of the string until it reaches the limit value
(counting backwards). If the given limit is greater than or equal to the
string length, returns a copy of self.

    str = "hello"
    str.last    # => "o"
    str.last(1) # => "o"
    str.last(2) # => "lo"
    str.last(0) # => ""
    str.last(6) # => "hello"


(from gem mail-2.6.6)
---
    last(limit = 1)

---

Returns the last character of the string or the last `limit` characters.

Examples:
    "hello".last     # => "o"
    "hello".last(2)  # => "lo"
    "hello".last(10) # => "hello"


# String#mb_chars

(from gem activesupport-5.1.2)
---
    mb_chars()

---

## Multibyte proxy

`mb_chars` is a multibyte safe proxy for string methods.

It creates and returns an instance of the ActiveSupport::Multibyte::Chars
class which encapsulates the original string. A Unicode safe version of all
the String methods are defined on this proxy class. If the proxy class doesn't
respond to a certain method, it's forwarded to the encapsulated string.

    >> "ǉ".upcase
    => "ǉ"
    >> "ǉ".mb_chars.upcase.to_s
    => "Ǉ"

## Method chaining

All the methods on the Chars proxy which normally return a string will return
a Chars object. This allows method chaining on the result of any of these
methods.

    name.mb_chars.reverse.length # => 12

## Interoperability and configuration

The Chars object tries to be as interchangeable with String objects as
possible: sorting and comparing between String and Char work like expected.
The bang! methods change the internal string representation in the Chars
object. Interoperability problems can be resolved easily with a `to_s` call.

For more information about the methods defined on the Chars proxy see
ActiveSupport::Multibyte::Chars. For information about how to change the
default Multibyte behavior see ActiveSupport::Multibyte.


(from gem mail-2.6.6)
---
    mb_chars()

---

## Multibyte proxy

`mb_chars` is a multibyte safe proxy for string methods.

In Ruby 1.8 and older it creates and returns an instance of the
Mail::Multibyte::Chars class which encapsulates the original string. A Unicode
safe version of all the String methods are defined on this proxy class. If the
proxy class doesn't respond to a certain method, it's forwarded to the
encapsuled string.

    name = 'Claus Müller'
    name.reverse # => "rell??M sualC"
    name.length  # => 13

    name.mb_chars.reverse.to_s # => "rellüM sualC"
    name.mb_chars.length       # => 12

In Ruby 1.9 and newer `mb_chars` returns `self` because String is (mostly)
encoding aware. This means that it becomes easy to run one version of your
code on multiple Ruby versions.

## Method chaining

All the methods on the Chars proxy which normally return a string will return
a Chars object. This allows method chaining on the result of any of these
methods.

    name.mb_chars.reverse.length # => 12

## Interoperability and configuration

The Chars object tries to be as interchangeable with String objects as
possible: sorting and comparing between String and Char work like expected.
The bang! methods change the internal string representation in the Chars
object. Interoperability problems can be resolved easily with a `to_s` call.

For more information about the methods defined on the Chars proxy see
Mail::Multibyte::Chars. For information about how to change the default
Multibyte behaviour see Mail::Multibyte.


# String#to

(from gem activesupport-5.1.2)
---
    to(position)

---

Returns a substring from the beginning of the string to the given position. If
the position is negative, it is counted from the end of the string.

    str = "hello"
    str.to(0)  # => "h"
    str.to(3)  # => "hell"
    str.to(-2) # => "hell"

You can mix it with `from` method and do fun things like:

    str = "hello"
    str.from(0).to(-1) # => "hello"
    str.from(1).to(-2) # => "ell"


(from gem mail-2.6.6)
---
    to(position)

---

Returns the beginning of the string up to the `position` treating the string
as an array (where 0 is the first character).

Examples:
    "hello".to(0)  # => "h"
    "hello".to(2)  # => "hel"
    "hello".to(10) # => "hello"


(from gem parser-2.4.0.0)
---
@api public

This monkeypatch extends Ruby 1.8 {String#%} with an ability to replace named
capture groups, i.e. `"foo: %{bar}" % { :bar => 10 } # => "foo: 10"`.
---
# Instance methods:

    %
    original_percent

# String#%

(from ruby core)
---
    str % arg   -> new_str

---

Format---Uses *str* as a format specification, and returns the result of
applying it to *arg*. If the format specification contains more than one
substitution, then *arg* must be an `Array` or `Hash` containing the values to
be substituted. See `Kernel::sprintf` for details of the format string.

    "%05d" % 123                              #=> "00123"
    "%-5s: %08x" % [ "ID", self.object_id ]   #=> "ID   : 200e14d6"
    "foo = %{foo}" % { :foo => 'bar' }        #=> "foo = bar"


(from gem parser-2.4.0.0)
---
    %(arg, *args)

---


# String#original_percent

(from gem parser-2.4.0.0)
---
    original_percent(arg, *args)

---


(from gem puma-3.9.1)
---
Provides code to work properly on 1.8 and 1.9
---
# Instance methods:

    byteslice

# String#byteslice

(from ruby core)
---
    str.byteslice(integer)           -> new_str or nil
    str.byteslice(integer, integer)   -> new_str or nil
    str.byteslice(range)            -> new_str or nil

---

Byte Reference---If passed a single `Integer`, returns a substring of one byte
at that position. If passed two `Integer` objects, returns a substring
starting at the offset given by the first, and a length given by the second.
If given a `Range`, a substring containing bytes at offsets given by the range
is returned. In all three cases, if an offset is negative, it is counted from
the end of *str*. Returns `nil` if the initial offset falls outside the
string, the length is negative, or the beginning of the range is greater than
the end. The encoding of the resulted string keeps original encoding.

    "hello".byteslice(1)     #=> "e"
    "hello".byteslice(-1)    #=> "o"
    "hello".byteslice(1, 2)  #=> "el"
    "\x80\u3042".byteslice(1, 3) #=> "\u3042"
    "\x03\u3042\xff".byteslice(1..3) #=> "\u3042"


(from gem puma-3.9.1)
---
    byteslice(*arg)

---


(from gem rake-12.0.0)
---
# Instance methods:

    ext
    pathmap
    pathmap_explode
    pathmap_partial
    pathmap_replace

# String#ext

(from gem rake-12.0.0)
---
    ext(newext="")

---

Replace the file extension with `newext`.  If there is no extension on the
string, append the new extension to the end.  If the new extension is not
given, or is the empty string, remove any existing extension.

`ext` is a user added method for the String class.

This String extension comes from Rake


# String#pathmap

(from gem rake-12.0.0)
---
    pathmap(spec=nil, &block)

---

Map the path according to the given specification.  The specification controls
the details of the mapping.  The following special patterns are recognized:

`%p`
:   The complete path.
`%f`
:   The base file name of the path, with its file extension, but without any
    directories.
`%n`
:   The file name of the path without its file extension.
`%d`
:   The directory list of the path.
`%x`
:   The file extension of the path.  An empty string if there is no extension.
`%X`
:   Everything **but** the file extension.
`%s`
:   The alternate file separator if defined, otherwise use # the standard file
    separator.
`%%`
:   A percent sign.


The `%d` specifier can also have a numeric prefix (e.g. '%2d'). If the number
is positive, only return (up to) `n` directories in the path, starting from
the left hand side.  If `n` is negative, return (up to) `n` directories from
the right hand side of the path.

Examples:

    'a/b/c/d/file.txt'.pathmap("%2d")   => 'a/b'
    'a/b/c/d/file.txt'.pathmap("%-2d")  => 'c/d'

Also the `%d`, `%p`, `%f`, `%n`, `%x`, and `%X` operators can take a
pattern/replacement argument to perform simple string substitutions on a
particular part of the path.  The pattern and replacement are separated by a
comma and are enclosed by curly braces.  The replacement spec comes after the
% character but before the operator letter.  (e.g. "%{old,new}d"). Multiple
replacement specs should be separated by semi-colons (e.g.
"%{old,new;src,bin}d").

Regular expressions may be used for the pattern, and back refs may be used in
the replacement text.  Curly braces, commas and semi-colons are excluded from
both the pattern and replacement text (let's keep parsing reasonable).

For example:

    "src/org/onestepback/proj/A.java".pathmap("%{^src,class}X.class")

returns:

    "class/org/onestepback/proj/A.class"

If the replacement text is '*', then a block may be provided to perform some
arbitrary calculation for the replacement.

For example:

    "/path/to/file.TXT".pathmap("%X%{.*,*}x") { |ext|
       ext.downcase
    }

Returns:

    "/path/to/file.txt"

This String extension comes from Rake


# String#pathmap_explode

(from gem rake-12.0.0)
---
    pathmap_explode()

---

Explode a path into individual components.  Used by `pathmap`.

This String extension comes from Rake


# String#pathmap_partial

(from gem rake-12.0.0)
---
    pathmap_partial(n)

---

Extract a partial path from the path.  Include `n` directories from the front
end (left hand side) if `n` is positive.  Include |`n`| directories from the
back end (right hand side) if `n` is negative.

This String extension comes from Rake


# String#pathmap_replace

(from gem rake-12.0.0)
---
    pathmap_replace(patterns, &block)

---

Perform the pathmap replacement operations on the given path. The patterns
take the form 'pat1,rep1;pat2,rep2...'.

This String extension comes from Rake


(from gem sqlite3-1.3.13)
---
# Instance methods:

    to_blob

# String#to_blob

(from gem sqlite3-1.3.13)
---
    to_blob()

---


(from gem yard-0.9.9)
---
# Instance methods:

    shell_split

# String#shell_split

(from gem yard-0.9.9)
---
    shell_split()

---

Splits text into tokens the way a shell would, handling quoted text as a
single token. Use '"' and "'" to escape quotes and '\' to escape a backslash.

@return [Array] an array representing the tokens


