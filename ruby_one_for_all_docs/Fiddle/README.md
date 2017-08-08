# Fiddle

(from ruby core)
---

A libffi wrapper for Ruby.

## Description

Fiddle is an extension to translate a foreign function interface (FFI) with
ruby.

It wraps [libffi](http://sourceware.org/libffi/), a popular C library which
provides a portable interface that allows code written in one language to call
code written in another language.

## Example

Here we will use Fiddle::Function to wrap [floor(3) from
libm](http://linux.die.net/man/3/floor)

    require 'fiddle'

    libm = Fiddle.dlopen('/lib/libm.so.6')

    floor = Fiddle::Function.new(
      libm['floor'],
      [Fiddle::TYPE_DOUBLE],
      Fiddle::TYPE_DOUBLE
    )

    puts floor.call(3.14159) #=> 3.0









---
# Constants:

ALIGN_CHAR
:   ALIGN_CHAR

    The alignment size of a char
ALIGN_DOUBLE
:   ALIGN_DOUBLE

    The alignment size of a double
ALIGN_FLOAT
:   ALIGN_FLOAT

    The alignment size of a float
ALIGN_INT
:   ALIGN_INT

    The alignment size of an int
ALIGN_INTPTR_T
:   ALIGN_INTPTR_T

    The alignment size of a intptr_t
ALIGN_LONG
:   ALIGN_LONG

    The alignment size of a long
ALIGN_LONG_LONG
:   ALIGN_LONG_LONG

    The alignment size of a long long
ALIGN_PTRDIFF_T
:   ALIGN_PTRDIFF_T

    The alignment size of a ptrdiff_t
ALIGN_SHORT
:   ALIGN_SHORT

    The alignment size of a short
ALIGN_SIZE_T
:   ALIGN_SIZE_T

    The alignment size of a size_t
ALIGN_SSIZE_T
:   ALIGN_SSIZE_T

    The alignment size of a ssize_t
ALIGN_UINTPTR_T
:   ALIGN_UINTPTR_T

    The alignment size of a uintptr_t
ALIGN_VOIDP
:   ALIGN_VOIDP

    The alignment size of a void*
BUILD_RUBY_PLATFORM
:   BUILD_RUBY_PLATFORM

    Platform built against (i.e. "x86_64-linux", etc.)

    See also RUBY_PLATFORM
RUBY_FREE
:   RUBY_FREE

    Address of the ruby_xfree() function
SIZEOF_CHAR
:   SIZEOF_CHAR

    size of a char
SIZEOF_DOUBLE
:   SIZEOF_DOUBLE

    size of a double
SIZEOF_FLOAT
:   SIZEOF_FLOAT

    size of a float
SIZEOF_INT
:   SIZEOF_INT

    size of an int
SIZEOF_INTPTR_T
:   SIZEOF_INTPTR_T

    size of a intptr_t
SIZEOF_LONG
:   SIZEOF_LONG

    size of a long
SIZEOF_LONG_LONG
:   SIZEOF_LONG_LONG

    size of a long long
SIZEOF_PTRDIFF_T
:   SIZEOF_PTRDIFF_T

    size of a ptrdiff_t
SIZEOF_SHORT
:   SIZEOF_SHORT

    size of a short
SIZEOF_SIZE_T
:   SIZEOF_SIZE_T

    size of a size_t
SIZEOF_SSIZE_T
:   SIZEOF_SSIZE_T

    size of a ssize_t
SIZEOF_UINTPTR_T
:   SIZEOF_UINTPTR_T

    size of a uintptr_t
SIZEOF_VOIDP
:   SIZEOF_VOIDP

    size of a void*
TYPE_CHAR
:   TYPE_CHAR

    C type - char
TYPE_DOUBLE
:   TYPE_DOUBLE

    C type - double
TYPE_FLOAT
:   TYPE_FLOAT

    C type - float
TYPE_INT
:   TYPE_INT

    C type - int
TYPE_INTPTR_T
:   TYPE_INTPTR_T

    C type - intptr_t
TYPE_LONG
:   TYPE_LONG

    C type - long
TYPE_LONG_LONG
:   TYPE_LONG_LONG

    C type - long long
TYPE_PTRDIFF_T
:   TYPE_PTRDIFF_T

    C type - ptrdiff_t
TYPE_SHORT
:   TYPE_SHORT

    C type - short
TYPE_SIZE_T
:   TYPE_SIZE_T

    C type - size_t
TYPE_SSIZE_T
:   TYPE_SSIZE_T

    C type - ssize_t
TYPE_UINTPTR_T
:   TYPE_UINTPTR_T

    C type - uintptr_t
TYPE_VOID
:   TYPE_VOID

    C type - void
TYPE_VOIDP
:   TYPE_VOIDP

    C type - void*
WINDOWS
:   Returns a boolean regarding whether the host is WIN32


# Class methods:

    dlopen
    dlunwrap
    dlwrap
    free
    last_error
    last_error=
    malloc
    realloc
    win32_last_error
    win32_last_error=

# Instance methods:

    dlopen

# Fiddle::dlopen

(from ruby core)
---
    dlopen(library) => Fiddle::Handle

---

Creates a new handler that opens `library`, and returns an instance of
Fiddle::Handle.

If `nil` is given for the `library`, Fiddle::Handle::DEFAULT is used, which is
the equivalent to RTLD_DEFAULT. See `man 3 dlopen` for more.

    lib = Fiddle.dlopen(nil)

The default is dependent on OS, and provide a handle for all libraries already
loaded. For example, in most cases you can use this to access `libc`
functions, or ruby functions like `rb_str_new`.

See Fiddle::Handle.new for more.


# Fiddle::dlunwrap

(from ruby core)
---
    Fiddle.dlunwrap(addr)

---

Returns the hexadecimal representation of a memory pointer address `addr`

Example:

    lib = Fiddle.dlopen('/lib64/libc-2.15.so')
    => #<Fiddle::Handle:0x00000001342460>

    lib['strcpy'].to_s(16)
    => "7f59de6dd240"

    Fiddle.dlunwrap(Fiddle.dlwrap(lib['strcpy'].to_s(16)))
    => "7f59de6dd240"


# Fiddle::dlwrap

(from ruby core)
---
    Fiddle.dlwrap(val)

---

Returns a memory pointer of a function's hexadecimal address location `val`

Example:

    lib = Fiddle.dlopen('/lib64/libc-2.15.so')
    => #<Fiddle::Handle:0x00000001342460>

    Fiddle.dlwrap(lib['strcpy'].to_s(16))
    => 25522520


# Fiddle::free

(from ruby core)
---
    Fiddle.free(addr)

---

Free the memory at address `addr`


# Fiddle::last_error

(from ruby core)
---
    last_error()

---

Returns the last `Error` of the current executing `Thread` or nil if none


# Fiddle::last_error=

(from ruby core)
---
    last_error=(error)

---

Sets the last `Error` of the current executing `Thread` to `error`


# Fiddle::malloc

(from ruby core)
---
    Fiddle.malloc(size)

---

Allocate `size` bytes of memory and return the integer memory address for the
allocated memory.


# Fiddle::realloc

(from ruby core)
---
    Fiddle.realloc(addr, size)

---

Change the size of the memory allocated at the memory location `addr` to
`size` bytes.  Returns the memory address of the reallocated memory, which may
be different than the address passed in.


# Fiddle::win32_last_error

(from ruby core)
---
    win32_last_error()

---

Returns the last win32 `Error` of the current executing `Thread` or nil if
none


# Fiddle::win32_last_error=

(from ruby core)
---
    win32_last_error=(error)

---

Sets the last win32 `Error` of the current executing `Thread` to `error`


# Fiddle#dlopen

(from ruby core)
---
    dlopen(library) => Fiddle::Handle

---

Creates a new handler that opens `library`, and returns an instance of
Fiddle::Handle.

If `nil` is given for the `library`, Fiddle::Handle::DEFAULT is used, which is
the equivalent to RTLD_DEFAULT. See `man 3 dlopen` for more.

    lib = Fiddle.dlopen(nil)

The default is dependent on OS, and provide a handle for all libraries already
loaded. For example, in most cases you can use this to access `libc`
functions, or ruby functions like `rb_str_new`.

See Fiddle::Handle.new for more.


