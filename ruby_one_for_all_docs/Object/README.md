# Object < BasicObject

---
# Includes:
(from ruby core)
    MakeMakefile
    Kernel

(from gem activesupport-5.1.2)
    ActiveSupport::Tryable
    Java

Rake::DSL (from gem bundler-1.15.3)

(from gem capybara-2.14.4)
    Capybara::DSL
    Capybara::RSpecMatchers
    Capybara::RSpecMatchers
    Capybara::Features
    File
    File

T (from gem yard-0.9.9)

(from ruby core)
---






Object is the default root of all Ruby objects.  Object inherits from
BasicObject which allows creating alternate object hierarchies.  Methods on
Object are available to all classes unless explicitly overridden.

Object mixes in the Kernel module, making the built-in kernel functions
globally accessible.  Although the instance methods of Object are defined by
the Kernel module, we have chosen to document them here for clarity.

When referencing constants in classes inheriting from Object you do not need
to use the full namespace.  For example, referencing `File` inside `YourClass`
will find the top-level File class.

In the descriptions of Object's methods, the parameter *symbol* refers to a
symbol, which is either a quoted string or a Symbol (such as `:name`).
---
# Constants:

ARGF
:   ARGF is a stream designed for use in scripts that process files given as
    command-line arguments or passed in via STDIN.

    See ARGF (the class) for more details.
ARGV
:   ARGV contains the command line arguments used to run ruby.

    A library like OptionParser can be used to process command-line arguments.
Bignum
:   [not documented]
CROSS_COMPILING
:   [not documented]
DATA
:   DATA is a File that contains the data section of the executed file. To
    create a data section use `__END__`:

        $ cat t.rb
        puts DATA.gets
        __END__
        hello world!

        $ ruby t.rb
        hello world!
ENV
:   ENV is a Hash-like accessor for environment variables.

    See ENV (the class) for more details.
FALSE
:   An obsolete alias of `false`
Fixnum
:   [not documented]
NIL
:   An obsolete alias of `nil`
OptParse
:   ## OptionParser

    ### Introduction

    OptionParser is a class for command-line option analysis.  It is much more
    advanced, yet also easier to use, than GetoptLong, and is a more
    Ruby-oriented solution.

    ### Features

    1.  The argument specification and the code to handle it are written in
        the same place.
    2.  It can output an option summary; you don't need to maintain this
        string separately.
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

    OptionParser can be used to automatically generate help for the commands
    you write:

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

    For options that require an argument, option specification strings may
    include an option name in all caps. If an option is used without the
    required argument, an exception will be raised.
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

    OptionParser comes with a few ready-to-use kinds of  type coercion. They
    are:

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
    *   TrueClass --  Accepts '+, yes, true, -, no, false' and defaults as
        `true`
    *   FalseClass -- Same as `TrueClass`, but defaults to `false`
    *   Array -- Strings separated by ',' (e.g. 1,2,3)
    *   Regexp -- Regular expressions. Also includes options.


    We can also add our own coercions, which we will cover soon.

    #### Using Built-in Conversions

    As an example, the built-in `Time` conversion is used. The other built-in
    conversions behave in the same way. OptionParser will attempt to parse the
    argument as a `Time`. If it succeeds, that time will be passed to the
    handler block. Otherwise, an exception will be raised.

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
    specifies which conversion block to call whenever a class is specified.
    The example below uses it to fetch a `User` object before the `on` handler
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

    The following example is a complete Ruby program.  You can run it and see
    the effect of specifying various options.  This is probably the best way
    to learn the features of `optparse`.

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

    The above examples should be enough to learn how to use this class.  If
    you have any questions, file a ticket at http://bugs.ruby-lang.org.
ParseError
:   [not documented]
RUBY_COPYRIGHT
:   The copyright string for ruby
RUBY_DESCRIPTION
:   The full ruby version string, like `ruby -v` prints'
RUBY_ENGINE
:   The engine or interpreter this ruby uses.
RUBY_ENGINE_VERSION
:   The version of the engine or interpreter this ruby uses.
RUBY_PATCHLEVEL
:   The patchlevel for this ruby.  If this is a development build of ruby the
    patchlevel will be -1
RUBY_PLATFORM
:   The platform for this ruby
RUBY_RELEASE_DATE
:   The date this ruby was released
RUBY_REVISION
:   The SVN revision for this ruby.
RUBY_VERSION
:   The running version of ruby
SCRIPT_LINES__
:   When a Hash is assigned to `SCRIPT_LINES__` the contents of files loaded
    after the assignment will be added as an Array of lines with the file name
    as the key.
STDERR
:   Holds the original stderr

STDIN
:   Holds the original stdin

STDOUT
:   Holds the original stdout

Synchronizer
:   A class that provides two-phase lock with a counter.  See Sync_m for
    details.
Synchronizer_m
:   A module that provides a two-phase lock with a counter.
TOPLEVEL_BINDING
:   The Binding of the top level scope
TRUE
:   An obsolete alias of `true`
ThWait
:   This class watches for termination of multiple threads.  Basic
    functionality (wait until specified threads have terminated) can be
    accessed through the class method ThreadsWait::all_waits.  Finer control
    can be gained using instance methods.

    Example:

        ThreadsWait.all_waits(thr1, thr2, ...) do |t|
          STDERR.puts "Thread #{t} has terminated."
        end

        th = ThreadsWait.new(thread1,...)
        th.next_wait # next one to be done
TimeoutError
:   Raised by Timeout#timeout when the block times out.


# Class methods:

    yaml_tag

# Instance methods:

    !~
    <=>
    ===
    =~
    CSV
    DelegateClass
    Digest
    class
    clone
    dclone
    default_src_encoding
    define_singleton_method
    display
    dup
    enum_for
    eql?
    extend
    freeze
    frozen?
    hash
    inspect
    instance_of?
    instance_variable_defined?
    instance_variable_get
    instance_variable_set
    instance_variables
    is_a?
    itself
    kind_of?
    method
    methods
    nil?
    object_id
    private_methods
    protected_methods
    psych_to_yaml
    public_method
    public_methods
    public_send
    remove_instance_variable
    respond_to?
    respond_to_missing?
    send
    singleton_class
    singleton_method
    singleton_methods
    sysread
    taint
    tainted?
    tap
    timeout
    to_enum
    to_s
    to_yaml
    trust
    unknown
    untaint
    untrust
    untrusted?
    xmp

# Object::yaml_tag

(from ruby core)
---
    yaml_tag(url)

---


# Object#!~

(from ruby core)
---
    obj !~ other  -> true or false

---

Returns true if two objects do not match (using the *=~* method), otherwise
false.


# Object#<=>

(from ruby core)
---
    obj <=> other -> 0 or nil

---

Returns 0 if `obj` and `other` are the same object or `obj == other`,
otherwise nil.

The `<=>` is used by various methods to compare objects, for example
Enumerable#sort, Enumerable#max etc.

Your implementation of `<=>` should return one of the following values: -1, 0,
1 or nil. -1 means self is smaller than other. 0 means self is equal to other.
1 means self is bigger than other. Nil means the two values could not be
compared.

When you define `<=>`, you can include Comparable to gain the methods `<=`,
`<`, `==`, `>=`, `>` and `between?`.


# Object#===

(from ruby core)
---
    obj === other   -> true or false

---

Case Equality -- For class Object, effectively the same as calling `#==`, but
typically overridden by descendants to provide meaningful semantics in `case`
statements.


# Object#=~

(from ruby core)
---
    obj =~ other  -> nil

---

Pattern Match---Overridden by descendants (notably `Regexp` and `String`) to
provide meaningful pattern-match semantics.


# Object#CSV

(from ruby core)
---
    CSV(*args, &block)

---

Passes `args` to CSV::instance.

    CSV("CSV,data").read
      #=> [["CSV", "data"]]

If a block is given, the instance is passed the block and the return value
becomes the return value of the block.

    CSV("CSV,data") { |c|
      c.read.any? { |a| a.include?("data") }
    } #=> true

    CSV("CSV,data") { |c|
      c.read.any? { |a| a.include?("zombies") }
    } #=> false


# Object#DelegateClass

(from ruby core)
---
    DelegateClass(superclass)

---

The primary interface to this library.  Use to setup delegation when defining
your class.

    class MyClass < DelegateClass(ClassToDelegateTo) # Step 1
      def initialize
        super(obj_of_ClassToDelegateTo)              # Step 2
      end
    end

Here's a sample of use from Tempfile which is really a File object with a few
special rules about storage location and when the File should be deleted. 
That makes for an almost textbook perfect example of how to use delegation.

    class Tempfile < DelegateClass(File)
      # constant and class member data initialization...

      def initialize(basename, tmpdir=Dir::tmpdir)
        # build up file path/name in var tmpname...

        @tmpfile = File.open(tmpname, File::RDWR|File::CREAT|File::EXCL, 0600)

        # ...

        super(@tmpfile)

        # below this point, all methods of File are supported...
      end

      # ...
    end


# Object#Digest

(from ruby core)
---
    Digest(name) -> digest_subclass

---

Returns a Digest subclass by `name` in a thread-safe manner even when
on-demand loading is involved.

    require 'digest'

    Digest("MD5")
    # => Digest::MD5

    Digest(:SHA256)
    # => Digest::SHA256

    Digest(:Foo)
    # => LoadError: library not found for class Digest::Foo -- digest/foo


# Object#class

(from ruby core)
---
    obj.class    -> class

---

Returns the class of *obj*. This method must always be called with an explicit
receiver, as `class` is also a reserved word in Ruby.

    1.class      #=> Integer
    self.class   #=> Object


# Object#clone

(from ruby core)
---
    obj.clone(freeze: true) -> an_object

---

Produces a shallow copy of *obj*---the instance variables of *obj* are copied,
but not the objects they reference. `clone` copies the frozen (unless :freeze
keyword argument is given with a false value) and tainted state of *obj*. See
also the discussion under `Object#dup`.

    class Klass
       attr_accessor :str
    end
    s1 = Klass.new      #=> #<Klass:0x401b3a38>
    s1.str = "Hello"    #=> "Hello"
    s2 = s1.clone       #=> #<Klass:0x401b3998 @str="Hello">
    s2.str[1,4] = "i"   #=> "i"
    s1.inspect          #=> "#<Klass:0x401b3a38 @str=\"Hi\">"
    s2.inspect          #=> "#<Klass:0x401b3998 @str=\"Hi\">"

This method may have class-specific behavior.  If so, that behavior will be
documented under the #`initialize_copy` method of the class.


# Object#dclone

(from ruby core)
---
    dclone()

---

provides a unified `clone` operation, for REXML::XPathParser to use across
multiple Object types


# Object#default_src_encoding

(from ruby core)
---
    default_src_encoding()

---

DO NOT WRITE ANY MAGIC COMMENT HERE.


# Object#define_singleton_method

(from ruby core)
---
    define_singleton_method(symbol, method) -> symbol
    define_singleton_method(symbol) { block } -> symbol

---

Defines a singleton method in the receiver. The *method* parameter can be a
`Proc`, a `Method` or an `UnboundMethod` object. If a block is specified, it
is used as the method body.

    class A
      class << self
        def class_name
          to_s
        end
      end
    end
    A.define_singleton_method(:who_am_i) do
      "I am: #{class_name}"
    end
    A.who_am_i   # ==> "I am: A"

    guy = "Bob"
    guy.define_singleton_method(:hello) { "#{self}: Hello there!" }
    guy.hello    #=>  "Bob: Hello there!"


# Object#display

(from ruby core)
---
    obj.display(port=$>)    -> nil

---

Prints *obj* on the given port (default `$>`). Equivalent to:

    def display(port=$>)
      port.write self
      nil
    end

For example:

    1.display
    "cat".display
    [ 4, 5, 6 ].display
    puts

*produces:*

    1cat[4, 5, 6]


# Object#dup

(from ruby core)
---
    obj.dup -> an_object

---

Produces a shallow copy of *obj*---the instance variables of *obj* are copied,
but not the objects they reference. `dup` copies the tainted state of *obj*.

This method may have class-specific behavior.  If so, that behavior will be
documented under the #`initialize_copy` method of the class.

### on dup vs clone

In general, `clone` and `dup` may have different semantics in descendant
classes. While `clone` is used to duplicate an object, including its internal
state, `dup` typically uses the class of the descendant object to create the
new instance.

When using #dup, any modules that the object has been extended with will not
be copied.

    class Klass
      attr_accessor :str
    end

    module Foo
      def foo; 'foo'; end
    end

    s1 = Klass.new #=> #<Klass:0x401b3a38>
    s1.extend(Foo) #=> #<Klass:0x401b3a38>
    s1.foo #=> "foo"

    s2 = s1.clone #=> #<Klass:0x401b3a38>
    s2.foo #=> "foo"

    s3 = s1.dup #=> #<Klass:0x401b3a38>
    s3.foo #=> NoMethodError: undefined method `foo' for #<Klass:0x401b3a38>


# Object#enum_for

(from ruby core)
---
    obj.enum_for(method = :each, *args)                -> enum
    obj.enum_for(method = :each, *args){|*args| block} -> enum

---

Creates a new Enumerator which will enumerate by calling `method` on `obj`,
passing `args` if any.

If a block is given, it will be used to calculate the size of the enumerator
without the need to iterate it (see Enumerator#size).

### Examples

    str = "xyz"

    enum = str.enum_for(:each_byte)
    enum.each { |b| puts b }
    # => 120
    # => 121
    # => 122

    # protect an array from being modified by some_method
    a = [1, 2, 3]
    some_method(a.to_enum)

It is typical to call to_enum when defining methods for a generic Enumerable,
in case no block is passed.

Here is such an example, with parameter passing and a sizing block:

    module Enumerable
      # a generic method to repeat the values of any enumerable
      def repeat(n)
        raise ArgumentError, "#{n} is negative!" if n < 0
        unless block_given?
          return to_enum(__method__, n) do # __method__ is :repeat here
            sz = size     # Call size and multiply by n...
            sz * n if sz  # but return nil if size itself is nil
          end
        end
        each do |*val|
          n.times { yield *val }
        end
      end
    end

    %i[hello world].repeat(2) { |w| puts w }
      # => Prints 'hello', 'hello', 'world', 'world'
    enum = (1..14).repeat(3)
      # => returns an Enumerator when called without a block
    enum.first(4) # => [1, 1, 1, 2]
    enum.size # => 42


# Object#eql?

(from ruby core)
---
    obj == other        -> true or false
    obj.equal?(other)   -> true or false
    obj.eql?(other)     -> true or false

---

Equality --- At the `Object` level, `==` returns `true` only if `obj` and
`other` are the same object. Typically, this method is overridden in
descendant classes to provide class-specific meaning.

Unlike `==`, the `equal?` method should never be overridden by subclasses as
it is used to determine object identity (that is, `a.equal?(b)` if and only if
`a` is the same object as `b`):

    obj = "a"
    other = obj.dup

    obj == other      #=> true
    obj.equal? other  #=> false
    obj.equal? obj    #=> true

The `eql?` method returns `true` if `obj` and `other` refer to the same hash
key.  This is used by Hash to test members for equality.  For objects of class
`Object`, `eql?` is synonymous with `==`.  Subclasses normally continue this
tradition by aliasing `eql?` to their overridden `==` method, but there are
exceptions.  `Numeric` types, for example, perform type conversion across
`==`, but not across `eql?`, so:

    1 == 1.0     #=> true
    1.eql? 1.0   #=> false


# Object#extend

(from ruby core)
---
    obj.extend(module, ...)    -> obj

---

Adds to *obj* the instance methods from each module given as a parameter.

    module Mod
      def hello
        "Hello from Mod.\n"
      end
    end

    class Klass
      def hello
        "Hello from Klass.\n"
      end
    end

    k = Klass.new
    k.hello         #=> "Hello from Klass.\n"
    k.extend(Mod)   #=> #<Klass:0x401b3bc8>
    k.hello         #=> "Hello from Mod.\n"


# Object#freeze

(from ruby core)
---
    obj.freeze    -> obj

---

Prevents further modifications to *obj*. A `RuntimeError` will be raised if
modification is attempted. There is no way to unfreeze a frozen object. See
also `Object#frozen?`.

This method returns self.

    a = [ "a", "b", "c" ]
    a.freeze
    a << "z"

*produces:*

    prog.rb:3:in `<<': can't modify frozen Array (RuntimeError)
     from prog.rb:3

Objects of the following classes are always frozen: Integer, Float, Symbol.


# Object#frozen?

(from ruby core)
---
    obj.frozen?    -> true or false

---

Returns the freeze status of *obj*.

    a = [ "a", "b", "c" ]
    a.freeze    #=> ["a", "b", "c"]
    a.frozen?   #=> true


# Object#hash

(from ruby core)
---
    obj.hash    -> integer

---

Generates an Integer hash value for this object.  This function must have the
property that `a.eql?(b)` implies `a.hash == b.hash`.

The hash value is used along with #eql? by the Hash class to determine if two
objects reference the same hash key.  Any hash value that exceeds the capacity
of an Integer will be truncated before being used.

The hash value for an object may not be identical across invocations or
implementations of Ruby.  If you need a stable identifier across Ruby
invocations and implementations you will need to generate one with a custom
method.


# Object#inspect

(from ruby core)
---
    obj.inspect   -> string

---

Returns a string containing a human-readable representation of *obj*. The
default `inspect` shows the object's class name, an encoding of the object id,
and a list of the instance variables and their values (by calling #inspect on
each of them). User defined classes should override this method to provide a
better representation of *obj*.  When overriding this method, it should return
a string whose encoding is compatible with the default external encoding.

    [ 1, 2, 3..4, 'five' ].inspect   #=> "[1, 2, 3..4, \"five\"]"
    Time.new.inspect                 #=> "2008-03-08 19:43:39 +0900"

    class Foo
    end
    Foo.new.inspect                  #=> "#<Foo:0x0300c868>"

    class Bar
      def initialize
        @bar = 1
      end
    end
    Bar.new.inspect                  #=> "#<Bar:0x0300c868 @bar=1>"


# Object#instance_of?

(from ruby core)
---
    obj.instance_of?(class)    -> true or false

---

Returns `true` if *obj* is an instance of the given class. See also
`Object#kind_of?`.

    class A;     end
    class B < A; end
    class C < B; end

    b = B.new
    b.instance_of? A   #=> false
    b.instance_of? B   #=> true
    b.instance_of? C   #=> false


# Object#instance_variable_defined?

(from ruby core)
---
    obj.instance_variable_defined?(symbol)    -> true or false
    obj.instance_variable_defined?(string)    -> true or false

---

Returns `true` if the given instance variable is defined in *obj*. String
arguments are converted to symbols.

    class Fred
      def initialize(p1, p2)
        @a, @b = p1, p2
      end
    end
    fred = Fred.new('cat', 99)
    fred.instance_variable_defined?(:@a)    #=> true
    fred.instance_variable_defined?("@b")   #=> true
    fred.instance_variable_defined?("@c")   #=> false


# Object#instance_variable_get

(from ruby core)
---
    obj.instance_variable_get(symbol)    -> obj
    obj.instance_variable_get(string)    -> obj

---

Returns the value of the given instance variable, or nil if the instance
variable is not set. The `@` part of the variable name should be included for
regular instance variables. Throws a `NameError` exception if the supplied
symbol is not valid as an instance variable name. String arguments are
converted to symbols.

    class Fred
      def initialize(p1, p2)
        @a, @b = p1, p2
      end
    end
    fred = Fred.new('cat', 99)
    fred.instance_variable_get(:@a)    #=> "cat"
    fred.instance_variable_get("@b")   #=> 99


# Object#instance_variable_set

(from ruby core)
---
    obj.instance_variable_set(symbol, obj)    -> obj
    obj.instance_variable_set(string, obj)    -> obj

---

Sets the instance variable named by *symbol* to the given object, thereby
frustrating the efforts of the class's author to attempt to provide proper
encapsulation. The variable does not have to exist prior to this call. If the
instance variable name is passed as a string, that string is converted to a
symbol.

    class Fred
      def initialize(p1, p2)
        @a, @b = p1, p2
      end
    end
    fred = Fred.new('cat', 99)
    fred.instance_variable_set(:@a, 'dog')   #=> "dog"
    fred.instance_variable_set(:@c, 'cat')   #=> "cat"
    fred.inspect                             #=> "#<Fred:0x401b3da8 @a=\"dog\", @b=99, @c=\"cat\">"


# Object#instance_variables

(from ruby core)
---
    obj.instance_variables    -> array

---

Returns an array of instance variable names for the receiver. Note that simply
defining an accessor does not create the corresponding instance variable.

    class Fred
      attr_accessor :a1
      def initialize
        @iv = 3
      end
    end
    Fred.new.instance_variables   #=> [:@iv]


# Object#is_a?

(from ruby core)
---
    obj.is_a?(class)       -> true or false

---

Returns `true` if *class* is the class of *obj*, or if *class* is one of the
superclasses of *obj* or modules included in *obj*.

    module M;    end
    class A
      include M
    end
    class B < A; end
    class C < B; end

    b = B.new
    b.is_a? A          #=> true
    b.is_a? B          #=> true
    b.is_a? C          #=> false
    b.is_a? M          #=> true

    b.kind_of? A       #=> true
    b.kind_of? B       #=> true
    b.kind_of? C       #=> false
    b.kind_of? M       #=> true


# Object#itself

(from ruby core)
---
    obj.itself -> an_object

---

Returns *obj*.

    string = 'my string' #=> "my string"
    string.itself.object_id == string.object_id #=> true


# Object#kind_of?

(from ruby core)
---
    obj.kind_of?(class)    -> true or false

---

Returns `true` if *class* is the class of *obj*, or if *class* is one of the
superclasses of *obj* or modules included in *obj*.

    module M;    end
    class A
      include M
    end
    class B < A; end
    class C < B; end

    b = B.new
    b.is_a? A          #=> true
    b.is_a? B          #=> true
    b.is_a? C          #=> false
    b.is_a? M          #=> true

    b.kind_of? A       #=> true
    b.kind_of? B       #=> true
    b.kind_of? C       #=> false
    b.kind_of? M       #=> true


# Object#method

(from ruby core)
---
    obj.method(sym)    -> method

---

Looks up the named method as a receiver in *obj*, returning a `Method` object
(or raising `NameError`). The `Method` object acts as a closure in *obj*'s
object instance, so instance variables and the value of `self` remain
available.

    class Demo
      def initialize(n)
        @iv = n
      end
      def hello()
        "Hello, @iv = #{@iv}"
      end
    end

    k = Demo.new(99)
    m = k.method(:hello)
    m.call   #=> "Hello, @iv = 99"

    l = Demo.new('Fred')
    m = l.method("hello")
    m.call   #=> "Hello, @iv = Fred"


# Object#methods

(from ruby core)
---
    obj.methods(regular=true)    -> array

---

Returns a list of the names of public and protected methods of *obj*. This
will include all the methods accessible in *obj*'s ancestors. If the optional
parameter is `false`, it returns an array of *obj<i>'s public and protected
singleton methods, the array will not include methods in modules included in
<i>obj*.

    class Klass
      def klass_method()
      end
    end
    k = Klass.new
    k.methods[0..9]    #=> [:klass_method, :nil?, :===,
                       #    :==~, :!, :eql?
                       #    :hash, :<=>, :class, :singleton_class]
    k.methods.length   #=> 56

    k.methods(false)   #=> []
    def k.singleton_method; end
    k.methods(false)   #=> [:singleton_method]

    module M123; def m123; end end
    k.extend M123
    k.methods(false)   #=> [:singleton_method]


# Object#nil?

(from ruby core)
---
    obj.nil?               -> true or false

---

Only the object *nil* responds `true` to `nil?`.

    Object.new.nil?   #=> false
    nil.nil?          #=> true


# Object#object_id

(from ruby core)
---
    obj.__id__       -> integer
    obj.object_id    -> integer

---

Returns an integer identifier for `obj`.

The same number will be returned on all calls to `object_id` for a given
object, and no two active objects will share an id.

Note: that some objects of builtin classes are reused for optimization. This
is the case for immediate values and frozen string literals.

Immediate values are not passed by reference but are passed by value: `nil`,
`true`, `false`, Fixnums, Symbols, and some Floats.

    Object.new.object_id  == Object.new.object_id  # => false
    (21 * 2).object_id    == (21 * 2).object_id    # => true
    "hello".object_id     == "hello".object_id     # => false
    "hi".freeze.object_id == "hi".freeze.object_id # => true


# Object#private_methods

(from ruby core)
---
    obj.private_methods(all=true)   -> array

---

Returns the list of private methods accessible to *obj*. If the *all*
parameter is set to `false`, only those methods in the receiver will be
listed.


# Object#protected_methods

(from ruby core)
---
    obj.protected_methods(all=true)   -> array

---

Returns the list of protected methods accessible to *obj*. If the *all*
parameter is set to `false`, only those methods in the receiver will be
listed.


# Object#psych_to_yaml

(from ruby core)
---
    to_yaml(options = {})

---

Convert an object to YAML.  See Psych.dump for more information on the
available `options`.


# Object#public_method

(from ruby core)
---
    obj.public_method(sym)    -> method

---

Similar to *method*, searches public method only.


# Object#public_methods

(from ruby core)
---
    obj.public_methods(all=true)   -> array

---

Returns the list of public methods accessible to *obj*. If the *all* parameter
is set to `false`, only those methods in the receiver will be listed.


# Object#public_send

(from ruby core)
---
    obj.public_send(symbol [, args...])  -> obj
    obj.public_send(string [, args...])  -> obj

---

Invokes the method identified by *symbol*, passing it any arguments specified.
Unlike send, public_send calls public methods only. When the method is
identified by a string, the string is converted to a symbol.

    1.public_send(:puts, "hello")  # causes NoMethodError


# Object#remove_instance_variable

(from ruby core)
---
    obj.remove_instance_variable(symbol)    -> obj

---

Removes the named instance variable from *obj*, returning that variable's
value.

    class Dummy
      attr_reader :var
      def initialize
        @var = 99
      end
      def remove
        remove_instance_variable(:@var)
      end
    end
    d = Dummy.new
    d.var      #=> 99
    d.remove   #=> 99
    d.var      #=> nil


# Object#respond_to?

(from ruby core)
---
    obj.respond_to?(symbol, include_all=false) -> true or false
    obj.respond_to?(string, include_all=false) -> true or false

---

Returns `true` if *obj* responds to the given method.  Private and protected
methods are included in the search only if the optional second parameter
evaluates to `true`.

If the method is not implemented, as Process.fork on Windows, File.lchmod on
GNU/Linux, etc., false is returned.

If the method is not defined, `respond_to_missing?` method is called and the
result is returned.

When the method name parameter is given as a string, the string is converted
to a symbol.


# Object#respond_to_missing?

(from ruby core)
---
    obj.respond_to_missing?(symbol, include_all) -> true or false
    obj.respond_to_missing?(string, include_all) -> true or false

---

DO NOT USE THIS DIRECTLY.

Hook method to return whether the *obj* can respond to *id* method or not.

When the method name parameter is given as a string, the string is converted
to a symbol.

See #respond_to?, and the example of BasicObject.


# Object#send

(from ruby core)
---
    foo.send(symbol [, args...])       -> obj
    foo.__send__(symbol [, args...])   -> obj
    foo.send(string [, args...])       -> obj
    foo.__send__(string [, args...])   -> obj

---

Invokes the method identified by *symbol*, passing it any arguments specified.
You can use `__send__` if the name `send` clashes with an existing method in
*obj*. When the method is identified by a string, the string is converted to a
symbol.

    class Klass
      def hello(*args)
        "Hello " + args.join(' ')
      end
    end
    k = Klass.new
    k.send :hello, "gentle", "readers"   #=> "Hello gentle readers"


# Object#singleton_class

(from ruby core)
---
    obj.singleton_class    -> class

---

Returns the singleton class of *obj*.  This method creates a new singleton
class if *obj* does not have one.

If *obj* is `nil`, `true`, or `false`, it returns NilClass, TrueClass, or
FalseClass, respectively. If *obj* is an Integer, a Float or a Symbol, it
raises a TypeError.

    Object.new.singleton_class  #=> #<Class:#<Object:0xb7ce1e24>>
    String.singleton_class      #=> #<Class:String>
    nil.singleton_class         #=> NilClass


# Object#singleton_method

(from ruby core)
---
    obj.singleton_method(sym)    -> method

---

Similar to *method*, searches singleton method only.

    class Demo
      def initialize(n)
        @iv = n
      end
      def hello()
        "Hello, @iv = #{@iv}"
      end
    end

    k = Demo.new(99)
    def k.hi
      "Hi, @iv = #{@iv}"
    end
    m = k.singleton_method(:hi)
    m.call   #=> "Hi, @iv = 99"
    m = k.singleton_method(:hello) #=> NameError


# Object#singleton_methods

(from ruby core)
---
    obj.singleton_methods(all=true)    -> array

---

Returns an array of the names of singleton methods for *obj*. If the optional
*all* parameter is true, the list will include methods in modules included in
*obj*. Only public and protected singleton methods are returned.

    module Other
      def three() end
    end

    class Single
      def Single.four() end
    end

    a = Single.new

    def a.one()
    end

    class << a
      include Other
      def two()
      end
    end

    Single.singleton_methods    #=> [:four]
    a.singleton_methods(false)  #=> [:two, :one]
    a.singleton_methods         #=> [:two, :one, :three]


# Object#sysread

(from ruby core)
---
    sysread(io, size)

---

cgi_runner.rb -- CGI launcher.

Author: IPR -- Internet Programming with Ruby -- writers Copyright (c) 2000
TAKAHASHI Masayoshi, GOTOU YUUZOU Copyright (c) 2002 Internet Programming with
Ruby writers. All rights reserved.

$IPR: cgi_runner.rb,v 1.9 2002/09/25 11:33:15 gotoyuzo Exp $


# Object#taint

(from ruby core)
---
    obj.taint -> obj

---

Mark the object as tainted.

Objects that are marked as tainted will be restricted from various built-in
methods. This is to prevent insecure data, such as command-line arguments or
strings read from Kernel#gets, from inadvertently compromising the user's
system.

To check whether an object is tainted, use #tainted?.

You should only untaint a tainted object if your code has inspected it and
determined that it is safe. To do so use #untaint.


# Object#tainted?

(from ruby core)
---
    obj.tainted?    -> true or false

---

Returns true if the object is tainted.

See #taint for more information.


# Object#tap

(from ruby core)
---
    obj.tap{|x|...}    -> obj

---

Yields self to the block, and then returns self. The primary purpose of this
method is to "tap into" a method chain, in order to perform operations on
intermediate results within the chain.

    (1..10)                .tap {|x| puts "original: #{x.inspect}"}
      .to_a                .tap {|x| puts "array: #{x.inspect}"}
      .select {|x| x%2==0} .tap {|x| puts "evens: #{x.inspect}"}
      .map {|x| x*x}       .tap {|x| puts "squares: #{x.inspect}"}


# Object#timeout

(from ruby core)
---
    timeout(*args, &block)

---


# Object#to_enum

(from ruby core)
---
    obj.to_enum(method = :each, *args)                 -> enum
    obj.to_enum(method = :each, *args) {|*args| block} -> enum

---

Creates a new Enumerator which will enumerate by calling `method` on `obj`,
passing `args` if any.

If a block is given, it will be used to calculate the size of the enumerator
without the need to iterate it (see Enumerator#size).

### Examples

    str = "xyz"

    enum = str.enum_for(:each_byte)
    enum.each { |b| puts b }
    # => 120
    # => 121
    # => 122

    # protect an array from being modified by some_method
    a = [1, 2, 3]
    some_method(a.to_enum)

It is typical to call to_enum when defining methods for a generic Enumerable,
in case no block is passed.

Here is such an example, with parameter passing and a sizing block:

    module Enumerable
      # a generic method to repeat the values of any enumerable
      def repeat(n)
        raise ArgumentError, "#{n} is negative!" if n < 0
        unless block_given?
          return to_enum(__method__, n) do # __method__ is :repeat here
            sz = size     # Call size and multiply by n...
            sz * n if sz  # but return nil if size itself is nil
          end
        end
        each do |*val|
          n.times { yield *val }
        end
      end
    end

    %i[hello world].repeat(2) { |w| puts w }
      # => Prints 'hello', 'hello', 'world', 'world'
    enum = (1..14).repeat(3)
      # => returns an Enumerator when called without a block
    enum.first(4) # => [1, 1, 1, 2]
    enum.size # => 42


# Object#to_s

(from ruby core)
---
    obj.to_s    -> string

---

Returns a string representing *obj*. The default `to_s` prints the object's
class and an encoding of the object id. As a special case, the top-level
object that is the initial execution context of Ruby programs returns
``main''.


# Object#to_yaml

(from ruby core)
---
    to_yaml(options = {})

---


# Object#trust

(from ruby core)
---
    obj.trust    -> obj

---

Deprecated method that is equivalent to #untaint.


# Object#unknown

(from ruby core)
---
    unknown()

---

# mathn

mathn serves to make mathematical operations more precise in Ruby and to
integrate other mathematical standard libraries.

Without mathn:

    3 / 2 => 1 # Integer

With mathn:

    3 / 2 => 3/2 # Rational

mathn keeps value in exact terms.

Without mathn:

    20 / 9 * 3 * 14 / 7 * 3 / 2 # => 18

With mathn:

    20 / 9 * 3 * 14 / 7 * 3 / 2 # => 20

When you require 'mathn', the libraries for Prime, CMath, Matrix and Vector
are also loaded.

## Copyright

Author: Keiju ISHITSUKA (SHL Japan Inc.)


# Object#untaint

(from ruby core)
---
    obj.untaint    -> obj

---

Removes the tainted mark from the object.

See #taint for more information.


# Object#untrust

(from ruby core)
---
    obj.untrust -> obj

---

Deprecated method that is equivalent to #taint.


# Object#untrusted?

(from ruby core)
---
    obj.untrusted?    -> true or false

---

Deprecated method that is equivalent to #tainted?.


# Object#xmp

(from ruby core)
---
    xmp(exps, bind = nil)

---

A convenience method that's only available when the you require the IRB::XMP
standard library.

Creates a new XMP object, using the given expressions as the `exps` parameter,
and optional binding as `bind` or uses the top-level binding. Then evaluates
the given expressions using the `:XMP` prompt mode.

For example:

    require 'irb/xmp'
    ctx = binding
    xmp 'foo = "bar"', ctx
    #=> foo = "bar"
      #==>"bar"
    ctx.eval 'foo'
    #=> "bar"

See XMP.new for more information.


(from gem activesupport-5.1.2)
---











---
# Instance methods:

    acts_like?
    blank?
    deep_dup
    duplicable?
    html_safe?
    in?
    instance_values
    instance_variable_names
    presence
    presence_in
    present?
    to_param
    to_query
    try
    try!
    unescape
    with_options

# Object#acts_like?

(from gem activesupport-5.1.2)
---
    acts_like?(duck)

---

A duck-type assistant method. For example, Active Support extends Date to
define an `acts_like_date?` method, and extends Time to define
`acts_like_time?`. As a result, we can do `x.acts_like?(:time)` and
`x.acts_like?(:date)` to do duck-type-safe comparisons, since classes that we
want to act like Time simply need to define an `acts_like_time?` method.


# Object#blank?

(from gem activesupport-5.1.2)
---
    blank?()

---

An object is blank if it's false, empty, or a whitespace string. For example,
`false`, '', '   ', `nil`, [], and {} are all blank.

This simplifies

    !address || address.empty?

to

    address.blank?

@return [true, false]


# Object#deep_dup

(from gem activesupport-5.1.2)
---
    deep_dup()

---

Returns a deep copy of object if it's duplicable. If it's not duplicable,
returns `self`.

    object = Object.new
    dup    = object.deep_dup
    dup.instance_variable_set(:@a, 1)

    object.instance_variable_defined?(:@a) # => false
    dup.instance_variable_defined?(:@a)    # => true


# Object#duplicable?

(from gem activesupport-5.1.2)
---
    duplicable?()

---

Can you safely dup this object?

False for method objects; true otherwise.


# Object#html_safe?

(from gem activesupport-5.1.2)
---
    html_safe?()

---


# Object#in?

(from gem activesupport-5.1.2)
---
    in?(another_object)

---

Returns true if this object is included in the argument. Argument must be any
object which responds to `#include?`. Usage:

    characters = ["Konata", "Kagami", "Tsukasa"]
    "Konata".in?(characters) # => true

This will throw an `ArgumentError` if the argument doesn't respond to
`#include?`.


# Object#instance_values

(from gem activesupport-5.1.2)
---
    instance_values()

---

Returns a hash with string keys that maps instance variable names without "@"
to their corresponding values.

    class C
      def initialize(x, y)
        @x, @y = x, y
      end
    end

    C.new(0, 1).instance_values # => {"x" => 0, "y" => 1}


# Object#instance_variable_names

(from gem activesupport-5.1.2)
---
    instance_variable_names()

---

Returns an array of instance variable names as strings including "@".

    class C
      def initialize(x, y)
        @x, @y = x, y
      end
    end

    C.new(0, 1).instance_variable_names # => ["@y", "@x"]


# Object#presence

(from gem activesupport-5.1.2)
---
    presence()

---

Returns the receiver if it's present otherwise returns `nil`.
`object.presence` is equivalent to

    object.present? ? object : nil

For example, something like

    state   = params[:state]   if params[:state].present?
    country = params[:country] if params[:country].present?
    region  = state || country || 'US'

becomes

    region = params[:state].presence || params[:country].presence || 'US'

@return [Object]


# Object#presence_in

(from gem activesupport-5.1.2)
---
    presence_in(another_object)

---

Returns the receiver if it's included in the argument otherwise returns `nil`.
Argument must be any object which responds to `#include?`. Usage:

    params[:bucket_type].presence_in %w( project calendar )

This will throw an `ArgumentError` if the argument doesn't respond to
`#include?`.

@return [Object]


# Object#present?

(from gem activesupport-5.1.2)
---
    present?()

---

An object is present if it's not blank.

@return [true, false]


# Object#to_param

(from gem activesupport-5.1.2)
---
    to_param()

---

Alias of `to_s`.


# Object#to_query

(from gem activesupport-5.1.2)
---
    to_query(key)

---

Converts an object into a string suitable for use as a URL query string, using
the given `key` as the param name.


# Object#try

(from gem activesupport-5.1.2)
---
    try(*a, &b)

---

Invokes the public method whose name goes as first argument just like
`public_send` does, except that if the receiver does not respond to it the
call returns `nil` rather than raising an exception.

This method is defined to be able to write

    @person.try(:name)

instead of

    @person.name if @person

`try` calls can be chained:

    @person.try(:spouse).try(:name)

instead of

    @person.spouse.name if @person && @person.spouse

`try` will also return `nil` if the receiver does not respond to the method:

    @person.try(:non_existing_method) # => nil

instead of

    @person.non_existing_method if @person.respond_to?(:non_existing_method) # => nil

`try` returns `nil` when called on `nil` regardless of whether it responds to
the method:

    nil.try(:to_i) # => nil, rather than 0

Arguments and blocks are forwarded to the method if invoked:

    @posts.try(:each_slice, 2) do |a, b|
      ...
    end

The number of arguments in the signature must match. If the object responds to
the method the call is attempted and `ArgumentError` is still raised in case
of argument mismatch.

If `try` is called without arguments it yields the receiver to a given block
unless it is `nil`:

    @person.try do |p|
      ...
    end

You can also call try with a block without accepting an argument, and the
block will be instance_eval'ed instead:

    @person.try { upcase.truncate(50) }

Please also note that `try` is defined on `Object`. Therefore, it won't work
with instances of classes that do not have `Object` among their ancestors,
like direct subclasses of `BasicObject`.


# Object#try!

(from gem activesupport-5.1.2)
---
    try!(*a, &b)

---

Same as #try, but raises a `NoMethodError` exception if the receiver is not
`nil` and does not implement the tried method.

    "a".try!(:upcase) # => "A"
    nil.try!(:upcase) # => nil
    123.try!(:upcase) # => NoMethodError: undefined method `upcase' for 123:Integer


# Object#unescape

(from gem activesupport-5.1.2)
---
    unescape(str, escaped = /%[a-fA-F\d]{2}/)

---


# Object#with_options

(from gem activesupport-5.1.2)
---
    with_options(options, &block)

---

An elegant way to factor duplication out of options passed to a series of
method calls. Each method called in the block, with the block variable as the
receiver, will have its options merged with the default `options` hash
provided. Each method called on the block variable must take an options hash
as its final argument.

Without `with_options`, this code contains duplication:

    class Account < ActiveRecord::Base
      has_many :customers, dependent: :destroy
      has_many :products,  dependent: :destroy
      has_many :invoices,  dependent: :destroy
      has_many :expenses,  dependent: :destroy
    end

Using `with_options`, we can remove the duplication:

    class Account < ActiveRecord::Base
      with_options dependent: :destroy do |assoc|
        assoc.has_many :customers
        assoc.has_many :products
        assoc.has_many :invoices
        assoc.has_many :expenses
      end
    end

It can also be used with an explicit receiver:

    I18n.with_options locale: user.locale, scope: 'newsletter' do |i18n|
      subject i18n.t :subject
      body    i18n.t :body, user_name: user.name
    end

When you don't pass an explicit receiver, it executes the whole block in
merging options context:

    class Account < ActiveRecord::Base
      with_options dependent: :destroy do
        has_many :customers
        has_many :products
        has_many :invoices
        has_many :expenses
      end
    end

`with_options` can also be nested since the call is forwarded to its receiver.

NOTE: Each nesting level will merge inherited defaults in addition to their
own.

    class Post < ActiveRecord::Base
      with_options if: :persisted?, length: { minimum: 50 } do
        validates :content, if: -> { content.present? }
      end
    end

The code is equivalent to:

    validates :content, length: { minimum: 50 }, if: -> { content.present? }

Hence the inherited default for `if` key is ignored.

NOTE: You cannot call class methods implicitly inside of with_options. You can
access these methods using the class name instead:

    class Phone < ActiveRecord::Base
      enum phone_number_type: [home: 0, office: 1, mobile: 2]

      with_options presence: true do
        validates :phone_number_type, inclusion: { in: Phone.phone_number_types.keys }
      end
    end


(from gem bindex-0.5.0)
---
# Instance methods:

    bindings

# Object#bindings

(from gem bindex-0.5.0)
---
    bindings()

---


(from gem builder-3.2.3)
---
Same as above, except in Object.
---
# Class methods:

    blank_slate_method_added
    find_hidden_method
    method_added

# Object::blank_slate_method_added

(from gem builder-3.2.3)
---
    blank_slate_method_added(name)

---


# Object::find_hidden_method

(from gem builder-3.2.3)
---
    find_hidden_method(name)

---


# Object::method_added

(from gem builder-3.2.3)
---
    method_added(name)

---

Detect method additions to Object and remove them in the BlankSlate class.


(from gem bundler-1.15.3)
---
# Instance methods:

    gemfile
    namespace
    rake_namespace
    task

# Object#gemfile

(from gem bundler-1.15.3)
---
    gemfile(install = false, options = {}, &gemfile)

---

Allows for declaring a Gemfile inline in a ruby script, optionally installing
any gems that aren't already installed on the user's system.

@note Every gem that is specified in this 'Gemfile' will be `require`d, as if
    the user had manually called `Bundler.require`. To avoid a requested gem
    being automatically required, add the `:require => false` option to the
    `gem` dependency declaration.

@param install [Boolean] whether gems that aren't already installed on the
    user's system should be installed.
    Defaults to `false`.

@param gemfile [Proc]    a block that is evaluated as a `Gemfile`.

@example Using an inline Gemfile

    #!/usr/bin/env ruby

    require 'bundler/inline'

    gemfile do
      source 'https://rubygems.org'
      gem 'json', require: false
      gem 'nap', require: 'rest'
      gem 'cocoapods', '~> 0.34.1'
    end

    puts Pod::VERSION # => "0.34.4"


# Object#namespace

(from gem bundler-1.15.3)
---
    namespace(name)

---


(from gem thor-0.19.4)
---
    namespace(name)

---


# Object#rake_namespace

(from gem bundler-1.15.3)
---
    rake_namespace(name)

---


(from gem thor-0.19.4)
---
    rake_namespace(name)

---


# Object#task

(from gem bundler-1.15.3)
---
    task(*)

---


(from gem thor-0.19.4)
---
    task(*)

---


(from gem capybara-2.14.4)
---
# Class methods:

    feature

# Instance methods:

    bases
    be_an_invalid_element_error
    should_be_on
    visit_host_links
    win_size

# Object::feature

(from gem capybara-2.14.4)
---
    feature(*args, &block)

---


# Object#bases

(from gem capybara-2.14.4)
---
    bases()

---


# Object#be_an_invalid_element_error

(from gem capybara-2.14.4)
---
    be_an_invalid_element_error(session)

---


# Object#should_be_on

(from gem capybara-2.14.4)
---
    should_be_on(server_index, path="/host", scheme="http")

---


# Object#visit_host_links

(from gem capybara-2.14.4)
---
    visit_host_links()

---


# Object#win_size

(from gem capybara-2.14.4)
---
    win_size()

---


(from gem jbuilder-2.7.0)
---
# Constants:

Jbuilder
:   [not documented]


# Instance methods:

    _cache_key
    _fragment_name_with_digest
    _is_active_model?
    _partial_options?
    _render_active_model_partial
    _render_explicit_partial
    _set_inline_partial

# Object#_cache_key

(from gem jbuilder-2.7.0)
---
    _cache_key(key, options)

---


# Object#_fragment_name_with_digest

(from gem jbuilder-2.7.0)
---
    _fragment_name_with_digest(key, options)

---


# Object#_is_active_model?

(from gem jbuilder-2.7.0)
---
    _is_active_model?(object)

---


# Object#_partial_options?

(from gem jbuilder-2.7.0)
---
    _partial_options?(options)

---


# Object#_render_active_model_partial

(from gem jbuilder-2.7.0)
---
    _render_active_model_partial(object)

---


# Object#_render_explicit_partial

(from gem jbuilder-2.7.0)
---
    _render_explicit_partial(name_or_options, locals = {})

---


# Object#_set_inline_partial

(from gem jbuilder-2.7.0)
---
    _set_inline_partial(name, object, options)

---


(from gem minitest-5.10.3)
---
Object extensions for Minitest::Mock.
---
# Instance methods:

    stub

# Object#stub

(from gem minitest-5.10.3)
---
    stub(name, val_or_callable, *block_args) { |self| ... }

---

Add a temporary stubbed method replacing `name` for the duration of the
`block`. If `val_or_callable` responds to #call, then it returns the result of
calling it, otherwise returns the value as-is. If stubbed method yields a
block, `block_args` will be passed along. Cleans up the stub at the end of the
`block`. The method `name` must exist before stubbing.

    def test_stale_eh
      obj_under_test = Something.new
      refute obj_under_test.stale?

      Time.stub :now, Time.at(0) do
        assert obj_under_test.stale?
      end
    end


(from gem nokogiri-1.8.0)
---
# Instance methods:

    Nokogiri

# Object#Nokogiri

(from gem nokogiri-1.8.0)
---
    Nokogiri(*args, &block)

---

Parser a document contained in `args`.  Nokogiri will try to guess what type
of document you are attempting to parse.  For more information, see
Nokogiri.parse

To specify the type of document, use Nokogiri.XML or Nokogiri.HTML.


(from gem pg-0.21.0)
---
# Constants:

PGError
:   [not documented]
PGconn
:   The PostgreSQL connection class. The interface for this class is based on
    [libpq](http://www.postgresql.org/docs/9.2/interactive/libpq.html), the C
    application programmer's interface to PostgreSQL. Some familiarity with
    libpq is recommended, but not necessary.

    For example, to send query to the database on the localhost:

        require 'pg'
        conn = PG::Connection.open(:dbname => 'test')
        res = conn.exec_params('SELECT $1 AS a, $2 AS b, $3 AS c', [1, 2, nil])
        # Equivalent to:
        #  res  = conn.exec('SELECT 1 AS a, 2 AS b, NULL AS c')

    See the PG::Result class for information on working with the results of a
    query.
PGresult
:   The class to represent the query result tuples (rows). An instance of this
    class is created as the result of every query. You may need to invoke the
    #clear method of the instance when finished with the result for better
    memory performance.

    Example:
        require 'pg'
        conn = PG.connect(:dbname => 'test')
        res  = conn.exec('SELECT 1 AS a, 2 AS b, NULL AS c')
        res.getvalue(0,0) # '1'
        res[0]['b']       # '2'
        res[0]['c']       # nil


# Instance methods:

    camelize

# Object#camelize

(from gem pg-0.21.0)
---
    camelize(lower_case_and_underscored_word)

---


(from gem puma-3.9.1)
---
# Instance methods:

    start

# Object#start

(from gem puma-3.9.1)
---
    start(launcher)

---


(from gem test-unit-3.2.3)
---
# Instance methods:

    run_test

# Object#run_test

(from gem test-unit-3.2.3)
---
    run_test()

---

experimental. It is for "ruby -rtest-unit -e run_test test/test_*.rb". Is this
API OK or dirty?


(from gem thor-0.19.4)
---
# Instance methods:

    namespace
    rake_namespace
    task

# Object#namespace

(from gem bundler-1.15.3)
---
    namespace(name)

---


(from gem thor-0.19.4)
---
    namespace(name)

---


# Object#rake_namespace

(from gem bundler-1.15.3)
---
    rake_namespace(name)

---


(from gem thor-0.19.4)
---
    rake_namespace(name)

---


# Object#task

(from gem bundler-1.15.3)
---
    task(*)

---


(from gem thor-0.19.4)
---
    task(*)

---


(from gem yard-0.9.9)
---
# Constants:

RUBY18
:   Keep track of Ruby version for compatibility code @deprecated Use
    {YARD.ruby18?} or {YARD.ruby19?} instead.
RUBY19
:   [not documented]


# Instance methods:

    P
    __p
    init
    javascripts
    log
    search
    stylesheets

# Object#P

(from gem yard-0.9.9)
---
    P(namespace, name = nil, type = nil)

---

Shortcut for creating a YARD::CodeObjects::Proxy via a path

@see YARD::CodeObjects::Proxy @see YARD::Registry.resolve


# Object#__p

(from gem yard-0.9.9)
---
    __p(path)

---

@private


# Object#init

(from gem yard-0.9.9)
---
    init()

---


# Object#javascripts

(from gem yard-0.9.9)
---
    javascripts()

---


# Object#log

(from gem yard-0.9.9)
---
    log()

---

The global {YARD::Logger} instance

@return [YARD::Logger] the global {YARD::Logger} instance @see YARD::Logger


# Object#search

(from gem yard-0.9.9)
---
    search()

---


# Object#stylesheets

(from gem yard-0.9.9)
---
    stylesheets()

---


---
Also found in:
    gem rake-12.0.0
    gem sqlite3-1.3.13
    gem tilt-2.0.8
    gem web-console-3.5.1

