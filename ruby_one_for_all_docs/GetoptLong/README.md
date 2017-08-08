# GetoptLong < Object

(from ruby core)
---
The GetoptLong class allows you to parse command line options similarly to the
GNU getopt_long() C library call. Note, however, that GetoptLong is a pure
Ruby implementation.

GetoptLong allows for POSIX-style options like `--file` as well as single
letter options like `-f`

The empty option `--` (two minus symbols) is used to end option processing.
This can be particularly important if options have optional arguments.

Here is a simple example of usage:

    require 'getoptlong'

    opts = GetoptLong.new(
      [ '--help', '-h', GetoptLong::NO_ARGUMENT ],
      [ '--repeat', '-n', GetoptLong::REQUIRED_ARGUMENT ],
      [ '--name', GetoptLong::OPTIONAL_ARGUMENT ]
    )

    dir = nil
    name = nil
    repetitions = 1
    opts.each do |opt, arg|
      case opt
        when '--help'
          puts <<-EOF
    hello [OPTION] ... DIR

    -h, --help:
       show help

    --repeat x, -n x:
       repeat x times

    --name [name]:
       greet user by name, if name not supplied default is John

    DIR: The directory in which to issue the greeting.
          EOF
        when '--repeat'
          repetitions = arg.to_i
        when '--name'
          if arg == ''
            name = 'John'
          else
            name = arg
          end
      end
    end

    if ARGV.length != 1
      puts "Missing dir argument (try --help)"
      exit 0
    end

    dir = ARGV.shift

    Dir.chdir(dir)
    for i in (1..repetitions)
      print "Hello"
      if name
        print ", #{name}"
      end
      puts
    end

Example command line:

    hello -n 6 --name -- /tmp
---
# Constants:

ARGUMENT_FLAGS
:   Argument flags.
ORDERINGS
:   Orderings.
STATUS_TERMINATED
:   [not documented]


# Class methods:

    new

# Instance methods:

    each
    each_option
    error
    error?
    error_message
    get
    get_option
    ordering
    ordering=
    quiet
    quiet?
    set_error
    set_options
    terminate
    terminated?

# Attributes:

    attr_accessor quiet
    attr_accessor quiet?
    attr_reader error
    attr_reader error?
    attr_reader ordering

# GetoptLong::new

(from ruby core)
---
    new(*arguments)

---

Set up option processing.

The options to support are passed to new() as an array of arrays. Each
sub-array contains any number of String option names which carry the same
meaning, and one of the following flags:

GetoptLong::NO_ARGUMENT
:   Option does not take an argument.

GetoptLong::REQUIRED_ARGUMENT
:   Option always takes an argument.

GetoptLong::OPTIONAL_ARGUMENT
:   Option may or may not take an argument.


The first option name is considered to be the preferred (canonical) name.
Other than that, the elements of each sub-array can be in any order.


# GetoptLong#each

(from ruby core)
---
    each() { |option_name, option_argument| ... }

---

Iterator version of `get'.

The block is called repeatedly with two arguments: The first is the option
name. The second is the argument which followed it (if any). Example:
('--opt', 'value')

The option name is always converted to the first (preferred) name given in the
original options to GetoptLong.new.


# GetoptLong#each_option

(from ruby core)
---
    each_option()

---

`each_option' is an alias of `each'.


# GetoptLong#error_message

(from ruby core)
---
    error_message()

---

Return the appropriate error message in POSIX-defined format. If no error has
occurred, returns nil.


# GetoptLong#get

(from ruby core)
---
    get()

---

Get next option name and its argument, as an Array of two elements.

The option name is always converted to the first (preferred) name given in the
original options to GetoptLong.new.

Example: ['--option', 'value']

Returns nil if the processing is complete (as determined by
STATUS_TERMINATED).


# GetoptLong#get_option

(from ruby core)
---
    get_option()

---

`get_option' is an alias of `get'.


# GetoptLong#ordering=

(from ruby core)
---
    ordering=(ordering)

---

Set the handling of the ordering of options and arguments. A RuntimeError is
raised if option processing has already started.

The supplied value must be a member of GetoptLong::ORDERINGS. It alters the
processing of options as follows:

**REQUIRE_ORDER** :

Options are required to occur before non-options.

Processing of options ends as soon as a word is encountered that has not been
preceded by an appropriate option flag.

For example, if -a and -b are options which do not take arguments, parsing
command line arguments of '-a one -b two' would result in 'one', '-b', 'two'
being left in ARGV, and only ('-a', '') being processed as an option/arg pair.

This is the default ordering, if the environment variable POSIXLY_CORRECT is
set. (This is for compatibility with GNU getopt_long.)

**PERMUTE** :

Options can occur anywhere in the command line parsed. This is the default
behavior.

Every sequence of words which can be interpreted as an option (with or without
argument) is treated as an option; non-option words are skipped.

For example, if -a does not require an argument and -b optionally takes an
argument, parsing '-a one -b two three' would result in ('-a','') and ('-b',
'two') being processed as option/arg pairs, and 'one','three' being left in
ARGV.

If the ordering is set to PERMUTE but the environment variable POSIXLY_CORRECT
is set, REQUIRE_ORDER is used instead. This is for compatibility with GNU
getopt_long.

**RETURN_IN_ORDER** :

All words on the command line are processed as options. Words not preceded by
a short or long option flag are passed as arguments with an option of ''
(empty string).

For example, if -a requires an argument but -b does not, a command line of '-a
one -b two three' would result in option/arg pairs of ('-a', 'one') ('-b',
''), ('', 'two'), ('', 'three') being processed.


# GetoptLong#set_options

(from ruby core)
---
    set_options(*arguments)

---

Set options. Takes the same argument as GetoptLong.new.

Raises a RuntimeError if option processing has already started.


# GetoptLong#terminate

(from ruby core)
---
    terminate()

---

Explicitly terminate option processing.


# GetoptLong#terminated?

(from ruby core)
---
    terminated?()

---

Returns true if option processing has terminated, false otherwise.


# GetoptLong#set_error

(from ruby core)
---
    set_error(type, message)

---

Set an error (a protected method).


