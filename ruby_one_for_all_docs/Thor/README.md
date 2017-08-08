# Thor < Object

---
# Includes:
Thor::Base (from gem thor-0.19.4)

(from gem thor-0.19.4)
---



























---
# Constants:

AmbiguousTaskError
:   [not documented]
DynamicTask
:   A dynamic command that handles method missing scenarios.
HELP_MAPPINGS
:   Shortcuts for help.
HiddenTask
:   A command that is hidden in help messages but still invocable.
TEMPLATE_EXTNAME
:   [not documented]
THOR_RESERVED_WORDS
:   Thor methods that should not be overwritten by the user.
Task
:   [not documented]
UndefinedTaskError
:   Raised when a command was not found.
VERSION
:   [not documented]


# Class methods:

    banner
    check_unknown_options!
    command_help
    default_command
    default_task
    desc
    disable_class_options
    find_command_possibilities
    find_task_possibilities
    help
    long_desc
    map
    method_option
    method_options
    option
    options
    package_name
    printable_commands
    printable_tasks
    register
    stop_on_unknown_option!
    subcommand
    subcommand_classes
    subcommand_help
    subcommands
    subtask
    subtask_help
    subtasks
    task_help

# Instance methods:

    help

# Thor::check_unknown_options!

(from gem thor-0.19.4)
---
    check_unknown_options!(options = {})

---

Extend check unknown options to accept a hash of conditions.

### Parameters
options<Hash>: A hash containing :only and/or :except keys


# Thor::command_help

(from gem thor-0.19.4)
---
    command_help(shell, command_name)

---

Prints help information for the given command.

#### Parameters
shell<Thor::Shell> command_name<String>


# Thor::default_command

(from gem thor-0.19.4)
---
    default_command(meth = nil)

---

Sets the default command when thor is executed without an explicit command to
be called.

#### Parameters
meth<Symbol>
:   name of the default command



# Thor::default_task

(from gem thor-0.19.4)
---
    default_task(meth = nil)

---


# Thor::desc

(from gem thor-0.19.4)
---
    desc(usage, description, options = {})

---

Defines the usage and the description of the next command.

#### Parameters
usage<String> description<String> options<String>


# Thor::disable_class_options

(from gem thor-0.19.4)
---
    disable_class_options()

---


# Thor::help

(from gem thor-0.19.4)
---
    help(shell, subcommand = false)

---

Prints help information for this class.

#### Parameters
shell<Thor::Shell>


# Thor::long_desc

(from gem thor-0.19.4)
---
    long_desc(long_description, options = {})

---

Defines the long description of the next command.

#### Parameters
long description<String>


# Thor::map

(from gem thor-0.19.4)
---
    map(mappings = nil)

---

Maps an input to a command. If you define:

    map "-T" => "list"

Running:

    thor -T

Will invoke the list command.

#### Parameters
Hash[String|Array => Symbol]
:   Maps the string or the strings in the array to the given command.



# Thor::method_option

(from gem thor-0.19.4)
---
    method_option(name, options = {})

---

Adds an option to the set of method options. If :for is given as option, it
allows you to change the options from a previous defined command.

    def previous_command
      # magic
    end

    method_option :foo => :bar, :for => :previous_command

    def next_command
      # magic
    end

#### Parameters
name<Symbol>
:   The name of the argument.
options<Hash>
:   Described below.


#### Options
:desc     - Description for the argument. :required - If the argument is
required or not. :default  - Default value for this argument. It cannot be
required and have default values. :aliases  - Aliases for this option. :type  
  - The type of the argument, can be :string, :hash, :array, :numeric or
:boolean. :banner   - String to show on usage notes. :hide     - If you want
to hide this option from the help.


# Thor::method_options

(from gem thor-0.19.4)
---
    method_options(options = nil)

---

Declares the options for the next command to be declared.

#### Parameters
Hash[Symbol => Object]
:   The hash key is the name of the option and the value

is the type of the option. Can be :string, :array, :hash, :boolean, :numeric
or :required (string). If you give a value, the type of the value is used.


# Thor::option

(from gem thor-0.19.4)
---
    option(name, options = {})

---


# Thor::options

(from gem thor-0.19.4)
---
    options(options = nil)

---


# Thor::package_name

(from gem thor-0.19.4)
---
    package_name(name, _ = {})

---

Allows for custom "Command" package naming.

### Parameters
name<String> options<Hash>


# Thor::printable_commands

(from gem thor-0.19.4)
---
    printable_commands(all = true, subcommand = false)

---

Returns commands ready to be printed.


# Thor::printable_tasks

(from gem thor-0.19.4)
---
    printable_tasks(all = true, subcommand = false)

---


# Thor::register

(from gem thor-0.19.4)
---
    register(klass, subcommand_name, usage, description, options = {})

---

Registers another Thor subclass as a command.

#### Parameters
klass<Class>
:   Thor subclass to register
command<String>
:   Subcommand name to use
usage<String>
:   Short usage for the subcommand
description<String>
:   Description for the subcommand



# Thor::stop_on_unknown_option!

(from gem thor-0.19.4)
---
    stop_on_unknown_option!(*command_names)

---

Stop parsing of options as soon as an unknown option or a regular argument is
encountered.  All remaining arguments are passed to the command. This is
useful if you have a command that can receive arbitrary additional options,
and where those additional options should not be handled by Thor.

#### Example

To better understand how this is useful, let's consider a command that calls
an external command.  A user may want to pass arbitrary options and arguments
to that command.  The command itself also accepts some options, which should
be handled by Thor.

    class_option "verbose",  :type => :boolean
    stop_on_unknown_option! :exec
    check_unknown_options!  :except => :exec

    desc "exec", "Run a shell command"
    def exec(*args)
      puts "diagnostic output" if options[:verbose]
      Kernel.exec(*args)
    end

Here `exec` can be called with `--verbose` to get diagnostic output, e.g.:

    $ thor exec --verbose echo foo
    diagnostic output
    foo

But if `--verbose` is given after `echo`, it is passed to `echo` instead:

    $ thor exec echo --verbose foo
    --verbose foo

#### Parameters
Symbol ...
:   A list of commands that should be affected.



# Thor::subcommand

(from gem thor-0.19.4)
---
    subcommand(subcommand, subcommand_class)

---


# Thor::subcommand_classes

(from gem thor-0.19.4)
---
    subcommand_classes()

---


# Thor::subcommands

(from gem thor-0.19.4)
---
    subcommands()

---


# Thor::subtask

(from gem thor-0.19.4)
---
    subtask(subcommand, subcommand_class)

---


# Thor::subtasks

(from gem thor-0.19.4)
---
    subtasks()

---


# Thor::task_help

(from gem thor-0.19.4)
---
    task_help(shell, command_name)

---


# Thor::banner

(from gem thor-0.19.4)
---
    banner(command, namespace = nil, subcommand = false)

---

The banner for this class. You can customize it if you are invoking the thor
class by another ways which is not the Thor::Runner. It receives the command
that is going to be invoked and a boolean which indicates if the namespace
should be displayed as arguments.


# Thor::find_command_possibilities

(from gem thor-0.19.4)
---
    find_command_possibilities(meth)

---

this is the logic that takes the command name passed in by the user and
determines whether it is an unambiguous substrings of a command or alias name.


# Thor::find_task_possibilities

(from gem thor-0.19.4)
---
    find_task_possibilities(meth)

---


# Thor::subcommand_help

(from gem thor-0.19.4)
---
    subcommand_help(cmd)

---


# Thor::subtask_help

(from gem thor-0.19.4)
---
    subtask_help(cmd)

---


# Thor#help

(from gem thor-0.19.4)
---
    help(command = nil, subcommand = false)

---


