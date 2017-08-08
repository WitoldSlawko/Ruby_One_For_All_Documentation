# RDocTask < Rake::TaskLib

(from ruby core)
---
RDoc::Task creates the following rake tasks to generate and clean up RDoc
output:

rdoc
:   Main task for this RDoc task.

clobber_rdoc
:   Delete all the rdoc files.  This target is automatically added to the main
    clobber target.

rerdoc
:   Rebuild the rdoc files from scratch, even if they are not out of date.


Simple Example:

    require 'rdoc/task'

    RDoc::Task.new do |rdoc|
      rdoc.main = "README.rdoc"
      rdoc.rdoc_files.include("README.rdoc", "lib   /*.rb")
    end

The `rdoc` object passed to the block is an RDoc::Task object. See the
attributes list for the RDoc::Task class for available customization options.

## Specifying different task names

You may wish to give the task a different name, such as if you are generating
two sets of documentation.  For instance, if you want to have a development
set of documentation including private methods:

    require 'rdoc/task'

    RDoc::Task.new :rdoc_dev do |rdoc|
      rdoc.main = "README.doc"
      rdoc.rdoc_files.include("README.rdoc", "lib/   *.rb")
      rdoc.options << "--all"
    end

The tasks would then be named :*rdoc_dev*, :clobber_*rdoc_dev*, and
:re*rdoc_dev*.

If you wish to have completely different task names, then pass a Hash as first
argument. With the `:rdoc`, `:clobber_rdoc` and `:rerdoc` options, you can
customize the task names to your liking.

For example:

    require 'rdoc/task'

    RDoc::Task.new(:rdoc => "rdoc", :clobber_rdoc => "rdoc:clean",
                   :rerdoc => "rdoc:force")

This will create the tasks `:rdoc`, `:rdoc:clean` and `:rdoc:force`.
---
# Class methods:

    new

# Instance methods:

    before_running_rdoc
    check_names
    clobber_task_description
    clobber_task_name
    defaults
    define
    external
    generator
    main
    markup
    name
    option_list
    options
    rdoc_dir
    rdoc_files
    rdoc_target
    rdoc_task_description
    rdoc_task_name
    rerdoc_task_description
    rerdoc_task_name
    template
    title

# Attributes:

    attr_accessor external
    attr_accessor generator
    attr_accessor main
    attr_accessor markup
    attr_accessor name
    attr_accessor options
    attr_accessor rdoc_dir
    attr_accessor rdoc_files
    attr_accessor template
    attr_accessor title

# RDocTask::new

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
### Implementation from Task
---
    new(name = :rdoc) { |self| ... }

---

Create an RDoc task with the given name. See the RDoc::Task class overview for
documentation.


# RDocTask#before_running_rdoc

(from ruby core)
### Implementation from Task
---
    before_running_rdoc(&block)

---

The block passed to this method will be called just before running the RDoc
generator. It is allowed to modify RDoc::Task attributes inside the block.


# RDocTask#check_names

(from ruby core)
### Implementation from Task
---
    check_names(names)

---

Ensures that `names` only includes names for the :rdoc, :clobber_rdoc and
:rerdoc.  If other names are given an ArgumentError is raised.


# RDocTask#clobber_task_description

(from ruby core)
### Implementation from Task
---
    clobber_task_description()

---

Task description for the clobber rdoc task or its renamed equivalent


# RDocTask#defaults

(from ruby core)
### Implementation from Task
---
    defaults()

---

Sets default task values


# RDocTask#define

(from ruby core)
### Implementation from Task
---
    define()

---

Create the tasks defined by this task lib.


# RDocTask#option_list

(from ruby core)
### Implementation from Task
---
    option_list()

---

List of options that will be supplied to RDoc


# RDocTask#rdoc_task_description

(from ruby core)
### Implementation from Task
---
    rdoc_task_description()

---

Task description for the rdoc task or its renamed equivalent


# RDocTask#rerdoc_task_description

(from ruby core)
### Implementation from Task
---
    rerdoc_task_description()

---

Task description for the rerdoc task or its renamed description


# RDocTask#clobber_task_name

(from ruby core)
### Implementation from Task
---
    clobber_task_name()

---


# RDocTask#rdoc_target

(from ruby core)
### Implementation from Task
---
    rdoc_target()

---


# RDocTask#rdoc_task_name

(from ruby core)
### Implementation from Task
---
    rdoc_task_name()

---


# RDocTask#rerdoc_task_name

(from ruby core)
### Implementation from Task
---
    rerdoc_task_name()

---


