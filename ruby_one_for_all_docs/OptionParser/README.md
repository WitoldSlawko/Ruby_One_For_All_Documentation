# OptionParser < Object

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

# OptionParser::accept

(from ruby core)
---
    accept(*args, &blk)

---

See #accept.


# OptionParser::each_const

(from ruby core)
---
    each_const(path, base = ::Object)

---


# OptionParser::getopts

(from ruby core)
---
    getopts(*args)

---

See #getopts.


# OptionParser::inc

(from ruby core)
---
    inc(arg, default = nil)

---

Returns an incremented value of `default` according to `arg`.


# OptionParser::new

(from ruby core)
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



# OptionParser::reject

(from ruby core)
---
    reject(*args, &blk)

---

See #reject.


# OptionParser::search_const

(from ruby core)
---
    search_const(klass, name) { |klass, cname, const| ... }

---


# OptionParser::show_version

(from ruby core)
---
    show_version(*pkgs)

---


# OptionParser::terminate

(from ruby core)
---
    terminate(arg = nil)

---


# OptionParser::top

(from ruby core)
---
    top()

---


# OptionParser::with

(from ruby core)
---
    with(*args, &block)

---

Initializes a new instance and evaluates the optional block in context of the
instance. Arguments `args` are passed to #new, see there for description of
parameters.

This method is **deprecated**, its behavior corresponds to the older #new
method.


# OptionParser#abort

(from ruby core)
---
    abort(mesg = $!)

---


# OptionParser#accept

(from ruby core)
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


# OptionParser#banner

(from ruby core)
---

Heading banner preceding summary.


# OptionParser#base

(from ruby core)
---
    base()

---

Subject of #on_tail.


# OptionParser#candidate

(from ruby core)
---
    candidate(word)

---


# OptionParser#def_head_option

(from ruby core)
---
    def_head_option(*opts, &block)

---


# OptionParser#def_option

(from ruby core)
---
    def_option(*opts, &block)

---


# OptionParser#def_tail_option

(from ruby core)
---
    def_tail_option(*opts, &block)

---


# OptionParser#define

(from ruby core)
---
    define(*opts, &block)

---


# OptionParser#define_by_keywords

(from ruby core)
---
    define_by_keywords(options, meth, **opts)

---


# OptionParser#define_head

(from ruby core)
---
    define_head(*opts, &block)

---


# OptionParser#define_tail

(from ruby core)
---
    define_tail(*opts, &block)

---


# OptionParser#environment

(from ruby core)
---
    environment(env = File.basename($0, '.*'))

---

Parses environment variable `env` or its uppercase with splitting like a
shell.

`env` defaults to the basename of the program.


# OptionParser#getopts

(from ruby core)
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


# OptionParser#help

(from ruby core)
---
    help()

---

Returns option summary string.


# OptionParser#inc

(from ruby core)
---
    inc(*args)

---


# OptionParser#load

(from ruby core)
---
    load(filename = nil)

---

Loads options from file names as `filename`. Does nothing when the file is not
present. Returns whether successfully loaded.

`filename` defaults to basename of the program without suffix in a directory
~/.options.


# OptionParser#make_switch

(from ruby core)
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



# OptionParser#new

(from ruby core)
---
    new() { |self| ... }

---

Pushes a new List.


# OptionParser#on

(from ruby core)
---
    on(*opts, &block)

---

Add option switch and handler. See #make_switch for an explanation of
parameters.


# OptionParser#on_head

(from ruby core)
---
    on_head(*opts, &block)

---

Add option switch like with #on, but at head of summary.


# OptionParser#on_tail

(from ruby core)
---
    on_tail(*opts, &block)

---

Add option switch like with #on, but at tail of summary.


# OptionParser#order

(from ruby core)
---
    order(*argv, into: nil, &nonopt)

---

Parses command line arguments `argv` in order. When a block is given, each
non-option argument is yielded.

Returns the rest of `argv` left unparsed.


# OptionParser#order!

(from ruby core)
---
    order!(argv = default_argv, into: nil, &nonopt)

---

Same as #order, but removes switches destructively. Non-option arguments
remain in `argv`.


# OptionParser#parse

(from ruby core)
---
    parse(*argv, into: nil)

---

Parses command line arguments `argv` in order when environment variable
POSIXLY_CORRECT is set, and in permutation mode otherwise.


# OptionParser#parse!

(from ruby core)
---
    parse!(argv = default_argv, into: nil)

---

Same as #parse, but removes switches destructively. Non-option arguments
remain in `argv`.


# OptionParser#permute

(from ruby core)
---
    permute(*argv, into: nil)

---

Parses command line arguments `argv` in permutation mode and returns list of
non-option arguments.


# OptionParser#permute!

(from ruby core)
---
    permute!(argv = default_argv, into: nil)

---

Same as #permute, but removes switches destructively. Non-option arguments
remain in `argv`.


# OptionParser#program_name

(from ruby core)
---

Program name to be emitted in error message and default banner, defaults to
$0.


# OptionParser#reject

(from ruby core)
---
    reject(*args, &blk)

---

Directs to reject specified class argument.

`t`
:   Argument class specifier, any object including Class.


    reject(t)


# OptionParser#release

(from ruby core)
---

Release code


# OptionParser#remove

(from ruby core)
---
    remove()

---

Removes the last List.


# OptionParser#separator

(from ruby core)
---
    separator(string)

---

Add separator in summary.


# OptionParser#summarize

(from ruby core)
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



# OptionParser#terminate

(from ruby core)
---
    terminate(arg = nil)

---

Terminates option parsing. Optional parameter `arg` is a string pushed back to
be the first non-option argument.


# OptionParser#to_a

(from ruby core)
---
    to_a()

---

Returns option summary list.


# OptionParser#to_s

(from ruby core)
---
    to_s()

---


# OptionParser#top

(from ruby core)
---
    top()

---

Subject of #on / #on_head, #accept / #reject


# OptionParser#ver

(from ruby core)
---
    ver()

---

Returns version string from program_name, version and release.


# OptionParser#version

(from ruby core)
---

Version


# OptionParser#warn

(from ruby core)
---
    warn(mesg = $!)

---

#### (Uses superclass method RDoc::AnyMethod: Kernel#warn)
---


# OptionParser#complete

(from ruby core)
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



# OptionParser#notwice

(from ruby core)
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



# OptionParser#search

(from ruby core)
---
    search(id, key) { |k| ... }

---

Searches `key` in @stack for `id` hash and returns or yields the result.


# OptionParser#visit

(from ruby core)
---
    visit(id, *args, &block)

---

Traverses @stack, sending each element method `id` with `args` and `block`.


