# FileUtils

---
# Includes:
StreamUtils_ (from ruby core)

---
# Extended by:
StreamUtils_ (from ruby core)

(from ruby core)
---
# fileutils.rb

Copyright (c) 2000-2007 Minero Aoki

This program is free software. You can distribute/modify this program under
the same terms of ruby.

## module FileUtils

Namespace for several file utility methods for copying, moving, removing, etc.

### Module Functions

    require 'fileutils'

    FileUtils.cd(dir, options)
    FileUtils.cd(dir, options) {|dir| .... }
    FileUtils.pwd()
    FileUtils.mkdir(dir, options)
    FileUtils.mkdir(list, options)
    FileUtils.mkdir_p(dir, options)
    FileUtils.mkdir_p(list, options)
    FileUtils.rmdir(dir, options)
    FileUtils.rmdir(list, options)
    FileUtils.ln(old, new, options)
    FileUtils.ln(list, destdir, options)
    FileUtils.ln_s(old, new, options)
    FileUtils.ln_s(list, destdir, options)
    FileUtils.ln_sf(src, dest, options)
    FileUtils.cp(src, dest, options)
    FileUtils.cp(list, dir, options)
    FileUtils.cp_r(src, dest, options)
    FileUtils.cp_r(list, dir, options)
    FileUtils.mv(src, dest, options)
    FileUtils.mv(list, dir, options)
    FileUtils.rm(list, options)
    FileUtils.rm_r(list, options)
    FileUtils.rm_rf(list, options)
    FileUtils.install(src, dest, mode = <src's>, options)
    FileUtils.chmod(mode, list, options)
    FileUtils.chmod_R(mode, list, options)
    FileUtils.chown(user, group, list, options)
    FileUtils.chown_R(user, group, list, options)
    FileUtils.touch(list, options)

The `options` parameter is a hash of options, taken from the list `:force`,
`:noop`, `:preserve`, and `:verbose`. `:noop` means that no changes are made. 
The other two are obvious. Each method documents the options that it honours.

All methods that have the concept of a "source" file or directory can take
either one file or a list of files in that argument.  See the method
documentation for examples.

There are some `low level' methods, which do not accept any option:

    FileUtils.copy_entry(src, dest, preserve = false, dereference = false)
    FileUtils.copy_file(src, dest, preserve = false, dereference = true)
    FileUtils.copy_stream(srcstream, deststream)
    FileUtils.remove_entry(path, force = false)
    FileUtils.remove_entry_secure(path, force = false)
    FileUtils.remove_file(path, force = false)
    FileUtils.compare_file(path_a, path_b)
    FileUtils.compare_stream(stream_a, stream_b)
    FileUtils.uptodate?(file, cmp_list)

## module FileUtils::Verbose

This module has all methods of FileUtils module, but it outputs messages
before acting.  This equates to passing the `:verbose` flag to methods in
FileUtils.

## module FileUtils::NoWrite

This module has all methods of FileUtils module, but never changes
files/directories.  This equates to passing the `:noop` flag to methods in
FileUtils.

## module FileUtils::DryRun

This module has all methods of FileUtils module, but never changes
files/directories.  This equates to passing the `:noop` and `:verbose` flags
to methods in FileUtils.

---
# Constants:

LOW_METHODS
:   [not documented]
METHODS
:   [not documented]


# Class methods:

    cd
    chdir
    chmod
    chmod_R
    chown
    chown_R
    cmp
    collect_method
    commands
    compare_file
    compare_stream
    copy
    copy_entry
    copy_file
    copy_stream
    cp
    cp_r
    getwd
    have_option?
    identical?
    install
    link
    ln
    ln_s
    ln_sf
    makedirs
    mkdir
    mkdir_p
    mkpath
    move
    mv
    options
    options_of
    pwd
    remove
    remove_dir
    remove_entry
    remove_entry_secure
    remove_file
    rm
    rm_f
    rm_r
    rm_rf
    rmdir
    rmtree
    safe_unlink
    symlink
    touch
    uptodate?

# Instance methods:

    apply_mask
    cd
    chdir
    chmod
    chmod_R
    chown
    chown_R
    cmp
    compare_file
    compare_stream
    copy
    copy_entry
    copy_file
    copy_stream
    cp
    cp_r
    getwd
    identical?
    install
    link
    ln
    ln_s
    ln_sf
    makedirs
    mkdir
    mkdir_p
    mkpath
    move
    mv
    pwd
    remove
    remove_dir
    remove_entry
    remove_entry_secure
    remove_file
    remove_trailing_slash
    rm
    rm_f
    rm_r
    rm_rf
    rmdir
    rmtree
    safe_unlink
    symlink
    touch
    uptodate?

# FileUtils::cd

(from ruby core)
---
    cd(dir, verbose: nil) { |dir| ... }

---

Changes the current directory to the directory `dir`.

If this method is called with block, resumes to the old working directory
after the block execution finished.

    FileUtils.cd('/', :verbose => true)   # chdir and report it

    FileUtils.cd('/') do  # chdir
      [...]               # do something
    end                   # return to original directory


# FileUtils::chdir

(from ruby core)
---
    chdir(dir, verbose: nil)

---


# FileUtils::chmod

(from ruby core)
---
    chmod(mode, list, noop: nil, verbose: nil)

---

Changes permission bits on the named files (in `list`) to the bit pattern
represented by `mode`.

`mode` is the symbolic and absolute mode can be used.

Absolute mode is
    FileUtils.chmod 0755, 'somecommand'
    FileUtils.chmod 0644, %w(my.rb your.rb his.rb her.rb)
    FileUtils.chmod 0755, '/usr/bin/ruby', :verbose => true

Symbolic mode is
    FileUtils.chmod "u=wrx,go=rx", 'somecommand'
    FileUtils.chmod "u=wr,go=rr", %w(my.rb your.rb his.rb her.rb)
    FileUtils.chmod "u=wrx,go=rx", '/usr/bin/ruby', :verbose => true

"a"
:   is user, group, other mask.
"u"
:   is user's mask.
"g"
:   is group's mask.
"o"
:   is other's mask.
"w"
:   is write permission.
"r"
:   is read permission.
"x"
:   is execute permission.
"X"
:   is execute permission for directories only, must be used in conjunction
    with "+"
"s"
:   is uid, gid.
"t"
:   is sticky bit.
"+"
:   is added to a class given the specified mode.
"-"
:   Is removed from a given class given mode.
"="
:   Is the exact nature of the class will be given a specified mode.



# FileUtils::chmod_R

(from ruby core)
---
    chmod_R(mode, list, noop: nil, verbose: nil, force: nil)

---

Changes permission bits on the named files (in `list`) to the bit pattern
represented by `mode`.

    FileUtils.chmod_R 0700, "/tmp/app.#{$$}"
    FileUtils.chmod_R "u=wrx", "/tmp/app.#{$$}"


# FileUtils::chown

(from ruby core)
---
    chown(user, group, list, noop: nil, verbose: nil)

---

Changes owner and group on the named files (in `list`) to the user `user` and
the group `group`.  `user` and `group` may be an ID (Integer/String) or a name
(String). If `user` or `group` is nil, this method does not change the
attribute.

    FileUtils.chown 'root', 'staff', '/usr/local/bin/ruby'
    FileUtils.chown nil, 'bin', Dir.glob('/usr/bin/*'), :verbose => true


# FileUtils::chown_R

(from ruby core)
---
    chown_R(user, group, list, noop: nil, verbose: nil, force: nil)

---

Changes owner and group on the named files (in `list`) to the user `user` and
the group `group` recursively. `user` and `group` may be an ID
(Integer/String) or a name (String).  If `user` or `group` is nil, this method
does not change the attribute.

    FileUtils.chown_R 'www', 'www', '/var/www/htdocs'
    FileUtils.chown_R 'cvs', 'cvs', '/var/cvs', :verbose => true


# FileUtils::cmp

(from ruby core)
---
    cmp(a, b)

---


# FileUtils::compare_file

(from ruby core)
---
    compare_file(a, b)

---

Returns true if the contents of a file A and a file B are identical.

    FileUtils.compare_file('somefile', 'somefile')  #=> true
    FileUtils.compare_file('/bin/cp', '/bin/mv')    #=> maybe false


# FileUtils::compare_stream

(from ruby core)
---
    compare_stream(a, b)

---

Returns true if the contents of a stream `a` and `b` are identical.


# FileUtils::copy

(from ruby core)
---
    copy(src, dest, preserve: nil, noop: nil, verbose: nil)

---


# FileUtils::copy_entry

(from ruby core)
---
    copy_entry(src, dest, preserve = false, dereference_root = false, remove_destination = false)

---

Copies a file system entry `src` to `dest`. If `src` is a directory, this
method copies its contents recursively. This method preserves file types, c.f.
symlink, directory... (FIFO, device files and etc. are not supported yet)

Both of `src` and `dest` must be a path name. `src` must exist, `dest` must
not exist.

If `preserve` is true, this method preserves owner, group, and modified time. 
Permissions are copied regardless `preserve`.

If `dereference_root` is true, this method dereference tree root.

If `remove_destination` is true, this method removes each destination file
before copy.


# FileUtils::copy_file

(from ruby core)
---
    copy_file(src, dest, preserve = false, dereference = true)

---

Copies file contents of `src` to `dest`. Both of `src` and `dest` must be a
path name.


# FileUtils::copy_stream

(from ruby core)
---
    copy_stream(src, dest)

---

Copies stream `src` to `dest`. `src` must respond to #read(n) and `dest` must
respond to #write(str).


# FileUtils::cp

(from ruby core)
---
    cp(src, dest, preserve: nil, noop: nil, verbose: nil)

---

Copies a file content `src` to `dest`.  If `dest` is a directory, copies `src`
to `dest/src`.

If `src` is a list of files, then `dest` must be a directory.

    FileUtils.cp 'eval.c', 'eval.c.org'
    FileUtils.cp %w(cgi.rb complex.rb date.rb), '/usr/lib/ruby/1.6'
    FileUtils.cp %w(cgi.rb complex.rb date.rb), '/usr/lib/ruby/1.6', :verbose => true
    FileUtils.cp 'symlink', 'dest'   # copy content, "dest" is not a symlink


# FileUtils::cp_r

(from ruby core)
---
    cp_r(src, dest, preserve: nil, noop: nil, verbose: nil, dereference_root: true, remove_destination: nil)

---

Copies `src` to `dest`. If `src` is a directory, this method copies all its
contents recursively. If `dest` is a directory, copies `src` to `dest/src`.

`src` can be a list of files.

    # Installing Ruby library "mylib" under the site_ruby
    FileUtils.rm_r site_ruby + '/mylib', :force
    FileUtils.cp_r 'lib/', site_ruby + '/mylib'

    # Examples of copying several files to target directory.
    FileUtils.cp_r %w(mail.rb field.rb debug/), site_ruby + '/tmail'
    FileUtils.cp_r Dir.glob('*.rb'), '/home/aamine/lib/ruby', :noop => true, :verbose => true

    # If you want to copy all contents of a directory instead of the
    # directory itself, c.f. src/x -> dest/x, src/y -> dest/y,
    # use following code.
    FileUtils.cp_r 'src/.', 'dest'     # cp_r('src', 'dest') makes dest/src,
                                       # but this doesn't.


# FileUtils::getwd

(from ruby core)
---
    getwd()

---


# FileUtils::identical?

(from ruby core)
---
    identical?(a, b)

---


# FileUtils::install

(from ruby core)
---
    install(src, dest, mode: nil, owner: nil, group: nil, preserve: nil, noop: nil, verbose: nil)

---

If `src` is not same as `dest`, copies it and changes the permission mode to
`mode`.  If `dest` is a directory, destination is `dest`/`src`. This method
removes destination before copy.

    FileUtils.install 'ruby', '/usr/local/bin/ruby', :mode => 0755, :verbose => true
    FileUtils.install 'lib.rb', '/usr/local/lib/ruby/site_ruby', :verbose => true


# FileUtils::link

(from ruby core)
---
    link(src, dest, force: nil, noop: nil, verbose: nil)

---


# FileUtils::ln

(from ruby core)
---
    ln(src, dest, force: nil, noop: nil, verbose: nil)

---

**`ln(old, new, **options)`**

Creates a hard link `new` which points to `old`. If `new` already exists and
it is a directory, creates a link `new/old`. If `new` already exists and it is
not a directory, raises Errno::EEXIST. But if :force option is set, overwrite
`new`.

    FileUtils.ln 'gcc', 'cc', :verbose => true
    FileUtils.ln '/usr/bin/emacs21', '/usr/bin/emacs'

**`ln(list, destdir, **options)`**

Creates several hard links in a directory, with each one pointing to the item
in `list`.  If `destdir` is not a directory, raises Errno::ENOTDIR.

    include FileUtils
    cd '/sbin'
    FileUtils.ln %w(cp mv mkdir), '/bin'   # Now /sbin/cp and /bin/cp are linked.


# FileUtils::ln_s

(from ruby core)
---
    ln_s(src, dest, force: nil, noop: nil, verbose: nil)

---

**`ln_s(old, new, **options)`**

Creates a symbolic link `new` which points to `old`.  If `new` already exists
and it is a directory, creates a symbolic link `new/old`.  If `new` already
exists and it is not a directory, raises Errno::EEXIST.  But if :force option
is set, overwrite `new`.

    FileUtils.ln_s '/usr/bin/ruby', '/usr/local/bin/ruby'
    FileUtils.ln_s 'verylongsourcefilename.c', 'c', :force => true

**`ln_s(list, destdir, **options)`**

Creates several symbolic links in a directory, with each one pointing to the
item in `list`.  If `destdir` is not a directory, raises Errno::ENOTDIR.

If `destdir` is not a directory, raises Errno::ENOTDIR.

    FileUtils.ln_s Dir.glob('bin/*.rb'), '/home/aamine/bin'


# FileUtils::ln_sf

(from ruby core)
---
    ln_sf(src, dest, noop: nil, verbose: nil)

---

Same as
    #ln_s(src, dest, :force => true)


# FileUtils::makedirs

(from ruby core)
---
    makedirs(list, mode: nil, noop: nil, verbose: nil)

---


# FileUtils::mkdir

(from ruby core)
---
    mkdir(list, mode: nil, noop: nil, verbose: nil)

---

Creates one or more directories.

    FileUtils.mkdir 'test'
    FileUtils.mkdir %w( tmp data )
    FileUtils.mkdir 'notexist', :noop => true  # Does not really create.
    FileUtils.mkdir 'tmp', :mode => 0700


# FileUtils::mkdir_p

(from ruby core)
---
    mkdir_p(list, mode: nil, noop: nil, verbose: nil)

---

Creates a directory and all its parent directories. For example,

    FileUtils.mkdir_p '/usr/local/lib/ruby'

causes to make following directories, if it does not exist.
    * /usr
    * /usr/local
    * /usr/local/lib
    * /usr/local/lib/ruby

You can pass several directories at a time in a list.


# FileUtils::mkpath

(from ruby core)
---
    mkpath(list, mode: nil, noop: nil, verbose: nil)

---


# FileUtils::move

(from ruby core)
---
    move(src, dest, force: nil, noop: nil, verbose: nil, secure: nil)

---


# FileUtils::mv

(from ruby core)
---
    mv(src, dest, force: nil, noop: nil, verbose: nil, secure: nil)

---

Moves file(s) `src` to `dest`.  If `file` and `dest` exist on the different
disk partition, the file is copied then the original file is removed.

    FileUtils.mv 'badname.rb', 'goodname.rb'
    FileUtils.mv 'stuff.rb', '/notexist/lib/ruby', :force => true  # no error

    FileUtils.mv %w(junk.txt dust.txt), '/home/aamine/.trash/'
    FileUtils.mv Dir.glob('test*.rb'), 'test', :noop => true, :verbose => true


# FileUtils::pwd

(from ruby core)
---
    pwd()

---

Returns the name of the current directory.


# FileUtils::remove

(from ruby core)
---
    remove(list, force: nil, noop: nil, verbose: nil)

---


# FileUtils::remove_dir

(from ruby core)
---
    remove_dir(path, force = false)

---

Removes a directory `dir` and its contents recursively. This method ignores
StandardError if `force` is true.


# FileUtils::remove_entry

(from ruby core)
---
    remove_entry(path, force = false)

---

This method removes a file system entry `path`. `path` might be a regular
file, a directory, or something. If `path` is a directory, remove it
recursively.

See also #remove_entry_secure.


# FileUtils::remove_entry_secure

(from ruby core)
---
    remove_entry_secure(path, force = false)

---

This method removes a file system entry `path`.  `path` shall be a regular
file, a directory, or something.  If `path` is a directory, remove it
recursively.  This method is required to avoid TOCTTOU
(time-of-check-to-time-of-use) local security vulnerability of #rm_r. #rm_r
causes security hole when:

    * Parent directory is world writable (including /tmp).
    * Removing directory tree includes world writable directory.
    * The system has symbolic link.

To avoid this security hole, this method applies special preprocess. If `path`
is a directory, this method chown(2) and chmod(2) all removing directories. 
This requires the current process is the owner of the removing whole directory
tree, or is the super user (root).

WARNING: You must ensure that **ALL** parent directories cannot be moved by
other untrusted users.  For example, parent directories should not be owned by
untrusted users, and should not be world writable except when the sticky bit
set.

WARNING: Only the owner of the removing directory tree, or Unix super user
(root) should invoke this method.  Otherwise this method does not work.

For details of this security vulnerability, see Perl's case:

    http://www.cve.mitre.org/cgi-bin/cvename.cgi?name=CAN-2005-0448
    http://www.cve.mitre.org/cgi-bin/cvename.cgi?name=CAN-2004-0452

For fileutils.rb, this vulnerability is reported in [ruby-dev:26100].


# FileUtils::remove_file

(from ruby core)
---
    remove_file(path, force = false)

---

Removes a file `path`. This method ignores StandardError if `force` is true.


# FileUtils::rm

(from ruby core)
---
    rm(list, force: nil, noop: nil, verbose: nil)

---

Remove file(s) specified in `list`.  This method cannot remove directories.
All StandardErrors are ignored when the :force option is set.

    FileUtils.rm %w( junk.txt dust.txt )
    FileUtils.rm Dir.glob('*.so')
    FileUtils.rm 'NotExistFile', :force => true   # never raises exception


# FileUtils::rm_f

(from ruby core)
---
    rm_f(list, noop: nil, verbose: nil)

---

Equivalent to

    #rm(list, :force => true)


# FileUtils::rm_r

(from ruby core)
---
    rm_r(list, force: nil, noop: nil, verbose: nil, secure: nil)

---

remove files `list[0]` `list[1]`... If `list[n]` is a directory, removes its
all contents recursively. This method ignores StandardError when :force option
is set.

    FileUtils.rm_r Dir.glob('/tmp/*')
    FileUtils.rm_r '/', :force => true          #  :-)

WARNING: This method causes local vulnerability if one of parent directories
or removing directory tree are world writable (including /tmp, whose
permission is 1777), and the current process has strong privilege such as Unix
super user (root), and the system has symbolic link.  For secure removing,
read the documentation of #remove_entry_secure carefully, and set :secure
option to true. Default is :secure=>false.

NOTE: This method calls #remove_entry_secure if :secure option is set. See
also #remove_entry_secure.


# FileUtils::rm_rf

(from ruby core)
---
    rm_rf(list, noop: nil, verbose: nil, secure: nil)

---

Equivalent to

    #rm_r(list, :force => true)

WARNING: This method causes local vulnerability. Read the documentation of
#rm_r first.


# FileUtils::rmdir

(from ruby core)
---
    rmdir(list, parents: nil, noop: nil, verbose: nil)

---

Removes one or more directories.

    FileUtils.rmdir 'somedir'
    FileUtils.rmdir %w(somedir anydir otherdir)
    # Does not really remove directory; outputs message.
    FileUtils.rmdir 'somedir', :verbose => true, :noop => true


# FileUtils::rmtree

(from ruby core)
---
    rmtree(list, noop: nil, verbose: nil, secure: nil)

---


# FileUtils::safe_unlink

(from ruby core)
---
    safe_unlink(list, noop: nil, verbose: nil)

---


# FileUtils::symlink

(from ruby core)
---
    symlink(src, dest, force: nil, noop: nil, verbose: nil)

---


# FileUtils::touch

(from ruby core)
---
    touch(list, noop: nil, verbose: nil, mtime: nil, nocreate: nil)

---

Updates modification time (mtime) and access time (atime) of file(s) in
`list`.  Files are created if they don't exist.

    FileUtils.touch 'timestamp'
    FileUtils.touch Dir.glob('*.c');  system 'make'


# FileUtils::uptodate?

(from ruby core)
---
    uptodate?(new, old_list)

---

Returns true if `new` is newer than all `old_list`. Non-existent files are
older than any file.

    FileUtils.uptodate?('hello.o', %w(hello.c hello.h)) or \
        system 'make hello.o'


# FileUtils::collect_method

(from ruby core)
---
    collect_method(opt)

---

Returns an Array of method names which have the option `opt`.

    p FileUtils.collect_method(:preserve) #=> ["cp", "cp_r", "copy", "install"]


# FileUtils::commands

(from ruby core)
---
    commands()

---

Returns an Array of method names which have any options.

    p FileUtils.commands  #=> ["chmod", "cp", "cp_r", "install", ...]


# FileUtils::have_option?

(from ruby core)
---
    have_option?(mid, opt)

---

Returns true if the method `mid` have an option `opt`.

    p FileUtils.have_option?(:cp, :noop)     #=> true
    p FileUtils.have_option?(:rm, :force)    #=> true
    p FileUtils.have_option?(:rm, :preserve) #=> false


# FileUtils::options

(from ruby core)
---
    options()

---

Returns an Array of option names.

    p FileUtils.options  #=> ["noop", "force", "verbose", "preserve", "mode"]


# FileUtils::options_of

(from ruby core)
---
    options_of(mid)

---

Returns an Array of option names of the method `mid`.

    p FileUtils.options_of(:rm)  #=> ["noop", "verbose", "force"]


# FileUtils#apply_mask

(from ruby core)
---
    apply_mask(mode, user_mask, op, mode_mask)

---


# FileUtils#remove_trailing_slash

(from ruby core)
---
    remove_trailing_slash(dir)

---


# FileUtils#cd

(from ruby core)
---
    cd(dir, verbose: nil) { |dir| ... }

---

Changes the current directory to the directory `dir`.

If this method is called with block, resumes to the old working directory
after the block execution finished.

    FileUtils.cd('/', :verbose => true)   # chdir and report it

    FileUtils.cd('/') do  # chdir
      [...]               # do something
    end                   # return to original directory


# FileUtils#chdir

(from ruby core)
---
    chdir(dir, verbose: nil)

---


# FileUtils#chmod

(from ruby core)
---
    chmod(mode, list, noop: nil, verbose: nil)

---

Changes permission bits on the named files (in `list`) to the bit pattern
represented by `mode`.

`mode` is the symbolic and absolute mode can be used.

Absolute mode is
    FileUtils.chmod 0755, 'somecommand'
    FileUtils.chmod 0644, %w(my.rb your.rb his.rb her.rb)
    FileUtils.chmod 0755, '/usr/bin/ruby', :verbose => true

Symbolic mode is
    FileUtils.chmod "u=wrx,go=rx", 'somecommand'
    FileUtils.chmod "u=wr,go=rr", %w(my.rb your.rb his.rb her.rb)
    FileUtils.chmod "u=wrx,go=rx", '/usr/bin/ruby', :verbose => true

"a"
:   is user, group, other mask.
"u"
:   is user's mask.
"g"
:   is group's mask.
"o"
:   is other's mask.
"w"
:   is write permission.
"r"
:   is read permission.
"x"
:   is execute permission.
"X"
:   is execute permission for directories only, must be used in conjunction
    with "+"
"s"
:   is uid, gid.
"t"
:   is sticky bit.
"+"
:   is added to a class given the specified mode.
"-"
:   Is removed from a given class given mode.
"="
:   Is the exact nature of the class will be given a specified mode.



# FileUtils#chmod_R

(from ruby core)
---
    chmod_R(mode, list, noop: nil, verbose: nil, force: nil)

---

Changes permission bits on the named files (in `list`) to the bit pattern
represented by `mode`.

    FileUtils.chmod_R 0700, "/tmp/app.#{$$}"
    FileUtils.chmod_R "u=wrx", "/tmp/app.#{$$}"


# FileUtils#chown

(from ruby core)
---
    chown(user, group, list, noop: nil, verbose: nil)

---

Changes owner and group on the named files (in `list`) to the user `user` and
the group `group`.  `user` and `group` may be an ID (Integer/String) or a name
(String). If `user` or `group` is nil, this method does not change the
attribute.

    FileUtils.chown 'root', 'staff', '/usr/local/bin/ruby'
    FileUtils.chown nil, 'bin', Dir.glob('/usr/bin/*'), :verbose => true


# FileUtils#chown_R

(from ruby core)
---
    chown_R(user, group, list, noop: nil, verbose: nil, force: nil)

---

Changes owner and group on the named files (in `list`) to the user `user` and
the group `group` recursively. `user` and `group` may be an ID
(Integer/String) or a name (String).  If `user` or `group` is nil, this method
does not change the attribute.

    FileUtils.chown_R 'www', 'www', '/var/www/htdocs'
    FileUtils.chown_R 'cvs', 'cvs', '/var/cvs', :verbose => true


# FileUtils#cmp

(from ruby core)
---
    cmp(a, b)

---


# FileUtils#compare_file

(from ruby core)
---
    compare_file(a, b)

---

Returns true if the contents of a file A and a file B are identical.

    FileUtils.compare_file('somefile', 'somefile')  #=> true
    FileUtils.compare_file('/bin/cp', '/bin/mv')    #=> maybe false


# FileUtils#compare_stream

(from ruby core)
---
    compare_stream(a, b)

---

Returns true if the contents of a stream `a` and `b` are identical.


# FileUtils#copy

(from ruby core)
---
    copy(src, dest, preserve: nil, noop: nil, verbose: nil)

---


# FileUtils#copy_entry

(from ruby core)
---
    copy_entry(src, dest, preserve = false, dereference_root = false, remove_destination = false)

---

Copies a file system entry `src` to `dest`. If `src` is a directory, this
method copies its contents recursively. This method preserves file types, c.f.
symlink, directory... (FIFO, device files and etc. are not supported yet)

Both of `src` and `dest` must be a path name. `src` must exist, `dest` must
not exist.

If `preserve` is true, this method preserves owner, group, and modified time. 
Permissions are copied regardless `preserve`.

If `dereference_root` is true, this method dereference tree root.

If `remove_destination` is true, this method removes each destination file
before copy.


# FileUtils#copy_file

(from ruby core)
---
    copy_file(src, dest, preserve = false, dereference = true)

---

Copies file contents of `src` to `dest`. Both of `src` and `dest` must be a
path name.


# FileUtils#copy_stream

(from ruby core)
---
    copy_stream(src, dest)

---

Copies stream `src` to `dest`. `src` must respond to #read(n) and `dest` must
respond to #write(str).


# FileUtils#cp

(from ruby core)
---
    cp(src, dest, preserve: nil, noop: nil, verbose: nil)

---

Copies a file content `src` to `dest`.  If `dest` is a directory, copies `src`
to `dest/src`.

If `src` is a list of files, then `dest` must be a directory.

    FileUtils.cp 'eval.c', 'eval.c.org'
    FileUtils.cp %w(cgi.rb complex.rb date.rb), '/usr/lib/ruby/1.6'
    FileUtils.cp %w(cgi.rb complex.rb date.rb), '/usr/lib/ruby/1.6', :verbose => true
    FileUtils.cp 'symlink', 'dest'   # copy content, "dest" is not a symlink


# FileUtils#cp_r

(from ruby core)
---
    cp_r(src, dest, preserve: nil, noop: nil, verbose: nil, dereference_root: true, remove_destination: nil)

---

Copies `src` to `dest`. If `src` is a directory, this method copies all its
contents recursively. If `dest` is a directory, copies `src` to `dest/src`.

`src` can be a list of files.

    # Installing Ruby library "mylib" under the site_ruby
    FileUtils.rm_r site_ruby + '/mylib', :force
    FileUtils.cp_r 'lib/', site_ruby + '/mylib'

    # Examples of copying several files to target directory.
    FileUtils.cp_r %w(mail.rb field.rb debug/), site_ruby + '/tmail'
    FileUtils.cp_r Dir.glob('*.rb'), '/home/aamine/lib/ruby', :noop => true, :verbose => true

    # If you want to copy all contents of a directory instead of the
    # directory itself, c.f. src/x -> dest/x, src/y -> dest/y,
    # use following code.
    FileUtils.cp_r 'src/.', 'dest'     # cp_r('src', 'dest') makes dest/src,
                                       # but this doesn't.


# FileUtils#getwd

(from ruby core)
---
    getwd()

---


# FileUtils#identical?

(from ruby core)
---
    identical?(a, b)

---


# FileUtils#install

(from ruby core)
---
    install(src, dest, mode: nil, owner: nil, group: nil, preserve: nil, noop: nil, verbose: nil)

---

If `src` is not same as `dest`, copies it and changes the permission mode to
`mode`.  If `dest` is a directory, destination is `dest`/`src`. This method
removes destination before copy.

    FileUtils.install 'ruby', '/usr/local/bin/ruby', :mode => 0755, :verbose => true
    FileUtils.install 'lib.rb', '/usr/local/lib/ruby/site_ruby', :verbose => true


# FileUtils#link

(from ruby core)
---
    link(src, dest, force: nil, noop: nil, verbose: nil)

---


# FileUtils#ln

(from ruby core)
---
    ln(src, dest, force: nil, noop: nil, verbose: nil)

---

**`ln(old, new, **options)`**

Creates a hard link `new` which points to `old`. If `new` already exists and
it is a directory, creates a link `new/old`. If `new` already exists and it is
not a directory, raises Errno::EEXIST. But if :force option is set, overwrite
`new`.

    FileUtils.ln 'gcc', 'cc', :verbose => true
    FileUtils.ln '/usr/bin/emacs21', '/usr/bin/emacs'

**`ln(list, destdir, **options)`**

Creates several hard links in a directory, with each one pointing to the item
in `list`.  If `destdir` is not a directory, raises Errno::ENOTDIR.

    include FileUtils
    cd '/sbin'
    FileUtils.ln %w(cp mv mkdir), '/bin'   # Now /sbin/cp and /bin/cp are linked.


# FileUtils#ln_s

(from ruby core)
---
    ln_s(src, dest, force: nil, noop: nil, verbose: nil)

---

**`ln_s(old, new, **options)`**

Creates a symbolic link `new` which points to `old`.  If `new` already exists
and it is a directory, creates a symbolic link `new/old`.  If `new` already
exists and it is not a directory, raises Errno::EEXIST.  But if :force option
is set, overwrite `new`.

    FileUtils.ln_s '/usr/bin/ruby', '/usr/local/bin/ruby'
    FileUtils.ln_s 'verylongsourcefilename.c', 'c', :force => true

**`ln_s(list, destdir, **options)`**

Creates several symbolic links in a directory, with each one pointing to the
item in `list`.  If `destdir` is not a directory, raises Errno::ENOTDIR.

If `destdir` is not a directory, raises Errno::ENOTDIR.

    FileUtils.ln_s Dir.glob('bin/*.rb'), '/home/aamine/bin'


# FileUtils#ln_sf

(from ruby core)
---
    ln_sf(src, dest, noop: nil, verbose: nil)

---

Same as
    #ln_s(src, dest, :force => true)


# FileUtils#makedirs

(from ruby core)
---
    makedirs(list, mode: nil, noop: nil, verbose: nil)

---


# FileUtils#mkdir

(from ruby core)
---
    mkdir(list, mode: nil, noop: nil, verbose: nil)

---

Creates one or more directories.

    FileUtils.mkdir 'test'
    FileUtils.mkdir %w( tmp data )
    FileUtils.mkdir 'notexist', :noop => true  # Does not really create.
    FileUtils.mkdir 'tmp', :mode => 0700


# FileUtils#mkdir_p

(from ruby core)
---
    mkdir_p(list, mode: nil, noop: nil, verbose: nil)

---

Creates a directory and all its parent directories. For example,

    FileUtils.mkdir_p '/usr/local/lib/ruby'

causes to make following directories, if it does not exist.
    * /usr
    * /usr/local
    * /usr/local/lib
    * /usr/local/lib/ruby

You can pass several directories at a time in a list.


# FileUtils#mkpath

(from ruby core)
---
    mkpath(list, mode: nil, noop: nil, verbose: nil)

---


# FileUtils#move

(from ruby core)
---
    move(src, dest, force: nil, noop: nil, verbose: nil, secure: nil)

---


# FileUtils#mv

(from ruby core)
---
    mv(src, dest, force: nil, noop: nil, verbose: nil, secure: nil)

---

Moves file(s) `src` to `dest`.  If `file` and `dest` exist on the different
disk partition, the file is copied then the original file is removed.

    FileUtils.mv 'badname.rb', 'goodname.rb'
    FileUtils.mv 'stuff.rb', '/notexist/lib/ruby', :force => true  # no error

    FileUtils.mv %w(junk.txt dust.txt), '/home/aamine/.trash/'
    FileUtils.mv Dir.glob('test*.rb'), 'test', :noop => true, :verbose => true


# FileUtils#pwd

(from ruby core)
---
    pwd()

---

Returns the name of the current directory.


# FileUtils#remove

(from ruby core)
---
    remove(list, force: nil, noop: nil, verbose: nil)

---


# FileUtils#remove_dir

(from ruby core)
---
    remove_dir(path, force = false)

---

Removes a directory `dir` and its contents recursively. This method ignores
StandardError if `force` is true.


# FileUtils#remove_entry

(from ruby core)
---
    remove_entry(path, force = false)

---

This method removes a file system entry `path`. `path` might be a regular
file, a directory, or something. If `path` is a directory, remove it
recursively.

See also #remove_entry_secure.


# FileUtils#remove_entry_secure

(from ruby core)
---
    remove_entry_secure(path, force = false)

---

This method removes a file system entry `path`.  `path` shall be a regular
file, a directory, or something.  If `path` is a directory, remove it
recursively.  This method is required to avoid TOCTTOU
(time-of-check-to-time-of-use) local security vulnerability of #rm_r. #rm_r
causes security hole when:

    * Parent directory is world writable (including /tmp).
    * Removing directory tree includes world writable directory.
    * The system has symbolic link.

To avoid this security hole, this method applies special preprocess. If `path`
is a directory, this method chown(2) and chmod(2) all removing directories. 
This requires the current process is the owner of the removing whole directory
tree, or is the super user (root).

WARNING: You must ensure that **ALL** parent directories cannot be moved by
other untrusted users.  For example, parent directories should not be owned by
untrusted users, and should not be world writable except when the sticky bit
set.

WARNING: Only the owner of the removing directory tree, or Unix super user
(root) should invoke this method.  Otherwise this method does not work.

For details of this security vulnerability, see Perl's case:

    http://www.cve.mitre.org/cgi-bin/cvename.cgi?name=CAN-2005-0448
    http://www.cve.mitre.org/cgi-bin/cvename.cgi?name=CAN-2004-0452

For fileutils.rb, this vulnerability is reported in [ruby-dev:26100].


# FileUtils#remove_file

(from ruby core)
---
    remove_file(path, force = false)

---

Removes a file `path`. This method ignores StandardError if `force` is true.


# FileUtils#rm

(from ruby core)
---
    rm(list, force: nil, noop: nil, verbose: nil)

---

Remove file(s) specified in `list`.  This method cannot remove directories.
All StandardErrors are ignored when the :force option is set.

    FileUtils.rm %w( junk.txt dust.txt )
    FileUtils.rm Dir.glob('*.so')
    FileUtils.rm 'NotExistFile', :force => true   # never raises exception


# FileUtils#rm_f

(from ruby core)
---
    rm_f(list, noop: nil, verbose: nil)

---

Equivalent to

    #rm(list, :force => true)


# FileUtils#rm_r

(from ruby core)
---
    rm_r(list, force: nil, noop: nil, verbose: nil, secure: nil)

---

remove files `list[0]` `list[1]`... If `list[n]` is a directory, removes its
all contents recursively. This method ignores StandardError when :force option
is set.

    FileUtils.rm_r Dir.glob('/tmp/*')
    FileUtils.rm_r '/', :force => true          #  :-)

WARNING: This method causes local vulnerability if one of parent directories
or removing directory tree are world writable (including /tmp, whose
permission is 1777), and the current process has strong privilege such as Unix
super user (root), and the system has symbolic link.  For secure removing,
read the documentation of #remove_entry_secure carefully, and set :secure
option to true. Default is :secure=>false.

NOTE: This method calls #remove_entry_secure if :secure option is set. See
also #remove_entry_secure.


# FileUtils#rm_rf

(from ruby core)
---
    rm_rf(list, noop: nil, verbose: nil, secure: nil)

---

Equivalent to

    #rm_r(list, :force => true)

WARNING: This method causes local vulnerability. Read the documentation of
#rm_r first.


# FileUtils#rmdir

(from ruby core)
---
    rmdir(list, parents: nil, noop: nil, verbose: nil)

---

Removes one or more directories.

    FileUtils.rmdir 'somedir'
    FileUtils.rmdir %w(somedir anydir otherdir)
    # Does not really remove directory; outputs message.
    FileUtils.rmdir 'somedir', :verbose => true, :noop => true


# FileUtils#rmtree

(from ruby core)
---
    rmtree(list, noop: nil, verbose: nil, secure: nil)

---


# FileUtils#safe_unlink

(from ruby core)
---
    safe_unlink(list, noop: nil, verbose: nil)

---


# FileUtils#symlink

(from ruby core)
---
    symlink(src, dest, force: nil, noop: nil, verbose: nil)

---


# FileUtils#touch

(from ruby core)
---
    touch(list, noop: nil, verbose: nil, mtime: nil, nocreate: nil)

---

Updates modification time (mtime) and access time (atime) of file(s) in
`list`.  Files are created if they don't exist.

    FileUtils.touch 'timestamp'
    FileUtils.touch Dir.glob('*.c');  system 'make'


# FileUtils#uptodate?

(from ruby core)
---
    uptodate?(new, old_list)

---

Returns true if `new` is newer than all `old_list`. Non-existent files are
older than any file.

    FileUtils.uptodate?('hello.o', %w(hello.c hello.h)) or \
        system 'make hello.o'


(from gem rake-12.0.0)
---
# Constants:

LN_SUPPORTED
:   [not documented]
RUBY
:   Path to the currently running Ruby program


# Instance methods:

    ruby
    safe_ln
    sh
    split_all

# FileUtils#ruby

(from gem rake-12.0.0)
---
    ruby(*args, &block)

---

Run a Ruby interpreter with the given arguments.

Example:
    ruby %{-pe '$_.upcase!' <README}


# FileUtils#safe_ln

(from gem rake-12.0.0)
---
    safe_ln(*args)

---

Attempt to do a normal file link, but fall back to a copy if the link fails.


# FileUtils#sh

(from gem rake-12.0.0)
---
    sh(*cmd, &block)

---

Run the system command `cmd`.  If multiple arguments are given the command is
run directly (without the shell, same semantics as Kernel::exec and
Kernel::system).

It is recommended you use the multiple argument form over interpolating user
input for both usability and security reasons.  With the multiple argument
form you can easily process files with spaces or other shell reserved
characters in them.  With the multiple argument form your rake tasks are not
vulnerable to users providing an argument like `; rm # -rf /`.

If a block is given, upon command completion the block is called with an OK
flag (true on a zero exit status) and a Process::Status object. Without a
block a RuntimeError is raised when the command exits non-zero.

Examples:

    sh 'ls -ltr'

    sh 'ls', 'file with spaces'

    # check exit status after command runs
    sh %{grep pattern file} do |ok, res|
      if ! ok
        puts "pattern not found (status = #{res.exitstatus})"
      end
    end


# FileUtils#split_all

(from gem rake-12.0.0)
---
    split_all(path)

---

Split a file path into individual directory names.

Example:
    split_all("a/b/c") =>  ['a', 'b', 'c']


