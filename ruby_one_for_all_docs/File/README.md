# File < IO

(from ruby core)
---
A `File` is an abstraction of any file object accessible by the program and is
closely associated with class `IO`. `File` includes the methods of module
`FileTest` as class methods, allowing you to write (for example)
`File.exist?("foo")`.

In the description of File methods, *permission bits* are a platform-specific
set of bits that indicate permissions of a file. On Unix-based systems,
permissions are viewed as a set of three octets, for the owner, the group, and
the rest of the world. For each of these entities, permissions may be set to
read, write, or execute the file:

The permission bits `0644` (in octal) would thus be interpreted as read/write
for owner, and read-only for group and other. Higher-order bits may also be
used to indicate the type of file (plain, directory, pipe, socket, and so on)
and various other special features. If the permissions are for a directory,
the meaning of the execute bit changes; when set the directory can be
searched.

On non-Posix operating systems, there may be only the ability to make a file
read-only or read-write. In this case, the remaining permission bits will be
synthesized to resemble typical values. For instance, on Windows NT the
default permission bits are `0644`, which means read/write for owner,
read-only for all others. The only change that can be made is to make the file
read-only, which is reported as `0444`.

Various constants for the methods in File can be found in File::Constants.
---
# Constants:

ALT_SEPARATOR
:   platform specific alternative separator

PATH_SEPARATOR
:   path list separator

SEPARATOR
:   [not documented]
Separator
:   separates directory parts in path



# Class methods:

    absolute_path
    atime
    basename
    birthtime
    blockdev?
    chardev?
    chmod
    chown
    ctime
    delete
    directory?
    dirname
    empty?
    executable?
    executable_real?
    exist?
    exists?
    expand_path
    extname
    file?
    fnmatch
    fnmatch?
    ftype
    grpowned?
    identical?
    join
    lchmod
    lchown
    link
    lstat
    mkfifo
    mtime
    new
    open
    owned?
    path
    pipe?
    readable?
    readable_real?
    readlink
    realdirpath
    realpath
    rename
    setgid?
    setuid?
    size
    size?
    socket?
    split
    stat
    sticky?
    symlink
    symlink?
    truncate
    umask
    unlink
    utime
    world_readable?
    world_writable?
    writable?
    writable_real?
    zero?

# Instance methods:

    atime
    birthtime
    chmod
    chown
    ctime
    flock
    lstat
    mtime
    path
    size
    to_path
    truncate

# File::absolute_path

(from ruby core)
---
    File.absolute_path(file_name [, dir_string] )  ->  abs_file_name

---

Converts a pathname to an absolute pathname. Relative paths are referenced
from the current working directory of the process unless *dir_string* is
given, in which case it will be used as the starting point. If the given
pathname starts with a ```~`'' it is NOT expanded, it is treated as a normal
directory name.

    File.absolute_path("~oracle/bin")       #=> "<relative_path>/~oracle/bin"


# File::atime

(from ruby core)
---
    File.atime(file_name)  ->  time

---

Returns the last access time for the named file as a Time object).

*file_name* can be an IO object.

    File.atime("testfile")   #=> Wed Apr 09 08:51:48 CDT 2003


# File::basename

(from ruby core)
---
    File.basename(file_name [, suffix] )  ->  base_name

---

Returns the last component of the filename given in *file_name*, which can be
formed using both `File::SEPARATOR` and `File::ALT_SEPARATOR` as the separator
when `File::ALT_SEPARATOR` is not `nil`. If *suffix* is given and present at
the end of *file_name*, it is removed. If *suffix* is ".*", any extension will
be removed.

    File.basename("/home/gumby/work/ruby.rb")          #=> "ruby.rb"
    File.basename("/home/gumby/work/ruby.rb", ".rb")   #=> "ruby"
    File.basename("/home/gumby/work/ruby.rb", ".*")    #=> "ruby"


# File::birthtime

(from ruby core)
---
    File.birthtime(file_name)  -> time

---

Returns the birth time for the named file.

*file_name* can be an IO object.

    File.birthtime("testfile")   #=> Wed Apr 09 08:53:13 CDT 2003

If the platform doesn't have birthtime, raises NotImplementedError.


# File::blockdev?

(from ruby core)
---
    File.blockdev?(file_name)   ->  true or false

---

Returns `true` if the named file is a block device.

*file_name* can be an IO object.


# File::chardev?

(from ruby core)
---
    File.chardev?(file_name)   ->  true or false

---

Returns `true` if the named file is a character device.

*file_name* can be an IO object.


# File::chmod

(from ruby core)
---
    File.chmod(mode_int, file_name, ... )  ->  integer

---

Changes permission bits on the named file(s) to the bit pattern represented by
*mode_int*. Actual effects are operating system dependent (see the beginning
of this section). On Unix systems, see `chmod(2)` for details. Returns the
number of files processed.

    File.chmod(0644, "testfile", "out")   #=> 2


# File::chown

(from ruby core)
---
    File.chown(owner_int, group_int, file_name,... )  ->  integer

---

Changes the owner and group of the named file(s) to the given numeric owner
and group id's. Only a process with superuser privileges may change the owner
of a file. The current owner of a file may change the file's group to any
group to which the owner belongs. A `nil` or -1 owner or group id is ignored.
Returns the number of files processed.

    File.chown(nil, 100, "testfile")


# File::ctime

(from ruby core)
---
    File.ctime(file_name)  -> time

---

Returns the change time for the named file (the time at which directory
information about the file was changed, not the file itself).

*file_name* can be an IO object.

Note that on Windows (NTFS), returns creation time (birth time).

    File.ctime("testfile")   #=> Wed Apr 09 08:53:13 CDT 2003


# File::delete

(from ruby core)
---
    File.delete(file_name, ...)  -> integer

---

Deletes the named files, returning the number of names passed as arguments.
Raises an exception on any error. See also `Dir::rmdir`.


# File::directory?

(from ruby core)
---
    File.directory?(file_name)   ->  true or false

---

Returns `true` if the named file is a directory, or a symlink that points at a
directory, and `false` otherwise.

*file_name* can be an IO object.

    File.directory?(".")


# File::dirname

(from ruby core)
---
    File.dirname(file_name)  ->  dir_name

---

Returns all components of the filename given in *file_name* except the last
one. The filename can be formed using both `File::SEPARATOR` and
`File::ALT_SEPARATOR` as the separator when `File::ALT_SEPARATOR` is not
`nil`.

    File.dirname("/home/gumby/work/ruby.rb")   #=> "/home/gumby/work"


# File::empty?

(from ruby core)
---
    File.zero?(file_name)   -> true or false

---

Returns `true` if the named file exists and has a zero size.

*file_name* can be an IO object.


# File::executable?

(from ruby core)
---
    File.executable?(file_name)   -> true or false

---

Returns `true` if the named file is executable by the effective user and group
id of this process. See eaccess(3).


# File::executable_real?

(from ruby core)
---
    File.executable_real?(file_name)   -> true or false

---

Returns `true` if the named file is executable by the real user and group id
of this process. See access(3).


# File::exist?

(from ruby core)
---
    File.exist?(file_name)    ->  true or false

---

Return `true` if the named file exists.

*file_name* can be an IO object.

"file exists" means that stat() or fstat() system call is successful.


# File::exists?

(from ruby core)
---
    File.exists?(file_name)   ->  true or false

---

Deprecated method. Don't use.


# File::expand_path

(from ruby core)
---
    File.expand_path(file_name [, dir_string] )  ->  abs_file_name

---

Converts a pathname to an absolute pathname. Relative paths are referenced
from the current working directory of the process unless `dir_string` is
given, in which case it will be used as the starting point. The given pathname
may start with a ```~`'', which expands to the process owner's home directory
(the environment variable `HOME` must be set correctly). ```~`*user*'' expands
to the named user's home directory.

    File.expand_path("~oracle/bin")           #=> "/home/oracle/bin"

A simple example of using `dir_string` is as follows.
    File.expand_path("ruby", "/usr/bin")      #=> "/usr/bin/ruby"

A more complex example which also resolves parent directory is as follows.
Suppose we are in bin/mygem and want the absolute path of lib/mygem.rb.

    File.expand_path("../../lib/mygem.rb", __FILE__)
    #=> ".../path/to/project/lib/mygem.rb"

So first it resolves the parent of __FILE__, that is bin/, then go to the
parent, the root of the project and appends `lib/mygem.rb`.


# File::extname

(from ruby core)
---
    File.extname(path)  ->  string

---

Returns the extension (the portion of file name in `path` starting from the
last period).

If `path` is a dotfile, or starts with a period, then the starting dot is not
dealt with the start of the extension.

An empty string will also be returned when the period is the last character in
`path`.

    File.extname("test.rb")         #=> ".rb"
    File.extname("a/b/d/test.rb")   #=> ".rb"
    File.extname(".a/b/d/test.rb")  #=> ".rb"
    File.extname("foo.")            #=> ""
    File.extname("test")            #=> ""
    File.extname(".profile")        #=> ""
    File.extname(".profile.sh")     #=> ".sh"


# File::file?

(from ruby core)
---
    File.file?(file) -> true or false

---

Returns `true` if the named `file` exists and is a regular file.

`file` can be an IO object.

If the `file` argument is a symbolic link, it will resolve the symbolic link
and use the file referenced by the link.


# File::fnmatch

(from ruby core)
---
    File.fnmatch( pattern, path, [flags] ) -> (true or false)
    File.fnmatch?( pattern, path, [flags] ) -> (true or false)

---

Returns true if `path` matches against `pattern`.  The pattern is not a
regular expression; instead it follows rules similar to shell filename
globbing.  It may contain the following metacharacters:

`*`
:   Matches any file. Can be restricted by other values in the glob.
    Equivalent to `/ .* /x` in regexp.

    `*`
:       Matches all files regular files
    `c*`
:       Matches all files beginning with `c`
    `*c`
:       Matches all files ending with `c`
    `*c*`
:       Matches all files that have `c` in them (including at the beginning or
        end).


    To match hidden files (that start with a `.` set the File::FNM_DOTMATCH
    flag.

`**`
:   Matches directories recursively or files expansively.

`?`
:   Matches any one character. Equivalent to `/.{1}/` in regexp.

`[set]`
:   Matches any one character in `set`.  Behaves exactly like character sets
    in Regexp, including set negation (`[^a-z]`).

` \ `
:   Escapes the next metacharacter.

`{a,b}`
:   Matches pattern a and pattern b if File::FNM_EXTGLOB flag is enabled.
    Behaves like a Regexp union (`(?:a|b)`).


`flags` is a bitwise OR of the `FNM_XXX` constants. The same glob pattern and
flags are used by Dir::glob.

Examples:

    File.fnmatch('cat',       'cat')        #=> true  # match entire string
    File.fnmatch('cat',       'category')   #=> false # only match partial string

    File.fnmatch('c{at,ub}s', 'cats')                    #=> false # { } isn't supported by default
    File.fnmatch('c{at,ub}s', 'cats', File::FNM_EXTGLOB) #=> true  # { } is supported on FNM_EXTGLOB

    File.fnmatch('c?t',     'cat')          #=> true  # '?' match only 1 character
    File.fnmatch('c??t',    'cat')          #=> false # ditto
    File.fnmatch('c*',      'cats')         #=> true  # '*' match 0 or more characters
    File.fnmatch('c*t',     'c/a/b/t')      #=> true  # ditto
    File.fnmatch('ca[a-z]', 'cat')          #=> true  # inclusive bracket expression
    File.fnmatch('ca[^t]',  'cat')          #=> false # exclusive bracket expression ('^' or '!')

    File.fnmatch('cat', 'CAT')                     #=> false # case sensitive
    File.fnmatch('cat', 'CAT', File::FNM_CASEFOLD) #=> true  # case insensitive

    File.fnmatch('?',   '/', File::FNM_PATHNAME)  #=> false # wildcard doesn't match '/' on FNM_PATHNAME
    File.fnmatch('*',   '/', File::FNM_PATHNAME)  #=> false # ditto
    File.fnmatch('[/]', '/', File::FNM_PATHNAME)  #=> false # ditto

    File.fnmatch('\?',   '?')                       #=> true  # escaped wildcard becomes ordinary
    File.fnmatch('\a',   'a')                       #=> true  # escaped ordinary remains ordinary
    File.fnmatch('\a',   '\a', File::FNM_NOESCAPE)  #=> true  # FNM_NOESCAPE makes '\' ordinary
    File.fnmatch('[\?]', '?')                       #=> true  # can escape inside bracket expression

    File.fnmatch('*',   '.profile')                      #=> false # wildcard doesn't match leading
    File.fnmatch('*',   '.profile', File::FNM_DOTMATCH)  #=> true  # period by default.
    File.fnmatch('.*',  '.profile')                      #=> true

    rbfiles = '**' '/' '*.rb' # you don't have to do like this. just write in single string.
    File.fnmatch(rbfiles, 'main.rb')                    #=> false
    File.fnmatch(rbfiles, './main.rb')                  #=> false
    File.fnmatch(rbfiles, 'lib/song.rb')                #=> true
    File.fnmatch('**.rb', 'main.rb')                    #=> true
    File.fnmatch('**.rb', './main.rb')                  #=> false
    File.fnmatch('**.rb', 'lib/song.rb')                #=> true
    File.fnmatch('*',           'dave/.profile')                      #=> true

    pattern = '*' '/' '*'
    File.fnmatch(pattern, 'dave/.profile', File::FNM_PATHNAME)  #=> false
    File.fnmatch(pattern, 'dave/.profile', File::FNM_PATHNAME | File::FNM_DOTMATCH) #=> true

    pattern = '**' '/' 'foo'
    File.fnmatch(pattern, 'a/b/c/foo', File::FNM_PATHNAME)     #=> true
    File.fnmatch(pattern, '/a/b/c/foo', File::FNM_PATHNAME)    #=> true
    File.fnmatch(pattern, 'c:/a/b/c/foo', File::FNM_PATHNAME)  #=> true
    File.fnmatch(pattern, 'a/.b/c/foo', File::FNM_PATHNAME)    #=> false
    File.fnmatch(pattern, 'a/.b/c/foo', File::FNM_PATHNAME | File::FNM_DOTMATCH) #=> true


# File::fnmatch?

(from ruby core)
---
    File.fnmatch?( pattern, path, [flags] ) -> (true or false)

---

Returns true if `path` matches against `pattern`.  The pattern is not a
regular expression; instead it follows rules similar to shell filename
globbing.  It may contain the following metacharacters:

`*`
:   Matches any file. Can be restricted by other values in the glob.
    Equivalent to `/ .* /x` in regexp.

    `*`
:       Matches all files regular files
    `c*`
:       Matches all files beginning with `c`
    `*c`
:       Matches all files ending with `c`
    `*c*`
:       Matches all files that have `c` in them (including at the beginning or
        end).


    To match hidden files (that start with a `.` set the File::FNM_DOTMATCH
    flag.

`**`
:   Matches directories recursively or files expansively.

`?`
:   Matches any one character. Equivalent to `/.{1}/` in regexp.

`[set]`
:   Matches any one character in `set`.  Behaves exactly like character sets
    in Regexp, including set negation (`[^a-z]`).

` \ `
:   Escapes the next metacharacter.

`{a,b}`
:   Matches pattern a and pattern b if File::FNM_EXTGLOB flag is enabled.
    Behaves like a Regexp union (`(?:a|b)`).


`flags` is a bitwise OR of the `FNM_XXX` constants. The same glob pattern and
flags are used by Dir::glob.

Examples:

    File.fnmatch('cat',       'cat')        #=> true  # match entire string
    File.fnmatch('cat',       'category')   #=> false # only match partial string

    File.fnmatch('c{at,ub}s', 'cats')                    #=> false # { } isn't supported by default
    File.fnmatch('c{at,ub}s', 'cats', File::FNM_EXTGLOB) #=> true  # { } is supported on FNM_EXTGLOB

    File.fnmatch('c?t',     'cat')          #=> true  # '?' match only 1 character
    File.fnmatch('c??t',    'cat')          #=> false # ditto
    File.fnmatch('c*',      'cats')         #=> true  # '*' match 0 or more characters
    File.fnmatch('c*t',     'c/a/b/t')      #=> true  # ditto
    File.fnmatch('ca[a-z]', 'cat')          #=> true  # inclusive bracket expression
    File.fnmatch('ca[^t]',  'cat')          #=> false # exclusive bracket expression ('^' or '!')

    File.fnmatch('cat', 'CAT')                     #=> false # case sensitive
    File.fnmatch('cat', 'CAT', File::FNM_CASEFOLD) #=> true  # case insensitive

    File.fnmatch('?',   '/', File::FNM_PATHNAME)  #=> false # wildcard doesn't match '/' on FNM_PATHNAME
    File.fnmatch('*',   '/', File::FNM_PATHNAME)  #=> false # ditto
    File.fnmatch('[/]', '/', File::FNM_PATHNAME)  #=> false # ditto

    File.fnmatch('\?',   '?')                       #=> true  # escaped wildcard becomes ordinary
    File.fnmatch('\a',   'a')                       #=> true  # escaped ordinary remains ordinary
    File.fnmatch('\a',   '\a', File::FNM_NOESCAPE)  #=> true  # FNM_NOESCAPE makes '\' ordinary
    File.fnmatch('[\?]', '?')                       #=> true  # can escape inside bracket expression

    File.fnmatch('*',   '.profile')                      #=> false # wildcard doesn't match leading
    File.fnmatch('*',   '.profile', File::FNM_DOTMATCH)  #=> true  # period by default.
    File.fnmatch('.*',  '.profile')                      #=> true

    rbfiles = '**' '/' '*.rb' # you don't have to do like this. just write in single string.
    File.fnmatch(rbfiles, 'main.rb')                    #=> false
    File.fnmatch(rbfiles, './main.rb')                  #=> false
    File.fnmatch(rbfiles, 'lib/song.rb')                #=> true
    File.fnmatch('**.rb', 'main.rb')                    #=> true
    File.fnmatch('**.rb', './main.rb')                  #=> false
    File.fnmatch('**.rb', 'lib/song.rb')                #=> true
    File.fnmatch('*',           'dave/.profile')                      #=> true

    pattern = '*' '/' '*'
    File.fnmatch(pattern, 'dave/.profile', File::FNM_PATHNAME)  #=> false
    File.fnmatch(pattern, 'dave/.profile', File::FNM_PATHNAME | File::FNM_DOTMATCH) #=> true

    pattern = '**' '/' 'foo'
    File.fnmatch(pattern, 'a/b/c/foo', File::FNM_PATHNAME)     #=> true
    File.fnmatch(pattern, '/a/b/c/foo', File::FNM_PATHNAME)    #=> true
    File.fnmatch(pattern, 'c:/a/b/c/foo', File::FNM_PATHNAME)  #=> true
    File.fnmatch(pattern, 'a/.b/c/foo', File::FNM_PATHNAME)    #=> false
    File.fnmatch(pattern, 'a/.b/c/foo', File::FNM_PATHNAME | File::FNM_DOTMATCH) #=> true


# File::ftype

(from ruby core)
---
    File.ftype(file_name)   -> string

---

Identifies the type of the named file; the return string is one of ```file`'',
```directory`'', ```characterSpecial`'', ```blockSpecial`'', ```fifo`'',
```link`'', ```socket`'', or ```unknown`''.

    File.ftype("testfile")            #=> "file"
    File.ftype("/dev/tty")            #=> "characterSpecial"
    File.ftype("/tmp/.X11-unix/X0")   #=> "socket"


# File::grpowned?

(from ruby core)
---
    File.grpowned?(file_name)   -> true or false

---

Returns `true` if the named file exists and the effective group id of the
calling process is the owner of the file. Returns `false` on Windows.

*file_name* can be an IO object.


# File::identical?

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


# File::join

(from ruby core)
---
    File.join(string, ...)  ->  string

---

Returns a new string formed by joining the strings using `File::SEPARATOR`.

    File.join("usr", "mail", "gumby")   #=> "usr/mail/gumby"


# File::lchmod

(from ruby core)
---
    File.lchmod(mode_int, file_name, ...)  -> integer

---

Equivalent to `File::chmod`, but does not follow symbolic links (so it will
change the permissions associated with the link, not the file referenced by
the link). Often not available.


# File::lchown

(from ruby core)
---
    File.lchown(owner_int, group_int, file_name,..) -> integer

---

Equivalent to `File::chown`, but does not follow symbolic links (so it will
change the owner associated with the link, not the file referenced by the
link). Often not available. Returns number of files in the argument list.


# File::link

(from ruby core)
---
    File.link(old_name, new_name)    -> 0

---

Creates a new name for an existing file using a hard link. Will not overwrite
*new_name* if it already exists (raising a subclass of `SystemCallError`). Not
available on all platforms.

    File.link("testfile", ".testfile")   #=> 0
    IO.readlines(".testfile")[0]         #=> "This is line one\n"


# File::lstat

(from ruby core)
---
    File.lstat(file_name)   -> stat

---

Same as `File::stat`, but does not follow the last symbolic link. Instead,
reports on the link itself.

    File.symlink("testfile", "link2test")   #=> 0
    File.stat("testfile").size              #=> 66
    File.lstat("link2test").size            #=> 8
    File.stat("link2test").size             #=> 66


# File::mkfifo

(from ruby core)
---
    mkfifo(*args)

---


# File::mtime

(from ruby core)
---
    File.mtime(file_name)  ->  time

---

Returns the modification time for the named file as a Time object.

*file_name* can be an IO object.

    File.mtime("testfile")   #=> Tue Apr 08 12:58:04 CDT 2003


# File::new

(from ruby core)
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


# File::open

(from ruby core)
---
    File.open(filename, mode="r" [, opt])                 -> file
    File.open(filename [, mode [, perm]] [, opt])         -> file
    File.open(filename, mode="r" [, opt]) {|file| block } -> obj
    File.open(filename [, mode [, perm]] [, opt]) {|file| block } -> obj

---

With no associated block, `File.open` is a synonym for File.new. If the
optional code block is given, it will be passed the opened `file` as an
argument and the File object will automatically be closed when the block
terminates.  The value of the block will be returned from `File.open`.

If a file is being created, its initial permissions may be set using the
`perm` parameter.  See File.new for further discussion.

See IO.new for a description of the `mode` and `opt` parameters.


# File::owned?

(from ruby core)
---
    File.owned?(file_name)   -> true or false

---

Returns `true` if the named file exists and the effective used id of the
calling process is the owner of the file.

*file_name* can be an IO object.


# File::path

(from ruby core)
---
    File.path(path)  ->  string

---

Returns the string representation of the path

    File.path("/dev/null")          #=> "/dev/null"
    File.path(Pathname.new("/tmp")) #=> "/tmp"


# File::pipe?

(from ruby core)
---
    File.pipe?(file_name)   ->  true or false

---

Returns `true` if the named file is a pipe.

*file_name* can be an IO object.


# File::readable?

(from ruby core)
---
    File.readable?(file_name)   -> true or false

---

Returns `true` if the named file is readable by the effective user and group
id of this process. See eaccess(3).


# File::readable_real?

(from ruby core)
---
    File.readable_real?(file_name)   -> true or false

---

Returns `true` if the named file is readable by the real user and group id of
this process. See access(3).


# File::readlink

(from ruby core)
---
    File.readlink(link_name)  ->  file_name

---

Returns the name of the file referenced by the given link. Not available on
all platforms.

    File.symlink("testfile", "link2test")   #=> 0
    File.readlink("link2test")              #=> "testfile"


# File::realdirpath

(from ruby core)
---
    File.realdirpath(pathname [, dir_string])  ->  real_pathname

---

Returns the real (absolute) pathname of *pathname* in the actual filesystem.
The real pathname doesn't contain symlinks or useless dots.

If *dir_string* is given, it is used as a base directory for interpreting
relative pathname instead of the current directory.

The last component of the real pathname can be nonexistent.


# File::realpath

(from ruby core)
---
    File.realpath(pathname [, dir_string])  ->  real_pathname

---

Returns the real (absolute) pathname of *pathname* in the actual filesystem
not containing symlinks or useless dots.

If *dir_string* is given, it is used as a base directory for interpreting
relative pathname instead of the current directory.

All components of the pathname must exist when this method is called.


# File::rename

(from ruby core)
---
    File.rename(old_name, new_name)   -> 0

---

Renames the given file to the new name. Raises a `SystemCallError` if the file
cannot be renamed.

    File.rename("afile", "afile.bak")   #=> 0


# File::setgid?

(from ruby core)
---
    File.setgid?(file_name)   ->  true or false

---

Returns `true` if the named file has the setgid bit set.


# File::setuid?

(from ruby core)
---
    File.setuid?(file_name)   ->  true or false

---

Returns `true` if the named file has the setuid bit set.


# File::size

(from ruby core)
---
    File.size(file_name)   -> integer

---

Returns the size of `file_name`.

*file_name* can be an IO object.


# File::size?

(from ruby core)
---
    File.size?(file_name)   -> Integer or nil

---

Returns `nil` if `file_name` doesn't exist or has zero size, the size of the
file otherwise.

*file_name* can be an IO object.


# File::socket?

(from ruby core)
---
    File.socket?(file_name)   ->  true or false

---

Returns `true` if the named file is a socket.

*file_name* can be an IO object.


# File::split

(from ruby core)
---
    File.split(file_name)   -> array

---

Splits the given string into a directory and a file component and returns them
in a two-element array. See also `File::dirname` and `File::basename`.

    File.split("/home/gumby/.profile")   #=> ["/home/gumby", ".profile"]


# File::stat

(from ruby core)
---
    File.stat(file_name)   ->  stat

---

Returns a `File::Stat` object for the named file (see `File::Stat`).

    File.stat("testfile").mtime   #=> Tue Apr 08 12:58:04 CDT 2003


# File::sticky?

(from ruby core)
---
    File.sticky?(file_name)   ->  true or false

---

Returns `true` if the named file has the sticky bit set.


# File::symlink

(from ruby core)
---
    File.symlink(old_name, new_name)   -> 0

---

Creates a symbolic link called *new_name* for the existing file *old_name*.
Raises a `NotImplemented` exception on platforms that do not support symbolic
links.

    File.symlink("testfile", "link2test")   #=> 0


# File::symlink?

(from ruby core)
---
    File.symlink?(file_name)   ->  true or false

---

Returns `true` if the named file is a symbolic link.


# File::truncate

(from ruby core)
---
    File.truncate(file_name, integer)  -> 0

---

Truncates the file *file_name* to be at most *integer* bytes long. Not
available on all platforms.

    f = File.new("out", "w")
    f.write("1234567890")     #=> 10
    f.close                   #=> nil
    File.truncate("out", 5)   #=> 0
    File.size("out")          #=> 5


# File::umask

(from ruby core)
---
    File.umask()          -> integer
    File.umask(integer)   -> integer

---

Returns the current umask value for this process. If the optional argument is
given, set the umask to that value and return the previous value. Umask values
are *subtracted* from the default permissions, so a umask of `0222` would make
a file read-only for everyone.

    File.umask(0006)   #=> 18
    File.umask         #=> 6


# File::unlink

(from ruby core)
---
    File.unlink(file_name, ...)  -> integer

---

Deletes the named files, returning the number of names passed as arguments.
Raises an exception on any error. See also `Dir::rmdir`.


# File::utime

(from ruby core)
---
    File.utime(atime, mtime, file_name,...)   ->  integer

---

Sets the access and modification times of each named file to the first two
arguments. Returns the number of file names in the argument list.


# File::world_readable?

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


# File::world_writable?

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


# File::writable?

(from ruby core)
---
    File.writable?(file_name)   -> true or false

---

Returns `true` if the named file is writable by the effective user and group
id of this process. See eaccess(3).


# File::writable_real?

(from ruby core)
---
    File.writable_real?(file_name)   -> true or false

---

Returns `true` if the named file is writable by the real user and group id of
this process. See access(3)


# File::zero?

(from ruby core)
---
    File.zero?(file_name)   -> true or false

---

Returns `true` if the named file exists and has a zero size.

*file_name* can be an IO object.


# File#atime

(from ruby core)
---
    file.atime    -> time

---

Returns the last access time (a `Time` object)
    for <i>file</i>, or epoch if <i>file</i> has not been accessed.

      File.new("testfile").atime   #=> Wed Dec 31 18:00:00 CST 1969


# File#birthtime

(from ruby core)
---
    file.birthtime  ->  time

---

Returns the birth time for *file*.

    File.new("testfile").birthtime   #=> Wed Apr 09 08:53:14 CDT 2003

If the platform doesn't have birthtime, raises NotImplementedError.


# File#chmod

(from ruby core)
---
    file.chmod(mode_int)   -> 0

---

Changes permission bits on *file* to the bit pattern represented by
*mode_int*. Actual effects are platform dependent; on Unix systems, see
`chmod(2)` for details. Follows symbolic links. Also see `File#lchmod`.

    f = File.new("out", "w");
    f.chmod(0644)   #=> 0


# File#chown

(from ruby core)
---
    file.chown(owner_int, group_int )   -> 0

---

Changes the owner and group of *file* to the given numeric owner and group
id's. Only a process with superuser privileges may change the owner of a file.
The current owner of a file may change the file's group to any group to which
the owner belongs. A `nil` or -1 owner or group id is ignored. Follows
symbolic links. See also `File#lchown`.

    File.new("testfile").chown(502, 1000)


# File#ctime

(from ruby core)
---
    file.ctime  ->  time

---

Returns the change time for *file* (that is, the time directory information
about the file was changed, not the file itself).

Note that on Windows (NTFS), returns creation time (birth time).

    File.new("testfile").ctime   #=> Wed Apr 09 08:53:14 CDT 2003


# File#flock

(from ruby core)
---
    file.flock(locking_constant) -> 0 or false

---

Locks or unlocks a file according to *locking_constant* (a logical *or* of the
values in the table below). Returns `false` if `File::LOCK_NB` is specified
and the operation would otherwise have blocked. Not available on all
platforms.

Locking constants (in class File):

    LOCK_EX   | Exclusive lock. Only one process may hold an
              | exclusive lock for a given file at a time.
    ----------+------------------------------------------------
    LOCK_NB   | Don't block when locking. May be combined
              | with other lock options using logical or.
    ----------+------------------------------------------------
    LOCK_SH   | Shared lock. Multiple processes may each hold a
              | shared lock for a given file at the same time.
    ----------+------------------------------------------------
    LOCK_UN   | Unlock.

Example:

    # update a counter using write lock
    # don't use "w" because it truncates the file before lock.
    File.open("counter", File::RDWR|File::CREAT, 0644) {|f|
      f.flock(File::LOCK_EX)
      value = f.read.to_i + 1
      f.rewind
      f.write("#{value}\n")
      f.flush
      f.truncate(f.pos)
    }

    # read the counter using read lock
    File.open("counter", "r") {|f|
      f.flock(File::LOCK_SH)
      p f.read
    }


# File#lstat

(from ruby core)
---
    file.lstat   ->  stat

---

Same as `IO#stat`, but does not follow the last symbolic link. Instead,
reports on the link itself.

    File.symlink("testfile", "link2test")   #=> 0
    File.stat("testfile").size              #=> 66
    f = File.new("link2test")
    f.lstat.size                            #=> 8
    f.stat.size                             #=> 66


# File#mtime

(from ruby core)
---
    file.mtime  ->  time

---

Returns the modification time for *file*.

    File.new("testfile").mtime   #=> Wed Apr 09 08:53:14 CDT 2003


# File#path

(from ruby core)
---
    file.path  ->  filename
    file.to_path  ->  filename

---

Returns the pathname used to create *file* as a string. Does not normalize the
name.

    File.new("testfile").path               #=> "testfile"
    File.new("/tmp/../tmp/xxx", "w").path   #=> "/tmp/../tmp/xxx"


# File#size

(from ruby core)
---
    file.size    -> integer

---

Returns the size of *file* in bytes.

    File.new("testfile").size   #=> 66


# File#to_path

(from ruby core)
---
    file.to_path  ->  filename

---

Returns the pathname used to create *file* as a string. Does not normalize the
name.

    File.new("testfile").path               #=> "testfile"
    File.new("/tmp/../tmp/xxx", "w").path   #=> "/tmp/../tmp/xxx"


# File#truncate

(from ruby core)
---
    file.truncate(integer)    -> 0

---

Truncates *file* to at most *integer* bytes. The file must be opened for
writing. Not available on all platforms.

    f = File.new("out", "w")
    f.syswrite("1234567890")   #=> 10
    f.truncate(5)              #=> 0
    f.close()                  #=> nil
    File.size("out")           #=> 5


(from gem activesupport-5.1.2)
---
# Class methods:

    atomic_write

# File::atomic_write

(from gem activesupport-5.1.2)
---
    atomic_write(file_name, temp_dir = dirname(file_name)) { |temp_file| ... }

---

Write to a file atomically. Useful for situations where you don't want other
processes or threads to see half-written files.

    File.atomic_write('important.file') do |file|
      file.write('hello')
    end

This method needs to create a temporary file. By default it will create it in
the same directory as the destination file. If you don't like this behavior
you can provide a different directory but it must be on the same physical
filesystem as the file you're trying to write.

    File.atomic_write('/data/something.important', '/data/tmp') do |file|
      file.write('hello')
    end


(from gem yard-0.9.9)
---
# Constants:

RELATIVE_PARENTDIR
:   [not documented]
RELATIVE_SAMEDIR
:   [not documented]


# Class methods:

    cleanpath
    open!
    read_binary
    relative_path

# File::cleanpath

(from gem yard-0.9.9)
---
    cleanpath(path)

---

Cleans a path by removing extraneous '..', '.' and '/' characters

@example Clean a path
    File.cleanpath('a/b//./c/../e') # => "a/b/e"

@param [String] path the path to clean @return [String] the sanitized path


# File::open!

(from gem yard-0.9.9)
---
    open!(file, *args, &block)

---

Forces opening a file (for writing) by first creating the file's directory
@param [String] file the filename to open @since 0.5.2


# File::read_binary

(from gem yard-0.9.9)
---
    read_binary(file)

---

Reads a file with binary encoding @return [String] the ascii-8bit encoded data
@since 0.5.3


# File::relative_path

(from gem yard-0.9.9)
---
    relative_path(from, to)

---

Turns a path `to` into a relative path from starting point `from`. The
argument `from` is assumed to be a filename. To treat it as a directory, make
sure it ends in `File::SEPARATOR` ('/' on UNIX filesystems).

@param [String] from the starting filename
    (or directory with +from_isdir+ set to +true+).

@param [String] to the final path that should be made relative. @return
[String] the relative path from `from` to `to`.


---
Also found in:
    gem pg-0.21.0

