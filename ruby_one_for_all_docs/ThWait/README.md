# ThWait < Object

---
# Extended by:
Exception2MessageMapper (from ruby core)

(from ruby core)
---
This class watches for termination of multiple threads.  Basic functionality
(wait until specified threads have terminated) can be accessed through the
class method ThreadsWait::all_waits.  Finer control can be gained using
instance methods.

Example:

    ThreadsWait.all_waits(thr1, thr2, ...) do |t|
      STDERR.puts "Thread #{t} has terminated."
    end

    th = ThreadsWait.new(thread1,...)
    th.next_wait # next one to be done
---
# Class methods:

    all_waits
    new

# Instance methods:

    all_waits
    empty?
    finished?
    join
    join_nowait
    next_wait
    threads

# Attributes:

    attr_reader threads

# ThWait::all_waits

(from ruby core)
### Implementation from ThreadsWait
---
    all_waits(*threads) { |thread| ... }

---

Waits until all specified threads have terminated.  If a block is provided, it
is executed for each thread as they terminate.


# ThWait::new

(from ruby core)
### Implementation from BasicObject
---
    new()

---

Not documented


(from ruby core)
### Implementation from File
---
    File.new(filename, mode="r" [, opt])            -> file
    File.new(filename [, mode [, perm]] [, opt])    -> file

---

Opens the file named by `filename` according to the given `mode` and returns a
new File object.

See IO.new for a description of `mode` and `opt`.

If a file is being created, permission bits may be given in `perm`.  These
mode and permission bits are platform dependent; on Unix systems, see open(2)
and chmod(2) man pages for details.

### Examples

    f = File.new("testfile", "r")
    f = File.new("newfile",  "w+")
    f = File.new("newfile", File::CREAT|File::TRUNC|File::RDWR, 0644)


(from ruby core)
### Implementation from IO
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


(from ruby core)
### Implementation from ThreadsWait
---
    new(*threads)

---

Creates a ThreadsWait object, specifying the threads to wait on. Non-blocking.


# ThWait#all_waits

(from ruby core)
### Implementation from ThreadsWait
---
    all_waits() { |th| ... }

---

Waits until all of the specified threads are terminated.  If a block is
supplied for the method, it is executed for each thread termination.

Raises exceptions in the same manner as `next_wait`.


# ThWait#empty?

(from ruby core)
### Implementation from ThreadsWait
---
    empty?()

---

Returns `true` if there are no threads in the pool still running.


# ThWait#finished?

(from ruby core)
### Implementation from ThreadsWait
---
    finished?()

---

Returns `true` if any thread has terminated and is ready to be collected.


# ThWait#join

(from ruby core)
### Implementation from ThreadsWait
---
    join(*threads)

---

Waits for specified threads to terminate, and returns when one of the threads
terminated.


# ThWait#join_nowait

(from ruby core)
### Implementation from ThreadsWait
---
    join_nowait(*threads)

---

Specifies the threads that this object will wait for, but does not actually
wait.


# ThWait#next_wait

(from ruby core)
### Implementation from ThreadsWait
---
    next_wait(nonblock = nil)

---

Waits until any of the specified threads has terminated, and returns the one
that does.

If there is no thread to wait, raises `ErrNoWaitingThread`.  If `nonblock` is
true, and there is no terminated thread, raises `ErrNoFinishedThread`.


