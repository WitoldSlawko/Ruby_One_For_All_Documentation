# CSV < Object

---
# Includes:
Enumerable (from ruby core)

---
# Extended by:
Forwardable (from ruby core)

IO and StringIO Delegation ###

(from ruby core)
---
This class provides a complete interface to CSV files and data.  It offers
tools to enable you to read and write to and from Strings or IO objects, as
needed.

## Reading

### From a File

#### A Line at a Time

    CSV.foreach("path/to/file.csv") do |row|
      # use row here...
    end

#### All at Once

    arr_of_arrs = CSV.read("path/to/file.csv")

### From a String

#### A Line at a Time

    CSV.parse("CSV,data,String") do |row|
      # use row here...
    end

#### All at Once

    arr_of_arrs = CSV.parse("CSV,data,String")

## Writing

### To a File

    CSV.open("path/to/file.csv", "wb") do |csv|
      csv << ["row", "of", "CSV", "data"]
      csv << ["another", "row"]
      # ...
    end

### To a String

    csv_string = CSV.generate do |csv|
      csv << ["row", "of", "CSV", "data"]
      csv << ["another", "row"]
      # ...
    end

## Convert a Single Line

    csv_string = ["CSV", "data"].to_csv   # to CSV
    csv_array  = "CSV,String".parse_csv   # from CSV

## Shortcut Interface

    CSV             { |csv_out| csv_out << %w{my data here} }  # to $stdout
    CSV(csv = "")   { |csv_str| csv_str << %w{my data here} }  # to a String
    CSV($stderr)    { |csv_err| csv_err << %w{my data here} }  # to $stderr
    CSV($stdin)     { |csv_in|  csv_in.each { |row| p row } }  # from $stdin

## Advanced Usage

### Wrap an IO Object

    csv = CSV.new(io, options)
    # ... read (with gets() or each()) from and write (with <<) to csv here ...

## CSV and Character Encodings (M17n or Multilingualization)

This new CSV parser is m17n savvy.  The parser works in the Encoding of the IO
or String object being read from or written to.  Your data is never transcoded
(unless you ask Ruby to transcode it for you) and will literally be parsed in
the Encoding it is in.  Thus CSV will return Arrays or Rows of Strings in the
Encoding of your data.  This is accomplished by transcoding the parser itself
into your Encoding.

Some transcoding must take place, of course, to accomplish this multiencoding
support.  For example, `:col_sep`, `:row_sep`, and `:quote_char` must be
transcoded to match your data.  Hopefully this makes the entire process feel
transparent, since CSV's defaults should just magically work for your data. 
However, you can set these values manually in the target Encoding to avoid the
translation.

It's also important to note that while all of CSV's core parser is now
Encoding agnostic, some features are not.  For example, the built-in
converters will try to transcode data to UTF-8 before making conversions.
Again, you can provide custom converters that are aware of your Encodings to
avoid this translation.  It's just too hard for me to support native
conversions in all of Ruby's Encodings.

Anyway, the practical side of this is simple:  make sure IO and String objects
passed into CSV have the proper Encoding set and everything should just work.
CSV methods that allow you to open IO objects (CSV::foreach(), CSV::open(),
CSV::read(), and CSV::readlines()) do allow you to specify the Encoding.

One minor exception comes when generating CSV into a String with an Encoding
that is not ASCII compatible.  There's no existing data for CSV to use to
prepare itself and thus you will probably need to manually specify the desired
Encoding for most of those cases.  It will try to guess using the fields in a
row of output though, when using CSV::generate_line() or Array#to_csv().

I try to point out any other Encoding issues in the documentation of methods
as they come up.

This has been tested to the best of my ability with all non-"dummy" Encodings
Ruby ships with.  However, it is brave new code and may have some bugs. Please
feel free to [report](mailto:james@grayproductions.net) any issues you find
with it.
---
# Constants:

ConverterEncoding
:   The encoding used by all converters.
Converters
:   This Hash holds the built-in converters of CSV that can be accessed by
    name. You can select Converters with CSV.convert() or through the
    `options` Hash passed to CSV::new().

    **`:integer`**
:       Converts any field Integer() accepts.
    **`:float`**
:       Converts any field Float() accepts.
    **`:numeric`**
:       A combination of `:integer` and `:float`.
    **`:date`**
:       Converts any field Date::parse() accepts.
    **`:date_time`**
:       Converts any field DateTime::parse() accepts.
    **`:all`**
:       All built-in converters.  A combination of `:date_time` and
        `:numeric`.


    All built-in converters transcode field data to UTF-8 before attempting a
    conversion.  If your data cannot be transcoded to UTF-8 the conversion
    will fail and the field will remain unchanged.

    This Hash is intentionally left unfrozen and users should feel free to add
    values to it that can be accessed by all CSV objects.

    To add a combo field, the value should be an Array of names.  Combo fields
    can be nested with other combo fields.
DEFAULT_OPTIONS
:   The options used when no overrides are given by calling code.  They are:

    **`:col_sep`**
:       `","`
    **`:row_sep`**
:       `:auto`
    **`:quote_char`**
:       `'"'`
    **`:field_size_limit`**
:       `nil`
    **`:converters`**
:       `nil`
    **`:unconverted_fields`**
:       `nil`
    **`:headers`**
:       `false`
    **`:return_headers`**
:       `false`
    **`:header_converters`**
:       `nil`
    **`:skip_blanks`**
:       `false`
    **`:force_quotes`**
:       `false`
    **`:skip_lines`**
:       `nil`
    **`:liberal_parsing`**
:       `false`

DateMatcher
:   A Regexp used to find and convert some common Date formats.
DateTimeMatcher
:   A Regexp used to find and convert some common DateTime formats.
FieldInfo
:   A FieldInfo Struct contains details about a field's position in the data
    source it was read from.  CSV will pass this Struct to some blocks that
    make decisions based on field structure.  See CSV.convert_fields() for an
    example.

    **`index`**
:       The zero-based index of the field in its row.
    **`line`**
:       The line of the data source this row is from.
    **`header`**
:       The header for the column, when available.

HeaderConverters
:   This Hash holds the built-in header converters of CSV that can be accessed
    by name.  You can select HeaderConverters with CSV.header_convert() or
    through the `options` Hash passed to CSV::new().

    **`:downcase`**
:       Calls downcase() on the header String.
    **`:symbol`**
:       Leading/trailing spaces are dropped, string is downcased, remaining
        spaces are replaced with underscores, non-word characters are dropped,
        and finally to_sym() is called.


    All built-in header converters transcode header data to UTF-8 before
    attempting a conversion.  If your data cannot be transcoded to UTF-8 the
    conversion will fail and the header will remain unchanged.

    This Hash is intentionally left unfrozen and users should feel free to add
    values to it that can be accessed by all CSV objects.

    To add a combo field, the value should be an Array of names.  Combo fields
    can be nested with other combo fields.
VERSION
:   The version of the installed library.


# Class methods:

    filter
    foreach
    generate
    generate_line
    instance
    new
    open
    parse
    parse_line
    read
    readlines
    table

# Instance methods:

    <<
    add_converter
    add_row
    add_unconverted_fields
    col_sep
    convert
    convert_fields
    converters
    each
    encode_re
    encode_str
    encoding
    escape_re
    field_size_limit
    force_quotes?
    gets
    header_convert
    header_converters
    header_row?
    headers
    init_comments
    init_converters
    init_headers
    init_parsers
    init_separators
    inspect
    liberal_parsing?
    lineno
    parse_headers
    puts
    quote_char
    raw_encoding
    read
    readline
    readlines
    return_headers?
    rewind
    row_sep
    shift
    skip_blanks?
    skip_lines
    unconverted_fields?
    write_headers?

# Attributes:

    attr_reader col_sep
    attr_reader encoding
    attr_reader field_size_limit
    attr_reader lineno
    attr_reader quote_char
    attr_reader row_sep
    attr_reader skip_lines

# CSV::filter

(from ruby core)
---
    filter( options = Hash.new ) { |row| ... }
    filter( input, options = Hash.new ) { |row| ... }
    filter( input, output, options = Hash.new ) { |row| ... }

---

This method is a convenience for building Unix-like filters for CSV data. Each
row is yielded to the provided block which can alter it as needed. After the
block returns, the row is appended to `output` altered or not.

The `input` and `output` arguments can be anything CSV::new() accepts
(generally String or IO objects).  If not given, they default to `ARGF` and
`$stdout`.

The `options` parameter is also filtered down to CSV::new() after some clever
key parsing.  Any key beginning with `:in_` or `:input_` will have that
leading identifier stripped and will only be used in the `options` Hash for
the `input` object.  Keys starting with `:out_` or `:output_` affect only
`output`.  All other keys are assigned to both objects.

The `:output_row_sep` `option` defaults to `$INPUT_RECORD_SEPARATOR` (`$/`).


# CSV::foreach

(from ruby core)
---
    foreach(path, options = Hash.new, &block)

---

This method is intended as the primary interface for reading CSV files.  You
pass a `path` and any `options` you wish to set for the read.  Each row of
file will be passed to the provided `block` in turn.

The `options` parameter can be anything CSV::new() understands.  This method
also understands an additional `:encoding` parameter that you can use to
specify the Encoding of the data in the file to be read. You must provide this
unless your data is in Encoding::default_external().  CSV will use this to
determine how to parse the data.  You may provide a second Encoding to have
the data transcoded as it is read.  For example, `encoding: "UTF-32BE:UTF-8"`
would read UTF-32BE data from the file but transcode it to UTF-8 before CSV
parses it.


# CSV::generate

(from ruby core)
---
    generate( str, options = Hash.new ) { |csv| ... }
    generate( options = Hash.new ) { |csv| ... }

---

This method wraps a String you provide, or an empty default String, in a CSV
object which is passed to the provided block.  You can use the block to append
CSV rows to the String and when the block exits, the final String will be
returned.

Note that a passed String **is** modified by this method.  Call dup() before
passing if you need a new String.

The `options` parameter can be anything CSV::new() understands.  This method
understands an additional `:encoding` parameter when not passed a String to
set the base Encoding for the output.  CSV needs this hint if you plan to
output non-ASCII compatible data.


# CSV::generate_line

(from ruby core)
---
    generate_line(row, options = Hash.new)

---

This method is a shortcut for converting a single row (Array) into a CSV
String.

The `options` parameter can be anything CSV::new() understands.  This method
understands an additional `:encoding` parameter to set the base Encoding for
the output.  This method will try to guess your Encoding from the first
non-`nil` field in `row`, if possible, but you may need to use this parameter
as a backup plan.

The `:row_sep` `option` defaults to `$INPUT_RECORD_SEPARATOR` (`$/`) when
calling this method.


# CSV::instance

(from ruby core)
---
    instance(data = $stdout, options = Hash.new) { |instance| ... }

---

This method will return a CSV instance, just like CSV::new(), but the instance
will be cached and returned for all future calls to this method for the same
`data` object (tested by Object#object_id()) with the same `options`.

If a block is given, the instance is passed to the block and the return value
becomes the return value of the block.


# CSV::new

(from ruby core)
---
    new(data, options = Hash.new)

---

This constructor will wrap either a String or IO object passed in `data` for
reading and/or writing.  In addition to the CSV instance methods, several IO
methods are delegated.  (See CSV::open() for a complete list.)  If you pass a
String for `data`, you can later retrieve it (after writing to it, for
example) with CSV.string().

Note that a wrapped String will be positioned at the beginning (for reading). 
If you want it at the end (for writing), use CSV::generate(). If you want any
other positioning, pass a preset StringIO object instead.

You may set any reading and/or writing preferences in the `options` Hash.
Available options are:

**`:col_sep`**
:   The String placed between each field. This String will be transcoded into
    the data's Encoding before parsing.
**`:row_sep`**
:   The String appended to the end of each row.  This can be set to the
    special `:auto` setting, which requests that CSV automatically discover
    this from the data.  Auto-discovery reads ahead in the data looking for
    the next `"\r\n"`, `"\n"`, or `"\r"` sequence.  A sequence will be
    selected even if it occurs in a quoted field, assuming that you would have
    the same line endings there.  If none of those sequences is found, `data`
    is `ARGF`, `STDIN`, `STDOUT`, or `STDERR`, or the stream is only available
    for output, the default `$INPUT_RECORD_SEPARATOR` (`$/`) is used. 
    Obviously, discovery takes a little time.  Set manually if speed is
    important.  Also note that IO objects should be opened in binary mode on
    Windows if this feature will be used as the line-ending translation can
    cause problems with resetting the document position to where it was before
    the read ahead. This String will be transcoded into the data's Encoding
    before parsing.
**`:quote_char`**
:   The character used to quote fields. This has to be a single character
    String.  This is useful for application that incorrectly use `'` as the
    quote character instead of the correct `"`. CSV will always consider a
    double sequence of this character to be an escaped quote. This String will
    be transcoded into the data's Encoding before parsing.
**`:field_size_limit`**
:   This is a maximum size CSV will read ahead looking for the closing quote
    for a field.  (In truth, it reads to the first line ending beyond this
    size.)  If a quote cannot be found within the limit CSV will raise a
    MalformedCSVError, assuming the data is faulty.  You can use this limit to
    prevent what are effectively DoS attacks on the parser.  However, this
    limit can cause a legitimate parse to fail and thus is set to `nil`, or
    off, by default.
**`:converters`**
:   An Array of names from the Converters Hash and/or lambdas that handle
    custom conversion.  A single converter doesn't have to be in an Array. 
    All built-in converters try to transcode fields to UTF-8 before
    converting. The conversion will fail if the data cannot be transcoded,
    leaving the field unchanged.
**`:unconverted_fields`**
:   If set to `true`, an unconverted_fields() method will be added to all
    returned rows (Array or CSV::Row) that will return the fields as they were
    before conversion.  Note that `:headers` supplied by Array or String were
    not fields of the document and thus will have an empty Array attached.
**`:headers`**
:   If set to `:first_row` or `true`, the initial row of the CSV file will be
    treated as a row of headers.  If set to an Array, the contents will be
    used as the headers. If set to a String, the String is run through a call
    of CSV::parse_line() with the same `:col_sep`, `:row_sep`, and
    `:quote_char` as this instance to produce an Array of headers.  This
    setting causes CSV#shift() to return rows as CSV::Row objects instead of
    Arrays and CSV#read() to return CSV::Table objects instead of an Array of
    Arrays.
**`:return_headers`**
:   When `false`, header rows are silently swallowed.  If set to `true`,
    header rows are returned in a CSV::Row object with identical headers and
    fields (save that the fields do not go through the converters).
**`:write_headers`**
:   When `true` and `:headers` is set, a header row will be added to the
    output.
**`:header_converters`**
:   Identical in functionality to `:converters` save that the conversions are
    only made to header rows.  All built-in converters try to transcode
    headers to UTF-8 before converting.  The conversion will fail if the data
    cannot be transcoded, leaving the header unchanged.
**`:skip_blanks`**
:   When set to a `true` value, CSV will skip over any empty rows. Note that
    this setting will not skip rows that contain column separators, even if
    the rows contain no actual data. If you want to skip rows that contain
    separators but no content, consider using `:skip_lines`, or inspecting
    fields.compact.empty? on each row.
**`:force_quotes`**
:   When set to a `true` value, CSV will quote all CSV fields it creates.
**`:skip_lines`**
:   When set to an object responding to `match`, every line matching it is
    considered a comment and ignored during parsing. When set to a String, it
    is first converted to a Regexp. When set to `nil` no line is considered a
    comment. If the passed object does not respond to `match`, `ArgumentError`
    is thrown.
**`:liberal_parsing`**
:   When set to a `true` value, CSV will attempt to parse input not conformant
    with RFC 4180, such as double quotes in unquoted fields.


See CSV::DEFAULT_OPTIONS for the default settings.

Options cannot be overridden in the instance methods for performance reasons,
so be sure to set what you want here.


# CSV::open

(from ruby core)
---
    open( filename, mode = "rb", options = Hash.new ) { |faster_csv| ... }
    open( filename, options = Hash.new ) { |faster_csv| ... }
    open( filename, mode = "rb", options = Hash.new )
    open( filename, options = Hash.new )

---

This method opens an IO object, and wraps that with CSV.  This is intended as
the primary interface for writing a CSV file.

You must pass a `filename` and may optionally add a `mode` for Ruby's open(). 
You may also pass an optional Hash containing any `options` CSV::new()
understands as the final argument.

This method works like Ruby's open() call, in that it will pass a CSV object
to a provided block and close it when the block terminates, or it will return
the CSV object when no block is provided.  (**Note**: This is different from
the Ruby 1.8 CSV library which passed rows to the block.  Use CSV::foreach()
for that behavior.)

You must provide a `mode` with an embedded Encoding designator unless your
data is in Encoding::default_external().  CSV will check the Encoding of the
underlying IO object (set by the `mode` you pass) to determine how to parse
the data.   You may provide a second Encoding to have the data transcoded as
it is read just as you can with a normal call to IO::open().  For example,
`"rb:UTF-32BE:UTF-8"` would read UTF-32BE data from the file but transcode it
to UTF-8 before CSV parses it.

An opened CSV object will delegate to many IO methods for convenience.  You
may call:

*   binmode()
*   binmode?()
*   close()
*   close_read()
*   close_write()
*   closed?()
*   eof()
*   eof?()
*   external_encoding()
*   fcntl()
*   fileno()
*   flock()
*   flush()
*   fsync()
*   internal_encoding()
*   ioctl()
*   isatty()
*   path()
*   pid()
*   pos()
*   pos=()
*   reopen()
*   seek()
*   stat()
*   sync()
*   sync=()
*   tell()
*   to_i()
*   to_io()
*   truncate()
*   tty?()



# CSV::parse

(from ruby core)
---
    parse( str, options = Hash.new ) { |row| ... }
    parse( str, options = Hash.new )

---

This method can be used to easily parse CSV out of a String.  You may either
provide a `block` which will be called with each row of the String in turn, or
just use the returned Array of Arrays (when no `block` is given).

You pass your `str` to read from, and an optional `options` Hash containing
anything CSV::new() understands.


# CSV::parse_line

(from ruby core)
---
    parse_line(line, options = Hash.new)

---

This method is a shortcut for converting a single line of a CSV String into an
Array.  Note that if `line` contains multiple rows, anything beyond the first
row is ignored.

The `options` parameter can be anything CSV::new() understands.


# CSV::read

(from ruby core)
---
    read(path, *options)

---

Use to slurp a CSV file into an Array of Arrays.  Pass the `path` to the file
and any `options` CSV::new() understands.  This method also understands an
additional `:encoding` parameter that you can use to specify the Encoding of
the data in the file to be read. You must provide this unless your data is in
Encoding::default_external().  CSV will use this to determine how to parse the
data.  You may provide a second Encoding to have the data transcoded as it is
read.  For example, `encoding: "UTF-32BE:UTF-8"` would read UTF-32BE data from
the file but transcode it to UTF-8 before CSV parses it.


# CSV::readlines

(from ruby core)
---
    readlines(*args)

---

Alias for CSV::read().


# CSV::table

(from ruby core)
---
    table(path, options = Hash.new)

---

A shortcut for:

    CSV.read( path, { headers:           true,
                      converters:        :numeric,
                      header_converters: :symbol }.merge(options) )


# CSV#<<

(from ruby core)
---
    <<(row)

---

The primary write method for wrapped Strings and IOs, `row` (an Array or
CSV::Row) is converted to CSV and appended to the data source.  When a
CSV::Row is passed, only the row's fields() are appended to the output.

The data source must be open for writing.


# CSV#add_row

(from ruby core)
---
    add_row(row)

---


# CSV#convert

(from ruby core)
---
    convert( name )
    convert { |field| ... }
    convert { |field, field_info| ... }

---

You can use this method to install a CSV::Converters built-in, or provide a
block that handles a custom conversion.

If you provide a block that takes one argument, it will be passed the field
and is expected to return the converted value or the field itself.  If your
block takes two arguments, it will also be passed a CSV::FieldInfo Struct,
containing details about the field.  Again, the block should return a
converted field or the field itself.


# CSV#converters

(from ruby core)
---
    converters()

---

Returns the current list of converters in effect.  See CSV::new for details.
Built-in converters will be returned by name, while others will be returned as
is.


# CSV#each

(from ruby core)
---
    each() { |row| ... }

---

Yields each row of the data source in turn.

Support for Enumerable.

The data source must be open for reading.


# CSV#force_quotes?

(from ruby core)
---
    force_quotes?()

---

Returns `true` if all output fields are quoted. See CSV::new for details.


# CSV#gets

(from ruby core)
---
    gets()

---


# CSV#header_convert

(from ruby core)
---
    header_convert( name )
    header_convert { |field| ... }
    header_convert { |field, field_info| ... }

---

Identical to CSV#convert(), but for header rows.

Note that this method must be called before header rows are read to have any
effect.


# CSV#header_converters

(from ruby core)
---
    header_converters()

---

Returns the current list of converters in effect for headers.  See CSV::new
for details.  Built-in converters will be returned by name, while others will
be returned as is.


# CSV#header_row?

(from ruby core)
---
    header_row?()

---

Returns `true` if the next row read will be a header row.


# CSV#headers

(from ruby core)
---
    headers()

---

Returns `nil` if headers will not be used, `true` if they will but have not
yet been read, or the actual headers after they have been read.  See CSV::new
for details.


# CSV#inspect

(from ruby core)
---
    inspect()

---

Returns a simplified description of the key CSV attributes in an ASCII
compatible String.


# CSV#liberal_parsing?

(from ruby core)
---
    liberal_parsing?()

---

Returns `true` if illegal input is handled. See CSV::new for details.


# CSV#puts

(from ruby core)
---
    puts(row)

---


# CSV#read

(from ruby core)
---
    read()

---

Slurps the remaining rows and returns an Array of Arrays.

The data source must be open for reading.


# CSV#readline

(from ruby core)
---
    readline()

---


# CSV#readlines

(from ruby core)
---
    readlines()

---


# CSV#return_headers?

(from ruby core)
---
    return_headers?()

---

Returns `true` if headers will be returned as a row of results. See CSV::new
for details.


# CSV#rewind

(from ruby core)
---
    rewind()

---

Rewinds the underlying IO object and resets CSV's lineno() counter.


# CSV#shift

(from ruby core)
---
    shift()

---

The primary read method for wrapped Strings and IOs, a single row is pulled
from the data source, parsed and returned as an Array of fields (if header
rows are not used) or a CSV::Row (when header rows are used).

The data source must be open for reading.


# CSV#skip_blanks?

(from ruby core)
---
    skip_blanks?()

---

Returns `true` blank lines are skipped by the parser. See CSV::new for
details.


# CSV#unconverted_fields?

(from ruby core)
---
    unconverted_fields?()

---

Returns `true` if unconverted_fields() to parsed results.  See CSV::new for
details.


# CSV#write_headers?

(from ruby core)
---
    write_headers?()

---

Returns `true` if headers are written in output. See CSV::new for details.


# CSV#add_converter

(from ruby core)
---
    add_converter(var_name, const, name = nil, &converter)

---

The actual work method for adding converters, used by both CSV.convert() and
CSV.header_convert().

This method requires the `var_name` of the instance variable to place the
converters in, the `const` Hash to lookup named converters in, and the normal
parameters of the CSV.convert() and CSV.header_convert() methods.


# CSV#add_unconverted_fields

(from ruby core)
---
    add_unconverted_fields(row, fields)

---

This method injects an instance variable `unconverted_fields` into `row` and
an accessor method for `row` called unconverted_fields().  The variable is set
to the contents of `fields`.


# CSV#convert_fields

(from ruby core)
---
    convert_fields(fields, headers = false)

---

Processes `fields` with `@converters`, or `@header_converters` if `headers` is
passed as `true`, returning the converted field set.  Any converter that
changes the field into something other than a String halts the pipeline of
conversion for that field.  This is primarily an efficiency shortcut.


# CSV#encode_re

(from ruby core)
---
    encode_re(*chunks)

---

Builds a regular expression in `@encoding`.  All `chunks` will be transcoded
to that encoding.


# CSV#encode_str

(from ruby core)
---
    encode_str(*chunks)

---

Builds a String in `@encoding`.  All `chunks` will be transcoded to that
encoding.


# CSV#escape_re

(from ruby core)
---
    escape_re(str)

---

This method is an encoding safe version of Regexp::escape().  It will escape
any characters that would change the meaning of a regular expression in the
encoding of `str`.  Regular expression characters that cannot be transcoded to
the target encoding will be skipped and no escaping will be performed if a
backslash cannot be transcoded.


# CSV#init_comments

(from ruby core)
---
    init_comments(options)

---

Stores the pattern of comments to skip from the provided options.

The pattern must respond to `.match`, else ArgumentError is raised. Strings
are converted to a Regexp.

See also CSV.new


# CSV#init_converters

(from ruby core)
---
    init_converters(options, field_name = :converters)

---

Loads any converters requested during construction.

If `field_name` is set `:converters` (the default) field converters are set. 
When `field_name` is `:header_converters` header converters are added instead.

The `:unconverted_fields` option is also activated for `:converters` calls, if
requested.


# CSV#init_headers

(from ruby core)
---
    init_headers(options)

---

Stores header row settings and loads header converters, if needed.


# CSV#init_parsers

(from ruby core)
---
    init_parsers(options)

---

Pre-compiles parsers and stores them by name for access during reads.


# CSV#init_separators

(from ruby core)
---
    init_separators(options)

---

Stores the indicated separators for later use.

If auto-discovery was requested for `@row_sep`, this method will read ahead in
the `@io` and try to find one.  `ARGF`, `STDIN`, `STDOUT`, `STDERR` and any
stream open for output only with a default `@row_sep` of
`$INPUT_RECORD_SEPARATOR` (`$/`).

This method also establishes the quoting rules used for CSV output.


# CSV#parse_headers

(from ruby core)
---
    parse_headers(row = nil)

---

This method is used to turn a finished `row` into a CSV::Row.  Header rows are
also dealt with here, either by returning a CSV::Row with identical headers
and fields (save that the fields do not go through the converters) or by
reading past them to return a field row. Headers are also saved in `@headers`
for use in future rows.

When `nil`, `row` is assumed to be a header row not based on an actual row of
the stream.


# CSV#raw_encoding

(from ruby core)
---
    raw_encoding(default = Encoding::ASCII_8BIT)

---

Returns the encoding of the internal IO object or the `default` if the
encoding cannot be determined.


