# Pathname < Object

(from ruby core)
---

Pathname represents the name of a file or directory on the filesystem, but not
the file itself.

The pathname depends on the Operating System: Unix, Windows, etc. This library
works with pathnames of local OS, however non-Unix pathnames are supported
experimentally.

A Pathname can be relative or absolute.  It's not until you try to reference
the file that it even matters whether the file exists or not.

Pathname is immutable.  It has no method for destructive update.

The goal of this class is to manipulate file path information in a neater way
than standard Ruby provides.  The examples below demonstrate the difference.

**All** functionality from File, FileTest, and some from Dir and FileUtils is
included, in an unsurprising way.  It is essentially a facade for all of
these, and more.

## Examples

### Example 1: Using Pathname

    require 'pathname'
    pn = Pathname.new("/usr/bin/ruby")
    size = pn.size              # 27662
    isdir = pn.directory?       # false
    dir  = pn.dirname           # Pathname:/usr/bin
    base = pn.basename          # Pathname:ruby
    dir, base = pn.split        # [Pathname:/usr/bin, Pathname:ruby]
    data = pn.read
    pn.open { |f| _ }
    pn.each_line { |line| _ }

### Example 2: Using standard Ruby

    pn = "/usr/bin/ruby"
    size = File.size(pn)        # 27662
    isdir = File.directory?(pn) # false
    dir  = File.dirname(pn)     # "/usr/bin"
    base = File.basename(pn)    # "ruby"
    dir, base = File.split(pn)  # ["/usr/bin", "ruby"]
    data = File.read(pn)
    File.open(pn) { |f| _ }
    File.foreach(pn) { |line| _ }

### Example 3: Special features

    p1 = Pathname.new("/usr/lib")   # Pathname:/usr/lib
    p2 = p1 + "ruby/1.8"            # Pathname:/usr/lib/ruby/1.8
    p3 = p1.parent                  # Pathname:/usr
    p4 = p2.relative_path_from(p3)  # Pathname:lib/ruby/1.8
    pwd = Pathname.pwd              # Pathname:/home/gavin
    pwd.absolute?                   # true
    p5 = Pathname.new "."           # Pathname:.
    p5 = p5 + "music/../articles"   # Pathname:music/../articles
    p5.cleanpath                    # Pathname:articles
    p5.realpath                     # Pathname:/home/gavin/articles
    p5.children                     # [Pathname:/home/gavin/articles/linux, ...]

## Breakdown of functionality

### Core methods

These methods are effectively manipulating a String, because that's all a path
is.  None of these access the file system except for #mountpoint?, #children,
#each_child, #realdirpath and #realpath.

*   +
*   #join
*   #parent
*   #root?
*   #absolute?
*   #relative?
*   #relative_path_from
*   #each_filename
*   #cleanpath
*   #realpath
*   #realdirpath
*   #children
*   #each_child
*   #mountpoint?


### File status predicate methods

These methods are a facade for FileTest:
*   #blockdev?
*   #chardev?
*   #directory?
*   #executable?
*   #executable_real?
*   #exist?
*   #file?
*   #grpowned?
*   #owned?
*   #pipe?
*   #readable?
*   #world_readable?
*   #readable_real?
*   #setgid?
*   #setuid?
*   #size
*   #size?
*   #socket?
*   #sticky?
*   #symlink?
*   #writable?
*   #world_writable?
*   #writable_real?
*   #zero?


### File property and manipulation methods

These methods are a facade for File:
*   #atime
*   #birthtime
*   #ctime
*   #mtime
*   #chmod(mode)
*   #lchmod(mode)
*   #chown(owner, group)
*   #lchown(owner, group)
*   #fnmatch(pattern, *args)
*   #fnmatch?(pattern, *args)
*   #ftype
*   #make_link(old)
*   #open(*args, &block)
*   #readlink
*   #rename(to)
*   #stat
*   #lstat
*   #make_symlink(old)
*   #truncate(length)
*   #utime(atime, mtime)
*   #basename(*args)
*   #dirname
*   #extname
*   #expand_path(*args)
*   #split


### Directory methods

These methods are a facade for Dir:
*   Pathname.glob(*args)
*   Pathname.getwd / Pathname.pwd
*   #rmdir
*   #entries
*   #each_entry(&block)
*   #mkdir(*args)
*   #opendir(*args)


### IO

These methods are a facade for IO:
*   #each_line(*args, &block)
*   #read(*args)
*   #binread(*args)
*   #readlines(*args)
*   #sysopen(*args)


### Utilities

These methods are a mixture of Find, FileUtils, and others:
*   #find(&block)
*   #mkpath
*   #rmtree
*   #unlink / #delete


## Method documentation

As the above section shows, most of the methods in Pathname are facades.  The
documentation for these methods generally just says, for instance, "See
FileTest.writable?", as you should be familiar with the original method
anyway, and its documentation (e.g. through `ri`) will contain more
information.  In some cases, a brief description will follow.
---
# Constants:

SAME_PATHS
:   [not documented]
SEPARATOR_LIST
:   [not documented]
SEPARATOR_PAT
:   [not documented]
TO_PATH
:   to_path is implemented so Pathname objects are usable with File.open, etc.


# Class methods:

    getwd
    glob
    new
    pwd

# Instance methods:

    +
    /
    <=>
    ==
    ===
    absolute?
    ascend
    atime
    basename
    binread
    binwrite
    birthtime
    blockdev?
    chardev?
    children
    chmod
    chown
    cleanpath
    ctime
    delete
    descend
    directory?
    dirname
    each_child
    each_entry
    each_filename
    each_line
    empty?
    entries
    eql?
    executable?
    executable_real?
    exist?
    expand_path
    extname
    file?
    find
    fnmatch
    fnmatch?
    freeze
    ftype
    grpowned?
    join
    lchmod
    lchown
    lstat
    make_link
    make_symlink
    mkdir
    mkpath
    mountpoint?
    mtime
    open
    opendir
    owned?
    parent
    pipe?
    read
    readable?
    readable_real?
    readlines
    readlink
    realdirpath
    realpath
    relative?
    relative_path_from
    rename
    rmdir
    rmtree
    root?
    setgid?
    setuid?
    size
    size?
    socket?
    split
    stat
    sticky?
    sub
    sub_ext
    symlink?
    sysopen
    taint
    to_path
    to_s
    truncate
    unlink
    untaint
    utime
    world_readable?
    world_writable?
    writable?
    writable_real?
    write
    zero?

# Pathname::getwd

(from ruby core)
---
    getwd()

---

Returns the current working directory as a Pathname.

    Pathname.getwd
        #=> #<Pathname:/home/zzak/projects/ruby>

See Dir.getwd.


# Pathname::glob

(from ruby core)
---
    glob(p1, p2 = v2)

---

Returns or yields Pathname objects.

    Pathname.glob("config/" "*.rb")
        #=> [#<Pathname:config/environment.rb>, #<Pathname:config/routes.rb>, ..]

See Dir.glob.


# Pathname::new

(from ruby core)
---
    new(p1)

---

Create a Pathname object from the given String (or String-like object). If
`path` contains a NULL character (`\0`), an ArgumentError is raised.


# Pathname::pwd

(from ruby core)
---
    pwd()

---

Returns the current working directory as a Pathname.

    Pathname.getwd
        #=> #<Pathname:/home/zzak/projects/ruby>

See Dir.getwd.


# Pathname#+

(from ruby core)
---
    +(other)

---

Appends a pathname fragment to `self` to produce a new Pathname object.

    p1 = Pathname.new("/usr")      # Pathname:/usr
    p2 = p1 + "bin/ruby"           # Pathname:/usr/bin/ruby
    p3 = p1 + "/etc/passwd"        # Pathname:/etc/passwd

    # / is aliased to +.
    p4 = p1 / "bin/ruby"           # Pathname:/usr/bin/ruby
    p5 = p1 / "/etc/passwd"        # Pathname:/etc/passwd

This method doesn't access the file system; it is pure string manipulation.


# Pathname#/

(from ruby core)
---
    /(other)

---


# Pathname#<=>

(from ruby core)
---
    <=>(p1)

---

Provides a case-sensitive comparison operator for pathnames.

    Pathname.new('/usr') <=> Pathname.new('/usr/bin')
        #=> -1
    Pathname.new('/usr/bin') <=> Pathname.new('/usr/bin')
        #=> 0
    Pathname.new('/usr/bin') <=> Pathname.new('/USR/BIN')
        #=> 1

It will return `-1`, `0` or `1` depending on the value of the left argument
relative to the right argument. Or it will return `nil` if the arguments are
not comparable.


# Pathname#==

(from ruby core)
---
    ==(p1)

---

Compare this pathname with `other`.  The comparison is string-based. Be aware
that two different paths (`foo.txt` and `./foo.txt`) can refer to the same
file.


# Pathname#===

(from ruby core)
---
    ===(p1)

---

Compare this pathname with `other`.  The comparison is string-based. Be aware
that two different paths (`foo.txt` and `./foo.txt`) can refer to the same
file.


# Pathname#absolute?

(from ruby core)
---
    absolute?()

---

Predicate method for testing whether a path is absolute.

It returns `true` if the pathname begins with a slash.

    p = Pathname.new('/im/sure')
    p.absolute?
        #=> true

    p = Pathname.new('not/so/sure')
    p.absolute?
        #=> false


# Pathname#ascend

(from ruby core)
---
    ascend() { |self| ... }

---

Iterates over and yields a new Pathname object for each element in the given
path in ascending order.

    Pathname.new('/path/to/some/file.rb').ascend {|v| p v}
       #<Pathname:/path/to/some/file.rb>
       #<Pathname:/path/to/some>
       #<Pathname:/path/to>
       #<Pathname:/path>
       #<Pathname:/>

    Pathname.new('path/to/some/file.rb').ascend {|v| p v}
       #<Pathname:path/to/some/file.rb>
       #<Pathname:path/to/some>
       #<Pathname:path/to>
       #<Pathname:path>

Returns an Enumerator if no block was given.

    enum = Pathname.new("/usr/bin/ruby").ascend
      # ... do stuff ...
    enum.each { |e| ... }
      # yields Pathnames /usr/bin/ruby, /usr/bin, /usr, and /.

It doesn't access the filesystem.


# Pathname#atime

(from ruby core)
---
    pathname.atime     -> time

---

Returns the last access time for the file.

See File.atime.


# Pathname#basename

(from ruby core)
---
    basename(p1 = v1)

---

Returns the last component of the path.

See File.basename.


# Pathname#binread

(from ruby core)
---
    pathname.binread([length [, offset]]) -> string

---

Returns all the bytes from the file, or the first `N` if specified.

See IO.binread.


# Pathname#binwrite

(from ruby core)
---
    pathname.binwrite(string, [offset] )   => fixnum
    pathname.binwrite(string, [offset], open_args )   => fixnum

---

Writes `contents` to the file, opening it in binary mode.

See IO.binwrite.


# Pathname#birthtime

(from ruby core)
---
    pathname.birthtime -> time

---

Returns the birth time for the file. If the platform doesn't have birthtime,
raises NotImplementedError.

See File.birthtime.


# Pathname#blockdev?

(from ruby core)
---
    blockdev?()

---

See FileTest.blockdev?.


# Pathname#chardev?

(from ruby core)
---
    chardev?()

---

See FileTest.chardev?.


# Pathname#children

(from ruby core)
---
    children(with_directory=true)

---

Returns the children of the directory (files and subdirectories, not
recursive) as an array of Pathname objects.

By default, the returned pathnames will have enough information to access the
files. If you set `with_directory` to `false`, then the returned pathnames
will contain the filename only.

For example:
    pn = Pathname("/usr/lib/ruby/1.8")
    pn.children
        # -> [ Pathname:/usr/lib/ruby/1.8/English.rb,
               Pathname:/usr/lib/ruby/1.8/Env.rb,
               Pathname:/usr/lib/ruby/1.8/abbrev.rb, ... ]
    pn.children(false)
        # -> [ Pathname:English.rb, Pathname:Env.rb, Pathname:abbrev.rb, ... ]

Note that the results never contain the entries `.` and `..` in the directory
because they are not children.


# Pathname#chmod

(from ruby core)
---
    pathname.chmod     -> integer

---

Changes file permissions.

See File.chmod.


# Pathname#chown

(from ruby core)
---
    pathname.chown     -> integer

---

Change owner and group of the file.

See File.chown.


# Pathname#cleanpath

(from ruby core)
---
    cleanpath(consider_symlink=false)

---

Returns clean pathname of `self` with consecutive slashes and useless dots
removed.  The filesystem is not accessed.

If `consider_symlink` is `true`, then a more conservative algorithm is used to
avoid breaking symbolic linkages.  This may retain more `..` entries than
absolutely necessary, but without accessing the filesystem, this can't be
avoided.

See Pathname#realpath.


# Pathname#ctime

(from ruby core)
---
    pathname.ctime     -> time

---

Returns the last change time, using directory information, not the file
itself.

See File.ctime.


# Pathname#delete

(from ruby core)
---
    delete()

---

Removes a file or directory, using File.unlink if `self` is a file, or
Dir.unlink as necessary.


# Pathname#descend

(from ruby core)
---
    descend() { |v| ... }

---

Iterates over and yields a new Pathname object for each element in the given
path in descending order.

    Pathname.new('/path/to/some/file.rb').descend {|v| p v}
       #<Pathname:/>
       #<Pathname:/path>
       #<Pathname:/path/to>
       #<Pathname:/path/to/some>
       #<Pathname:/path/to/some/file.rb>

    Pathname.new('path/to/some/file.rb').descend {|v| p v}
       #<Pathname:path>
       #<Pathname:path/to>
       #<Pathname:path/to/some>
       #<Pathname:path/to/some/file.rb>

Returns an Enumerator if no block was given.

    enum = Pathname.new("/usr/bin/ruby").descend
      # ... do stuff ...
    enum.each { |e| ... }
      # yields Pathnames /, /usr, /usr/bin, and /usr/bin/ruby.

It doesn't access the filesystem.


# Pathname#directory?

(from ruby core)
---
    directory?()

---

See FileTest.directory?.


# Pathname#dirname

(from ruby core)
---
    dirname()

---

Returns all but the last component of the path.

See File.dirname.


# Pathname#each_child

(from ruby core)
---
    each_child(with_directory=true, &b)

---

Iterates over the children of the directory (files and subdirectories, not
recursive).

It yields Pathname object for each child.

By default, the yielded pathnames will have enough information to access the
files.

If you set `with_directory` to `false`, then the returned pathnames will
contain the filename only.

    Pathname("/usr/local").each_child {|f| p f }
    #=> #<Pathname:/usr/local/share>
    #   #<Pathname:/usr/local/bin>
    #   #<Pathname:/usr/local/games>
    #   #<Pathname:/usr/local/lib>
    #   #<Pathname:/usr/local/include>
    #   #<Pathname:/usr/local/sbin>
    #   #<Pathname:/usr/local/src>
    #   #<Pathname:/usr/local/man>

    Pathname("/usr/local").each_child(false) {|f| p f }
    #=> #<Pathname:share>
    #   #<Pathname:bin>
    #   #<Pathname:games>
    #   #<Pathname:lib>
    #   #<Pathname:include>
    #   #<Pathname:sbin>
    #   #<Pathname:src>
    #   #<Pathname:man>

Note that the results never contain the entries `.` and `..` in the directory
because they are not children.

See Pathname#children


# Pathname#each_entry

(from ruby core)
---
    each_entry()

---

Iterates over the entries (files and subdirectories) in the directory,
yielding a Pathname object for each entry.


# Pathname#each_filename

(from ruby core)
---
    each_filename() { |filename| ... }

---

Iterates over each component of the path.

    Pathname.new("/usr/bin/ruby").each_filename {|filename| ... }
      # yields "usr", "bin", and "ruby".

Returns an Enumerator if no block was given.

    enum = Pathname.new("/usr/bin/ruby").each_filename
      # ... do stuff ...
    enum.each { |e| ... }
      # yields "usr", "bin", and "ruby".


# Pathname#each_line

(from ruby core)
---
    pathname.each_line {|line| ... }
    pathname.each_line(sep=$/ [, open_args]) {|line| block }     -> nil
    pathname.each_line(limit [, open_args]) {|line| block }      -> nil
    pathname.each_line(sep, limit [, open_args]) {|line| block } -> nil
    pathname.each_line(...)                                      -> an_enumerator

---

Iterates over each line in the file and yields a String object for each.


# Pathname#empty?

(from ruby core)
---
    empty?()

---

Tests the file is empty.

See Dir#empty? and FileTest.empty?.


# Pathname#entries

(from ruby core)
---
    entries()

---

Return the entries (files and subdirectories) in the directory, each as a
Pathname object.

The results contains just the names in the directory, without any trailing
slashes or recursive look-up.

    pp Pathname.new('/usr/local').entries
    #=> [#<Pathname:share>,
    #    #<Pathname:lib>,
    #    #<Pathname:..>,
    #    #<Pathname:include>,
    #    #<Pathname:etc>,
    #    #<Pathname:bin>,
    #    #<Pathname:man>,
    #    #<Pathname:games>,
    #    #<Pathname:.>,
    #    #<Pathname:sbin>,
    #    #<Pathname:src>]

The result may contain the current directory `#<Pathname:.>` and the parent
directory `#<Pathname:..>`.

If you don't want `.` and `..` and want directories, consider
Pathname#children.


# Pathname#eql?

(from ruby core)
---
    eql?(p1)

---

Compare this pathname with `other`.  The comparison is string-based. Be aware
that two different paths (`foo.txt` and `./foo.txt`) can refer to the same
file.


# Pathname#executable?

(from ruby core)
---
    executable?()

---

See FileTest.executable?.


# Pathname#executable_real?

(from ruby core)
---
    executable_real?()

---

See FileTest.executable_real?.


# Pathname#exist?

(from ruby core)
---
    exist?()

---

See FileTest.exist?.


# Pathname#expand_path

(from ruby core)
---
    expand_path(p1 = v1)

---

Returns the absolute path for the file.

See File.expand_path.


# Pathname#extname

(from ruby core)
---
    extname()

---

Returns the file's extension.

See File.extname.


# Pathname#file?

(from ruby core)
---
    file?()

---

See FileTest.file?.


# Pathname#find

(from ruby core)
---
    find(ignore_error: true) { |pathname| ... }

---

Iterates over the directory tree in a depth first manner, yielding a Pathname
for each file under "this" directory.

Returns an Enumerator if no block is given.

Since it is implemented by the standard library module Find, Find.prune can be
used to control the traversal.

If `self` is `.`, yielded pathnames begin with a filename in the current
directory, not `./`.

See Find.find


# Pathname#fnmatch

(from ruby core)
---
    pathname.fnmatch(pattern, [flags])        -> string
    pathname.fnmatch?(pattern, [flags])       -> string

---

Return `true` if the receiver matches the given pattern.

See File.fnmatch.


# Pathname#fnmatch?

(from ruby core)
---
    pathname.fnmatch?(pattern, [flags])       -> string

---

Return `true` if the receiver matches the given pattern.

See File.fnmatch.


# Pathname#freeze

(from ruby core)
---
    pathname.freeze -> obj

---

Freezes this Pathname.

See Object.freeze.


# Pathname#ftype

(from ruby core)
---
    pathname.ftype     -> string

---

Returns "type" of file ("file", "directory", etc).

See File.ftype.


# Pathname#grpowned?

(from ruby core)
---
    grpowned?()

---

See FileTest.grpowned?.


# Pathname#join

(from ruby core)
---
    join(*args)

---

Joins the given pathnames onto `self` to create a new Pathname object.

    path0 = Pathname.new("/usr")                # Pathname:/usr
    path0 = path0.join("bin/ruby")              # Pathname:/usr/bin/ruby
        # is the same as
    path1 = Pathname.new("/usr") + "bin/ruby"   # Pathname:/usr/bin/ruby
    path0 == path1
        #=> true


# Pathname#lchmod

(from ruby core)
---
    pathname.lchmod    -> integer

---

Same as Pathname.chmod, but does not follow symbolic links.

See File.lchmod.


# Pathname#lchown

(from ruby core)
---
    pathname.lchown    -> integer

---

Same as Pathname.chown, but does not follow symbolic links.

See File.lchown.


# Pathname#lstat

(from ruby core)
---
    lstat()

---

See File.lstat.


# Pathname#make_link

(from ruby core)
---
    pathname.make_link(old)

---

Creates a hard link at *pathname*.

See File.link.


# Pathname#make_symlink

(from ruby core)
---
    pathname.make_symlink(old)

---

Creates a symbolic link.

See File.symlink.


# Pathname#mkdir

(from ruby core)
---
    mkdir(p1 = v1)

---

Create the referenced directory.

See Dir.mkdir.


# Pathname#mkpath

(from ruby core)
---
    mkpath()

---

Creates a full path, including any intermediate directories that don't yet
exist.

See FileUtils.mkpath and FileUtils.mkdir_p


# Pathname#mountpoint?

(from ruby core)
---
    mountpoint?()

---

Returns `true` if `self` points to a mountpoint.


# Pathname#mtime

(from ruby core)
---
    pathname.mtime     -> time

---

Returns the last modified time of the file.

See File.mtime.


# Pathname#open

(from ruby core)
---
    open(p1 = v1, p2 = v2, p3 = v3)

---

Opens the file for reading or writing.

See File.open.


# Pathname#opendir

(from ruby core)
---
    opendir()

---

Opens the referenced directory.

See Dir.open.


# Pathname#owned?

(from ruby core)
---
    owned?()

---

See FileTest.owned?.


# Pathname#parent

(from ruby core)
---
    parent()

---

Returns the parent directory.

This is same as `self + '..'`.


# Pathname#pipe?

(from ruby core)
---
    pipe?()

---

See FileTest.pipe?.


# Pathname#read

(from ruby core)
---
    pathname.read([length [, offset]]) -> string
    pathname.read([length [, offset]], open_args) -> string

---

Returns all data from the file, or the first `N` bytes if specified.

See IO.read.


# Pathname#readable?

(from ruby core)
---
    readable?()

---

See FileTest.readable?.


# Pathname#readable_real?

(from ruby core)
---
    readable_real?()

---

See FileTest.readable_real?.


# Pathname#readlines

(from ruby core)
---
    pathname.readlines(sep=$/ [, open_args])     -> array
    pathname.readlines(limit [, open_args])      -> array
    pathname.readlines(sep, limit [, open_args]) -> array

---

Returns all the lines from the file.

See IO.readlines.


# Pathname#readlink

(from ruby core)
---
    readlink()

---

Read symbolic link.

See File.readlink.


# Pathname#realdirpath

(from ruby core)
---
    realdirpath(p1 = v1)

---

Returns the real (absolute) pathname of `self` in the actual filesystem.

Does not contain symlinks or useless dots, `..` and `.`.

The last component of the real pathname can be nonexistent.


# Pathname#realpath

(from ruby core)
---
    realpath(p1 = v1)

---

Returns the real (absolute) pathname for `self` in the actual filesystem.

Does not contain symlinks or useless dots, `..` and `.`.

All components of the pathname must exist when this method is called.


# Pathname#relative?

(from ruby core)
---
    relative?()

---

The opposite of Pathname#absolute?

It returns `false` if the pathname begins with a slash.

    p = Pathname.new('/im/sure')
    p.relative?
        #=> false

    p = Pathname.new('not/so/sure')
    p.relative?
        #=> true


# Pathname#relative_path_from

(from ruby core)
---
    relative_path_from(base_directory)

---

Returns a relative path from the given `base_directory` to the receiver.

If `self` is absolute, then `base_directory` must be absolute too.

If `self` is relative, then `base_directory` must be relative too.

This method doesn't access the filesystem.  It assumes no symlinks.

ArgumentError is raised when it cannot find a relative path.


# Pathname#rename

(from ruby core)
---
    rename(p1)

---

Rename the file.

See File.rename.


# Pathname#rmdir

(from ruby core)
---
    rmdir()

---

Remove the referenced directory.

See Dir.rmdir.


# Pathname#rmtree

(from ruby core)
---
    rmtree()

---

Recursively deletes a directory, including all directories beneath it.

See FileUtils.rm_r


# Pathname#root?

(from ruby core)
---
    root?()

---

Predicate method for root directories.  Returns `true` if the pathname
consists of consecutive slashes.

It doesn't access the filesystem.  So it may return `false` for some pathnames
which points to roots such as `/usr/..`.


# Pathname#setgid?

(from ruby core)
---
    setgid?()

---

See FileTest.setgid?.


# Pathname#setuid?

(from ruby core)
---
    setuid?()

---

See FileTest.setuid?.


# Pathname#size

(from ruby core)
---
    size()

---

See FileTest.size.


# Pathname#size?

(from ruby core)
---
    size?()

---

See FileTest.size?.


# Pathname#socket?

(from ruby core)
---
    socket?()

---

See FileTest.socket?.


# Pathname#split

(from ruby core)
---
    split()

---

Returns the #dirname and the #basename in an Array.

See File.split.


# Pathname#stat

(from ruby core)
---
    stat()

---

Returns a File::Stat object.

See File.stat.


# Pathname#sticky?

(from ruby core)
---
    sticky?()

---

See FileTest.sticky?.


# Pathname#sub

(from ruby core)
---
    sub(*args)

---

Return a pathname which is substituted by String#sub.

    path1 = Pathname.new('/usr/bin/perl')
    path1.sub('perl', 'ruby')
        #=> #<Pathname:/usr/bin/ruby>


# Pathname#sub_ext

(from ruby core)
---
    sub_ext(p1)

---

Return a pathname with `repl` added as a suffix to the basename.

If self has no extension part, `repl` is appended.

    Pathname.new('/usr/bin/shutdown').sub_ext('.rb')
        #=> #<Pathname:/usr/bin/shutdown.rb>


# Pathname#symlink?

(from ruby core)
---
    symlink?()

---

See FileTest.symlink?.


# Pathname#sysopen

(from ruby core)
---
    pathname.sysopen([mode, [perm]])  -> fixnum

---

See IO.sysopen.


# Pathname#taint

(from ruby core)
---
    pathname.taint -> obj

---

Taints this Pathname.

See Object.taint.


# Pathname#to_path

(from ruby core)
---
    pathname.to_path          -> string

---

Return the path as a String.

to_path is implemented so Pathname objects are usable with File.open, etc.


# Pathname#to_s

(from ruby core)
---
    pathname.to_s             -> string

---

Return the path as a String.

to_path is implemented so Pathname objects are usable with File.open, etc.


# Pathname#truncate

(from ruby core)
---
    truncate(p1)

---

Truncates the file to `length` bytes.

See File.truncate.


# Pathname#unlink

(from ruby core)
---
    unlink()

---

Removes a file or directory, using File.unlink if `self` is a file, or
Dir.unlink as necessary.


# Pathname#untaint

(from ruby core)
---
    pathname.untaint -> obj

---

Untaints this Pathname.

See Object.untaint.


# Pathname#utime

(from ruby core)
---
    utime(p1, p2)

---

Update the access and modification times of the file.

See File.utime.


# Pathname#world_readable?

(from ruby core)
---
    world_readable?()

---

See FileTest.world_readable?.


# Pathname#world_writable?

(from ruby core)
---
    world_writable?()

---

See FileTest.world_writable?.


# Pathname#writable?

(from ruby core)
---
    writable?()

---

See FileTest.writable?.


# Pathname#writable_real?

(from ruby core)
---
    writable_real?()

---

See FileTest.writable_real?.


# Pathname#write

(from ruby core)
---
    pathname.write(string, [offset] )   => fixnum
    pathname.write(string, [offset], open_args )   => fixnum

---

Writes `contents` to the file.

See IO.write.


# Pathname#zero?

(from ruby core)
---
    zero?()

---

See FileTest.zero?.


---
Also found in:
    gem activesupport-5.1.2

