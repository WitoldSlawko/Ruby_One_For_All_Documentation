# OptParse < Object

(from ruby core)
---
## OptionParser

### Introduction

OptionParser is a class for command-line option analysis.  It is much more
advanced, yet also easier to use, than GetoptLong, and is a more Ruby-oriented
solution.

### Features

1.  The argument specification and the code to handle it are written in the
    same place.
2.  It can output an option summary; you don't need to maintain this string
    separately.
3.  Optional and mandatory arguments are specified very gracefully.
4.  Arguments can be automatically converted to a specified class.
5.  Arguments can be restricted to a certain set.


All of these features are demonstrated in the examples below.  See
#make_switch for full documentation.

### Minimal example

    require 'optparse'

    options = {}
    OptionParser.new do |opts|
      opts.banner = "Usage: example.rb [options]"

      opts.on("-v", "--[no-]verbose", "Run verbosely") do |v|
        options[:verbose] = v
      end
    end.parse!

    p options
    p ARGV

### Generating Help

OptionParser can be used to automatically generate help for the commands you
write:

    require 'optparse'

    Options = Struct.new(:name)

    class Parser
      def self.parse(options)
        args = Options.new("world")

        opt_parser = OptionParser.new do |opts|
          opts.banner = "Usage: example.rb [options]"

          opts.on("-nNAME", "--name=NAME", "Name to say hello to") do |n|
            args.name = n
          end

          opts.on("-h", "--help", "Prints this help") do
            puts opts
            exit
          end
        end

        opt_parser.parse!(options)
        return args
      end
    end
    options = Parser.parse %w[--help]

    #=>
       # Usage: example.rb [options]
       #     -n, --name=NAME                  Name to say hello to
       #     -h, --help                       Prints this help

### Required Arguments

For options that require an argument, option specification strings may include
an option name in all caps. If an option is used without the required
argument, an exception will be raised.
    require 'optparse'

    options = {}
    OptionParser.new do |parser|
      parser.on("-r", "--require LIBRARY",
                "Require the LIBRARY before executing your script") do |lib|
        puts "You required #{lib}!"
      end
    end.parse!

Used:

    bash-3.2$ ruby optparse-test.rb -r
    optparse-test.rb:9:in `<main>': missing argument: -r (OptionParser::MissingArgument)
    bash-3.2$ ruby optparse-test.rb -r my-library
    You required my-library!

### Type Coercion

OptionParser supports the ability to coerce command line arguments into
objects for us.

OptionParser comes with a few ready-to-use kinds of  type coercion. They are:

*   Date  -- Anything accepted by `Date.parse`
*   DateTime -- Anything accepted by `DateTime.parse`
*   Time -- Anything accepted by `Time.httpdate` or `Time.parse`
*   URI  -- Anything accepted by `URI.parse`
*   Shellwords -- Anything accepted by `Shellwords.shellwords`
*   String -- Any non-empty string
*   Integer -- Any integer. Will convert octal. (e.g. 124, -3, 040)
*   Float -- Any float. (e.g. 10, 3.14, -100E+13)
*   Numeric -- Any integer, float, or rational (1, 3.4, 1/3)
*   DecimalInteger -- Like `Integer`, but no octal format.
*   OctalInteger -- Like `Integer`, but no decimal format.
*   DecimalNumeric -- Decimal integer or float.
*   TrueClass --  Accepts '+, yes, true, -, no, false' and defaults as `true`
*   FalseClass -- Same as `TrueClass`, but defaults to `false`
*   Array -- Strings separated by ',' (e.g. 1,2,3)
*   Regexp -- Regular expressions. Also includes options.


We can also add our own coercions, which we will cover soon.

#### Using Built-in Conversions

As an example, the built-in `Time` conversion is used. The other built-in
conversions behave in the same way. OptionParser will attempt to parse the
argument as a `Time`. If it succeeds, that time will be passed to the handler
block. Otherwise, an exception will be raised.

    require 'optparse'
    require 'optparse/time'
    OptionParser.new do |parser|
      parser.on("-t", "--time [TIME]", Time, "Begin execution at given time") do |time|
        p time
      end
    end.parse!

Used:
    bash-3.2$ ruby optparse-test.rb  -t nonsense
    ... invalid argument: -t nonsense (OptionParser::InvalidArgument)
    from ... time.rb:5:in `block in <top (required)>'
    from optparse-test.rb:31:in `<main>'
    bash-3.2$ ruby optparse-test.rb  -t 10-11-12
    2010-11-12 00:00:00 -0500
    bash-3.2$ ruby optparse-test.rb  -t 9:30
    2014-08-13 09:30:00 -0400

#### Creating Custom Conversions

The `accept` method on OptionParser may be used to create converters. It
specifies which conversion block to call whenever a class is specified. The
example below uses it to fetch a `User` object before the `on` handler
receives it.

    require 'optparse'

    User = Struct.new(:id, :name)

    def find_user id
      not_found = ->{ raise "No User Found for id #{id}" }
      [ User.new(1, "Sam"),
        User.new(2, "Gandalf") ].find(not_found) do |u|
        u.id == id
      end
    end

    op = OptionParser.new
    op.accept(User) do |user_id|
      find_user user_id.to_i
    end

    op.on("--user ID", User) do |user|
      puts user
    end

    op.parse!

output:
    bash-3.2$ ruby optparse-test.rb --user 1
    #<struct User id=1, name="Sam">
    bash-3.2$ ruby optparse-test.rb --user 2
    #<struct User id=2, name="Gandalf">
    bash-3.2$ ruby optparse-test.rb --user 3
    optparse-test.rb:15:in `block in find_user': No User Found for id 3 (RuntimeError)

### Complete example

The following example is a complete Ruby program.  You can run it and see the
effect of specifying various options.  This is probably the best way to learn
the features of `optparse`.

    require 'optparse'
    require 'optparse/time'
    require 'ostruct'
    require 'pp'

    class OptparseExample
      Version = '1.0.0'

      CODES = %w[iso-2022-jp shift_jis euc-jp utf8 binary]
      CODE_ALIASES = { "jis" => "iso-2022-jp", "sjis" => "shift_jis" }

      class ScriptOptions
        attr_accessor :library, :inplace, :encoding, :transfer_type,
                      :verbose, :extension, :delay, :time, :record_separator,
                      :list

        def initialize
          self.library = []
          self.inplace = false
          self.encoding = "utf8"
          self.transfer_type = :auto
          self.verbose = false
        end

        def define_options(parser)
          parser.banner = "Usage: example.rb [options]"
          parser.separator ""
          parser.separator "Specific options:"

          # add additional options
          perform_inplace_option(parser)
          delay_execution_option(parser)
          execute_at_time_option(parser)
          specify_record_separator_option(parser)
          list_example_option(parser)
          specify_encoding_option(parser)
          optional_option_argument_with_keyword_completion_option(parser)
          boolean_verbose_option(parser)

          parser.separator ""
          parser.separator "Common options:"
          # No argument, shows at tail.  This will print an options summary.
          # Try it and see!
          parser.on_tail("-h", "--help", "Show this message") do
            puts parser
            exit
          end
          # Another typical switch to print the version.
          parser.on_tail("--version", "Show version") do
            puts Version
            exit
          end
        end

        def perform_inplace_option(parser)
          # Specifies an optional option argument
          parser.on("-i", "--inplace [EXTENSION]",
                    "Edit ARGV files in place",
                    "(make backup if EXTENSION supplied)") do |ext|
            self.inplace = true
            self.extension = ext || ''
            self.extension.sub!(/\A\.?(?=.)/, ".")  # Ensure extension begins with dot.
          end
        end

        def delay_execution_option(parser)
          # Cast 'delay' argument to a Float.
          parser.on("--delay N", Float, "Delay N seconds before executing") do |n|
            self.delay = n
          end
        end

        def execute_at_time_option(parser)
          # Cast 'time' argument to a Time object.
          parser.on("-t", "--time [TIME]", Time, "Begin execution at given time") do |time|
            self.time = time
          end
        end

        def specify_record_separator_option(parser)
          # Cast to octal integer.
          parser.on("-F", "--irs [OCTAL]", OptionParser::OctalInteger,
                    "Specify record separator (default \\0)") do |rs|
            self.record_separator = rs
          end
        end

        def list_example_option(parser)
          # List of arguments.
          parser.on("--list x,y,z", Array, "Example 'list' of arguments") do |list|
            self.list = list
          end
        end

        def specify_encoding_option(parser)
          # Keyword completion.  We are specifying a specific set of arguments (CODES
          # and CODE_ALIASES - notice the latter is a Hash), and the user may provide
          # the shortest unambiguous text.
          code_list = (CODE_ALIASES.keys + CODES).join(', ')
          parser.on("--code CODE", CODES, CODE_ALIASES, "Select encoding",
                    "(#{code_list})") do |encoding|
            self.encoding = encoding
          end
        end

        def optional_option_argument_with_keyword_completion_option(parser)
          # Optional '--type' option argument with keyword completion.
          parser.on("--type [TYPE]", [:text, :binary, :auto],
                    "Select transfer type (text, binary, auto)") do |t|
            self.transfer_type = t
          end
        end

        def boolean_verbose_option(parser)
          # Boolean switch.
          parser.on("-v", "--[no-]verbose", "Run verbosely") do |v|
            self.verbose = v
          end
        end
      end

      #
      # Return a structure describing the options.
      #
      def parse(args)
        # The options specified on the command line will be collected in
        # *options*.

        @options = ScriptOptions.new
        @args = OptionParser.new do |parser|
          @options.define_options(parser)
          parser.parse!(args)
        end
        @options
      end

      attr_reader :parser, :options
    end  # class OptparseExample

    example = OptparseExample.new
    options = example.parse(ARGV)
    pp options # example.options
    pp ARGV

### Shell Completion

For modern shells (e.g. bash, zsh, etc.), you can use shell completion for
command line options.

### Further documentation

The above examples should be enough to learn how to use this class.  If you
have any questions, file a ticket at http://bugs.ruby-lang.org.

---
# Constants:

DecimalInteger
:   Decimal integer format, to be converted to Integer.
DecimalNumeric
:   Decimal integer/float number format, to be converted to Integer for
    integer format, Float for float format.
OctalInteger
:   Ruby/C like octal/hexadecimal/binary integer format, to be converted to
    Integer.


# Class methods:

    accept
    each_const
    getopts
    inc
    new
    reject
    search_const
    show_version
    terminate
    top
    with

# Instance methods:

    abort
    accept
    banner
    base
    candidate
    complete
    def_head_option
    def_option
    def_tail_option
    default_argv
    define
    define_by_keywords
    define_head
    define_tail
    environment
    getopts
    help
    inc
    load
    make_switch
    new
    notwice
    on
    on_head
    on_tail
    order
    order!
    parse
    parse!
    permute
    permute!
    program_name
    reject
    release
    remove
    search
    separator
    set_banner
    set_program_name
    set_summary_indent
    set_summary_width
    summarize
    summary_indent
    summary_width
    terminate
    to_a
    to_s
    top
    ver
    version
    visit
    warn

# Attributes:

    attr_accessor default_argv
    attr_accessor set_summary_indent
    attr_accessor set_summary_width
    attr_accessor summary_indent
    attr_accessor summary_width
    attr_writer banner
    attr_writer program_name
    attr_writer release
    attr_writer set_banner
    attr_writer set_program_name
    attr_writer version

# OptParse::accept

(from ruby core)
### Implementation from OptionParser
---
    accept(*args, &blk)

---

See #accept.


# OptParse::each_const

(from ruby core)
### Implementation from OptionParser
---
    each_const(path, base = ::Object)

---


# OptParse::getopts

(from ruby core)
### Implementation from OptionParser
---
    getopts(*args)

---

See #getopts.


# OptParse::inc

(from ruby core)
### Implementation from OptionParser
---
    inc(arg, default = nil)

---

Returns an incremented value of `default` according to `arg`.


# OptParse::new

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
### Implementation from OptionParser
---
    new(banner = nil, width = 32, indent = ' ' * 4) { |self| ... }

---

Initializes the instance and yields itself if called with a block.

`banner`
:   Banner message.
`width`
:   Summary width.
`indent`
:   Summary indent.



# OptParse::reject

(from ruby core)
### Implementation from OptionParser
---
    reject(*args, &blk)

---

See #reject.


# OptParse::search_const

(from ruby core)
### Implementation from OptionParser
---
    search_const(klass, name) { |klass, cname, const| ... }

---


# OptParse::show_version

(from ruby core)
### Implementation from OptionParser
---
    show_version(*pkgs)

---


# OptParse::terminate

(from ruby core)
### Implementation from OptionParser
---
    terminate(arg = nil)

---


# OptParse::top

(from ruby core)
### Implementation from OptionParser
---
    top()

---


# OptParse::with

(from ruby core)
### Implementation from OptionParser
---
    with(*args, &block)

---

Initializes a new instance and evaluates the optional block in context of the
instance. Arguments `args` are passed to #new, see there for description of
parameters.

This method is **deprecated**, its behavior corresponds to the older #new
method.


# OptParse#abort

(from ruby core)
### Implementation from Kernel
---
    abort
    Kernel::abort([msg])
    Process.abort([msg])

---

Terminate execution immediately, effectively by calling `Kernel.exit(false)`.
If *msg* is given, it is written to STDERR prior to terminating.


(from ruby core)
### Implementation from OptionParser
---
    abort(mesg = $!)

---


# OptParse#accept

(from ruby core)
### Implementation from OptionParser
---
    accept(*args, &blk)

---

Directs to accept specified class `t`. The argument string is passed to the
block in which it should be converted to the desired class.

`t`
:   Argument class specifier, any object including Class.
`pat`
:   Pattern for argument, defaults to `t` if it responds to match.


    accept(t, pat, &block)


# OptParse#banner

(from ruby core)
### Implementation from OptionParser
---

Heading banner preceding summary.


# OptParse#base

(from ruby core)
### Implementation from OptionParser
---
    base()

---

Subject of #on_tail.


# OptParse#candidate

(from ruby core)
### Implementation from OptionParser
---
    candidate(word)

---


# OptParse#def_head_option

(from ruby core)
### Implementation from OptionParser
---
    def_head_option(*opts, &block)

---


# OptParse#def_option

(from ruby core)
### Implementation from OptionParser
---
    def_option(*opts, &block)

---


# OptParse#def_tail_option

(from ruby core)
### Implementation from OptionParser
---
    def_tail_option(*opts, &block)

---


# OptParse#define

(from ruby core)
### Implementation from OptionParser
---
    define(*opts, &block)

---


# OptParse#define_by_keywords

(from ruby core)
### Implementation from OptionParser
---
    define_by_keywords(options, meth, **opts)

---


# OptParse#define_head

(from ruby core)
### Implementation from OptionParser
---
    define_head(*opts, &block)

---


# OptParse#define_tail

(from ruby core)
### Implementation from OptionParser
---
    define_tail(*opts, &block)

---


# OptParse#environment

(from ruby core)
### Implementation from OptionParser
---
    environment(env = File.basename($0, '.*'))

---

Parses environment variable `env` or its uppercase with splitting like a
shell.

`env` defaults to the basename of the program.


# OptParse#getopts

(from ruby core)
### Implementation from OptionParser
---
    getopts(*args)

---

Wrapper method for getopts.rb.

    params = ARGV.getopts("ab:", "foo", "bar:", "zot:Z;zot option")
    # params[:a] = true   # -a
    # params[:b] = "1"    # -b1
    # params[:foo] = "1"  # --foo
    # params[:bar] = "x"  # --bar x
    # params[:zot] = "z"  # --zot Z


# OptParse#help

(from ruby core)
### Implementation from OptionParser
---
    help()

---

Returns option summary string.


# OptParse#inc

(from ruby core)
### Implementation from OptionParser
---
    inc(*args)

---


# OptParse#load

(from ruby core)
### Implementation from Kernel
---
    load(filename, wrap=false)   -> true

---

Loads and executes the Ruby program in the file *filename*. If the filename
does not resolve to an absolute path, the file is searched for in the library
directories listed in `$:`. If the optional *wrap* parameter is `true`, the
loaded script will be executed under an anonymous module, protecting the
calling program's global namespace. In no circumstance will any local
variables in the loaded file be propagated to the loading environment.


(from ruby core)
### Implementation from OptionParser
---
    load(filename = nil)

---

Loads options from file names as `filename`. Does nothing when the file is not
present. Returns whether successfully loaded.

`filename` defaults to basename of the program without suffix in a directory
~/.options.


# OptParse#make_switch

(from ruby core)
### Implementation from OptionParser
---
    make_switch(opts, block = nil)

---

Creates an OptionParser::Switch from the parameters. The parsed argument value
is passed to the given block, where it can be processed.

See at the beginning of OptionParser for some full examples.

`opts` can include the following elements:

Argument style:
:   One of the following:
        :NONE, :REQUIRED, :OPTIONAL

Argument pattern:
:   Acceptable option argument format, must be pre-defined with
    OptionParser.accept or OptionParser#accept, or Regexp. This can appear
    once or assigned as String if not present, otherwise causes an
    ArgumentError. Examples:
        Float, Time, Array

Possible argument values:
:   Hash or Array.
        [:text, :binary, :auto]
        %w[iso-2022-jp shift_jis euc-jp utf8 binary]
        { "jis" => "iso-2022-jp", "sjis" => "shift_jis" }

Long style switch:
:   Specifies a long style switch which takes a mandatory, optional or no
    argument. It's a string of the following form:
        "--switch=MANDATORY" or "--switch MANDATORY"
        "--switch[=OPTIONAL]"
        "--switch"

Short style switch:
:   Specifies short style switch which takes a mandatory, optional or no
    argument. It's a string of the following form:
        "-xMANDATORY"
        "-x[OPTIONAL]"
        "-x"

    There is also a special form which matches character range (not full set
    of regular expression):
        "-[a-z]MANDATORY"
        "-[a-z][OPTIONAL]"
        "-[a-z]"

Argument style and description:
:   Instead of specifying mandatory or optional arguments directly in the
    switch parameter, this separate parameter can be used.
        "=MANDATORY"
        "=[OPTIONAL]"

Description:
:   Description string for the option.
        "Run verbosely"

Handler:
:   Handler for the parsed argument value. Either give a block or pass a Proc
    or Method as an argument.



# OptParse#new

(from ruby core)
### Implementation from OptionParser
---
    new() { |self| ... }

---

Pushes a new List.


# OptParse#on

(from ruby core)
### Implementation from OptionParser
---
    on(*opts, &block)

---

Add option switch and handler. See #make_switch for an explanation of
parameters.


# OptParse#on_head

(from ruby core)
### Implementation from OptionParser
---
    on_head(*opts, &block)

---

Add option switch like with #on, but at head of summary.


# OptParse#on_tail

(from ruby core)
### Implementation from OptionParser
---
    on_tail(*opts, &block)

---

Add option switch like with #on, but at tail of summary.


# OptParse#order

(from ruby core)
### Implementation from OptionParser
---
    order(*argv, into: nil, &nonopt)

---

Parses command line arguments `argv` in order. When a block is given, each
non-option argument is yielded.

Returns the rest of `argv` left unparsed.


# OptParse#order!

(from ruby core)
### Implementation from OptionParser
---
    order!(argv = default_argv, into: nil, &nonopt)

---

Same as #order, but removes switches destructively. Non-option arguments
remain in `argv`.


# OptParse#parse

(from ruby core)
### Implementation from OptionParser
---
    parse(*argv, into: nil)

---

Parses command line arguments `argv` in order when environment variable
POSIXLY_CORRECT is set, and in permutation mode otherwise.


# OptParse#parse!

(from ruby core)
### Implementation from OptionParser
---
    parse!(argv = default_argv, into: nil)

---

Same as #parse, but removes switches destructively. Non-option arguments
remain in `argv`.


# OptParse#permute

(from ruby core)
### Implementation from OptionParser
---
    permute(*argv, into: nil)

---

Parses command line arguments `argv` in permutation mode and returns list of
non-option arguments.


# OptParse#permute!

(from ruby core)
### Implementation from OptionParser
---
    permute!(argv = default_argv, into: nil)

---

Same as #permute, but removes switches destructively. Non-option arguments
remain in `argv`.


# OptParse#program_name

(from ruby core)
### Implementation from OptionParser
---

Program name to be emitted in error message and default banner, defaults to
$0.


# OptParse#reject

(from ruby core)
### Implementation from OptionParser
---
    reject(*args, &blk)

---

Directs to reject specified class argument.

`t`
:   Argument class specifier, any object including Class.


    reject(t)


# OptParse#release

(from ruby core)
### Implementation from OptionParser
---

Release code


# OptParse#remove

(from ruby core)
### Implementation from OptionParser
---
    remove()

---

Removes the last List.


# OptParse#separator

(from ruby core)
### Implementation from OptionParser
---
    separator(string)

---

Add separator in summary.


# OptParse#summarize

(from ruby core)
### Implementation from OptionParser
---
    summarize(to = [], width = @summary_width, max = width - 1, indent = @summary_indent, &blk)

---

Puts option summary into `to` and returns `to`. Yields each line if a block is
given.

`to`
:   Output destination, which must have method <<. Defaults to [].
`width`
:   Width of left side, defaults to @summary_width.
`max`
:   Maximum length allowed for left side, defaults to `width` - 1.
`indent`
:   Indentation, defaults to @summary_indent.



# OptParse#terminate

(from ruby core)
### Implementation from OptionParser
---
    terminate(arg = nil)

---

Terminates option parsing. Optional parameter `arg` is a string pushed back to
be the first non-option argument.


# OptParse#to_a

(from ruby core)
### Implementation from OptionParser
---
    to_a()

---

Returns option summary list.


# OptParse#to_s

(from ruby core)
### Implementation from Object
---
    obj.to_s    -> string

---

Returns a string representing *obj*. The default `to_s` prints the object's
class and an encoding of the object id. As a special case, the top-level
object that is the initial execution context of Ruby programs returns
``main''.


(from ruby core)
### Implementation from OptionParser
---
    to_s()

---


# OptParse#top

(from ruby core)
### Implementation from OptionParser
---
    top()

---

Subject of #on / #on_head, #accept / #reject


# OptParse#ver

(from ruby core)
### Implementation from OptionParser
---
    ver()

---

Returns version string from program_name, version and release.


# OptParse#version

(from ruby core)
### Implementation from OptionParser
---

Version


# OptParse#warn

(from ruby core)
### Implementation from Kernel
---
    warn(msg, ...)   -> nil

---

Displays each of the given messages followed by a record separator on STDERR
unless warnings have been disabled (for example with the `-W0` flag).

      warn("warning 1", "warning 2")

    <em>produces:</em>

      warning 1
      warning 2


(from ruby core)
### Implementation from OptionParser
---
    warn(mesg = $!)

---

#### (Uses superclass method RDoc::AnyMethod: Kernel#warn)
---


# OptParse#complete

(from ruby core)
### Implementation from OptionParser
---
    complete(typ, opt, icase = false, *pat)

---

Completes shortened long style option switch and returns pair of canonical
switch and switch descriptor OptionParser::Switch.

`typ`
:   Searching table.
`opt`
:   Searching key.
`icase`
:   Search case insensitive if true.
`pat`
:   Optional pattern for completion.



# OptParse#notwice

(from ruby core)
### Implementation from OptionParser
---
    notwice(obj, prv, msg)

---

Checks if an argument is given twice, in which case an ArgumentError is
raised. Called from OptionParser#switch only.

`obj`
:   New argument.
`prv`
:   Previously specified argument.
`msg`
:   Exception message.



# OptParse#search

(from gem yard-0.9.9)
### Implementation from Object
---
    search()

---


(from ruby core)
### Implementation from OptionParser
---
    search(id, key) { |k| ... }

---

Searches `key` in @stack for `id` hash and returns or yields the result.


# OptParse#visit

(from ruby core)
### Implementation from OptionParser
---
    visit(id, *args, &block)

---

Traverses @stack, sending each element method `id` with `args` and `block`.


