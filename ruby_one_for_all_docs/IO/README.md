# IO < Object

---
# Includes:
(from ruby core)
    File::Constants
    Enumerable

(from ruby core)
---

Expect library adds the IO instance method #expect, which does similar act to
tcl's expect extension.

In order to use this method, you must require expect:

    require 'expect'

Please see #expect for usage.

The IO class is the basis for all input and output in Ruby. An I/O stream may
be *duplexed* (that is, bidirectional), and so may use more than one native
operating system stream.

Many of the examples in this section use the File class, the only standard
subclass of IO. The two classes are closely associated.  Like the File class,
the Socket library subclasses from IO (such as TCPSocket or UDPSocket).

The Kernel#open method can create an IO (or File) object for these types of
arguments:

*   A plain string represents a filename suitable for the underlying operating
    system.

*   A string starting with `"|"` indicates a subprocess. The remainder of the
    string following the `"|"` is invoked as a process with appropriate
    input/output channels connected to it.

*   A string equal to `"|-"` will create another Ruby instance as a
    subprocess.


The IO may be opened with different file modes (read-only, write-only) and
encodings for proper conversion.  See IO.new for these options.  See
Kernel#open for details of the various command formats described above.

IO.popen, the Open3 library, or  Process#spawn may also be used to communicate
with subprocesses through an IO.

Ruby will convert pathnames between different operating system conventions if
possible.  For instance, on a Windows system the filename
`"/gumby/ruby/test.rb"` will be opened as `"\gumby\ruby\test.rb"`.  When
specifying a Windows-style filename in a Ruby string, remember to escape the
backslashes:

    "c:\\gumby\\ruby\\test.rb"

Our examples here will use the Unix-style forward slashes; File::ALT_SEPARATOR
can be used to get the platform-specific separator character.

The global constant ARGF (also accessible as $<) provides an IO-like stream
which allows access to all files mentioned on the command line (or STDIN if no
files are mentioned). ARGF#path and its alias ARGF#filename are provided to
access the name of the file currently being read.

## io/console

The io/console extension provides methods for interacting with the console. 
The console can be accessed from IO.console or the standard input/output/error
IO objects.

Requiring io/console adds the following methods:

*   IO::console
*   IO#raw
*   IO#raw!
*   IO#cooked
*   IO#cooked!
*   IO#getch
*   IO#echo=
*   IO#echo?
*   IO#noecho
*   IO#winsize
*   IO#winsize=
*   IO#iflush
*   IO#ioflush
*   IO#oflush


Example:

    require 'io/console'
    rows, columns = $stdout.winsize
    puts "Your screen is #{columns} wide and #{rows} tall"


---
# Constants:

EWOULDBLOCKWaitReadable
:   EAGAINWaitReadable

EWOULDBLOCKWaitWritable
:   EAGAINWaitWritable

SEEK_CUR
:   Set I/O position from the current position

SEEK_DATA
:   Set I/O position to the next location containing data

SEEK_END
:   Set I/O position from the end

SEEK_HOLE
:   Set I/O position to the next hole

SEEK_SET
:   Set I/O position from the beginning



# Class methods:

    binread
    binwrite
    console
    copy_stream
    for_fd
    foreach
    new
    open
    pipe
    popen
    read
    readlines
    select
    sysopen
    try_convert
    write

# Instance methods:

    <<
    advise
    autoclose=
    autoclose?
    beep
    binmode
    binmode?
    block_scanf
    bytes
    chars
    close
    close_on_exec=
    close_on_exec?
    close_read
    close_write
    closed?
    codepoints
    cooked
    cooked!
    cursor
    cursor=
    each
    each_byte
    each_char
    each_codepoint
    each_line
    echo=
    echo?
    eof
    eof?
    expect
    external_encoding
    fcntl
    fdatasync
    fileno
    flush
    fsync
    getbyte
    getc
    getch
    getpass
    gets
    goto
    iflush
    inspect
    internal_encoding
    ioctl
    ioflush
    isatty
    lineno
    lineno=
    lines
    noecho
    nonblock
    nonblock=
    nonblock?
    nread
    oflush
    pathconf
    pid
    pos
    pos=
    pressed?
    print
    printf
    putc
    puts
    raw
    raw!
    read
    read_nonblock
    readbyte
    readchar
    readline
    readlines
    readpartial
    ready?
    reopen
    rewind
    scanf
    seek
    set_encoding
    soak_up_spaces
    stat
    sync
    sync=
    sysread
    sysseek
    syswrite
    tell
    to_i
    to_io
    tty?
    ungetbyte
    ungetc
    wait
    wait_readable
    wait_writable
    winsize
    winsize=
    write
    write_nonblock

# IO::binread

(from ruby core)
---
    IO.binread(name, [length [, offset]] )   -> string

---

Opens the file, optionally seeks to the given *offset*, then returns *length*
bytes (defaulting to the rest of the file). `binread` ensures the file is
closed before returning. The open mode would be "rb:ASCII-8BIT".

    IO.binread("testfile")           #=> "This is line one\nThis is line two\nThis is line three\nAnd so on...\n"
    IO.binread("testfile", 20)       #=> "This is line one\nThi"
    IO.binread("testfile", 20, 10)   #=> "ne one\nThis is line "


# IO::binwrite

(from ruby core)
---
    IO.binwrite(name, string, [offset] )   => integer
    IO.binwrite(name, string, [offset], open_args )   => integer

---

Same as `IO.write` except opening the file in binary mode and ASCII-8BIT
encoding ("wb:ASCII-8BIT").


# IO::console

(from ruby core)
---
    IO.console      -> #<File:/dev/tty>
    IO.console(sym, *args)

---

Returns an File instance opened console.

If `sym` is given, it will be sent to the opened console with `args` and the
result will be returned instead of the console IO itself.

You must require 'io/console' to use this method.


# IO::copy_stream

(from ruby core)
---
    IO.copy_stream(src, dst)
    IO.copy_stream(src, dst, copy_length)
    IO.copy_stream(src, dst, copy_length, src_offset)

---

IO.copy_stream copies *src* to *dst*. *src* and *dst* is either a filename or
an IO.

This method returns the number of bytes copied.

If optional arguments are not given, the start position of the copy is the
beginning of the filename or the current file offset of the IO. The end
position of the copy is the end of file.

If *copy_length* is given, No more than *copy_length* bytes are copied.

If *src_offset* is given, it specifies the start position of the copy.

When *src_offset* is specified and *src* is an IO, IO.copy_stream doesn't move
the current file offset.


# IO::for_fd

(from ruby core)
---
    IO.for_fd(fd, mode [, opt])    -> io

---

Synonym for `IO.new`.


# IO::foreach

(from ruby core)
---
    IO.foreach(name, sep=$/ [, open_args]) {|line| block }     -> nil
    IO.foreach(name, limit [, open_args]) {|line| block }      -> nil
    IO.foreach(name, sep, limit [, open_args]) {|line| block } -> nil
    IO.foreach(...)                                            -> an_enumerator

---

Executes the block for every line in the named I/O port, where lines are
separated by *sep*.

If no block is given, an enumerator is returned instead.

    IO.foreach("testfile") {|x| print "GOT ", x }

*produces:*

    GOT This is line one
    GOT This is line two
    GOT This is line three
    GOT And so on...

If the last argument is a hash, it's the keyword argument to open. See
`IO.read` for detail.


# IO::new

(from ruby core)
---
    IO.new(fd [, mode] [, opt])   -> io

---

Returns a new IO object (a stream) for the given integer file descriptor `fd`
and `mode` string.  `opt` may be used to specify parts of `mode` in a more
readable fashion.  See also IO.sysopen and IO.for_fd.

IO.new is called by various File and IO opening methods such as IO::open,
Kernel#open, and File::open.

### Open Mode

When `mode` is an integer it must be combination of the modes defined in
File::Constants (`File::RDONLY`, +File::WRONLY | File::CREAT+).  See the
open(2) man page for more information.

When `mode` is a string it must be in one of the following forms:

    fmode
    fmode ":" ext_enc
    fmode ":" ext_enc ":" int_enc
    fmode ":" "BOM|UTF-*"

`fmode` is an IO open mode string, `ext_enc` is the external encoding for the
IO and `int_enc` is the internal encoding.

#### IO Open Mode

Ruby allows the following open modes:

    "r"  Read-only, starts at beginning of file  (default mode).

    "r+" Read-write, starts at beginning of file.

    "w"  Write-only, truncates existing file
         to zero length or creates a new file for writing.

    "w+" Read-write, truncates existing file to zero length
         or creates a new file for reading and writing.

    "a"  Write-only, each write call appends data at end of file.
         Creates a new file for writing if file does not exist.

    "a+" Read-write, each write call appends data at end of file.
         Creates a new file for reading and writing if file does
         not exist.

The following modes must be used separately, and along with one or more of the
modes seen above.

    "b"  Binary file mode
         Suppresses EOL <-> CRLF conversion on Windows. And
         sets external encoding to ASCII-8BIT unless explicitly
         specified.

    "t"  Text file mode

When the open mode of original IO is read only, the mode cannot be changed to
be writable.  Similarly, the open mode cannot be changed from write only to
readable.

When such a change is attempted the error is raised in different locations
according to the platform.

### IO Encoding

When `ext_enc` is specified, strings read will be tagged by the encoding when
reading, and strings output will be converted to the specified encoding when
writing.

When `ext_enc` and `int_enc` are specified read strings will be converted from
`ext_enc` to `int_enc` upon input, and written strings will be converted from
`int_enc` to `ext_enc` upon output.  See Encoding for further details of
transcoding on input and output.

If "BOM|UTF-8", "BOM|UTF-16LE" or "BOM|UTF16-BE" are used, ruby checks for a
Unicode BOM in the input document to help determine the encoding.  For UTF-16
encodings the file open mode must be binary.  When present, the BOM is
stripped and the external encoding from the BOM is used.  When the BOM is
missing the given Unicode encoding is used as `ext_enc`.  (The BOM-set
encoding option is case insensitive, so "bom|utf-8" is also valid.)

### Options

`opt` can be used instead of `mode` for improved readability.  The following
keys are supported:

:mode
:   Same as `mode` parameter

:flags
:   Specifies file open flags as integer. If `mode` parameter is given, this
    parameter will be bitwise-ORed.

:external_encoding
:   External encoding for the IO.  "-" is a synonym for the default external
    encoding.

:internal_encoding
:   Internal encoding for the IO.  "-" is a synonym for the default internal
    encoding.

    If the value is nil no conversion occurs.

:encoding
:   Specifies external and internal encodings as "extern:intern".

:textmode
:   If the value is truth value, same as "t" in argument `mode`.

:binmode
:   If the value is truth value, same as "b" in argument `mode`.

:autoclose
:   If the value is `false`, the `fd` will be kept open after this IO instance
    gets finalized.


Also, `opt` can have same keys in String#encode for controlling conversion
between the external encoding and the internal encoding.

### Example 1

    fd = IO.sysopen("/dev/tty", "w")
    a = IO.new(fd,"w")
    $stderr.puts "Hello"
    a.puts "World"

Produces:

    Hello
    World

### Example 2

    require 'fcntl'

    fd = STDERR.fcntl(Fcntl::F_DUPFD)
    io = IO.new(fd, mode: 'w:UTF-16LE', cr_newline: true)
    io.puts "Hello, World!"

    fd = STDERR.fcntl(Fcntl::F_DUPFD)
    io = IO.new(fd, mode: 'w', cr_newline: true,
                external_encoding: Encoding::UTF_16LE)
    io.puts "Hello, World!"

Both of above print "Hello, World!" in UTF-16LE to standard error output with
converting EOL generated by `puts` to CR.


# IO::open

(from ruby core)
---
    IO.open(fd, mode="r" [, opt])                -> io
    IO.open(fd, mode="r" [, opt]) { |io| block } -> obj

---

With no associated block, `IO.open` is a synonym for IO.new.  If the optional
code block is given, it will be passed `io` as an argument, and the IO object
will automatically be closed when the block terminates. In this instance,
IO.open returns the value of the block.

See IO.new for a description of the `fd`, `mode` and `opt` parameters.


# IO::pipe

(from ruby core)
---
    IO.pipe                             ->  [read_io, write_io]
    IO.pipe(ext_enc)                    ->  [read_io, write_io]
    IO.pipe("ext_enc:int_enc" [, opt])  ->  [read_io, write_io]
    IO.pipe(ext_enc, int_enc [, opt])   ->  [read_io, write_io]
    IO.pipe(...) {|read_io, write_io| ... }

---

Creates a pair of pipe endpoints (connected to each other) and returns them as
a two-element array of `IO` objects: `[` *read_io*, *write_io* `]`.

If a block is given, the block is called and returns the value of the block.
*read_io* and *write_io* are sent to the block as arguments. If read_io and
write_io are not closed when the block exits, they are closed. i.e. closing
read_io and/or write_io doesn't cause an error.

Not available on all platforms.

If an encoding (encoding name or encoding object) is specified as an optional
argument, read string from pipe is tagged with the encoding specified. If the
argument is a colon separated two encoding names "A:B", the read string is
converted from encoding A (external encoding) to encoding B (internal
encoding), then tagged with B. If two optional arguments are specified, those
must be encoding objects or encoding names, and the first one is the external
encoding, and the second one is the internal encoding. If the external
encoding and the internal encoding is specified, optional hash argument
specify the conversion option.

In the example below, the two processes close the ends of the pipe that they
are not using. This is not just a cosmetic nicety. The read end of a pipe will
not generate an end of file condition if there are any writers with the pipe
still open. In the case of the parent process, the `rd.read` will never return
if it does not first issue a `wr.close`.

    rd, wr = IO.pipe

    if fork
      wr.close
      puts "Parent got: <#{rd.read}>"
      rd.close
      Process.wait
    else
      rd.close
      puts "Sending message to parent"
      wr.write "Hi Dad"
      wr.close
    end

*produces:*

    Sending message to parent
    Parent got: <Hi Dad>


# IO::popen

(from ruby core)
---
    IO.popen([env,] cmd, mode="r" [, opt])               -> io
    IO.popen([env,] cmd, mode="r" [, opt]) {|io| block } -> obj

---

Runs the specified command as a subprocess; the subprocess's standard input
and output will be connected to the returned `IO` object.

The PID of the started process can be obtained by IO#pid method.

*cmd* is a string or an array as follows.

    cmd:
      "-"                                      : fork
      commandline                              : command line string which is passed to a shell
      [env, cmdname, arg1, ..., opts]          : command name and zero or more arguments (no shell)
      [env, [cmdname, argv0], arg1, ..., opts] : command name, argv[0] and zero or more arguments (no shell)
    (env and opts are optional.)

If *cmd* is a `String` ```-`'', then a new instance of Ruby is started as the
subprocess.

If *cmd* is an `Array` of `String`, then it will be used as the subprocess's
`argv` bypassing a shell. The array can contains a hash at first for
environments and a hash at last for options similar to `spawn`.

The default mode for the new file object is ``r'', but *mode* may be set to
any of the modes listed in the description for class IO. The last argument
*opt* qualifies *mode*.

    # set IO encoding
    IO.popen("nkf -e filename", :external_encoding=>"EUC-JP") {|nkf_io|
      euc_jp_string = nkf_io.read
    }

    # merge standard output and standard error using
    # spawn option.  See the document of Kernel.spawn.
    IO.popen(["ls", "/", :err=>[:child, :out]]) {|ls_io|
      ls_result_with_error = ls_io.read
    }

    # spawn options can be mixed with IO options
    IO.popen(["ls", "/"], :err=>[:child, :out]) {|ls_io|
      ls_result_with_error = ls_io.read
    }

Raises exceptions which `IO.pipe` and `Kernel.spawn` raise.

If a block is given, Ruby will run the command as a child connected to Ruby
with a pipe. Ruby's end of the pipe will be passed as a parameter to the
block. At the end of block, Ruby closes the pipe and sets `$?`. In this case
`IO.popen` returns the value of the block.

If a block is given with a *cmd* of ```-`'', the block will be run in two
separate processes: once in the parent, and once in a child. The parent
process will be passed the pipe object as a parameter to the block, the child
version of the block will be passed `nil`, and the child's standard in and
standard out will be connected to the parent through the pipe. Not available
on all platforms.

    f = IO.popen("uname")
    p f.readlines
    f.close
    puts "Parent is #{Process.pid}"
    IO.popen("date") { |f| puts f.gets }
    IO.popen("-") {|f| $stderr.puts "#{Process.pid} is here, f is #{f.inspect}"}
    p $?
    IO.popen(%w"sed -e s|^|<foo>| -e s&$&;zot;&", "r+") {|f|
      f.puts "bar"; f.close_write; puts f.gets
    }

*produces:*

    ["Linux\n"]
    Parent is 21346
    Thu Jan 15 22:41:19 JST 2009
    21346 is here, f is #<IO:fd 3>
    21352 is here, f is nil
    #<Process::Status: pid 21352 exit 0>
    <foo>bar;zot;


# IO::read

(from ruby core)
---
    IO.read(name, [length [, offset]] [, opt] )   -> string

---

Opens the file, optionally seeks to the given `offset`, then returns `length`
bytes (defaulting to the rest of the file).  `read` ensures the file is closed
before returning.

If `name` starts with a pipe character (`"|"`), a subprocess is created in the
same way as Kernel#open, and its output is returned.

### Options

The options hash accepts the following keys:

encoding
:   string or encoding

    Specifies the encoding of the read string.  `encoding:` will be ignored if
    `length` is specified.  See Encoding.aliases for possible encodings.

mode
:   string

    Specifies the mode argument for open().  It must start with an "r"
    otherwise it will cause an error. See IO.new for the list of possible
    modes.

open_args
:   array of strings

    Specifies arguments for open() as an array.  This key can not be used in
    combination with either `encoding:` or `mode:`.


Examples:

    IO.read("testfile")              #=> "This is line one\nThis is line two\nThis is line three\nAnd so on...\n"
    IO.read("testfile", 20)          #=> "This is line one\nThi"
    IO.read("testfile", 20, 10)      #=> "ne one\nThis is line "
    IO.read("binfile", mode: "rb")   #=> "\xF7\x00\x00\x0E\x12"


# IO::readlines

(from ruby core)
---
    IO.readlines(name, sep=$/ [, open_args])     -> array
    IO.readlines(name, limit [, open_args])      -> array
    IO.readlines(name, sep, limit [, open_args]) -> array

---

Reads the entire file specified by *name* as individual lines, and returns
those lines in an array. Lines are separated by *sep*.

    a = IO.readlines("testfile")
    a[0]   #=> "This is line one\n"

If the last argument is a hash, it's the keyword argument to open. See
`IO.read` for detail.


# IO::select

(from ruby core)
---
    IO.select(read_array [, write_array [, error_array [, timeout]]]) -> array  or  nil

---

Calls select(2) system call. It monitors given arrays of `IO` objects, waits
until one or more of `IO` objects are ready for reading, are ready for
writing, and have pending exceptions respectively, and returns an array that
contains arrays of those IO objects.  It will return `nil` if optional
*timeout* value is given and no `IO` object is ready in *timeout* seconds.

`IO.select` peeks the buffer of `IO` objects for testing readability. If the
`IO` buffer is not empty, `IO.select` immediately notifies readability. This
"peek" only happens for `IO` objects. It does not happen for IO-like objects
such as OpenSSL::SSL::SSLSocket.

The best way to use `IO.select` is invoking it after nonblocking methods such
as `read_nonblock`, `write_nonblock`, etc. The methods raise an exception
which is extended by `IO::WaitReadable` or `IO::WaitWritable`. The modules
notify how the caller should wait with `IO.select`. If `IO::WaitReadable` is
raised, the caller should wait for reading. If `IO::WaitWritable` is raised,
the caller should wait for writing.

So, blocking read (`readpartial`) can be emulated using `read_nonblock` and
`IO.select` as follows:

    begin
      result = io_like.read_nonblock(maxlen)
    rescue IO::WaitReadable
      IO.select([io_like])
      retry
    rescue IO::WaitWritable
      IO.select(nil, [io_like])
      retry
    end

Especially, the combination of nonblocking methods and `IO.select` is
preferred for `IO` like objects such as `OpenSSL::SSL::SSLSocket`. It has
`to_io` method to return underlying `IO` object. `IO.select` calls `to_io` to
obtain the file descriptor to wait.

This means that readability notified by `IO.select` doesn't mean readability
from `OpenSSL::SSL::SSLSocket` object.

The most likely situation is that `OpenSSL::SSL::SSLSocket` buffers some data.
`IO.select` doesn't see the buffer. So `IO.select` can block when
`OpenSSL::SSL::SSLSocket#readpartial` doesn't block.

However, several more complicated situations exist.

SSL is a protocol which is sequence of records. The record consists of
multiple bytes. So, the remote side of SSL sends a partial record, `IO.select`
notifies readability but `OpenSSL::SSL::SSLSocket` cannot decrypt a byte and
`OpenSSL::SSL::SSLSocket#readpartial` will blocks.

Also, the remote side can request SSL renegotiation which forces the local SSL
engine to write some data. This means `OpenSSL::SSL::SSLSocket#readpartial`
may invoke `write` system call and it can block. In such a situation,
`OpenSSL::SSL::SSLSocket#read_nonblock` raises IO::WaitWritable instead of
blocking. So, the caller should wait for ready for writability as above
example.

The combination of nonblocking methods and `IO.select` is also useful for
streams such as tty, pipe socket socket when multiple processes read from a
stream.

Finally, Linux kernel developers don't guarantee that readability of select(2)
means readability of following read(2) even for a single process. See
select(2) manual on GNU/Linux system.

Invoking `IO.select` before `IO#readpartial` works well as usual. However it
is not the best way to use `IO.select`.

The writability notified by select(2) doesn't show how many bytes writable.
`IO#write` method blocks until given whole string is written. So,
`IO#write(two or more bytes)` can block after writability is notified by
`IO.select`. `IO#write_nonblock` is required to avoid the blocking.

Blocking write (`write`) can be emulated using `write_nonblock` and
`IO.select` as follows: IO::WaitReadable should also be rescued for SSL
renegotiation in `OpenSSL::SSL::SSLSocket`.

    while 0 < string.bytesize
      begin
        written = io_like.write_nonblock(string)
      rescue IO::WaitReadable
        IO.select([io_like])
        retry
      rescue IO::WaitWritable
        IO.select(nil, [io_like])
        retry
      end
      string = string.byteslice(written..-1)
    end

### Parameters
read_array
:   an array of `IO` objects that wait until ready for read
write_array
:   an array of `IO` objects that wait until ready for write
error_array
:   an array of `IO` objects that wait for exceptions
timeout
:   a numeric value in second


### Example

    rp, wp = IO.pipe
    mesg = "ping "
    100.times {
      # IO.select follows IO#read.  Not the best way to use IO.select.
      rs, ws, = IO.select([rp], [wp])
      if r = rs[0]
        ret = r.read(5)
        print ret
        case ret
        when /ping/
          mesg = "pong\n"
        when /pong/
          mesg = "ping "
        end
      end
      if w = ws[0]
        w.write(mesg)
      end
    }

*produces:*

    ping pong
    ping pong
    ping pong
    (snipped)
    ping


# IO::sysopen

(from ruby core)
---
    IO.sysopen(path, [mode, [perm]])  -> integer

---

Opens the given path, returning the underlying file descriptor as a `Integer`.

    IO.sysopen("testfile")   #=> 3


# IO::try_convert

(from ruby core)
---
    IO.try_convert(obj)  ->  io or nil

---

Try to convert *obj* into an IO, using to_io method. Returns converted IO or
nil if *obj* cannot be converted for any reason.

    IO.try_convert(STDOUT)     #=> STDOUT
    IO.try_convert("STDOUT")   #=> nil

    require 'zlib'
    f = open("/tmp/zz.gz")       #=> #<File:/tmp/zz.gz>
    z = Zlib::GzipReader.open(f) #=> #<Zlib::GzipReader:0x81d8744>
    IO.try_convert(z)            #=> #<File:/tmp/zz.gz>


# IO::write

(from ruby core)
---
    IO.write(name, string, [offset] )   => integer
    IO.write(name, string, [offset], open_args )   => integer

---

Opens the file, optionally seeks to the given *offset*, writes *string*, then
returns the length written. `write` ensures the file is closed before
returning. If *offset* is not given, the file is truncated.  Otherwise, it is
not truncated.

If the last argument is a hash, it specifies option for internal open().  The
key would be the following.  open_args: is exclusive to others.

    encoding: string or encoding

     specifies encoding of the read string.  encoding will be ignored
     if length is specified.

    mode: string

     specifies mode argument for open().  it should start with "w" or "a" or "r+"
     otherwise it would cause error.

    perm: integer

     specifies perm argument for open().

    open_args: array

     specifies arguments for open() as an array.

      IO.write("testfile", "0123456789", 20) # => 10
      # File could contain:  "This is line one\nThi0123456789two\nThis is line three\nAnd so on...\n"
      IO.write("testfile", "0123456789")      #=> 10
      # File would now read: "0123456789"


# IO#<<

(from ruby core)
---
    ios << obj     -> ios

---

String Output---Writes *obj* to *ios*. *obj* will be converted to a string
using `to_s`.

    $stdout << "Hello " << "world!\n"

*produces:*

    Hello world!


# IO#advise

(from ruby core)
---
    ios.advise(advice, offset=0, len=0) -> nil

---

Announce an intention to access data from the current file in a specific
pattern. On platforms that do not support the *posix_fadvise(2)* system call,
this method is a no-op.

*advice* is one of the following symbols:

:normal
:   No advice to give; the default assumption for an open file.
:sequential
:   The data will be accessed sequentially with lower offsets read before
    higher ones.
:random
:   The data will be accessed in random order.
:willneed
:   The data will be accessed in the near future.
:dontneed
:   The data will not be accessed in the near future.
:noreuse
:   The data will only be accessed once.


The semantics of a piece of advice are platform-dependent. See *man 2
posix_fadvise* for details.

"data" means the region of the current file that begins at *offset* and
extends for *len* bytes. If *len* is 0, the region ends at the last byte of
the file. By default, both *offset* and *len* are 0, meaning that the advice
applies to the entire file.

If an error occurs, one of the following exceptions will be raised:

`IOError`
:   The `IO` stream is closed.
`Errno::EBADF`
:   The file descriptor of the current file is invalid.
`Errno::EINVAL`
:   An invalid value for *advice* was given.
`Errno::ESPIPE`
:   The file descriptor of the current file refers to a FIFO or pipe. (Linux
    raises `Errno::EINVAL` in this case).
`TypeError`
:   Either *advice* was not a Symbol, or one of the other arguments was not an
    `Integer`.
`RangeError`
:   One of the arguments given was too big/small.

This list is not exhaustive; other Errno
:   exceptions are also possible.



# IO#autoclose=

(from ruby core)
---
    io.autoclose = bool    -> true or false

---

Sets auto-close flag.

    f = open("/dev/null")
    IO.for_fd(f.fileno)
    # ...
    f.gets # may cause IOError

    f = open("/dev/null")
    IO.for_fd(f.fileno).autoclose = true
    # ...
    f.gets # won't cause IOError


# IO#autoclose?

(from ruby core)
---
    ios.autoclose?   -> true or false

---

Returns `true` if the underlying file descriptor of *ios* will be closed
automatically at its finalization, otherwise `false`.


# IO#beep

(from ruby core)
---
    beep()

---


# IO#binmode

(from ruby core)
---
    ios.binmode    -> ios

---

Puts *ios* into binary mode. Once a stream is in binary mode, it cannot be
reset to nonbinary mode.

*   newline conversion disabled
*   encoding conversion disabled
*   content is treated as ASCII-8BIT



# IO#binmode?

(from ruby core)
---
    ios.binmode?    -> true or false

---

Returns `true` if *ios* is binmode.


# IO#bytes

(from ruby core)
---
    bytes()

---

This is a deprecated alias for `each_byte`.


# IO#chars

(from ruby core)
---
    chars()

---

This is a deprecated alias for `each_char`.


# IO#close

(from ruby core)
---
    ios.close   -> nil

---

Closes *ios* and flushes any pending writes to the operating system. The
stream is unavailable for any further data operations; an `IOError` is raised
if such an attempt is made. I/O streams are automatically closed when they are
claimed by the garbage collector.

If *ios* is opened by `IO.popen`, `close` sets `$?`.

Calling this method on closed IO object is just ignored since Ruby 2.3.


# IO#close_on_exec=

(from ruby core)
---
    ios.close_on_exec = bool    -> true or false

---

Sets a close-on-exec flag.

    f = open("/dev/null")
    f.close_on_exec = true
    system("cat", "/proc/self/fd/#{f.fileno}") # cat: /proc/self/fd/3: No such file or directory
    f.closed?                #=> false

Ruby sets close-on-exec flags of all file descriptors by default since Ruby
2.0.0. So you don't need to set by yourself. Also, unsetting a close-on-exec
flag can cause file descriptor leak if another thread use fork() and exec()
(via system() method for example). If you really needs file descriptor
inheritance to child process, use spawn()'s argument such as fd=>fd.


# IO#close_on_exec?

(from ruby core)
---
    ios.close_on_exec?   -> true or false

---

Returns `true` if *ios* will be closed on exec.

    f = open("/dev/null")
    f.close_on_exec?                 #=> false
    f.close_on_exec = true
    f.close_on_exec?                 #=> true
    f.close_on_exec = false
    f.close_on_exec?                 #=> false


# IO#close_read

(from ruby core)
---
    ios.close_read    -> nil

---

Closes the read end of a duplex I/O stream (i.e., one that contains both a
read and a write stream, such as a pipe). Will raise an `IOError` if the
stream is not duplexed.

    f = IO.popen("/bin/sh","r+")
    f.close_read
    f.readlines

*produces:*

    prog.rb:3:in `readlines': not opened for reading (IOError)
     from prog.rb:3


# IO#close_write

(from ruby core)
---
    ios.close_write   -> nil

---

Closes the write end of a duplex I/O stream (i.e., one that contains both a
read and a write stream, such as a pipe). Will raise an `IOError` if the
stream is not duplexed.

    f = IO.popen("/bin/sh","r+")
    f.close_write
    f.print "nowhere"

*produces:*

    prog.rb:3:in `write': not opened for writing (IOError)
     from prog.rb:3:in `print'
     from prog.rb:3


# IO#closed?

(from ruby core)
---
    ios.closed?    -> true or false

---

Returns `true` if *ios* is completely closed (for duplex streams, both reader
and writer), `false` otherwise.

    f = File.new("testfile")
    f.close         #=> nil
    f.closed?       #=> true
    f = IO.popen("/bin/sh","r+")
    f.close_write   #=> nil
    f.closed?       #=> false
    f.close_read    #=> nil
    f.closed?       #=> true


# IO#codepoints

(from ruby core)
---
    codepoints()

---

This is a deprecated alias for `each_codepoint`.


# IO#cooked

(from ruby core)
---
    io.cooked {|io| }

---

Yields `self` within cooked mode.

    STDIN.cooked(&:gets)

will read and return a line with echo back and line editing.

You must require 'io/console' to use this method.


# IO#cooked!

(from ruby core)
---
    io.cooked!

---

Enables cooked mode.

If the terminal mode needs to be back, use io.cooked { ... }.

You must require 'io/console' to use this method.


# IO#cursor

(from ruby core)
---
    cursor()

---


# IO#cursor=

(from ruby core)
---
    cursor=(p1)

---


# IO#each

(from ruby core)
---
    ios.each(sep=$/) {|line| block }         -> ios
    ios.each(limit) {|line| block }          -> ios
    ios.each(sep,limit) {|line| block }      -> ios
    ios.each(...)                            -> an_enumerator
    ios.each_line(sep=$/) {|line| block }    -> ios
    ios.each_line(limit) {|line| block }     -> ios
    ios.each_line(sep,limit) {|line| block } -> ios
    ios.each_line(...)                       -> an_enumerator

---

Executes the block for every line in *ios*, where lines are separated by
*sep*. *ios* must be opened for reading or an `IOError` will be raised.

If no block is given, an enumerator is returned instead.

    f = File.new("testfile")
    f.each {|line| puts "#{f.lineno}: #{line}" }

*produces:*

    1: This is line one
    2: This is line two
    3: This is line three
    4: And so on...


# IO#each_byte

(from ruby core)
---
    ios.each_byte {|byte| block }  -> ios
    ios.each_byte                  -> an_enumerator

---

Calls the given block once for each byte (0..255) in *ios*, passing the byte
as an argument. The stream must be opened for reading or an `IOError` will be
raised.

If no block is given, an enumerator is returned instead.

    f = File.new("testfile")
    checksum = 0
    f.each_byte {|x| checksum ^= x }   #=> #<File:testfile>
    checksum                           #=> 12


# IO#each_char

(from ruby core)
---
    ios.each_char {|c| block }  -> ios
    ios.each_char               -> an_enumerator

---

Calls the given block once for each character in *ios*, passing the character
as an argument. The stream must be opened for reading or an `IOError` will be
raised.

If no block is given, an enumerator is returned instead.

    f = File.new("testfile")
    f.each_char {|c| print c, ' ' }   #=> #<File:testfile>


# IO#each_codepoint

(from ruby core)
---
    ios.each_codepoint {|c| block }  -> ios
    ios.codepoints     {|c| block }  -> ios
    ios.each_codepoint               -> an_enumerator
    ios.codepoints                   -> an_enumerator

---

Passes the `Integer` ordinal of each character in *ios*, passing the codepoint
as an argument. The stream must be opened for reading or an `IOError` will be
raised.

If no block is given, an enumerator is returned instead.


# IO#each_line

(from ruby core)
---
    ios.each_line(sep=$/) {|line| block }    -> ios
    ios.each_line(limit) {|line| block }     -> ios
    ios.each_line(sep,limit) {|line| block } -> ios
    ios.each_line(...)                       -> an_enumerator

---

Executes the block for every line in *ios*, where lines are separated by
*sep*. *ios* must be opened for reading or an `IOError` will be raised.

If no block is given, an enumerator is returned instead.

    f = File.new("testfile")
    f.each {|line| puts "#{f.lineno}: #{line}" }

*produces:*

    1: This is line one
    2: This is line two
    3: This is line three
    4: And so on...


# IO#echo=

(from ruby core)
---
    io.echo = flag

---

Enables/disables echo back. On some platforms, all combinations of this flags
and raw/cooked mode may not be valid.

You must require 'io/console' to use this method.


# IO#echo?

(from ruby core)
---
    io.echo?       -> true or false

---

Returns `true` if echo back is enabled.

You must require 'io/console' to use this method.


# IO#eof

(from ruby core)
---
    ios.eof     -> true or false
    ios.eof?    -> true or false

---

Returns true if *ios* is at end of file that means there are no more data to
read. The stream must be opened for reading or an `IOError` will be raised.

    f = File.new("testfile")
    dummy = f.readlines
    f.eof   #=> true

If *ios* is a stream such as pipe or socket, `IO#eof?` blocks until the other
end sends some data or closes it.

    r, w = IO.pipe
    Thread.new { sleep 1; w.close }
    r.eof?  #=> true after 1 second blocking

    r, w = IO.pipe
    Thread.new { sleep 1; w.puts "a" }
    r.eof?  #=> false after 1 second blocking

    r, w = IO.pipe
    r.eof?  # blocks forever

Note that `IO#eof?` reads data to the input byte buffer. So `IO#sysread` may
not behave as you intend with `IO#eof?`, unless you call `IO#rewind` first
(which is not available for some streams).


# IO#eof?

(from ruby core)
---
    ios.eof?    -> true or false

---

Returns true if *ios* is at end of file that means there are no more data to
read. The stream must be opened for reading or an `IOError` will be raised.

    f = File.new("testfile")
    dummy = f.readlines
    f.eof   #=> true

If *ios* is a stream such as pipe or socket, `IO#eof?` blocks until the other
end sends some data or closes it.

    r, w = IO.pipe
    Thread.new { sleep 1; w.close }
    r.eof?  #=> true after 1 second blocking

    r, w = IO.pipe
    Thread.new { sleep 1; w.puts "a" }
    r.eof?  #=> false after 1 second blocking

    r, w = IO.pipe
    r.eof?  # blocks forever

Note that `IO#eof?` reads data to the input byte buffer. So `IO#sysread` may
not behave as you intend with `IO#eof?`, unless you call `IO#rewind` first
(which is not available for some streams).


# IO#expect

(from ruby core)
---
    IO#expect(pattern,timeout=9999999)                  ->  Array
    IO#expect(pattern,timeout=9999999) { |result| ... } ->  nil

---

Reads from the IO until the given `pattern` matches or the `timeout` is over.

It returns an array with the read buffer, followed by the matches. If a block
is given, the result is yielded to the block and returns nil.

When called without a block, it waits until the input that matches the given
`pattern` is obtained from the IO or the time specified as the timeout passes.
An array is returned when the pattern is obtained from the IO. The first
element of the array is the entire string obtained from the IO until the
pattern matches, followed by elements indicating which the pattern which
matched to the anchor in the regular expression.

The optional timeout parameter defines, in seconds, the total time to wait for
the pattern.  If the timeout expires or eof is found, nil is returned or
yielded.  However, the buffer in a timeout session is kept for the next expect
call.  The default timeout is 9999999 seconds.


# IO#external_encoding

(from ruby core)
---
    io.external_encoding   -> encoding

---

Returns the Encoding object that represents the encoding of the file. If io is
write mode and no encoding is specified, returns `nil`.


# IO#fcntl

(from ruby core)
---
    ios.fcntl(integer_cmd, arg)    -> integer

---

Provides a mechanism for issuing low-level commands to control or query
file-oriented I/O streams. Arguments and results are platform dependent. If
*arg* is a number, its value is passed directly. If it is a string, it is
interpreted as a binary sequence of bytes (`Array#pack` might be a useful way
to build this string). On Unix platforms, see `fcntl(2)` for details. Not
implemented on all platforms.


# IO#fdatasync

(from ruby core)
---
    ios.fdatasync   -> 0 or nil

---

Immediately writes all buffered data in *ios* to disk.

If the underlying operating system does not support *fdatasync(2)*, `IO#fsync`
is called instead (which might raise a `NotImplementedError`).


# IO#fileno

(from ruby core)
---
    ios.fileno    -> integer
    ios.to_i      -> integer

---

Returns an integer representing the numeric file descriptor for *ios*.

    $stdin.fileno    #=> 0
    $stdout.fileno   #=> 1


# IO#flush

(from ruby core)
---
    ios.flush    -> ios

---

Flushes any buffered data within *ios* to the underlying operating system
(note that this is Ruby internal buffering only; the OS may buffer the data as
well).

    $stdout.print "no newline"
    $stdout.flush

*produces:*

    no newline


# IO#fsync

(from ruby core)
---
    ios.fsync   -> 0 or nil

---

Immediately writes all buffered data in *ios* to disk. Note that `fsync`
differs from using `IO#sync=`. The latter ensures that data is flushed from
Ruby's buffers, but does not guarantee that the underlying operating system
actually writes it to disk.

`NotImplementedError` is raised if the underlying operating system does not
support *fsync(2)*.


# IO#getbyte

(from ruby core)
---
    ios.getbyte   -> integer or nil

---

Gets the next 8-bit byte (0..255) from *ios*. Returns `nil` if called at end
of file.

    f = File.new("testfile")
    f.getbyte   #=> 84
    f.getbyte   #=> 104


# IO#getc

(from ruby core)
---
    ios.getc   -> string or nil

---

Reads a one-character string from *ios*. Returns `nil` if called at end of
file.

    f = File.new("testfile")
    f.getc   #=> "h"
    f.getc   #=> "e"


# IO#getch

(from ruby core)
---
    io.getch(min: nil, time: nil)       -> char

---

Reads and returns a character in raw mode.

You must require 'io/console' to use this method.


# IO#getpass

(from ruby core)
---
    io.getpass(prompt=nil)       -> string

---

Reads and returns a line without echo back. Prints `prompt` unless it is
`nil`.

You must require 'io/console' to use this method.


# IO#gets

(from ruby core)
---
    ios.gets(sep=$/)     -> string or nil
    ios.gets(limit)      -> string or nil
    ios.gets(sep, limit) -> string or nil

---

Reads the next ``line'' from the I/O stream; lines are separated by *sep*. A
separator of `nil` reads the entire contents, and a zero-length separator
reads the input a paragraph at a time (two successive newlines in the input
separate paragraphs). The stream must be opened for reading or an `IOError`
will be raised. The line read in will be returned and also assigned to `$_`.
Returns `nil` if called at end of file.  If the first argument is an integer,
or optional second argument is given, the returning string would not be longer
than the given value in bytes.

    File.new("testfile").gets   #=> "This is line one\n"
    $_                          #=> "This is line one\n"

    File.new("testfile").gets(4)#=> "This"

If IO contains multibyte characters byte then `gets(1)` returns character
entirely:

    # Russian characters take 2 bytes
    File.write("testfile", "\u{442 435 441 442}")
    File.open("testfile") {|f|f.gets(1)} #=> "\u0442"
    File.open("testfile") {|f|f.gets(2)} #=> "\u0442"
    File.open("testfile") {|f|f.gets(3)} #=> "\u0442\u0435"
    File.open("testfile") {|f|f.gets(4)} #=> "\u0442\u0435"


# IO#goto

(from ruby core)
---
    goto(p1, p2)

---


# IO#iflush

(from ruby core)
---
    io.iflush

---

Flushes input buffer in kernel.

You must require 'io/console' to use this method.


# IO#inspect

(from ruby core)
---
    ios.inspect   -> string

---

Return a string describing this IO object.


# IO#internal_encoding

(from ruby core)
---
    io.internal_encoding   -> encoding

---

Returns the Encoding of the internal string if conversion is specified. 
Otherwise returns nil.


# IO#ioctl

(from ruby core)
---
    ios.ioctl(integer_cmd, arg)    -> integer

---

Provides a mechanism for issuing low-level commands to control or query I/O
devices. Arguments and results are platform dependent. If *arg* is a number,
its value is passed directly. If it is a string, it is interpreted as a binary
sequence of bytes. On Unix platforms, see `ioctl(2)` for details. Not
implemented on all platforms.


# IO#ioflush

(from ruby core)
---
    io.ioflush

---

Flushes input and output buffers in kernel.

You must require 'io/console' to use this method.


# IO#isatty

(from ruby core)
---
    ios.isatty   -> true or false

---

Returns `true` if *ios* is associated with a terminal device (tty), `false`
otherwise.

    File.new("testfile").isatty   #=> false
    File.new("/dev/tty").isatty   #=> true


# IO#lineno

(from ruby core)
---
    ios.lineno    -> integer

---

Returns the current line number in *ios*.  The stream must be opened for
reading. `lineno` counts the number of times #gets is called rather than the
number of newlines encountered.  The two values will differ if #gets is called
with a separator other than newline.

Methods that use `$/` like #each, #lines and #readline will also increment
`lineno`.

See also the `$.` variable.

    f = File.new("testfile")
    f.lineno   #=> 0
    f.gets     #=> "This is line one\n"
    f.lineno   #=> 1
    f.gets     #=> "This is line two\n"
    f.lineno   #=> 2


# IO#lineno=

(from ruby core)
---
    ios.lineno = integer    -> integer

---

Manually sets the current line number to the given value. `$.` is updated only
on the next read.

    f = File.new("testfile")
    f.gets                     #=> "This is line one\n"
    $.                         #=> 1
    f.lineno = 1000
    f.lineno                   #=> 1000
    $.                         #=> 1         # lineno of last read
    f.gets                     #=> "This is line two\n"
    $.                         #=> 1001      # lineno of last read


# IO#lines

(from ruby core)
---
    lines(*args)

---

This is a deprecated alias for `each_line`.


# IO#noecho

(from ruby core)
---
    io.noecho {|io| }

---

Yields `self` with disabling echo back.

    STDIN.noecho(&:gets)

will read and return a line without echo back.

You must require 'io/console' to use this method.


# IO#nonblock

(from ruby core)
---
    io.nonblock {|io| } -> io
    io.nonblock(boolean) {|io| } -> io

---

Yields `self` in non-blocking mode.

When `false` is given as an argument, `self` is yielded in blocking mode. The
original mode is restored after the block is executed.


# IO#nonblock=

(from ruby core)
---
    io.nonblock = boolean -> boolean

---

Enables non-blocking mode on a stream when set to `true`, and blocking mode
when set to `false`.


# IO#nonblock?

(from ruby core)
---
    io.nonblock? -> boolean

---

Returns `true` if an IO object is in non-blocking mode.


# IO#nread

(from ruby core)
---
    io.nread -> int

---

Returns number of bytes that can be read without blocking. Returns zero if no
information available.


# IO#oflush

(from ruby core)
---
    io.oflush

---

Flushes output buffer in kernel.

You must require 'io/console' to use this method.


# IO#pathconf

(from ruby core)
---
    pathconf(p1)

---

Returns pathname configuration variable using fpathconf().

*name* should be a constant under `Etc` which begins with `PC_`.

The return value is an integer or nil. nil means indefinite limit. 
(fpathconf() returns -1 but errno is not set.)

    require 'etc'
    IO.pipe {|r, w|
      p w.pathconf(Etc::PC_PIPE_BUF) #=> 4096
    }


# IO#pid

(from ruby core)
---
    ios.pid    -> integer

---

Returns the process ID of a child process associated with *ios*. This will be
set by `IO.popen`.

    pipe = IO.popen("-")
    if pipe
      $stderr.puts "In parent, child pid is #{pipe.pid}"
    else
      $stderr.puts "In child, pid is #{$$}"
    end

*produces:*

    In child, pid is 26209
    In parent, child pid is 26209


# IO#pos

(from ruby core)
---
    ios.pos     -> integer

---

Returns the current offset (in bytes) of *ios*.

    f = File.new("testfile")
    f.pos    #=> 0
    f.gets   #=> "This is line one\n"
    f.pos    #=> 17


# IO#pos=

(from ruby core)
---
    ios.pos = integer    -> integer

---

Seeks to the given position (in bytes) in *ios*. It is not guaranteed that
seeking to the right position when *ios* is textmode.

    f = File.new("testfile")
    f.pos = 17
    f.gets   #=> "This is line two\n"


# IO#pressed?

(from ruby core)
---
    pressed?(p1)

---


# IO#print

(from ruby core)
---
    ios.print()             -> nil
    ios.print(obj, ...)     -> nil

---

Writes the given object(s) to *ios*. The stream must be opened for writing. If
the output field separator (`$,`) is not `nil`, it will be inserted between
each object. If the output record separator (`$\`) is not `nil`, it will be
appended to the output. If no arguments are given, prints `$_`. Objects that
aren't strings will be converted by calling their `to_s` method. With no
argument, prints the contents of the variable `$_`. Returns `nil`.

    $stdout.print("This is ", 100, " percent.\n")

*produces:*

    This is 100 percent.


# IO#printf

(from ruby core)
---
    ios.printf(format_string [, obj, ...])   -> nil

---

Formats and writes to *ios*, converting parameters under control of the format
string. See `Kernel#sprintf` for details.


# IO#putc

(from ruby core)
---
    ios.putc(obj)    -> obj

---

If *obj* is `Numeric`, write the character whose code is the least-significant
byte of *obj*, otherwise write the first byte of the string representation of
*obj* to *ios*. Note: This method is not safe for use with multi-byte
characters as it will truncate them.

    $stdout.putc "A"
    $stdout.putc 65

*produces:*

    AA


# IO#puts

(from ruby core)
---
    ios.puts(obj, ...)    -> nil

---

Writes the given objects to *ios* as with `IO#print`. Writes a record
separator (typically a newline) after any that do not already end with a
newline sequence. If called with an array argument, writes each element on a
new line. If called without arguments, outputs a single record separator.

    $stdout.puts("this", "is", "a", "test")

*produces:*

    this
    is
    a
    test


# IO#raw

(from ruby core)
---
    io.raw(min: nil, time: nil) {|io| }

---

Yields `self` within raw mode.

    STDIN.raw(&:gets)

will read and return a line without echo back and line editing.

You must require 'io/console' to use this method.


# IO#raw!

(from ruby core)
---
    io.raw!(min: nil, time: nil)

---

Enables raw mode.

If the terminal mode needs to be back, use io.raw { ... }.

You must require 'io/console' to use this method.


# IO#read

(from ruby core)
---
    ios.read([length [, outbuf]])    -> string, outbuf, or nil

---

Reads *length* bytes from the I/O stream.

*length* must be a non-negative integer or `nil`.

If *length* is a positive integer, it tries to read *length* bytes without any
conversion (binary mode). It returns `nil` or a string whose length is 1 to
*length* bytes. `nil` means it met EOF at beginning. The 1 to *length*-1 bytes
string means it met EOF after reading the result. The *length* bytes string
means it doesn't meet EOF. The resulted string is always ASCII-8BIT encoding.

If *length* is omitted or is `nil`, it reads until EOF and the encoding
conversion is applied. It returns a string even if EOF is met at beginning.

If *length* is zero, it returns `""`.

If the optional *outbuf* argument is present, it must reference a String,
which will receive the data. The *outbuf* will contain only the received data
after the method call even if it is not empty at the beginning.

At end of file, it returns `nil` or `""` depend on *length*. *`ios*.read()`
and *`ios*.read(nil)` returns `""`. *`ios*.read(*positive-integer*)` returns
`nil`.

    f = File.new("testfile")
    f.read(16)   #=> "This is line one"

    # reads whole file
    open("file") {|f|
      data = f.read # This returns a string even if the file is empty.
      ...
    }

    # iterate over fixed length records.
    open("fixed-record-file") {|f|
      while record = f.read(256)
        ...
      end
    }

    # iterate over variable length records.
    # record is prefixed by 32-bit length.
    open("variable-record-file") {|f|
      while len = f.read(4)
        len = len.unpack("N")[0] # 32-bit length
        record = f.read(len) # This returns a string even if len is 0.
      end
    }

Note that this method behaves like fread() function in C. This means it retry
to invoke read(2) system call to read data with the specified length (or until
EOF). This behavior is preserved even if *ios* is non-blocking mode. (This
method is non-blocking flag insensitive as other methods.) If you need the
behavior like single read(2) system call, consider readpartial, read_nonblock
and sysread.


# IO#read_nonblock

(from ruby core)
---
    ios.read_nonblock(maxlen [, options])              -> string
    ios.read_nonblock(maxlen, outbuf [, options])      -> outbuf

---

Reads at most *maxlen* bytes from *ios* using the read(2) system call after
O_NONBLOCK is set for the underlying file descriptor.

If the optional *outbuf* argument is present, it must reference a String,
which will receive the data. The *outbuf* will contain only the received data
after the method call even if it is not empty at the beginning.

read_nonblock just calls the read(2) system call. It causes all errors the
read(2) system call causes: Errno::EWOULDBLOCK, Errno::EINTR, etc. The caller
should care such errors.

If the exception is Errno::EWOULDBLOCK or Errno::EAGAIN, it is extended by
IO::WaitReadable. So IO::WaitReadable can be used to rescue the exceptions for
retrying read_nonblock.

read_nonblock causes EOFError on EOF.

If the read byte buffer is not empty, read_nonblock reads from the buffer like
readpartial. In this case, the read(2) system call is not called.

When read_nonblock raises an exception kind of IO::WaitReadable, read_nonblock
should not be called until io is readable for avoiding busy loop. This can be
done as follows.

    # emulates blocking read (readpartial).
    begin
      result = io.read_nonblock(maxlen)
    rescue IO::WaitReadable
      IO.select([io])
      retry
    end

Although IO#read_nonblock doesn't raise IO::WaitWritable.
OpenSSL::Buffering#read_nonblock can raise IO::WaitWritable. If IO and SSL
should be used polymorphically, IO::WaitWritable should be rescued too. See
the document of OpenSSL::Buffering#read_nonblock for sample code.

Note that this method is identical to readpartial except the non-blocking flag
is set.

By specifying `exception: false`, the options hash allows you to indicate that
read_nonblock should not raise an IO::WaitReadable exception, but return the
symbol :wait_readable instead.


# IO#readbyte

(from ruby core)
---
    ios.readbyte   -> integer

---

Reads a byte as with `IO#getbyte`, but raises an `EOFError` on end of file.


# IO#readchar

(from ruby core)
---
    ios.readchar   -> string

---

Reads a one-character string from *ios*. Raises an `EOFError` on end of file.

    f = File.new("testfile")
    f.readchar   #=> "h"
    f.readchar   #=> "e"


# IO#readline

(from ruby core)
---
    ios.readline(sep=$/)     -> string
    ios.readline(limit)      -> string
    ios.readline(sep, limit) -> string

---

Reads a line as with `IO#gets`, but raises an `EOFError` on end of file.


# IO#readlines

(from ruby core)
---
    ios.readlines(sep=$/)     -> array
    ios.readlines(limit)      -> array
    ios.readlines(sep, limit) -> array

---

Reads all of the lines in *ios*, and returns them in *anArray*. Lines are
separated by the optional *sep*. If *sep* is `nil`, the rest of the stream is
returned as a single record.  If the first argument is an integer, or optional
second argument is given, the returning string would not be longer than the
given value in bytes. The stream must be opened for reading or an `IOError`
will be raised.

    f = File.new("testfile")
    f.readlines[0]   #=> "This is line one\n"


# IO#readpartial

(from ruby core)
---
    ios.readpartial(maxlen)              -> string
    ios.readpartial(maxlen, outbuf)      -> outbuf

---

Reads at most *maxlen* bytes from the I/O stream. It blocks only if *ios* has
no data immediately available. It doesn't block if some data available. If the
optional *outbuf* argument is present, it must reference a String, which will
receive the data. The *outbuf* will contain only the received data after the
method call even if it is not empty at the beginning. It raises `EOFError` on
end of file.

readpartial is designed for streams such as pipe, socket, tty, etc. It blocks
only when no data immediately available. This means that it blocks only when
following all conditions hold.
*   the byte buffer in the IO object is empty.
*   the content of the stream is empty.
*   the stream is not reached to EOF.


When readpartial blocks, it waits data or EOF on the stream. If some data is
reached, readpartial returns with the data. If EOF is reached, readpartial
raises EOFError.

When readpartial doesn't blocks, it returns or raises immediately. If the byte
buffer is not empty, it returns the data in the buffer. Otherwise if the
stream has some content, it returns the data in the stream. Otherwise if the
stream is reached to EOF, it raises EOFError.

    r, w = IO.pipe           #               buffer          pipe content
    w << "abc"               #               ""              "abc".
    r.readpartial(4096)      #=> "abc"       ""              ""
    r.readpartial(4096)      # blocks because buffer and pipe is empty.

    r, w = IO.pipe           #               buffer          pipe content
    w << "abc"               #               ""              "abc"
    w.close                  #               ""              "abc" EOF
    r.readpartial(4096)      #=> "abc"       ""              EOF
    r.readpartial(4096)      # raises EOFError

    r, w = IO.pipe           #               buffer          pipe content
    w << "abc\ndef\n"        #               ""              "abc\ndef\n"
    r.gets                   #=> "abc\n"     "def\n"         ""
    w << "ghi\n"             #               "def\n"         "ghi\n"
    r.readpartial(4096)      #=> "def\n"     ""              "ghi\n"
    r.readpartial(4096)      #=> "ghi\n"     ""              ""

Note that readpartial behaves similar to sysread. The differences are:
*   If the byte buffer is not empty, read from the byte buffer instead of
    "sysread for buffered IO (IOError)".
*   It doesn't cause Errno::EWOULDBLOCK and Errno::EINTR.  When readpartial
    meets EWOULDBLOCK and EINTR by read system call, readpartial retry the
    system call.


The latter means that readpartial is nonblocking-flag insensitive. It blocks
on the situation IO#sysread causes Errno::EWOULDBLOCK as if the fd is blocking
mode.


# IO#ready?

(from ruby core)
---
    io.ready? -> true, false or nil

---

Returns true if input available without blocking, or false. Returns nil if no
information available.


# IO#reopen

(from ruby core)
---
    ios.reopen(other_IO)         -> ios
    ios.reopen(path, mode_str)   -> ios

---

Reassociates *ios* with the I/O stream given in *other_IO* or to a new stream
opened on *path*. This may dynamically change the actual class of this stream.

    f1 = File.new("testfile")
    f2 = File.new("testfile")
    f2.readlines[0]   #=> "This is line one\n"
    f2.reopen(f1)     #=> #<File:testfile>
    f2.readlines[0]   #=> "This is line one\n"


# IO#rewind

(from ruby core)
---
    ios.rewind    -> 0

---

Positions *ios* to the beginning of input, resetting `lineno` to zero.

    f = File.new("testfile")
    f.readline   #=> "This is line one\n"
    f.rewind     #=> 0
    f.lineno     #=> 0
    f.readline   #=> "This is line one\n"

Note that it cannot be used with streams such as pipes, ttys, and sockets.


# IO#scanf

(from ruby core)
---
    scanf(str) { |current_match| ... }

---

Scans the current string until the match is exhausted, yielding each match as
it is encountered in the string. A block is not necessary though, as the
results will simply be aggregated into the final array.

    "123 456".block_scanf("%d")
    # => [123, 456]

If a block is given, the value from that is returned from the yield is added
to an output array.

    "123 456".block_scanf("%d") do |digit,| # the ',' unpacks the Array
      digit + 100
    end
    # => [223, 556]

See Scanf for details on creating a format string.

You will need to require 'scanf' to use IO#scanf.


# IO#seek

(from ruby core)
---
    ios.seek(amount, whence=IO::SEEK_SET)  ->  0

---

Seeks to a given offset *anInteger* in the stream according to the value of
*whence*:

    :CUR or IO::SEEK_CUR  | Seeks to _amount_ plus current position
    ----------------------+--------------------------------------------------
    :END or IO::SEEK_END  | Seeks to _amount_ plus end of stream (you
                          | probably want a negative value for _amount_)
    ----------------------+--------------------------------------------------
    :SET or IO::SEEK_SET  | Seeks to the absolute location given by _amount_

Example:

    f = File.new("testfile")
    f.seek(-13, IO::SEEK_END)   #=> 0
    f.readline                  #=> "And so on...\n"


# IO#set_encoding

(from ruby core)
---
    io.set_encoding(ext_enc)                -> io
    io.set_encoding("ext_enc:int_enc")      -> io
    io.set_encoding(ext_enc, int_enc)       -> io
    io.set_encoding("ext_enc:int_enc", opt) -> io
    io.set_encoding(ext_enc, int_enc, opt)  -> io

---

If single argument is specified, read string from io is tagged with the
encoding specified.  If encoding is a colon separated two encoding names
"A:B", the read string is converted from encoding A (external encoding) to
encoding B (internal encoding), then tagged with B.  If two arguments are
specified, those must be encoding objects or encoding names, and the first one
is the external encoding, and the second one is the internal encoding. If the
external encoding and the internal encoding is specified, optional hash
argument specify the conversion option.


# IO#stat

(from ruby core)
---
    ios.stat    -> stat

---

Returns status information for *ios* as an object of type `File::Stat`.

    f = File.new("testfile")
    s = f.stat
    "%o" % s.mode   #=> "100644"
    s.blksize       #=> 4096
    s.atime         #=> Wed Apr 09 08:53:54 CDT 2003


# IO#sync

(from ruby core)
---
    ios.sync    -> true or false

---

Returns the current ``sync mode'' of *ios*. When sync mode is true, all output
is immediately flushed to the underlying operating system and is not buffered
by Ruby internally. See also `IO#fsync`.

    f = File.new("testfile")
    f.sync   #=> false


# IO#sync=

(from ruby core)
---
    ios.sync = boolean   -> boolean

---

Sets the ``sync mode'' to `true` or `false`. When sync mode is true, all
output is immediately flushed to the underlying operating system and is not
buffered internally. Returns the new state. See also `IO#fsync`.

    f = File.new("testfile")
    f.sync = true

*(produces no output)*


# IO#sysread

(from ruby core)
---
    ios.sysread(maxlen[, outbuf])    -> string

---

Reads *maxlen* bytes from *ios* using a low-level read and returns them as a
string.  Do not mix with other methods that read from *ios* or you may get
unpredictable results. If the optional *outbuf* argument is present, it must
reference a String, which will receive the data. The *outbuf* will contain
only the received data after the method call even if it is not empty at the
beginning. Raises `SystemCallError` on error and `EOFError` at end of file.

    f = File.new("testfile")
    f.sysread(16)   #=> "This is line one"


# IO#sysseek

(from ruby core)
---
    ios.sysseek(offset, whence=IO::SEEK_SET)   -> integer

---

Seeks to a given *offset* in the stream according to the value of *whence*
(see `IO#seek` for values of *whence*). Returns the new offset into the file.

    f = File.new("testfile")
    f.sysseek(-13, IO::SEEK_END)   #=> 53
    f.sysread(10)                  #=> "And so on."


# IO#syswrite

(from ruby core)
---
    ios.syswrite(string)   -> integer

---

Writes the given string to *ios* using a low-level write. Returns the number
of bytes written. Do not mix with other methods that write to *ios* or you may
get unpredictable results. Raises `SystemCallError` on error.

    f = File.new("out", "w")
    f.syswrite("ABCDEF")   #=> 6


# IO#tell

(from ruby core)
---
    ios.tell    -> integer

---

Returns the current offset (in bytes) of *ios*.

    f = File.new("testfile")
    f.pos    #=> 0
    f.gets   #=> "This is line one\n"
    f.pos    #=> 17


# IO#to_i

(from ruby core)
---
    to_i()

---


# IO#to_io

(from ruby core)
---
    ios.to_io  ->  ios

---

Returns *ios*.


# IO#tty?

(from ruby core)
---
    ios.tty?     -> true or false

---

Returns `true` if *ios* is associated with a terminal device (tty), `false`
otherwise.

    File.new("testfile").isatty   #=> false
    File.new("/dev/tty").isatty   #=> true


# IO#ungetbyte

(from ruby core)
---
    ios.ungetbyte(string)   -> nil
    ios.ungetbyte(integer)   -> nil

---

Pushes back bytes (passed as a parameter) onto *ios*, such that a subsequent
buffered read will return it. Only one byte may be pushed back before a
subsequent read operation (that is, you will be able to read only the last of
several bytes that have been pushed back). Has no effect with unbuffered reads
(such as `IO#sysread`).

    f = File.new("testfile")   #=> #<File:testfile>
    b = f.getbyte              #=> 0x38
    f.ungetbyte(b)             #=> nil
    f.getbyte                  #=> 0x38


# IO#ungetc

(from ruby core)
---
    ios.ungetc(string)   -> nil

---

Pushes back one character (passed as a parameter) onto *ios*, such that a
subsequent buffered character read will return it. Only one character may be
pushed back before a subsequent read operation (that is, you will be able to
read only the last of several characters that have been pushed back). Has no
effect with unbuffered reads (such as `IO#sysread`).

    f = File.new("testfile")   #=> #<File:testfile>
    c = f.getc                 #=> "8"
    f.ungetc(c)                #=> nil
    f.getc                     #=> "8"


# IO#wait

(from ruby core)
---
    io.wait(timeout = nil, mode = :read) -> IO, true or nil

---

Waits until IO is readable or writable without blocking and returns `self`, or
`nil` when times out. Returns `true` immediately when buffered data is
available. Optional parameter `mode` is one of `:read`, `:write`, or
`:read_write`.


# IO#wait_readable

(from ruby core)
---
    io.wait_readable          -> IO, true or nil
    io.wait_readable(timeout) -> IO, true or nil

---

Waits until IO is readable without blocking and returns `self`, or `nil` when
times out. Returns `true` immediately when buffered data is available.


# IO#wait_writable

(from ruby core)
---
    io.wait_writable          -> IO
    io.wait_writable(timeout) -> IO or nil

---

Waits until IO is writable without blocking and returns `self` or `nil` when
times out.


# IO#winsize

(from ruby core)
---
    io.winsize     -> [rows, columns]

---

Returns console size.

You must require 'io/console' to use this method.


# IO#winsize=

(from ruby core)
---
    io.winsize = [rows, columns]

---

Tries to set console size.  The effect depends on the platform and the running
environment.

You must require 'io/console' to use this method.


# IO#write

(from ruby core)
---
    ios.write(string)    -> integer

---

Writes the given string to *ios*. The stream must be opened for writing. If
the argument is not a string, it will be converted to a string using `to_s`.
Returns the number of bytes written.

    count = $stdout.write("This is a test\n")
    puts "That was #{count} bytes of data"

*produces:*

    This is a test
    That was 15 bytes of data


# IO#write_nonblock

(from ruby core)
---
    ios.write_nonblock(string)   -> integer
    ios.write_nonblock(string [, options])   -> integer

---

Writes the given string to *ios* using the write(2) system call after
O_NONBLOCK is set for the underlying file descriptor.

It returns the number of bytes written.

write_nonblock just calls the write(2) system call. It causes all errors the
write(2) system call causes: Errno::EWOULDBLOCK, Errno::EINTR, etc. The result
may also be smaller than string.length (partial write). The caller should care
such errors and partial write.

If the exception is Errno::EWOULDBLOCK or Errno::EAGAIN, it is extended by
IO::WaitWritable. So IO::WaitWritable can be used to rescue the exceptions for
retrying write_nonblock.

    # Creates a pipe.
    r, w = IO.pipe

    # write_nonblock writes only 65536 bytes and return 65536.
    # (The pipe size is 65536 bytes on this environment.)
    s = "a" * 100000
    p w.write_nonblock(s)     #=> 65536

    # write_nonblock cannot write a byte and raise EWOULDBLOCK (EAGAIN).
    p w.write_nonblock("b")   # Resource temporarily unavailable (Errno::EAGAIN)

If the write buffer is not empty, it is flushed at first.

When write_nonblock raises an exception kind of IO::WaitWritable,
write_nonblock should not be called until io is writable for avoiding busy
loop. This can be done as follows.

    begin
      result = io.write_nonblock(string)
    rescue IO::WaitWritable, Errno::EINTR
      IO.select(nil, [io])
      retry
    end

Note that this doesn't guarantee to write all data in string. The length
written is reported as result and it should be checked later.

On some platforms such as Windows, write_nonblock is not supported according
to the kind of the IO object. In such cases, write_nonblock raises
`Errno::EBADF`.

By specifying `exception: false`, the options hash allows you to indicate that
write_nonblock should not raise an IO::WaitWritable exception, but return the
symbol :wait_writable instead.


# IO#block_scanf

(from ruby core)
---
    block_scanf(str) { |current| ... }

---


# IO#soak_up_spaces

(from ruby core)
---
    soak_up_spaces()

---


(from gem postgres-pr-0.7.0)
---
# Instance methods:

    read_exactly_n_bytes

# IO#read_exactly_n_bytes

(from gem postgres-pr-0.7.0)
---
    read_exactly_n_bytes(n)

---


---
Also found in:
    gem bundler-1.15.3
    gem puma-3.9.1
    gem thor-0.19.4

