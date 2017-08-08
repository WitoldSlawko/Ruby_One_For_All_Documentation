# StringIO < Data

---
# Includes:
(from ruby core)
    Enumerable
    IO::generic_readable
    IO::generic_writable

(from ruby core)
---
Pseudo I/O on String object.

Commonly used to simulate `$stdio` or `$stderr`

### Examples

    require 'stringio'

    io = StringIO.new
    io.puts "Hello World"
    io.string #=> "Hello World\n"
---
# Class methods:

    new
    open

# Instance methods:

    binmode
    bytes
    chars
    close
    close_read
    close_write
    closed?
    closed_read?
    closed_write?
    codepoints
    each
    each_byte
    each_char
    each_codepoint
    each_line
    eof
    eof?
    external_encoding
    fcntl
    fileno
    flush
    fsync
    getbyte
    getc
    gets
    internal_encoding
    isatty
    length
    lineno
    lineno=
    lines
    pid
    pos
    pos=
    putc
    read
    readlines
    reopen
    rewind
    seek
    set_encoding
    size
    string
    string=
    sync
    sync=
    tell
    truncate
    tty?
    ungetbyte
    ungetc
    write

# StringIO::new

(from ruby core)
---
    StringIO.new(string=""[, mode])

---

Creates new StringIO instance from with *string* and *mode*.


# StringIO::open

(from ruby core)
---
    StringIO.open(string=""[, mode]) {|strio| ...}

---

Equivalent to StringIO.new except that when it is called with a block, it
yields with the new instance and closes it, and returns the result which
returned from the block.


# StringIO#binmode

(from ruby core)
---
    binmode()

---


# StringIO#bytes

(from ruby core)
---
    bytes()

---

This is a deprecated alias for #each_byte.


# StringIO#chars

(from ruby core)
---
    chars()

---

This is a deprecated alias for `each_char`.


# StringIO#close

(from ruby core)
---
    strio.close  -> nil

---

Closes strio.  The **strio** is unavailable for any further data operations;
an `IOError` is raised if such an attempt is made.


# StringIO#close_read

(from ruby core)
---
    strio.close_read    -> nil

---

Closes the read end of a StringIO.  Will raise an `IOError` if the **strio**
is not readable.


# StringIO#close_write

(from ruby core)
---
    strio.close_write    -> nil

---

Closes the write end of a StringIO.  Will raise an  `IOError` if the **strio**
is not writeable.


# StringIO#closed?

(from ruby core)
---
    strio.closed?    -> true or false

---

Returns `true` if **strio** is completely closed, `false` otherwise.


# StringIO#closed_read?

(from ruby core)
---
    strio.closed_read?    -> true or false

---

Returns `true` if **strio** is not readable, `false` otherwise.


# StringIO#closed_write?

(from ruby core)
---
    strio.closed_write?    -> true or false

---

Returns `true` if **strio** is not writable, `false` otherwise.


# StringIO#codepoints

(from ruby core)
---
    codepoints()

---

This is a deprecated alias for `each_codepoint`.


# StringIO#each

(from ruby core)
---
    strio.each(sep=$/) {|line| block }         -> strio
    strio.each(limit) {|line| block }          -> strio
    strio.each(sep, limit) {|line| block }     -> strio
    strio.each(...)                            -> anEnumerator
    strio.each_line(sep=$/) {|line| block }    -> strio
    strio.each_line(limit) {|line| block }     -> strio
    strio.each_line(sep,limit) {|line| block } -> strio
    strio.each_line(...)                       -> anEnumerator

---

See IO#each.


# StringIO#each_byte

(from ruby core)
---
    strio.each_byte {|byte| block }  -> strio
    strio.each_byte                  -> anEnumerator

---

See IO#each_byte.


# StringIO#each_char

(from ruby core)
---
    strio.each_char {|char| block }  -> strio
    strio.each_char                  -> anEnumerator

---

See IO#each_char.


# StringIO#each_codepoint

(from ruby core)
---
    strio.each_codepoint {|c| block }  -> strio
    strio.each_codepoint               -> anEnumerator

---

See IO#each_codepoint.


# StringIO#each_line

(from ruby core)
---
    strio.each_line(sep=$/) {|line| block }    -> strio
    strio.each_line(limit) {|line| block }     -> strio
    strio.each_line(sep,limit) {|line| block } -> strio
    strio.each_line(...)                       -> anEnumerator

---

See IO#each.


# StringIO#eof

(from ruby core)
---
    strio.eof     -> true or false
    strio.eof?    -> true or false

---

Returns true if **strio** is at end of file. The stringio must be opened for
reading or an `IOError` will be raised.


# StringIO#eof?

(from ruby core)
---
    strio.eof?    -> true or false

---

Returns true if **strio** is at end of file. The stringio must be opened for
reading or an `IOError` will be raised.


# StringIO#external_encoding

(from ruby core)
---
    strio.external_encoding   => encoding

---

Returns the Encoding object that represents the encoding of the file. If strio
is write mode and no encoding is specified, returns `nil`.


# StringIO#fcntl

(from ruby core)
---
    fcntl(*args)

---

Raises NotImplementedError.


# StringIO#fileno

(from ruby core)
---
    fileno()

---

Returns `nil`.  Just for compatibility to IO.


# StringIO#flush

(from ruby core)
---
    flush()

---

Returns **strio** itself.  Just for compatibility to IO.


# StringIO#fsync

(from ruby core)
---
    fsync()

---

Returns 0.  Just for compatibility to IO.


# StringIO#getbyte

(from ruby core)
---
    strio.getbyte   -> fixnum or nil

---

See IO#getbyte.


# StringIO#getc

(from ruby core)
---
    strio.getc   -> string or nil

---

See IO#getc.


# StringIO#gets

(from ruby core)
---
    strio.gets(sep=$/)     -> string or nil
    strio.gets(limit)      -> string or nil
    strio.gets(sep, limit) -> string or nil

---

See IO#gets.


# StringIO#internal_encoding

(from ruby core)
---
    strio.internal_encoding   => encoding

---

Returns the Encoding of the internal string if conversion is specified. 
Otherwise returns nil.


# StringIO#isatty

(from ruby core)
---
    isatty()

---

Returns `false`.  Just for compatibility to IO.


# StringIO#length

(from ruby core)
---
    strio.length -> integer

---

Returns the size of the buffer string.


# StringIO#lineno

(from ruby core)
---
    strio.lineno    -> integer

---

Returns the current line number in **strio**. The stringio must be opened for
reading. `lineno` counts the number of times  `gets` is called, rather than
the number of newlines  encountered. The two values will differ if `gets` is 
called with a separator other than newline.  See also the  `$.` variable.


# StringIO#lineno=

(from ruby core)
---
    strio.lineno = integer    -> integer

---

Manually sets the current line number to the given value. `$.` is updated only
on the next read.


# StringIO#lines

(from ruby core)
---
    lines(*args)

---

This is a deprecated alias for `each_line`.


# StringIO#pid

(from ruby core)
---
    pid()

---

Returns `nil`.  Just for compatibility to IO.


# StringIO#pos

(from ruby core)
---
    strio.pos     -> integer
    strio.tell    -> integer

---

Returns the current offset (in bytes) of **strio**.


# StringIO#pos=

(from ruby core)
---
    strio.pos = integer    -> integer

---

Seeks to the given position (in bytes) in **strio**.


# StringIO#putc

(from ruby core)
---
    strio.putc(obj)    -> obj

---

See IO#putc.


# StringIO#read

(from ruby core)
---
    strio.read([length [, outbuf]])    -> string, outbuf, or nil

---

See IO#read.


# StringIO#readlines

(from ruby core)
---
    strio.readlines(sep=$/)    ->   array
    strio.readlines(limit)     ->   array
    strio.readlines(sep,limit) ->   array

---

See IO#readlines.


# StringIO#reopen

(from ruby core)
---
    strio.reopen(other_StrIO)     -> strio
    strio.reopen(string, mode)    -> strio

---

Reinitializes **strio** with the given *other_StrIO* or *string* and *mode*
(see StringIO#new).


# StringIO#rewind

(from ruby core)
---
    strio.rewind    -> 0

---

Positions **strio** to the beginning of input, resetting `lineno` to zero.


# StringIO#seek

(from ruby core)
---
    strio.seek(amount, whence=SEEK_SET) -> 0

---

Seeks to a given offset *amount* in the stream according to the value of
*whence* (see IO#seek).


# StringIO#set_encoding

(from ruby core)
---
    strio.set_encoding(ext_enc, [int_enc[, opt]])  => strio

---

Specify the encoding of the StringIO as *ext_enc*. Use the default external
encoding if *ext_enc* is nil. 2nd argument *int_enc* and optional hash *opt*
argument are ignored; they are for API compatibility to IO.


# StringIO#size

(from ruby core)
---
    strio.size   -> integer

---

Returns the size of the buffer string.


# StringIO#string

(from ruby core)
---
    strio.string     -> string

---

Returns underlying String object, the subject of IO.


# StringIO#string=

(from ruby core)
---
    strio.string = string  -> string

---

Changes underlying String object, the subject of IO.


# StringIO#sync

(from ruby core)
---
    strio.sync    -> true

---

Returns `true` always.


# StringIO#sync=

(from ruby core)
---
    sync=(p1)

---

Returns the argument unchanged.  Just for compatibility to IO.


# StringIO#tell

(from ruby core)
---
    strio.pos     -> integer
    strio.tell    -> integer

---

Returns the current offset (in bytes) of **strio**.


# StringIO#truncate

(from ruby core)
---
    strio.truncate(integer)    -> 0

---

Truncates the buffer string to at most *integer* bytes. The **strio** must be
opened for writing.


# StringIO#tty?

(from ruby core)
---
    tty?()

---

Returns `false`.  Just for compatibility to IO.


# StringIO#ungetbyte

(from ruby core)
---
    strio.ungetbyte(fixnum)   -> nil

---

See IO#ungetbyte


# StringIO#ungetc

(from ruby core)
---
    strio.ungetc(string)   -> nil

---

Pushes back one character (passed as a parameter) onto **strio** such that a
subsequent buffered read will return it.  There is no limitation for multiple
pushbacks including pushing back behind the beginning of the buffer string.


# StringIO#write

(from ruby core)
---
    strio.write(string)    -> integer
    strio.syswrite(string) -> integer

---

Appends the given string to the underlying buffer string of **strio**. The
stream must be opened for writing.  If the argument is not a string, it will
be converted to a string using `to_s`. Returns the number of bytes written. 
See IO#write.


