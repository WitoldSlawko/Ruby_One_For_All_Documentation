# Dir < Object

---
# Includes:
Enumerable (from ruby core)

(from ruby core)
---
Objects of class `Dir` are directory streams representing directories in the
underlying file system. They provide a variety of ways to list directories and
their contents. See also `File`.

The directory used in these examples contains the two regular files
(`config.h` and `main.rb`), the parent directory (`..`), and the directory
itself (`.`).

---
# Class methods:

    []
    chdir
    chroot
    delete
    empty?
    entries
    exist?
    exists?
    foreach
    getwd
    glob
    home
    mkdir
    mktmpdir
    new
    open
    pwd
    rmdir
    tmpdir
    unlink

# Instance methods:

    close
    each
    fileno
    inspect
    path
    pos
    pos=
    read
    rewind
    seek
    tell
    to_path

# Dir::[]

(from ruby core)
---
    Dir[ string [, string ...] ] -> array

---

Equivalent to calling `Dir.glob([string,...],0)`.


# Dir::chdir

(from ruby core)
---
    Dir.chdir( [ string] ) -> 0
    Dir.chdir( [ string] ) {| path | block }  -> anObject

---

Changes the current working directory of the process to the given string. When
called without an argument, changes the directory to the value of the
environment variable `HOME`, or `LOGDIR`. `SystemCallError` (probably
`Errno::ENOENT`) if the target directory does not exist.

If a block is given, it is passed the name of the new current directory, and
the block is executed with that as the current directory. The original working
directory is restored when the block exits. The return value of `chdir` is the
value of the block. `chdir` blocks can be nested, but in a multi-threaded
program an error will be raised if a thread attempts to open a `chdir` block
while another thread has one open.

    Dir.chdir("/var/spool/mail")
    puts Dir.pwd
    Dir.chdir("/tmp") do
      puts Dir.pwd
      Dir.chdir("/usr") do
        puts Dir.pwd
      end
      puts Dir.pwd
    end
    puts Dir.pwd

*produces:*

    /var/spool/mail
    /tmp
    /usr
    /tmp
    /var/spool/mail


# Dir::chroot

(from ruby core)
---
    Dir.chroot( string ) -> 0

---

Changes this process's idea of the file system root. Only a privileged process
may make this call. Not available on all platforms. On Unix systems, see
`chroot(2)` for more information.


# Dir::delete

(from ruby core)
---
    Dir.delete( string ) -> 0

---

Deletes the named directory. Raises a subclass of `SystemCallError` if the
directory isn't empty.


# Dir::empty?

(from ruby core)
---
    Dir.empty?(path_name)  ->  true or false

---

Returns `true` if the named file is an empty directory, `false` if it is not a
directory or non-empty.


# Dir::entries

(from ruby core)
---
    Dir.entries( dirname )                -> array
    Dir.entries( dirname, encoding: enc ) -> array

---

Returns an array containing all of the filenames in the given directory. Will
raise a `SystemCallError` if the named directory doesn't exist.

The optional *enc* argument specifies the encoding of the directory. If not
specified, the filesystem encoding is used.

    Dir.entries("testdir")   #=> [".", "..", "config.h", "main.rb"]


# Dir::exist?

(from ruby core)
---
    Dir.exist?(file_name)   ->  true or false

---

Returns `true` if the named file is a directory, `false` otherwise.


# Dir::exists?

(from ruby core)
---
    Dir.exists?(file_name)  ->  true or false

---

Deprecated method. Don't use.


# Dir::foreach

(from ruby core)
---
    Dir.foreach( dirname ) {| filename | block }                 -> nil
    Dir.foreach( dirname, encoding: enc ) {| filename | block }  -> nil
    Dir.foreach( dirname )                                       -> an_enumerator
    Dir.foreach( dirname, encoding: enc )                        -> an_enumerator

---

Calls the block once for each entry in the named directory, passing the
filename of each entry as a parameter to the block.

If no block is given, an enumerator is returned instead.

    Dir.foreach("testdir") {|x| puts "Got #{x}" }

*produces:*

    Got .
    Got ..
    Got config.h
    Got main.rb


# Dir::getwd

(from ruby core)
---
    Dir.getwd -> string

---

Returns the path to the current working directory of this process as a string.

    Dir.chdir("/tmp")   #=> 0
    Dir.getwd           #=> "/tmp"
    Dir.pwd             #=> "/tmp"


# Dir::glob

(from ruby core)
---
    Dir.glob( pattern, [flags] ) -> matches
    Dir.glob( pattern, [flags] ) { |filename| block }  -> nil

---

Expands `pattern`, which is an Array of patterns or a pattern String, and
returns the results as `matches` or as arguments given to the block.

Note that this pattern is not a regexp, it's closer to a shell glob.  See
File::fnmatch for the meaning of the `flags` parameter.  Note that case
sensitivity depends on your system (so File::FNM_CASEFOLD is ignored), as does
the order in which the results are returned.

`*`
:   Matches any file. Can be restricted by other values in the glob.
    Equivalent to `/ .* /x` in regexp.

    `*`
:       Matches all files
    `c*`
:       Matches all files beginning with `c`
    `*c`
:       Matches all files ending with `c`
    `*c*`
:       Match all files that have `c` in them (including at the beginning or
        end).


    Note, this will not match Unix-like hidden files (dotfiles).  In order to
    include those in the match results, you must use the File::FNM_DOTMATCH
    flag or something like `"{*,.*}"`.

`**`
:   Matches directories recursively.

`?`
:   Matches any one character. Equivalent to `/.{1}/` in regexp.

`[set]`
:   Matches any one character in `set`.  Behaves exactly like character sets
    in Regexp, including set negation (`[^a-z]`).

`{p,q}`
:   Matches either literal `p` or literal `q`. Equivalent to pattern
    alternation in regexp.

    Matching literals may be more than one character in length.  More than two
    literals may be specified.

` \\ `
:   Escapes the next metacharacter.

    Note that this means you cannot use backslash on windows as part of a
    glob, i.e.  `Dir["c:\\foo*"]` will not work, use `Dir["c:/foo*"]` instead.


Examples:

    Dir["config.?"]                     #=> ["config.h"]
    Dir.glob("config.?")                #=> ["config.h"]
    Dir.glob("*.[a-z][a-z]")            #=> ["main.rb"]
    Dir.glob("*.[^r]*")                 #=> ["config.h"]
    Dir.glob("*.{rb,h}")                #=> ["main.rb", "config.h"]
    Dir.glob("*")                       #=> ["config.h", "main.rb"]
    Dir.glob("*", File::FNM_DOTMATCH)   #=> [".", "..", "config.h", "main.rb"]

    rbfiles = File.join("**", "*.rb")
    Dir.glob(rbfiles)                   #=> ["main.rb",
                                        #    "lib/song.rb",
                                        #    "lib/song/karaoke.rb"]
    libdirs = File.join("**", "lib")
    Dir.glob(libdirs)                   #=> ["lib"]

    librbfiles = File.join("**", "lib", "**", "*.rb")
    Dir.glob(librbfiles)                #=> ["lib/song.rb",
                                        #    "lib/song/karaoke.rb"]

    librbfiles = File.join("**", "lib", "*.rb")
    Dir.glob(librbfiles)                #=> ["lib/song.rb"]


# Dir::home

(from ruby core)
---
    Dir.home()       -> "/home/me"
    Dir.home("root") -> "/root"

---

Returns the home directory of the current user or the named user if given.


# Dir::mkdir

(from ruby core)
---
    Dir.mkdir( string [, integer] ) -> 0

---

Makes a new directory named by *string*, with permissions specified by the
optional parameter *anInteger*. The permissions may be modified by the value
of `File::umask`, and are ignored on NT. Raises a `SystemCallError` if the
directory cannot be created. See also the discussion of permissions in the
class documentation for `File`.

    Dir.mkdir(File.join(Dir.home, ".foo"), 0700) #=> 0


# Dir::mktmpdir

(from ruby core)
---
    mktmpdir(prefix_suffix=nil, *rest) { |path| ... }

---

Dir.mktmpdir creates a temporary directory.

The directory is created with 0700 permission. Application should not change
the permission to make the temporary directory accessible from other users.

The prefix and suffix of the name of the directory is specified by the
optional first argument, *prefix_suffix*.
*   If it is not specified or nil, "d" is used as the prefix and no suffix is
    used.
*   If it is a string, it is used as the prefix and no suffix is used.
*   If it is an array, first element is used as the prefix and second element
    is used as a suffix.


    Dir.mktmpdir {|dir| dir is ".../d..." }
    Dir.mktmpdir("foo") {|dir| dir is ".../foo..." }
    Dir.mktmpdir(["foo", "bar"]) {|dir| dir is ".../foo...bar" }

The directory is created under Dir.tmpdir or the optional second argument
*tmpdir* if non-nil value is given.

    Dir.mktmpdir {|dir| dir is "#{Dir.tmpdir}/d..." }
    Dir.mktmpdir(nil, "/var/tmp") {|dir| dir is "/var/tmp/d..." }

If a block is given, it is yielded with the path of the directory. The
directory and its contents are removed using FileUtils.remove_entry before
Dir.mktmpdir returns. The value of the block is returned.

    Dir.mktmpdir {|dir|
      # use the directory...
      open("#{dir}/foo", "w") { ... }
    }

If a block is not given, The path of the directory is returned. In this case,
Dir.mktmpdir doesn't remove the directory.

    dir = Dir.mktmpdir
    begin
      # use the directory...
      open("#{dir}/foo", "w") { ... }
    ensure
      # remove the directory.
      FileUtils.remove_entry dir
    end


# Dir::new

(from ruby core)
---
    Dir.new( string ) -> aDir
    Dir.new( string, encoding: enc ) -> aDir

---

Returns a new directory object for the named directory.

The optional *enc* argument specifies the encoding of the directory. If not
specified, the filesystem encoding is used.


# Dir::open

(from ruby core)
---
    Dir.open( string ) -> aDir
    Dir.open( string, encoding: enc ) -> aDir
    Dir.open( string ) {| aDir | block } -> anObject
    Dir.open( string, encoding: enc ) {| aDir | block } -> anObject

---

The optional *enc* argument specifies the encoding of the directory. If not
specified, the filesystem encoding is used.

With no block, `open` is a synonym for `Dir::new`. If a block is present, it
is passed *aDir* as a parameter. The directory is closed at the end of the
block, and `Dir::open` returns the value of the block.


# Dir::pwd

(from ruby core)
---
    Dir.pwd -> string

---

Returns the path to the current working directory of this process as a string.

    Dir.chdir("/tmp")   #=> 0
    Dir.getwd           #=> "/tmp"
    Dir.pwd             #=> "/tmp"


# Dir::rmdir

(from ruby core)
---
    Dir.rmdir( string ) -> 0

---

Deletes the named directory. Raises a subclass of `SystemCallError` if the
directory isn't empty.


# Dir::tmpdir

(from ruby core)
---
    tmpdir()

---

Returns the operating system's temporary file path.


# Dir::unlink

(from ruby core)
---
    Dir.unlink( string ) -> 0

---

Deletes the named directory. Raises a subclass of `SystemCallError` if the
directory isn't empty.


# Dir#close

(from ruby core)
---
    dir.close -> nil

---

Closes the directory stream. Calling this method on closed Dir object is
ignored since Ruby 2.3.

    d = Dir.new("testdir")
    d.close   #=> nil


# Dir#each

(from ruby core)
---
    dir.each { |filename| block }  -> dir
    dir.each                       -> an_enumerator

---

Calls the block once for each entry in this directory, passing the filename of
each entry as a parameter to the block.

If no block is given, an enumerator is returned instead.

    d = Dir.new("testdir")
    d.each  {|x| puts "Got #{x}" }

*produces:*

    Got .
    Got ..
    Got config.h
    Got main.rb


# Dir#fileno

(from ruby core)
---
    dir.fileno -> integer

---

Returns the file descriptor used in *dir*.

    d = Dir.new("..")
    d.fileno   #=> 8

This method uses dirfd() function defined by POSIX 2008. NotImplementedError
is raised on other platforms, such as Windows, which doesn't provide the
function.


# Dir#inspect

(from ruby core)
---
    dir.inspect -> string

---

Return a string describing this Dir object.


# Dir#path

(from ruby core)
---
    dir.path -> string or nil

---

Returns the path parameter passed to *dir*'s constructor.

    d = Dir.new("..")
    d.path   #=> ".."


# Dir#pos

(from ruby core)
---
    dir.pos -> integer

---

Returns the current position in *dir*. See also `Dir#seek`.

    d = Dir.new("testdir")
    d.tell   #=> 0
    d.read   #=> "."
    d.tell   #=> 12


# Dir#pos=

(from ruby core)
---
    dir.pos = integer  -> integer

---

Synonym for `Dir#seek`, but returns the position parameter.

    d = Dir.new("testdir")   #=> #<Dir:0x401b3c40>
    d.read                   #=> "."
    i = d.pos                #=> 12
    d.read                   #=> ".."
    d.pos = i                #=> 12
    d.read                   #=> ".."


# Dir#read

(from ruby core)
---
    dir.read -> string or nil

---

Reads the next entry from *dir* and returns it as a string. Returns `nil` at
the end of the stream.

    d = Dir.new("testdir")
    d.read   #=> "."
    d.read   #=> ".."
    d.read   #=> "config.h"


# Dir#rewind

(from ruby core)
---
    dir.rewind -> dir

---

Repositions *dir* to the first entry.

    d = Dir.new("testdir")
    d.read     #=> "."
    d.rewind   #=> #<Dir:0x401b3fb0>
    d.read     #=> "."


# Dir#seek

(from ruby core)
---
    dir.seek( integer ) -> dir

---

Seeks to a particular location in *dir*. *integer* must be a value returned by
`Dir#tell`.

    d = Dir.new("testdir")   #=> #<Dir:0x401b3c40>
    d.read                   #=> "."
    i = d.tell               #=> 12
    d.read                   #=> ".."
    d.seek(i)                #=> #<Dir:0x401b3c40>
    d.read                   #=> ".."


# Dir#tell

(from ruby core)
---
    dir.tell -> integer

---

Returns the current position in *dir*. See also `Dir#seek`.

    d = Dir.new("testdir")
    d.tell   #=> 0
    d.read   #=> "."
    d.tell   #=> 12


# Dir#to_path

(from ruby core)
---
    dir.to_path -> string or nil

---

Returns the path parameter passed to *dir*'s constructor.

    d = Dir.new("..")
    d.path   #=> ".."


