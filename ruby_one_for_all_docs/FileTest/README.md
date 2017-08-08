# FileTest

(from ruby core)
---
`FileTest` implements file test operations similar to those used in
`File::Stat`. It exists as a standalone module, and its methods are also
insinuated into the `File` class. (Note that this is not done by inclusion:
the interpreter cheats).
---
# Instance methods:

    blockdev?
    chardev?
    directory?
    empty?
    executable?
    executable_real?
    exist?
    exists?
    file?
    grpowned?
    identical?
    owned?
    pipe?
    readable?
    readable_real?
    setgid?
    setuid?
    size
    size?
    socket?
    sticky?
    symlink?
    world_readable?
    world_writable?
    writable?
    writable_real?
    zero?

# FileTest#blockdev?

(from ruby core)
---
    File.blockdev?(file_name)   ->  true or false

---

Returns `true` if the named file is a block device.

*file_name* can be an IO object.


# FileTest#chardev?

(from ruby core)
---
    File.chardev?(file_name)   ->  true or false

---

Returns `true` if the named file is a character device.

*file_name* can be an IO object.


# FileTest#directory?

(from ruby core)
---
    File.directory?(file_name)   ->  true or false

---

Returns `true` if the named file is a directory, or a symlink that points at a
directory, and `false` otherwise.

*file_name* can be an IO object.

    File.directory?(".")


# FileTest#empty?

(from ruby core)
---
    File.zero?(file_name)   -> true or false

---

Returns `true` if the named file exists and has a zero size.

*file_name* can be an IO object.


# FileTest#executable?

(from ruby core)
---
    File.executable?(file_name)   -> true or false

---

Returns `true` if the named file is executable by the effective user and group
id of this process. See eaccess(3).


# FileTest#executable_real?

(from ruby core)
---
    File.executable_real?(file_name)   -> true or false

---

Returns `true` if the named file is executable by the real user and group id
of this process. See access(3).


# FileTest#exist?

(from ruby core)
---
    File.exist?(file_name)    ->  true or false

---

Return `true` if the named file exists.

*file_name* can be an IO object.

"file exists" means that stat() or fstat() system call is successful.


# FileTest#exists?

(from ruby core)
---
    File.exists?(file_name)   ->  true or false

---

Deprecated method. Don't use.


# FileTest#file?

(from ruby core)
---
    File.file?(file) -> true or false

---

Returns `true` if the named `file` exists and is a regular file.

`file` can be an IO object.

If the `file` argument is a symbolic link, it will resolve the symbolic link
and use the file referenced by the link.


# FileTest#grpowned?

(from ruby core)
---
    File.grpowned?(file_name)   -> true or false

---

Returns `true` if the named file exists and the effective group id of the
calling process is the owner of the file. Returns `false` on Windows.

*file_name* can be an IO object.


# FileTest#identical?

(from ruby core)
---
    File.identical?(file_1, file_2)   ->  true or false

---

Returns `true` if the named files are identical.

*file_1* and *file_2* can be an IO object.

    open("a", "w") {}
    p File.identical?("a", "a")      #=> true
    p File.identical?("a", "./a")    #=> true
    File.link("a", "b")
    p File.identical?("a", "b")      #=> true
    File.symlink("a", "c")
    p File.identical?("a", "c")      #=> true
    open("d", "w") {}
    p File.identical?("a", "d")      #=> false


# FileTest#owned?

(from ruby core)
---
    File.owned?(file_name)   -> true or false

---

Returns `true` if the named file exists and the effective used id of the
calling process is the owner of the file.

*file_name* can be an IO object.


# FileTest#pipe?

(from ruby core)
---
    File.pipe?(file_name)   ->  true or false

---

Returns `true` if the named file is a pipe.

*file_name* can be an IO object.


# FileTest#readable?

(from ruby core)
---
    File.readable?(file_name)   -> true or false

---

Returns `true` if the named file is readable by the effective user and group
id of this process. See eaccess(3).


# FileTest#readable_real?

(from ruby core)
---
    File.readable_real?(file_name)   -> true or false

---

Returns `true` if the named file is readable by the real user and group id of
this process. See access(3).


# FileTest#setgid?

(from ruby core)
---
    File.setgid?(file_name)   ->  true or false

---

Returns `true` if the named file has the setgid bit set.


# FileTest#setuid?

(from ruby core)
---
    File.setuid?(file_name)   ->  true or false

---

Returns `true` if the named file has the setuid bit set.


# FileTest#size

(from ruby core)
---
    File.size(file_name)   -> integer

---

Returns the size of `file_name`.

*file_name* can be an IO object.


# FileTest#size?

(from ruby core)
---
    File.size?(file_name)   -> Integer or nil

---

Returns `nil` if `file_name` doesn't exist or has zero size, the size of the
file otherwise.

*file_name* can be an IO object.


# FileTest#socket?

(from ruby core)
---
    File.socket?(file_name)   ->  true or false

---

Returns `true` if the named file is a socket.

*file_name* can be an IO object.


# FileTest#sticky?

(from ruby core)
---
    File.sticky?(file_name)   ->  true or false

---

Returns `true` if the named file has the sticky bit set.


# FileTest#symlink?

(from ruby core)
---
    File.symlink?(file_name)   ->  true or false

---

Returns `true` if the named file is a symbolic link.


# FileTest#world_readable?

(from ruby core)
---
    File.world_readable?(file_name)   -> integer or nil

---

If *file_name* is readable by others, returns an integer representing the file
permission bits of *file_name*. Returns `nil` otherwise. The meaning of the
bits is platform dependent; on Unix systems, see `stat(2)`.

*file_name* can be an IO object.

    File.world_readable?("/etc/passwd")           #=> 420
    m = File.world_readable?("/etc/passwd")
    sprintf("%o", m)                              #=> "644"


# FileTest#world_writable?

(from ruby core)
---
    File.world_writable?(file_name)   -> integer or nil

---

If *file_name* is writable by others, returns an integer representing the file
permission bits of *file_name*. Returns `nil` otherwise. The meaning of the
bits is platform dependent; on Unix systems, see `stat(2)`.

*file_name* can be an IO object.

    File.world_writable?("/tmp")                  #=> 511
    m = File.world_writable?("/tmp")
    sprintf("%o", m)                              #=> "777"


# FileTest#writable?

(from ruby core)
---
    File.writable?(file_name)   -> true or false

---

Returns `true` if the named file is writable by the effective user and group
id of this process. See eaccess(3).


# FileTest#writable_real?

(from ruby core)
---
    File.writable_real?(file_name)   -> true or false

---

Returns `true` if the named file is writable by the real user and group id of
this process. See access(3)


# FileTest#zero?

(from ruby core)
---
    File.zero?(file_name)   -> true or false

---

Returns `true` if the named file exists and has a zero size.

*file_name* can be an IO object.


