# Kernel

(from ruby core)
---




RubyGems adds the #gem method to allow activation of specific gem versions and
overrides the #require method on Kernel to make gems appear as if they live on
the `$LOAD_PATH`.  See the documentation of these methods for further detail.




The Kernel module is included by class Object, so its methods are available in
every Ruby object.

The Kernel instance methods are documented in class Object while the module
methods are documented here.  These methods are called without a receiver and
thus can be called in functional form:

    sprintf "%.1f", 1.234 #=> "1.2"
---
# Class methods:

    URI
    open
    open_uri_original_open
    pp

# Instance methods:

    Array
    BigDecimal
    Complex
    Float
    Hash
    Integer
    JSON
    Pathname
    Rational
    String
    URI
    __callee__
    __dir__
    __method__
    `
    abort
    at_exit
    autoload
    autoload?
    binding
    block_given?
    callcc
    caller
    caller_locations
    catch
    chomp
    chop
    eval
    exec
    exit
    exit!
    fail
    fork
    format
    gem
    gem_original_require
    gets
    global_variables
    gsub
    iterator?
    j
    jj
    lambda
    load
    local_variables
    loop
    open
    open_uri_original_open
    p
    pp
    pretty_inspect
    print
    printf
    proc
    putc
    puts
    raise
    rand
    readline
    readlines
    require
    require_relative
    scanf
    select
    set_trace_func
    sleep
    spawn
    sprintf
    srand
    sub
    syscall
    system
    test
    throw
    trace_var
    trap
    untrace_var
    warn
    y

# Kernel::open

(from ruby core)
---
    open(path [, mode [, perm]] [, opt])                -> io or nil
    open(path [, mode [, perm]] [, opt]) {|io| block }  -> obj

---

Creates an IO object connected to the given stream, file, or subprocess.

If `path` does not start with a pipe character (`|`), treat it as the name of
a file to open using the specified mode (defaulting to "r").

The `mode` is either a string or an integer.  If it is an integer, it must be
bitwise-or of open(2) flags, such as File::RDWR or File::EXCL.  If it is a
string, it is either "fmode", "fmode:ext_enc", or "fmode:ext_enc:int_enc".

See the documentation of IO.new for full documentation of the `mode` string
directives.

If a file is being created, its initial permissions may be set using the
`perm` parameter.  See File.new and the open(2) and chmod(2) man pages for a
description of permissions.

If a block is specified, it will be invoked with the IO object as a parameter,
and the IO will be automatically closed when the block terminates.  The call
returns the value of the block.

If `path` starts with a pipe character (`"|"`), a subprocess is created,
connected to the caller by a pair of pipes.  The returned IO object may be
used to write to the standard input and read from the standard output of this
subprocess.

If the command following the pipe is a single minus sign (`"|-"`), Ruby forks,
and this subprocess is connected to the parent.  If the command is not `"-"`,
the subprocess runs the command.

When the subprocess is ruby (opened via `"|-"`), the `open` call returns
`nil`.  If a block is associated with the open call, that block will run twice
--- once in the parent and once in the child.

The block parameter will be an IO object in the parent and `nil` in the child.
The parent's `IO` object will be connected to the child's $stdin and $stdout. 
The subprocess will be terminated at the end of the block.

### Examples

Reading from "testfile":

    open("testfile") do |f|
      print f.gets
    end

Produces:

    This is line one

Open a subprocess and read its output:

    cmd = open("|date")
    print cmd.gets
    cmd.close

Produces:

    Wed Apr  9 08:56:31 CDT 2003

Open a subprocess running the same Ruby program:

    f = open("|-", "w+")
    if f == nil
      puts "in Child"
      exit
    else
      puts "Got: #{f.gets}"
    end

Produces:

    Got: in Child

Open a subprocess using a block to receive the IO object:

    open "|-" do |f|
      if f then
        # parent process
        puts "Got: #{f.gets}"
      else
        # child process
        puts "in Child"
      end
    end

Produces:

    Got: in Child


# Kernel::pp

(from ruby core)
---
    pp(*objs)

---

prints arguments in pretty form.

pp returns argument(s).


# Kernel::open_uri_original_open

(from ruby core)
---
    open_uri_original_open(*args)

---


# Kernel#Array

(from ruby core)
---
    Array(arg)    -> array

---

Returns `arg` as an Array.

First tries to call `to_ary` on `arg`, then `to_a`.

    Array(1..5)   #=> [1, 2, 3, 4, 5]


# Kernel#BigDecimal

(from ruby core)
---
    BigDecimal(*args)

---

See also BigDecimal.new



# Kernel#Complex

(from ruby core)
---
    Complex(x[, y])  ->  numeric

---

Returns x+i*y;

    Complex(1, 2)    #=> (1+2i)
    Complex('1+2i')  #=> (1+2i)
    Complex(nil)     #=> TypeError
    Complex(1, nil)  #=> TypeError

Syntax of string form:

    string form = extra spaces , complex , extra spaces ;
    complex = real part | [ sign ] , imaginary part
            | real part , sign , imaginary part
            | rational , "@" , rational ;
    real part = rational ;
    imaginary part = imaginary unit | unsigned rational , imaginary unit ;
    rational = [ sign ] , unsigned rational ;
    unsigned rational = numerator | numerator , "/" , denominator ;
    numerator = integer part | fractional part | integer part , fractional part ;
    denominator = digits ;
    integer part = digits ;
    fractional part = "." , digits , [ ( "e" | "E" ) , [ sign ] , digits ] ;
    imaginary unit = "i" | "I" | "j" | "J" ;
    sign = "-" | "+" ;
    digits = digit , { digit | "_" , digit };
    digit = "0" | "1" | "2" | "3" | "4" | "5" | "6" | "7" | "8" | "9" ;
    extra spaces = ? \s* ? ;

See String#to_c.


# Kernel#Float

(from ruby core)
---
    Float(p1)

---


# Kernel#Hash

(from ruby core)
---
    Hash(arg)    -> hash

---

Converts *arg* to a `Hash` by calling *arg*`.to_hash`. Returns an empty `Hash`
when *arg* is `nil` or `[]`.

    Hash([])          #=> {}
    Hash(nil)         #=> {}
    Hash(key: :value) #=> {:key => :value}
    Hash([1, 2, 3])   #=> TypeError


# Kernel#Integer

(from ruby core)
---
    Integer(arg, base=0)    -> integer

---

Converts *arg* to an `Integer`. Numeric types are converted directly (with
floating point numbers being truncated).  *base* (0, or between 2 and 36) is a
base for integer string representation.  If *arg* is a `String`, when *base*
is omitted or equals zero, radix indicators (`0`, `0b`, and `0x`) are honored.
In any case, strings should be strictly conformed to numeric representation.
This behavior is different from that of `String#to_i`.  Non string values will
be converted by first trying `to_int`, then `to_i`. Passing `nil` raises a
TypeError.

    Integer(123.999)    #=> 123
    Integer("0x1a")     #=> 26
    Integer(Time.new)   #=> 1204973019
    Integer("0930", 10) #=> 930
    Integer("111", 2)   #=> 7
    Integer(nil)        #=> TypeError


# Kernel#Pathname

(from ruby core)
---
    Pathname(path)  -> pathname

---

Creates a new Pathname object from the given string, `path`, and returns
pathname object.

In order to use this constructor, you must first require the Pathname standard
library extension.

    require 'pathname'
    Pathname("/home/zzak")
    #=> #<Pathname:/home/zzak>

See also Pathname::new for more information.


# Kernel#Rational

(from ruby core)
---
    Rational(x[, y])  ->  numeric

---

Returns x/y;

    Rational(1, 2)   #=> (1/2)
    Rational('1/2')  #=> (1/2)
    Rational(nil)    #=> TypeError
    Rational(1, nil) #=> TypeError

Syntax of string form:

    string form = extra spaces , rational , extra spaces ;
    rational = [ sign ] , unsigned rational ;
    unsigned rational = numerator | numerator , "/" , denominator ;
    numerator = integer part | fractional part | integer part , fractional part ;
    denominator = digits ;
    integer part = digits ;
    fractional part = "." , digits , [ ( "e" | "E" ) , [ sign ] , digits ] ;
    sign = "-" | "+" ;
    digits = digit , { digit | "_" , digit } ;
    digit = "0" | "1" | "2" | "3" | "4" | "5" | "6" | "7" | "8" | "9" ;
    extra spaces = ? \s* ? ;

See String#to_r.


# Kernel#String

(from ruby core)
---
    String(arg)   -> string

---

Returns *arg* as a `String`.

First tries to call its `to_str` method, then its `to_s` method.

    String(self)        #=> "main"
    String(self.class)  #=> "Object"
    String(123456)      #=> "123456"


# Kernel#__callee__

(from ruby core)
---
    __callee__         -> symbol

---

Returns the called name of the current method as a Symbol. If called outside
of a method, it returns `nil`.


# Kernel#__dir__

(from ruby core)
---
    __dir__         -> string

---

Returns the canonicalized absolute path of the directory of the file from
which this method is called. It means symlinks in the path is resolved. If
`__FILE__` is `nil`, it returns `nil`. The return value equals to
`File.dirname(File.realpath(__FILE__))`.


# Kernel#__method__

(from ruby core)
---
    __method__         -> symbol

---

Returns the name at the definition of the current method as a Symbol. If
called outside of a method, it returns `nil`.


# Kernel#`

(from ruby core)
---
    `cmd`    -> string

---

Returns the standard output of running *cmd* in a subshell. The built-in
syntax `%x{...}` uses this method. Sets `$?` to the process status.

    `date`                   #=> "Wed Apr  9 08:56:30 CDT 2003\n"
    `ls testdir`.split[1]    #=> "main.rb"
    `echo oops && exit 99`   #=> "oops\n"
    $?.exitstatus            #=> 99


# Kernel#abort

(from ruby core)
---
    abort
    Kernel::abort([msg])
    Process.abort([msg])

---

Terminate execution immediately, effectively by calling `Kernel.exit(false)`.
If *msg* is given, it is written to STDERR prior to terminating.


# Kernel#at_exit

(from ruby core)
---
    at_exit { block } -> proc

---

Converts *block* to a `Proc` object (and therefore binds it at the point of
call) and registers it for execution when the program exits. If multiple
handlers are registered, they are executed in reverse order of registration.

    def do_at_exit(str1)
      at_exit { print str1 }
    end
    at_exit { puts "cruel world" }
    do_at_exit("goodbye ")
    exit

*produces:*

    goodbye cruel world


# Kernel#autoload

(from ruby core)
---
    autoload(module, filename)   -> nil

---

Registers *filename* to be loaded (using `Kernel::require`) the first time
that *module* (which may be a `String` or a symbol) is accessed.

    autoload(:MyModule, "/usr/local/lib/modules/my_module.rb")


# Kernel#autoload?

(from ruby core)
---
    autoload?(name)   -> String or nil

---

Returns *filename* to be loaded if *name* is registered as `autoload`.

    autoload(:B, "b")
    autoload?(:B)            #=> "b"


# Kernel#binding

(from ruby core)
---
    binding -> a_binding

---

Returns a `Binding` object, describing the variable and method bindings at the
point of call. This object can be used when calling `eval` to execute the
evaluated command in this environment. See also the description of class
`Binding`.

    def get_binding(param)
      return binding
    end
    b = get_binding("hello")
    eval("param", b)   #=> "hello"


# Kernel#block_given?

(from ruby core)
---
    block_given?   -> true or false

---

Returns `true` if `yield` would execute a block in the current context. The
`iterator?` form is mildly deprecated.

    def try
      if block_given?
        yield
      else
        "no block"
      end
    end
    try                  #=> "no block"
    try { "hello" }      #=> "hello"
    try do "hello" end   #=> "hello"


# Kernel#callcc

(from ruby core)
---
    callcc {|cont| block }   ->  obj

---

Generates a Continuation object, which it passes to the associated block. You
need to `require 'continuation'` before using this method. Performing a
*cont*`.call` will cause the #callcc to return (as will falling through the
end of the block). The value returned by the #callcc is the value of the
block, or the value passed to *cont*`.call`. See class Continuation for more
details. Also see Kernel#throw for an alternative mechanism for unwinding a
call stack.


# Kernel#caller

(from ruby core)
---
    caller(start=1, length=nil)  -> array or nil
    caller(range)                -> array or nil

---

Returns the current execution stack---an array containing strings in the form
`file:line` or `file:line: in `method'`.

The optional *start* parameter determines the number of initial stack entries
to omit from the top of the stack.

A second optional `length` parameter can be used to limit how many entries are
returned from the stack.

Returns `nil` if *start* is greater than the size of current execution stack.

Optionally you can pass a range, which will return an array containing the
entries within the specified range.

    def a(skip)
      caller(skip)
    end
    def b(skip)
      a(skip)
    end
    def c(skip)
      b(skip)
    end
    c(0)   #=> ["prog:2:in `a'", "prog:5:in `b'", "prog:8:in `c'", "prog:10:in `<main>'"]
    c(1)   #=> ["prog:5:in `b'", "prog:8:in `c'", "prog:11:in `<main>'"]
    c(2)   #=> ["prog:8:in `c'", "prog:12:in `<main>'"]
    c(3)   #=> ["prog:13:in `<main>'"]
    c(4)   #=> []
    c(5)   #=> nil


# Kernel#caller_locations

(from ruby core)
---
    caller_locations(start=1, length=nil)    -> array or nil
    caller_locations(range)                  -> array or nil

---

Returns the current execution stack---an array containing backtrace location
objects.

See Thread::Backtrace::Location for more information.

The optional *start* parameter determines the number of initial stack entries
to omit from the top of the stack.

A second optional `length` parameter can be used to limit how many entries are
returned from the stack.

Returns `nil` if *start* is greater than the size of current execution stack.

Optionally you can pass a range, which will return an array containing the
entries within the specified range.


# Kernel#catch

(from ruby core)
---
    catch([tag]) {|tag| block }  -> obj

---

`catch` executes its block. If `throw` is not called, the block executes
normally, and `catch` returns the value of the last expression evaluated.

    catch(1) { 123 }            # => 123

If `throw(tag2, val)` is called, Ruby searches up its stack for a `catch`
block whose `tag` has the same `object_id` as *tag2*. When found, the block
stops executing and returns *val* (or `nil` if no second argument was given to
`throw`).

    catch(1) { throw(1, 456) }  # => 456
    catch(1) { throw(1) }       # => nil

When `tag` is passed as the first argument, `catch` yields it as the parameter
of the block.

    catch(1) {|x| x + 2 }       # => 3

When no `tag` is given, `catch` yields a new unique object (as from
`Object.new`) as the block parameter. This object can then be used as the
argument to `throw`, and will match the correct `catch` block.

    catch do |obj_A|
      catch do |obj_B|
        throw(obj_B, 123)
        puts "This puts is not reached"
      end

      puts "This puts is displayed"
      456
    end

    # => 456

    catch do |obj_A|
      catch do |obj_B|
        throw(obj_A, 123)
        puts "This puts is still not reached"
      end

      puts "Now this puts is also not reached"
      456
    end

    # => 123


# Kernel#chomp

(from ruby core)
---
    chomp            -> $_
    chomp(string)    -> $_

---

Equivalent to `$_ = $_.chomp(*string*)`. See `String#chomp`. Available only
when -p/-n command line option specified.


# Kernel#chop

(from ruby core)
---
    chop   -> $_

---

Equivalent to `($_.dup).chop!`, except `nil` is never returned. See
`String#chop!`. Available only when -p/-n command line option specified.


# Kernel#eval

(from ruby core)
---
    eval(string [, binding [, filename [,lineno]]])  -> obj

---

Evaluates the Ruby expression(s) in *string*. If *binding* is given, which
must be a `Binding` object, the evaluation is performed in its context. If the
optional *filename* and *lineno* parameters are present, they will be used
when reporting syntax errors.

    def get_binding(str)
      return binding
    end
    str = "hello"
    eval "str + ' Fred'"                      #=> "hello Fred"
    eval "str + ' Fred'", get_binding("bye")  #=> "bye Fred"


# Kernel#exec

(from ruby core)
---
    exec([env,] command... [,options])

---

Replaces the current process by running the given external *command*, which
can take one of the following forms:

`exec(commandline)`
:   command line string which is passed to the standard shell
`exec(cmdname, arg1, ...)`
:   command name and one or more arguments (no shell)
`exec([cmdname, argv0], arg1, ...)`
:   command name, [argv](0) and zero or more arguments (no shell)


In the first form, the string is taken as a command line that is subject to
shell expansion before being executed.

The standard shell always means `"/bin/sh"` on Unix-like systems, same as
`ENV["RUBYSHELL"]` (or `ENV["COMSPEC"]` on Windows NT series), and similar.

If the string from the first form (`exec("command")`) follows these simple
rules:

*   no meta characters
*   no shell reserved word and no special built-in
*   Ruby invokes the command directly without shell


You can force shell invocation by adding ";" to the string (because ";" is a
meta character).

Note that this behavior is observable by pid obtained (return value of spawn()
and IO#pid for IO.popen) is the pid of the invoked command, not shell.

In the second form (`exec("command1", "arg1", ...)`), the first is taken as a
command name and the rest are passed as parameters to command with no shell
expansion.

In the third form (`exec(["command", "argv0"], "arg1", ...)`), starting a
two-element array at the beginning of the command, the first element is the
command to be executed, and the second argument is used as the `argv[0]`
value, which may show up in process listings.

In order to execute the command, one of the `exec(2)` system calls are used,
so the running command may inherit some of the environment of the original
program (including open file descriptors).

This behavior is modified by the given `env` and `options` parameters. See
::spawn for details.

If the command fails to execute (typically `Errno::ENOENT` when it was not
found) a SystemCallError exception is raised.

This method modifies process attributes according to given `options` before
`exec(2)` system call. See ::spawn for more details about the given `options`.

The modified attributes may be retained when `exec(2)` system call fails.

For example, hard resource limits are not restorable.

Consider to create a child process using ::spawn or Kernel#system if this is
not acceptable.

    exec "echo *"       # echoes list of files in current directory
    # never get here

    exec "echo", "*"    # echoes an asterisk
    # never get here


# Kernel#exit

(from ruby core)
---
    exit(status=true)
    Kernel::exit(status=true)
    Process::exit(status=true)

---

Initiates the termination of the Ruby script by raising the `SystemExit`
exception. This exception may be caught. The optional parameter is used to
return a status code to the invoking environment. `true` and `FALSE` of
*status* means success and failure respectively.  The interpretation of other
integer values are system dependent.

    begin
      exit
      puts "never get here"
    rescue SystemExit
      puts "rescued a SystemExit exception"
    end
    puts "after begin block"

*produces:*

    rescued a SystemExit exception
    after begin block

Just prior to termination, Ruby executes any `at_exit` functions (see
Kernel::at_exit) and runs any object finalizers (see
ObjectSpace::define_finalizer).

    at_exit { puts "at_exit function" }
    ObjectSpace.define_finalizer("string",  proc { puts "in finalizer" })
    exit

*produces:*

    at_exit function
    in finalizer


# Kernel#exit!

(from ruby core)
---
    Process.exit!(status=false)

---

Exits the process immediately. No exit handlers are run. *status* is returned
to the underlying system as the exit status.

    Process.exit!(true)


# Kernel#fail

(from ruby core)
---
    fail
    fail(string)
    fail(exception [, string [, array]])

---

With no arguments, raises the exception in `$!` or raises a `RuntimeError` if
`$!` is `nil`. With a single `String` argument, raises a `RuntimeError` with
the string as a message. Otherwise, the first parameter should be the name of
an `Exception` class (or an object that returns an `Exception` object when
sent an `exception` message). The optional second parameter sets the message
associated with the exception, and the third parameter is an array of callback
information. Exceptions are caught by the `rescue` clause of `begin...end`
blocks.

    raise "Failed to create socket"
    raise ArgumentError, "No parameters", caller


# Kernel#fork

(from ruby core)
---
    Kernel.fork  [{ block }]   -> integer or nil
    Process.fork [{ block }]   -> integer or nil

---

Creates a subprocess. If a block is specified, that block is run in the
subprocess, and the subprocess terminates with a status of zero. Otherwise,
the `fork` call returns twice, once in the parent, returning the process ID of
the child, and once in the child, returning *nil*. The child process can exit
using `Kernel.exit!` to avoid running any `at_exit` functions. The parent
process should use `Process.wait` to collect the termination statuses of its
children or use `Process.detach` to register disinterest in their status;
otherwise, the operating system may accumulate zombie processes.

The thread calling fork is the only thread in the created child process. fork
doesn't copy other threads.

If fork is not usable, Process.respond_to?(:fork) returns false.

Note that fork(2) is not available on some platforms like Windows and NetBSD
4. Therefore you should use spawn() instead of fork().


# Kernel#format

(from ruby core)
---
    format(format_string [, arguments...] )   -> string

---

Returns the string resulting from applying *format_string* to any additional
arguments.  Within the format string, any characters other than format
sequences are copied to the result.

The syntax of a format sequence is follows.

    %[flags][width][.precision]type

A format sequence consists of a percent sign, followed by optional flags,
width, and precision indicators, then terminated with a field type character. 
The field type controls how the corresponding `sprintf` argument is to be
interpreted, while the flags modify that interpretation.

The field type characters are:

    Field |  Integer Format
    ------+--------------------------------------------------------------
      b   | Convert argument as a binary number.
          | Negative numbers will be displayed as a two's complement
          | prefixed with `..1'.
      B   | Equivalent to `b', but uses an uppercase 0B for prefix
          | in the alternative format by #.
      d   | Convert argument as a decimal number.
      i   | Identical to `d'.
      o   | Convert argument as an octal number.
          | Negative numbers will be displayed as a two's complement
          | prefixed with `..7'.
      u   | Identical to `d'.
      x   | Convert argument as a hexadecimal number.
          | Negative numbers will be displayed as a two's complement
          | prefixed with `..f' (representing an infinite string of
          | leading 'ff's).
      X   | Equivalent to `x', but uses uppercase letters.

    Field |  Float Format
    ------+--------------------------------------------------------------
      e   | Convert floating point argument into exponential notation
          | with one digit before the decimal point as [-]d.dddddde[+-]dd.
          | The precision specifies the number of digits after the decimal
          | point (defaulting to six).
      E   | Equivalent to `e', but uses an uppercase E to indicate
          | the exponent.
      f   | Convert floating point argument as [-]ddd.dddddd,
          | where the precision specifies the number of digits after
          | the decimal point.
      g   | Convert a floating point number using exponential form
          | if the exponent is less than -4 or greater than or
          | equal to the precision, or in dd.dddd form otherwise.
          | The precision specifies the number of significant digits.
      G   | Equivalent to `g', but use an uppercase `E' in exponent form.
      a   | Convert floating point argument as [-]0xh.hhhhp[+-]dd,
          | which is consisted from optional sign, "0x", fraction part
          | as hexadecimal, "p", and exponential part as decimal.
      A   | Equivalent to `a', but use uppercase `X' and `P'.

    Field |  Other Format
    ------+--------------------------------------------------------------
      c   | Argument is the numeric code for a single character or
          | a single character string itself.
      p   | The valuing of argument.inspect.
      s   | Argument is a string to be substituted.  If the format
          | sequence contains a precision, at most that many characters
          | will be copied.
      %   | A percent sign itself will be displayed.  No argument taken.

The flags modifies the behavior of the formats. The flag characters are:

    Flag     | Applies to    | Meaning
    ---------+---------------+-----------------------------------------
    space    | bBdiouxX      | Leave a space at the start of
             | aAeEfgG       | non-negative numbers.
             | (numeric fmt) | For `o', `x', `X', `b' and `B', use
             |               | a minus sign with absolute value for
             |               | negative values.
    ---------+---------------+-----------------------------------------
    (digit)$ | all           | Specifies the absolute argument number
             |               | for this field.  Absolute and relative
             |               | argument numbers cannot be mixed in a
             |               | sprintf string.
    ---------+---------------+-----------------------------------------
     #       | bBoxX         | Use an alternative format.
             | aAeEfgG       | For the conversions `o', increase the precision
             |               | until the first digit will be `0' if
             |               | it is not formatted as complements.
             |               | For the conversions `x', `X', `b' and `B'
             |               | on non-zero, prefix the result with ``0x'',
             |               | ``0X'', ``0b'' and ``0B'', respectively.
             |               | For `a', `A', `e', `E', `f', `g', and 'G',
             |               | force a decimal point to be added,
             |               | even if no digits follow.
             |               | For `g' and 'G', do not remove trailing zeros.
    ---------+---------------+-----------------------------------------
    +        | bBdiouxX      | Add a leading plus sign to non-negative
             | aAeEfgG       | numbers.
             | (numeric fmt) | For `o', `x', `X', `b' and `B', use
             |               | a minus sign with absolute value for
             |               | negative values.
    ---------+---------------+-----------------------------------------
    -        | all           | Left-justify the result of this conversion.
    ---------+---------------+-----------------------------------------
    0 (zero) | bBdiouxX      | Pad with zeros, not spaces.
             | aAeEfgG       | For `o', `x', `X', `b' and `B', radix-1
             | (numeric fmt) | is used for negative numbers formatted as
             |               | complements.
    ---------+---------------+-----------------------------------------
    *        | all           | Use the next argument as the field width.
             |               | If negative, left-justify the result. If the
             |               | asterisk is followed by a number and a dollar
             |               | sign, use the indicated argument as the width.

Examples of flags:

    # `+' and space flag specifies the sign of non-negative numbers.
    sprintf("%d", 123)  #=> "123"
    sprintf("%+d", 123) #=> "+123"
    sprintf("% d", 123) #=> " 123"

    # `#' flag for `o' increases number of digits to show `0'.
    # `+' and space flag changes format of negative numbers.
    sprintf("%o", 123)   #=> "173"
    sprintf("%#o", 123)  #=> "0173"
    sprintf("%+o", -123) #=> "-173"
    sprintf("%o", -123)  #=> "..7605"
    sprintf("%#o", -123) #=> "..7605"

    # `#' flag for `x' add a prefix `0x' for non-zero numbers.
    # `+' and space flag disables complements for negative numbers.
    sprintf("%x", 123)   #=> "7b"
    sprintf("%#x", 123)  #=> "0x7b"
    sprintf("%+x", -123) #=> "-7b"
    sprintf("%x", -123)  #=> "..f85"
    sprintf("%#x", -123) #=> "0x..f85"
    sprintf("%#x", 0)    #=> "0"

    # `#' for `X' uses the prefix `0X'.
    sprintf("%X", 123)  #=> "7B"
    sprintf("%#X", 123) #=> "0X7B"

    # `#' flag for `b' add a prefix `0b' for non-zero numbers.
    # `+' and space flag disables complements for negative numbers.
    sprintf("%b", 123)   #=> "1111011"
    sprintf("%#b", 123)  #=> "0b1111011"
    sprintf("%+b", -123) #=> "-1111011"
    sprintf("%b", -123)  #=> "..10000101"
    sprintf("%#b", -123) #=> "0b..10000101"
    sprintf("%#b", 0)    #=> "0"

    # `#' for `B' uses the prefix `0B'.
    sprintf("%B", 123)  #=> "1111011"
    sprintf("%#B", 123) #=> "0B1111011"

    # `#' for `e' forces to show the decimal point.
    sprintf("%.0e", 1)  #=> "1e+00"
    sprintf("%#.0e", 1) #=> "1.e+00"

    # `#' for `f' forces to show the decimal point.
    sprintf("%.0f", 1234)  #=> "1234"
    sprintf("%#.0f", 1234) #=> "1234."

    # `#' for `g' forces to show the decimal point.
    # It also disables stripping lowest zeros.
    sprintf("%g", 123.4)   #=> "123.4"
    sprintf("%#g", 123.4)  #=> "123.400"
    sprintf("%g", 123456)  #=> "123456"
    sprintf("%#g", 123456) #=> "123456."

The field width is an optional integer, followed optionally by a period and a
precision.  The width specifies the minimum number of characters that will be
written to the result for this field.

Examples of width:

    # padding is done by spaces,       width=20
    # 0 or radix-1.             <------------------>
    sprintf("%20d", 123)   #=> "                 123"
    sprintf("%+20d", 123)  #=> "                +123"
    sprintf("%020d", 123)  #=> "00000000000000000123"
    sprintf("%+020d", 123) #=> "+0000000000000000123"
    sprintf("% 020d", 123) #=> " 0000000000000000123"
    sprintf("%-20d", 123)  #=> "123                 "
    sprintf("%-+20d", 123) #=> "+123                "
    sprintf("%- 20d", 123) #=> " 123                "
    sprintf("%020x", -123) #=> "..ffffffffffffffff85"

For numeric fields, the precision controls the number of decimal places
displayed.  For string fields, the precision determines the maximum number of
characters to be copied from the string.  (Thus, the format sequence `%10.10s`
will always contribute exactly ten characters to the result.)

Examples of precisions:

    # precision for `d', 'o', 'x' and 'b' is
    # minimum number of digits               <------>
    sprintf("%20.8d", 123)  #=> "            00000123"
    sprintf("%20.8o", 123)  #=> "            00000173"
    sprintf("%20.8x", 123)  #=> "            0000007b"
    sprintf("%20.8b", 123)  #=> "            01111011"
    sprintf("%20.8d", -123) #=> "           -00000123"
    sprintf("%20.8o", -123) #=> "            ..777605"
    sprintf("%20.8x", -123) #=> "            ..ffff85"
    sprintf("%20.8b", -11)  #=> "            ..110101"

    # "0x" and "0b" for `#x' and `#b' is not counted for
    # precision but "0" for `#o' is counted.  <------>
    sprintf("%#20.8d", 123)  #=> "            00000123"
    sprintf("%#20.8o", 123)  #=> "            00000173"
    sprintf("%#20.8x", 123)  #=> "          0x0000007b"
    sprintf("%#20.8b", 123)  #=> "          0b01111011"
    sprintf("%#20.8d", -123) #=> "           -00000123"
    sprintf("%#20.8o", -123) #=> "            ..777605"
    sprintf("%#20.8x", -123) #=> "          0x..ffff85"
    sprintf("%#20.8b", -11)  #=> "          0b..110101"

    # precision for `e' is number of
    # digits after the decimal point           <------>
    sprintf("%20.8e", 1234.56789) #=> "      1.23456789e+03"

    # precision for `f' is number of
    # digits after the decimal point               <------>
    sprintf("%20.8f", 1234.56789) #=> "       1234.56789000"

    # precision for `g' is number of
    # significant digits                          <------->
    sprintf("%20.8g", 1234.56789) #=> "           1234.5679"

    #                                         <------->
    sprintf("%20.8g", 123456789)  #=> "       1.2345679e+08"

    # precision for `s' is
    # maximum number of characters                    <------>
    sprintf("%20.8s", "string test") #=> "            string t"

Examples:

    sprintf("%d %04x", 123, 123)               #=> "123 007b"
    sprintf("%08b '%4s'", 123, 123)            #=> "01111011 ' 123'"
    sprintf("%1$*2$s %2$d %1$s", "hello", 8)   #=> "   hello 8 hello"
    sprintf("%1$*2$s %2$d", "hello", -8)       #=> "hello    -8"
    sprintf("%+g:% g:%-g", 1.23, 1.23, 1.23)   #=> "+1.23: 1.23:1.23"
    sprintf("%u", -123)                        #=> "-123"

For more complex formatting, Ruby supports a reference by name. %<name>s style
uses format style, but %{name} style doesn't.

Examples:
    sprintf("%<foo>d : %<bar>f", { :foo => 1, :bar => 2 })
      #=> 1 : 2.000000
    sprintf("%{foo}f", { :foo => 1 })
      # => "1f"


# Kernel#gem_original_require

(from ruby core)
---
    gem_original_require(path)

---

The Kernel#require from before RubyGems was loaded.


# Kernel#gets

(from ruby core)
---
    gets(sep=$/)    -> string or nil
    gets(limit)     -> string or nil
    gets(sep,limit) -> string or nil

---

Returns (and assigns to `$_`) the next line from the list of files in `ARGV`
(or `$*`), or from standard input if no files are present on the command line.
Returns `nil` at end of file. The optional argument specifies the record
separator. The separator is included with the contents of each record. A
separator of `nil` reads the entire contents, and a zero-length separator
reads the input one paragraph at a time, where paragraphs are divided by two
consecutive newlines.  If the first argument is an integer, or optional second
argument is given, the returning string would not be longer than the given
value in bytes.  If multiple filenames are present in `ARGV`, +gets(nil)+ will
read the contents one file at a time.

    ARGV << "testfile"
    print while gets

*produces:*

    This is line one
    This is line two
    This is line three
    And so on...

The style of programming using `$_` as an implicit parameter is gradually
losing favor in the Ruby community.


# Kernel#global_variables

(from ruby core)
---
    global_variables    -> array

---

Returns an array of the names of global variables.

    global_variables.grep /std/   #=> [:$stdin, :$stdout, :$stderr]


# Kernel#gsub

(from ruby core)
---
    gsub(pattern, replacement)    -> $_
    gsub(pattern) {|...| block }  -> $_

---

Equivalent to `$_.gsub...`, except that `$_` will be updated if substitution
occurs. Available only when -p/-n command line option specified.


# Kernel#iterator?

(from ruby core)
---
    iterator?      -> true or false

---

Returns `true` if `yield` would execute a block in the current context. The
`iterator?` form is mildly deprecated.

    def try
      if block_given?
        yield
      else
        "no block"
      end
    end
    try                  #=> "no block"
    try { "hello" }      #=> "hello"
    try do "hello" end   #=> "hello"


# Kernel#lambda

(from ruby core)
---
    lambda { |...| block }  -> a_proc

---

Equivalent to `Proc.new`, except the resulting Proc objects check the number
of parameters passed when called.


# Kernel#load

(from ruby core)
---
    load(filename, wrap=false)   -> true

---

Loads and executes the Ruby program in the file *filename*. If the filename
does not resolve to an absolute path, the file is searched for in the library
directories listed in `$:`. If the optional *wrap* parameter is `true`, the
loaded script will be executed under an anonymous module, protecting the
calling program's global namespace. In no circumstance will any local
variables in the loaded file be propagated to the loading environment.


# Kernel#local_variables

(from ruby core)
---
    local_variables    -> array

---

Returns the names of the current local variables.

    fred = 1
    for i in 1..10
       # ...
    end
    local_variables   #=> [:fred, :i]


# Kernel#loop

(from ruby core)
---
    loop { block }
    loop            -> an_enumerator

---

Repeatedly executes the block.

If no block is given, an enumerator is returned instead.

    loop do
      print "Input: "
      line = gets
      break if !line or line =~ /^qQ/
      # ...
    end

StopIteration raised in the block breaks the loop.  In this case, loop returns
the "result" value stored in the exception.

    enum = Enumerator.new { |y|
      y << "one"
      y << "two"
      :ok
    }

    result = loop {
      puts enum.next
    } #=> :ok


# Kernel#p

(from ruby core)
---
    p(obj)              -> obj
    p(obj1, obj2, ...)  -> [obj, ...]
    p()                 -> nil

---

For each object, directly writes *obj*.`inspect` followed by a newline to the
program's standard output.

    S = Struct.new(:name, :state)
    s = S['dave', 'TX']
    p s

*produces:*

    #<S name="dave", state="TX">


# Kernel#pretty_inspect

(from ruby core)
---
    pretty_inspect()

---

Returns a pretty printed object as a string.

In order to use this method you must first require the PP module:

    require 'pp'

See the PP module for more information.


# Kernel#print

(from ruby core)
---
    print(obj, ...)    -> nil

---

Prints each object in turn to `$stdout`. If the output field separator (`$,`)
is not `nil`, its contents will appear between each field. If the output
record separator (`$\`) is not `nil`, it will be appended to the output. If no
arguments are given, prints `$_`. Objects that aren't strings will be
converted by calling their `to_s` method.

    print "cat", [1,2,3], 99, "\n"
    $, = ", "
    $\ = "\n"
    print "cat", [1,2,3], 99

*produces:*

    cat12399
    cat, 1, 2, 3, 99


# Kernel#printf

(from ruby core)
---
    printf(io, string [, obj ... ])    -> nil
    printf(string [, obj ... ])        -> nil

---

Equivalent to:
    io.write(sprintf(string, obj, ...))

or
    $stdout.write(sprintf(string, obj, ...))


# Kernel#proc

(from ruby core)
---
    proc   { |...| block }  -> a_proc

---

Equivalent to `Proc.new`.


# Kernel#putc

(from ruby core)
---
    putc(int)   -> int

---

    Equivalent to:

      $stdout.putc(int)

Refer to the documentation for IO#putc for important information regarding
multi-byte characters.


# Kernel#puts

(from ruby core)
---
    puts(obj, ...)    -> nil

---

Equivalent to

    $stdout.puts(obj, ...)


# Kernel#raise

(from ruby core)
---
    raise
    raise(string)
    raise(exception [, string [, array]])

---

With no arguments, raises the exception in `$!` or raises a `RuntimeError` if
`$!` is `nil`. With a single `String` argument, raises a `RuntimeError` with
the string as a message. Otherwise, the first parameter should be the name of
an `Exception` class (or an object that returns an `Exception` object when
sent an `exception` message). The optional second parameter sets the message
associated with the exception, and the third parameter is an array of callback
information. Exceptions are caught by the `rescue` clause of `begin...end`
blocks.

    raise "Failed to create socket"
    raise ArgumentError, "No parameters", caller


# Kernel#rand

(from ruby core)
---
    rand(max=0)    -> number

---

If called without an argument, or if `max.to_i.abs == 0`, rand returns a
pseudo-random floating point number between 0.0 and 1.0, including 0.0 and
excluding 1.0.

    rand        #=> 0.2725926052826416

When `max.abs` is greater than or equal to 1, `rand` returns a pseudo-random
integer greater than or equal to 0 and less than `max.to_i.abs`.

    rand(100)   #=> 12

When `max` is a Range, `rand` returns a random number where
range.member?(number) == true.

Negative or floating point values for `max` are allowed, but may give
surprising results.

    rand(-100) # => 87
    rand(-0.5) # => 0.8130921818028143
    rand(1.9)  # equivalent to rand(1), which is always 0

Kernel.srand may be used to ensure that sequences of random numbers are
reproducible between different runs of a program.

See also Random.rand.


# Kernel#readline

(from ruby core)
---
    readline(sep=$/)     -> string
    readline(limit)      -> string
    readline(sep, limit) -> string

---

Equivalent to `Kernel::gets`, except `readline` raises `EOFError` at end of
file.


# Kernel#readlines

(from ruby core)
---
    readlines(sep=$/)    -> array
    readlines(limit)     -> array
    readlines(sep,limit) -> array

---

Returns an array containing the lines returned by calling `Kernel.gets(*sep*)`
until the end of file.


# Kernel#require_relative

(from ruby core)
---
    require_relative(string) -> true or false

---

Ruby tries to load the library named *string* relative to the requiring file's
path.  If the file's path cannot be determined a LoadError is raised. If a
file is loaded `true` is returned and false otherwise.


# Kernel#select

(from ruby core)
---
    IO.select(read_array [, write_array [, error_array [, timeout]]]) -> array  or  nil

---

Calls select(2) system call. It monitors given arrays of `IO` objects, waits
until one or more of `IO` objects are ready for reading, are ready for
writing, and have pending exceptions respectively, and returns an array that
contains arrays of those IO objects.  It will return `nil` if optional
*timeout* value is given and no `IO` object is ready in *timeout* seconds.

`IO.select` peeks the buffer of `IO` objects for testing readability. If the
`IO` buffer is not empty, `IO.select` immediately notifies readability. This
"peek" only happens for `IO` objects. It does not happen for IO-like objects
such as OpenSSL::SSL::SSLSocket.

The best way to use `IO.select` is invoking it after nonblocking methods such
as `read_nonblock`, `write_nonblock`, etc. The methods raise an exception
which is extended by `IO::WaitReadable` or `IO::WaitWritable`. The modules
notify how the caller should wait with `IO.select`. If `IO::WaitReadable` is
raised, the caller should wait for reading. If `IO::WaitWritable` is raised,
the caller should wait for writing.

So, blocking read (`readpartial`) can be emulated using `read_nonblock` and
`IO.select` as follows:

    begin
      result = io_like.read_nonblock(maxlen)
    rescue IO::WaitReadable
      IO.select([io_like])
      retry
    rescue IO::WaitWritable
      IO.select(nil, [io_like])
      retry
    end

Especially, the combination of nonblocking methods and `IO.select` is
preferred for `IO` like objects such as `OpenSSL::SSL::SSLSocket`. It has
`to_io` method to return underlying `IO` object. `IO.select` calls `to_io` to
obtain the file descriptor to wait.

This means that readability notified by `IO.select` doesn't mean readability
from `OpenSSL::SSL::SSLSocket` object.

The most likely situation is that `OpenSSL::SSL::SSLSocket` buffers some data.
`IO.select` doesn't see the buffer. So `IO.select` can block when
`OpenSSL::SSL::SSLSocket#readpartial` doesn't block.

However, several more complicated situations exist.

SSL is a protocol which is sequence of records. The record consists of
multiple bytes. So, the remote side of SSL sends a partial record, `IO.select`
notifies readability but `OpenSSL::SSL::SSLSocket` cannot decrypt a byte and
`OpenSSL::SSL::SSLSocket#readpartial` will blocks.

Also, the remote side can request SSL renegotiation which forces the local SSL
engine to write some data. This means `OpenSSL::SSL::SSLSocket#readpartial`
may invoke `write` system call and it can block. In such a situation,
`OpenSSL::SSL::SSLSocket#read_nonblock` raises IO::WaitWritable instead of
blocking. So, the caller should wait for ready for writability as above
example.

The combination of nonblocking methods and `IO.select` is also useful for
streams such as tty, pipe socket socket when multiple processes read from a
stream.

Finally, Linux kernel developers don't guarantee that readability of select(2)
means readability of following read(2) even for a single process. See
select(2) manual on GNU/Linux system.

Invoking `IO.select` before `IO#readpartial` works well as usual. However it
is not the best way to use `IO.select`.

The writability notified by select(2) doesn't show how many bytes writable.
`IO#write` method blocks until given whole string is written. So,
`IO#write(two or more bytes)` can block after writability is notified by
`IO.select`. `IO#write_nonblock` is required to avoid the blocking.

Blocking write (`write`) can be emulated using `write_nonblock` and
`IO.select` as follows: IO::WaitReadable should also be rescued for SSL
renegotiation in `OpenSSL::SSL::SSLSocket`.

    while 0 < string.bytesize
      begin
        written = io_like.write_nonblock(string)
      rescue IO::WaitReadable
        IO.select([io_like])
        retry
      rescue IO::WaitWritable
        IO.select(nil, [io_like])
        retry
      end
      string = string.byteslice(written..-1)
    end

### Parameters
read_array
:   an array of `IO` objects that wait until ready for read
write_array
:   an array of `IO` objects that wait until ready for write
error_array
:   an array of `IO` objects that wait for exceptions
timeout
:   a numeric value in second


### Example

    rp, wp = IO.pipe
    mesg = "ping "
    100.times {
      # IO.select follows IO#read.  Not the best way to use IO.select.
      rs, ws, = IO.select([rp], [wp])
      if r = rs[0]
        ret = r.read(5)
        print ret
        case ret
        when /ping/
          mesg = "pong\n"
        when /pong/
          mesg = "ping "
        end
      end
      if w = ws[0]
        w.write(mesg)
      end
    }

*produces:*

    ping pong
    ping pong
    ping pong
    (snipped)
    ping


# Kernel#set_trace_func

(from ruby core)
---
    set_trace_func(proc)    -> proc
    set_trace_func(nil)     -> nil

---

Establishes *proc* as the handler for tracing, or disables tracing if the
parameter is `nil`.

**Note:** this method is obsolete, please use TracePoint instead.

*proc* takes up to six parameters:

*   an event name
*   a filename
*   a line number
*   an object id
*   a binding
*   the name of a class


*proc* is invoked whenever an event occurs.

Events are:

`c-call`
:   call a C-language routine
`c-return`
:   return from a C-language routine
`call`
:   call a Ruby method
`class`
:   start a class or module definition
`end`
:   finish a class or module definition
`line`
:   execute code on a new line
`raise`
:   raise an exception
`return`
:   return from a Ruby method


Tracing is disabled within the context of *proc*.

      class Test
      def test
        a = 1
        b = 2
      end
      end

      set_trace_func proc { |event, file, line, id, binding, classname|
         printf "%8s %s:%-2d %10s %8s\n", event, file, line, id, classname
      }
      t = Test.new
      t.test

        line prog.rb:11               false
      c-call prog.rb:11        new    Class
      c-call prog.rb:11 initialize   Object
    c-return prog.rb:11 initialize   Object
    c-return prog.rb:11        new    Class
        line prog.rb:12               false
        call prog.rb:2        test     Test
        line prog.rb:3        test     Test
        line prog.rb:4        test     Test
      return prog.rb:4        test     Test


# Kernel#sleep

(from ruby core)
---
    sleep([duration])    -> integer

---

Suspends the current thread for *duration* seconds (which may be any number,
including a `Float` with fractional seconds). Returns the actual number of
seconds slept (rounded), which may be less than that asked for if another
thread calls `Thread#run`. Called without an argument, sleep() will sleep
forever.

    Time.new    #=> 2008-03-08 19:56:19 +0900
    sleep 1.2   #=> 1
    Time.new    #=> 2008-03-08 19:56:20 +0900
    sleep 1.9   #=> 2
    Time.new    #=> 2008-03-08 19:56:22 +0900


# Kernel#spawn

(from ruby core)
---
    spawn([env,] command... [,options])     -> pid
    Process.spawn([env,] command... [,options])     -> pid

---

spawn executes specified command and return its pid.

    pid = spawn("tar xf ruby-2.0.0-p195.tar.bz2")
    Process.wait pid

    pid = spawn(RbConfig.ruby, "-eputs'Hello, world!'")
    Process.wait pid

This method is similar to Kernel#system but it doesn't wait for the command to
finish.

The parent process should use `Process.wait` to collect the termination status
of its child or use `Process.detach` to register disinterest in their status;
otherwise, the operating system may accumulate zombie processes.

spawn has bunch of options to specify process attributes:

    env: hash
      name => val : set the environment variable
      name => nil : unset the environment variable

      the keys and the values except for +nil+ must be strings.
    command...:
      commandline                 : command line string which is passed to the standard shell
      cmdname, arg1, ...          : command name and one or more arguments (This form does not use the shell. See below for caveats.)
      [cmdname, argv0], arg1, ... : command name, argv[0] and zero or more arguments (no shell)
    options: hash
      clearing environment variables:
        :unsetenv_others => true   : clear environment variables except specified by env
        :unsetenv_others => false  : don't clear (default)
      process group:
        :pgroup => true or 0 : make a new process group
        :pgroup => pgid      : join the specified process group
        :pgroup => nil       : don't change the process group (default)
      create new process group: Windows only
        :new_pgroup => true  : the new process is the root process of a new process group
        :new_pgroup => false : don't create a new process group (default)
      resource limit: resourcename is core, cpu, data, etc.  See Process.setrlimit.
        :rlimit_resourcename => limit
        :rlimit_resourcename => [cur_limit, max_limit]
      umask:
        :umask => int
      redirection:
        key:
          FD              : single file descriptor in child process
          [FD, FD, ...]   : multiple file descriptor in child process
        value:
          FD                        : redirect to the file descriptor in parent process
          string                    : redirect to file with open(string, "r" or "w")
          [string]                  : redirect to file with open(string, File::RDONLY)
          [string, open_mode]       : redirect to file with open(string, open_mode, 0644)
          [string, open_mode, perm] : redirect to file with open(string, open_mode, perm)
          [:child, FD]              : redirect to the redirected file descriptor
          :close                    : close the file descriptor in child process
        FD is one of follows
          :in     : the file descriptor 0 which is the standard input
          :out    : the file descriptor 1 which is the standard output
          :err    : the file descriptor 2 which is the standard error
          integer : the file descriptor of specified the integer
          io      : the file descriptor specified as io.fileno
      file descriptor inheritance: close non-redirected non-standard fds (3, 4, 5, ...) or not
        :close_others => true  : don't inherit
      current directory:
        :chdir => str

      The 'cmdname, arg1, ...' form does not use the shell. However,
      on different OSes, different things are provided as built-in
      commands. An example of this is 'echo', which is a built-in
      on Windows, but is a normal program on Linux and Mac OS X.
      This means that `Process.spawn 'echo', '%Path%'` will display
      the contents of the `%Path%` environment variable on Windows,
      but `Process.spawn 'echo', '$PATH'` prints the literal '$PATH'.

If a hash is given as `env`, the environment is updated by `env` before
`exec(2)` in the child process. If a pair in `env` has nil as the value, the
variable is deleted.

    # set FOO as BAR and unset BAZ.
    pid = spawn({"FOO"=>"BAR", "BAZ"=>nil}, command)

If a hash is given as `options`, it specifies process group, create new
process group, resource limit, current directory, umask and redirects for the
child process. Also, it can be specified to clear environment variables.

The `:unsetenv_others` key in `options` specifies to clear environment
variables, other than specified by `env`.

    pid = spawn(command, :unsetenv_others=>true) # no environment variable
    pid = spawn({"FOO"=>"BAR"}, command, :unsetenv_others=>true) # FOO only

The `:pgroup` key in `options` specifies a process group. The corresponding
value should be true, zero, a positive integer, or nil. true and zero cause
the process to be a process leader of a new process group. A non-zero positive
integer causes the process to join the provided process group. The default
value, nil, causes the process to remain in the same process group.

    pid = spawn(command, :pgroup=>true) # process leader
    pid = spawn(command, :pgroup=>10) # belongs to the process group 10

The `:new_pgroup` key in `options` specifies to pass
`CREATE_NEW_PROCESS_GROUP` flag to `CreateProcessW()` that is Windows API.
This option is only for Windows. true means the new process is the root
process of the new process group. The new process has CTRL+C disabled. This
flag is necessary for `Process.kill(:SIGINT, pid)` on the subprocess.
:new_pgroup is false by default.

    pid = spawn(command, :new_pgroup=>true)  # new process group
    pid = spawn(command, :new_pgroup=>false) # same process group

The `:rlimit_`*foo* key specifies a resource limit. *foo* should be one of
resource types such as `core`. The corresponding value should be an integer or
an array which have one or two integers: same as cur_limit and max_limit
arguments for Process.setrlimit.

    cur, max = Process.getrlimit(:CORE)
    pid = spawn(command, :rlimit_core=>[0,max]) # disable core temporary.
    pid = spawn(command, :rlimit_core=>max) # enable core dump
    pid = spawn(command, :rlimit_core=>0) # never dump core.

The `:umask` key in `options` specifies the umask.

    pid = spawn(command, :umask=>077)

The :in, :out, :err, an integer, an IO and an array key specifies a
redirection. The redirection maps a file descriptor in the child process.

For example, stderr can be merged into stdout as follows:

    pid = spawn(command, :err=>:out)
    pid = spawn(command, 2=>1)
    pid = spawn(command, STDERR=>:out)
    pid = spawn(command, STDERR=>STDOUT)

The hash keys specifies a file descriptor in the child process started by
`spawn`. :err, 2 and STDERR specifies the standard error stream (stderr).

The hash values specifies a file descriptor in the parent process which
invokes `spawn`. :out, 1 and STDOUT specifies the standard output stream
(stdout).

In the above example, the standard output in the child process is not
specified. So it is inherited from the parent process.

The standard input stream (stdin) can be specified by :in, 0 and STDIN.

A filename can be specified as a hash value.

    pid = spawn(command, :in=>"/dev/null") # read mode
    pid = spawn(command, :out=>"/dev/null") # write mode
    pid = spawn(command, :err=>"log") # write mode
    pid = spawn(command, [:out, :err]=>"/dev/null") # write mode
    pid = spawn(command, 3=>"/dev/null") # read mode

For stdout and stderr (and combination of them), it is opened in write mode.
Otherwise read mode is used.

For specifying flags and permission of file creation explicitly, an array is
used instead.

    pid = spawn(command, :in=>["file"]) # read mode is assumed
    pid = spawn(command, :in=>["file", "r"])
    pid = spawn(command, :out=>["log", "w"]) # 0644 assumed
    pid = spawn(command, :out=>["log", "w", 0600])
    pid = spawn(command, :out=>["log", File::WRONLY|File::EXCL|File::CREAT, 0600])

The array specifies a filename, flags and permission. The flags can be a
string or an integer. If the flags is omitted or nil, File::RDONLY is assumed.
The permission should be an integer. If the permission is omitted or nil, 0644
is assumed.

If an array of IOs and integers are specified as a hash key, all the elements
are redirected.

    # stdout and stderr is redirected to log file.
    # The file "log" is opened just once.
    pid = spawn(command, [:out, :err]=>["log", "w"])

Another way to merge multiple file descriptors is [:child, fd]. [:child, fd]
means the file descriptor in the child process. This is different from fd. For
example, :err=>:out means redirecting child stderr to parent stdout. But
:err=>[:child, :out] means redirecting child stderr to child stdout. They
differ if stdout is redirected in the child process as follows.

    # stdout and stderr is redirected to log file.
    # The file "log" is opened just once.
    pid = spawn(command, :out=>["log", "w"], :err=>[:child, :out])

[:child, :out] can be used to merge stderr into stdout in IO.popen. In this
case, IO.popen redirects stdout to a pipe in the child process and [:child,
:out] refers the redirected stdout.

    io = IO.popen(["sh", "-c", "echo out; echo err >&2", :err=>[:child, :out]])
    p io.read #=> "out\nerr\n"

The `:chdir` key in `options` specifies the current directory.

    pid = spawn(command, :chdir=>"/var/tmp")

spawn closes all non-standard unspecified descriptors by default. The
"standard" descriptors are 0, 1 and 2. This behavior is specified by
:close_others option. :close_others doesn't affect the standard descriptors
which are closed only if :close is specified explicitly.

    pid = spawn(command, :close_others=>true)  # close 3,4,5,... (default)
    pid = spawn(command, :close_others=>false) # don't close 3,4,5,...

:close_others is true by default for spawn and IO.popen.

Note that fds which close-on-exec flag is already set are closed regardless of
:close_others option.

So IO.pipe and spawn can be used as IO.popen.

    # similar to r = IO.popen(command)
    r, w = IO.pipe
    pid = spawn(command, :out=>w)   # r, w is closed in the child process.
    w.close

:close is specified as a hash value to close a fd individually.

    f = open(foo)
    system(command, f=>:close)        # don't inherit f.

If a file descriptor need to be inherited, io=>io can be used.

    # valgrind has --log-fd option for log destination.
    # log_w=>log_w indicates log_w.fileno inherits to child process.
    log_r, log_w = IO.pipe
    pid = spawn("valgrind", "--log-fd=#{log_w.fileno}", "echo", "a", log_w=>log_w)
    log_w.close
    p log_r.read

It is also possible to exchange file descriptors.

    pid = spawn(command, :out=>:err, :err=>:out)

The hash keys specify file descriptors in the child process. The hash values
specifies file descriptors in the parent process. So the above specifies
exchanging stdout and stderr. Internally, `spawn` uses an extra file
descriptor to resolve such cyclic file descriptor mapping.

See `Kernel.exec` for the standard shell.


# Kernel#sprintf

(from ruby core)
---
    sprintf(format_string [, arguments...] )  -> string

---

Returns the string resulting from applying *format_string* to any additional
arguments.  Within the format string, any characters other than format
sequences are copied to the result.

The syntax of a format sequence is follows.

    %[flags][width][.precision]type

A format sequence consists of a percent sign, followed by optional flags,
width, and precision indicators, then terminated with a field type character. 
The field type controls how the corresponding `sprintf` argument is to be
interpreted, while the flags modify that interpretation.

The field type characters are:

    Field |  Integer Format
    ------+--------------------------------------------------------------
      b   | Convert argument as a binary number.
          | Negative numbers will be displayed as a two's complement
          | prefixed with `..1'.
      B   | Equivalent to `b', but uses an uppercase 0B for prefix
          | in the alternative format by #.
      d   | Convert argument as a decimal number.
      i   | Identical to `d'.
      o   | Convert argument as an octal number.
          | Negative numbers will be displayed as a two's complement
          | prefixed with `..7'.
      u   | Identical to `d'.
      x   | Convert argument as a hexadecimal number.
          | Negative numbers will be displayed as a two's complement
          | prefixed with `..f' (representing an infinite string of
          | leading 'ff's).
      X   | Equivalent to `x', but uses uppercase letters.

    Field |  Float Format
    ------+--------------------------------------------------------------
      e   | Convert floating point argument into exponential notation
          | with one digit before the decimal point as [-]d.dddddde[+-]dd.
          | The precision specifies the number of digits after the decimal
          | point (defaulting to six).
      E   | Equivalent to `e', but uses an uppercase E to indicate
          | the exponent.
      f   | Convert floating point argument as [-]ddd.dddddd,
          | where the precision specifies the number of digits after
          | the decimal point.
      g   | Convert a floating point number using exponential form
          | if the exponent is less than -4 or greater than or
          | equal to the precision, or in dd.dddd form otherwise.
          | The precision specifies the number of significant digits.
      G   | Equivalent to `g', but use an uppercase `E' in exponent form.
      a   | Convert floating point argument as [-]0xh.hhhhp[+-]dd,
          | which is consisted from optional sign, "0x", fraction part
          | as hexadecimal, "p", and exponential part as decimal.
      A   | Equivalent to `a', but use uppercase `X' and `P'.

    Field |  Other Format
    ------+--------------------------------------------------------------
      c   | Argument is the numeric code for a single character or
          | a single character string itself.
      p   | The valuing of argument.inspect.
      s   | Argument is a string to be substituted.  If the format
          | sequence contains a precision, at most that many characters
          | will be copied.
      %   | A percent sign itself will be displayed.  No argument taken.

The flags modifies the behavior of the formats. The flag characters are:

    Flag     | Applies to    | Meaning
    ---------+---------------+-----------------------------------------
    space    | bBdiouxX      | Leave a space at the start of
             | aAeEfgG       | non-negative numbers.
             | (numeric fmt) | For `o', `x', `X', `b' and `B', use
             |               | a minus sign with absolute value for
             |               | negative values.
    ---------+---------------+-----------------------------------------
    (digit)$ | all           | Specifies the absolute argument number
             |               | for this field.  Absolute and relative
             |               | argument numbers cannot be mixed in a
             |               | sprintf string.
    ---------+---------------+-----------------------------------------
     #       | bBoxX         | Use an alternative format.
             | aAeEfgG       | For the conversions `o', increase the precision
             |               | until the first digit will be `0' if
             |               | it is not formatted as complements.
             |               | For the conversions `x', `X', `b' and `B'
             |               | on non-zero, prefix the result with ``0x'',
             |               | ``0X'', ``0b'' and ``0B'', respectively.
             |               | For `a', `A', `e', `E', `f', `g', and 'G',
             |               | force a decimal point to be added,
             |               | even if no digits follow.
             |               | For `g' and 'G', do not remove trailing zeros.
    ---------+---------------+-----------------------------------------
    +        | bBdiouxX      | Add a leading plus sign to non-negative
             | aAeEfgG       | numbers.
             | (numeric fmt) | For `o', `x', `X', `b' and `B', use
             |               | a minus sign with absolute value for
             |               | negative values.
    ---------+---------------+-----------------------------------------
    -        | all           | Left-justify the result of this conversion.
    ---------+---------------+-----------------------------------------
    0 (zero) | bBdiouxX      | Pad with zeros, not spaces.
             | aAeEfgG       | For `o', `x', `X', `b' and `B', radix-1
             | (numeric fmt) | is used for negative numbers formatted as
             |               | complements.
    ---------+---------------+-----------------------------------------
    *        | all           | Use the next argument as the field width.
             |               | If negative, left-justify the result. If the
             |               | asterisk is followed by a number and a dollar
             |               | sign, use the indicated argument as the width.

Examples of flags:

    # `+' and space flag specifies the sign of non-negative numbers.
    sprintf("%d", 123)  #=> "123"
    sprintf("%+d", 123) #=> "+123"
    sprintf("% d", 123) #=> " 123"

    # `#' flag for `o' increases number of digits to show `0'.
    # `+' and space flag changes format of negative numbers.
    sprintf("%o", 123)   #=> "173"
    sprintf("%#o", 123)  #=> "0173"
    sprintf("%+o", -123) #=> "-173"
    sprintf("%o", -123)  #=> "..7605"
    sprintf("%#o", -123) #=> "..7605"

    # `#' flag for `x' add a prefix `0x' for non-zero numbers.
    # `+' and space flag disables complements for negative numbers.
    sprintf("%x", 123)   #=> "7b"
    sprintf("%#x", 123)  #=> "0x7b"
    sprintf("%+x", -123) #=> "-7b"
    sprintf("%x", -123)  #=> "..f85"
    sprintf("%#x", -123) #=> "0x..f85"
    sprintf("%#x", 0)    #=> "0"

    # `#' for `X' uses the prefix `0X'.
    sprintf("%X", 123)  #=> "7B"
    sprintf("%#X", 123) #=> "0X7B"

    # `#' flag for `b' add a prefix `0b' for non-zero numbers.
    # `+' and space flag disables complements for negative numbers.
    sprintf("%b", 123)   #=> "1111011"
    sprintf("%#b", 123)  #=> "0b1111011"
    sprintf("%+b", -123) #=> "-1111011"
    sprintf("%b", -123)  #=> "..10000101"
    sprintf("%#b", -123) #=> "0b..10000101"
    sprintf("%#b", 0)    #=> "0"

    # `#' for `B' uses the prefix `0B'.
    sprintf("%B", 123)  #=> "1111011"
    sprintf("%#B", 123) #=> "0B1111011"

    # `#' for `e' forces to show the decimal point.
    sprintf("%.0e", 1)  #=> "1e+00"
    sprintf("%#.0e", 1) #=> "1.e+00"

    # `#' for `f' forces to show the decimal point.
    sprintf("%.0f", 1234)  #=> "1234"
    sprintf("%#.0f", 1234) #=> "1234."

    # `#' for `g' forces to show the decimal point.
    # It also disables stripping lowest zeros.
    sprintf("%g", 123.4)   #=> "123.4"
    sprintf("%#g", 123.4)  #=> "123.400"
    sprintf("%g", 123456)  #=> "123456"
    sprintf("%#g", 123456) #=> "123456."

The field width is an optional integer, followed optionally by a period and a
precision.  The width specifies the minimum number of characters that will be
written to the result for this field.

Examples of width:

    # padding is done by spaces,       width=20
    # 0 or radix-1.             <------------------>
    sprintf("%20d", 123)   #=> "                 123"
    sprintf("%+20d", 123)  #=> "                +123"
    sprintf("%020d", 123)  #=> "00000000000000000123"
    sprintf("%+020d", 123) #=> "+0000000000000000123"
    sprintf("% 020d", 123) #=> " 0000000000000000123"
    sprintf("%-20d", 123)  #=> "123                 "
    sprintf("%-+20d", 123) #=> "+123                "
    sprintf("%- 20d", 123) #=> " 123                "
    sprintf("%020x", -123) #=> "..ffffffffffffffff85"

For numeric fields, the precision controls the number of decimal places
displayed.  For string fields, the precision determines the maximum number of
characters to be copied from the string.  (Thus, the format sequence `%10.10s`
will always contribute exactly ten characters to the result.)

Examples of precisions:

    # precision for `d', 'o', 'x' and 'b' is
    # minimum number of digits               <------>
    sprintf("%20.8d", 123)  #=> "            00000123"
    sprintf("%20.8o", 123)  #=> "            00000173"
    sprintf("%20.8x", 123)  #=> "            0000007b"
    sprintf("%20.8b", 123)  #=> "            01111011"
    sprintf("%20.8d", -123) #=> "           -00000123"
    sprintf("%20.8o", -123) #=> "            ..777605"
    sprintf("%20.8x", -123) #=> "            ..ffff85"
    sprintf("%20.8b", -11)  #=> "            ..110101"

    # "0x" and "0b" for `#x' and `#b' is not counted for
    # precision but "0" for `#o' is counted.  <------>
    sprintf("%#20.8d", 123)  #=> "            00000123"
    sprintf("%#20.8o", 123)  #=> "            00000173"
    sprintf("%#20.8x", 123)  #=> "          0x0000007b"
    sprintf("%#20.8b", 123)  #=> "          0b01111011"
    sprintf("%#20.8d", -123) #=> "           -00000123"
    sprintf("%#20.8o", -123) #=> "            ..777605"
    sprintf("%#20.8x", -123) #=> "          0x..ffff85"
    sprintf("%#20.8b", -11)  #=> "          0b..110101"

    # precision for `e' is number of
    # digits after the decimal point           <------>
    sprintf("%20.8e", 1234.56789) #=> "      1.23456789e+03"

    # precision for `f' is number of
    # digits after the decimal point               <------>
    sprintf("%20.8f", 1234.56789) #=> "       1234.56789000"

    # precision for `g' is number of
    # significant digits                          <------->
    sprintf("%20.8g", 1234.56789) #=> "           1234.5679"

    #                                         <------->
    sprintf("%20.8g", 123456789)  #=> "       1.2345679e+08"

    # precision for `s' is
    # maximum number of characters                    <------>
    sprintf("%20.8s", "string test") #=> "            string t"

Examples:

    sprintf("%d %04x", 123, 123)               #=> "123 007b"
    sprintf("%08b '%4s'", 123, 123)            #=> "01111011 ' 123'"
    sprintf("%1$*2$s %2$d %1$s", "hello", 8)   #=> "   hello 8 hello"
    sprintf("%1$*2$s %2$d", "hello", -8)       #=> "hello    -8"
    sprintf("%+g:% g:%-g", 1.23, 1.23, 1.23)   #=> "+1.23: 1.23:1.23"
    sprintf("%u", -123)                        #=> "-123"

For more complex formatting, Ruby supports a reference by name. %<name>s style
uses format style, but %{name} style doesn't.

Examples:
    sprintf("%<foo>d : %<bar>f", { :foo => 1, :bar => 2 })
      #=> 1 : 2.000000
    sprintf("%{foo}f", { :foo => 1 })
      # => "1f"


# Kernel#srand

(from ruby core)
---
    srand(number = Random.new_seed) -> old_seed

---

Seeds the system pseudo-random number generator, Random::DEFAULT, with
`number`.  The previous seed value is returned.

If `number` is omitted, seeds the generator using a source of entropy provided
by the operating system, if available (/dev/urandom on Unix systems or the RSA
cryptographic provider on Windows), which is then combined with the time, the
process id, and a sequence number.

srand may be used to ensure repeatable sequences of pseudo-random numbers
between different runs of the program. By setting the seed to a known value,
programs can be made deterministic during testing.

    srand 1234               # => 268519324636777531569100071560086917274
    [ rand, rand ]           # => [0.1915194503788923, 0.6221087710398319]
    [ rand(10), rand(1000) ] # => [4, 664]
    srand 1234               # => 1234
    [ rand, rand ]           # => [0.1915194503788923, 0.6221087710398319]


# Kernel#sub

(from ruby core)
---
    sub(pattern, replacement)   -> $_
    sub(pattern) {|...| block } -> $_

---

Equivalent to `$_.sub(*args*)`, except that `$_` will be updated if
substitution occurs. Available only when -p/-n command line option specified.


# Kernel#syscall

(from ruby core)
---
    syscall(num [, args...])   -> integer

---

    Calls the operating system function identified by _num_ and
    returns the result of the function or raises SystemCallError if
    it failed.

    Arguments for the function can follow _num_. They must be either
    +String+ objects or +Integer+ objects. A +String+ object is passed
    as a pointer to the byte sequence. An +Integer+ object is passed
    as an integer whose bit size is same as a pointer.
    Up to nine parameters may be passed.

    The function identified by _num_ is system
    dependent. On some Unix systems, the numbers may be obtained from a
    header file called <code>syscall.h</code>.

       syscall 4, 1, "hello\n", 6   # '4' is write(2) on our box

    <em>produces:</em>

       hello

    Calling +syscall+ on a platform which does not have any way to
    an arbitrary system function just fails with NotImplementedError.

Note
:   `syscall` is essentially unsafe and unportable. Feel free to shoot your
    foot. DL (Fiddle) library is preferred for safer and a bit more portable
    programming.



# Kernel#system

(from ruby core)
---
    system([env,] command... [,options])    -> true, false or nil

---

Executes *command...* in a subshell. *command...* is one of following forms.

    commandline                 : command line string which is passed to the standard shell
    cmdname, arg1, ...          : command name and one or more arguments (no shell)
    [cmdname, argv0], arg1, ... : command name, argv[0] and zero or more arguments (no shell)

system returns `true` if the command gives zero exit status, `false` for non
zero exit status. Returns `nil` if command execution fails. An error status is
available in `$?`. The arguments are processed in the same way as for
`Kernel.spawn`.

The hash arguments, env and options, are same as `exec` and `spawn`. See
`Kernel.spawn` for details.

    system("echo *")
    system("echo", "*")

*produces:*

    config.h main.rb
    *

See `Kernel.exec` for the standard shell.


# Kernel#test

(from ruby core)
---
    test(cmd, file1 [, file2] ) -> obj

---

Uses the character `cmd` to perform various tests on `file1` (first table
below) or on `file1` and `file2` (second table).

File tests on a single file:

    Cmd    Returns   Meaning
    "A"  | Time    | Last access time for file1
    "b"  | boolean | True if file1 is a block device
    "c"  | boolean | True if file1 is a character device
    "C"  | Time    | Last change time for file1
    "d"  | boolean | True if file1 exists and is a directory
    "e"  | boolean | True if file1 exists
    "f"  | boolean | True if file1 exists and is a regular file
    "g"  | boolean | True if file1 has the \CF{setgid} bit
         |         | set (false under NT)
    "G"  | boolean | True if file1 exists and has a group
         |         | ownership equal to the caller's group
    "k"  | boolean | True if file1 exists and has the sticky bit set
    "l"  | boolean | True if file1 exists and is a symbolic link
    "M"  | Time    | Last modification time for file1
    "o"  | boolean | True if file1 exists and is owned by
         |         | the caller's effective uid
    "O"  | boolean | True if file1 exists and is owned by
         |         | the caller's real uid
    "p"  | boolean | True if file1 exists and is a fifo
    "r"  | boolean | True if file1 is readable by the effective
         |         | uid/gid of the caller
    "R"  | boolean | True if file is readable by the real
         |         | uid/gid of the caller
    "s"  | int/nil | If file1 has nonzero size, return the size,
         |         | otherwise return nil
    "S"  | boolean | True if file1 exists and is a socket
    "u"  | boolean | True if file1 has the setuid bit set
    "w"  | boolean | True if file1 exists and is writable by
         |         | the effective uid/gid
    "W"  | boolean | True if file1 exists and is writable by
         |         | the real uid/gid
    "x"  | boolean | True if file1 exists and is executable by
         |         | the effective uid/gid
    "X"  | boolean | True if file1 exists and is executable by
         |         | the real uid/gid
    "z"  | boolean | True if file1 exists and has a zero length

Tests that take two files:

    "-"  | boolean | True if file1 and file2 are identical
    "="  | boolean | True if the modification times of file1
         |         | and file2 are equal
    "<"  | boolean | True if the modification time of file1
         |         | is prior to that of file2
    ">"  | boolean | True if the modification time of file1
         |         | is after that of file2


# Kernel#throw

(from ruby core)
---
    throw(tag [, obj])

---

Transfers control to the end of the active `catch` block waiting for *tag*.
Raises `UncaughtThrowError` if there is no `catch` block for the *tag*. The
optional second parameter supplies a return value for the `catch` block, which
otherwise defaults to `nil`. For examples, see `Kernel::catch`.


# Kernel#trace_var

(from ruby core)
---
    trace_var(symbol, cmd )             -> nil
    trace_var(symbol) {|val| block }    -> nil

---

Controls tracing of assignments to global variables. The parameter `symbol`
identifies the variable (as either a string name or a symbol identifier).
*cmd* (which may be a string or a `Proc` object) or block is executed whenever
the variable is assigned. The block or `Proc` object receives the variable's
new value as a parameter. Also see `Kernel::untrace_var`.

    trace_var :$_, proc {|v| puts "$_ is now '#{v}'" }
    $_ = "hello"
    $_ = ' there'

*produces:*

    $_ is now 'hello'
    $_ is now ' there'


# Kernel#trap

(from ruby core)
---
    Signal.trap( signal, command ) -> obj
    Signal.trap( signal ) {| | block } -> obj

---

Specifies the handling of signals. The first parameter is a signal name (a
string such as ``SIGALRM'', ``SIGUSR1'', and so on) or a signal number. The
characters ``SIG'' may be omitted from the signal name. The command or block
specifies code to be run when the signal is raised. If the command is the
string ``IGNORE'' or ``SIG_IGN'', the signal will be ignored. If the command
is ``DEFAULT'' or ``SIG_DFL'', the Ruby's default handler will be invoked. If
the command is ``EXIT'', the script will be terminated by the signal. If the
command is ``SYSTEM_DEFAULT'', the operating system's default handler will be
invoked. Otherwise, the given command or block will be run. The special signal
name ``EXIT'' or signal number zero will be invoked just prior to program
termination. trap returns the previous handler for the given signal.

    Signal.trap(0, proc { puts "Terminating: #{$$}" })
    Signal.trap("CLD")  { puts "Child died" }
    fork && Process.wait

produces:
    Terminating: 27461
    Child died
    Terminating: 27460


# Kernel#untrace_var

(from ruby core)
---
    untrace_var(symbol [, cmd] )   -> array or nil

---

Removes tracing for the specified command on the given global variable and
returns `nil`. If no command is specified, removes all tracing for that
variable and returns an array containing the commands actually removed.


# Kernel#warn

(from ruby core)
---
    warn(msg, ...)   -> nil

---

Displays each of the given messages followed by a record separator on STDERR
unless warnings have been disabled (for example with the `-W0` flag).

      warn("warning 1", "warning 2")

    <em>produces:</em>

      warning 1
      warning 2


# Kernel#JSON

(from ruby core)
---
    JSON(object, *args)

---

If *object* is string-like, parse the string and return the parsed result as a
Ruby data structure. Otherwise, generate a JSON text from the Ruby data
structure object and return it.

The *opts* argument is passed through to generate/parse respectively. See
generate and parse for their documentation.


# Kernel#URI

(from ruby core)
---
    URI(uri)

---

Returns `uri` converted to a URI object.


# Kernel#gem

(from ruby core)
---
    gem(gem_name, *requirements)

---

Use Kernel#gem to activate a specific version of `gem_name`.

`requirements` is a list of version requirements that the specified gem must
match, most commonly "= example.version.number".  See Gem::Requirement for how
to specify a version requirement.

If you will be activating the latest version of a gem, there is no need to
call Kernel#gem, Kernel#require will do the right thing for you.

Kernel#gem returns true if the gem was activated, otherwise false.  If the gem
could not be found, didn't match the version requirements, or a different
version was already activated, an exception will be raised.

Kernel#gem should be called **before** any require statements (otherwise
RubyGems may load a conflicting library version).

Kernel#gem only loads prerelease versions when prerelease `requirements` are
given:

    gem 'rake', '>= 1.1.a', '< 2'

In older RubyGems versions, the environment variable GEM_SKIP could be used to
skip activation of specified gems, for example to test out changes that
haven't been installed yet.  Now RubyGems defers to -I and the RUBYLIB
environment variable to skip activation of a gem.

Example:

    GEM_SKIP=libA:libB ruby -I../libA -I../libB ./mycode.rb


# Kernel#j

(from ruby core)
---
    j(*objs)

---

Outputs *objs* to STDOUT as JSON strings in the shortest form, that is in one
line.


# Kernel#jj

(from ruby core)
---
    jj(*objs)

---

Outputs *objs* to STDOUT as JSON strings in a pretty format, with indentation
and over many lines.


# Kernel#open

(from ruby core)
---
    open(path [, mode [, perm]] [, opt])                -> io or nil
    open(path [, mode [, perm]] [, opt]) {|io| block }  -> obj

---

Creates an IO object connected to the given stream, file, or subprocess.

If `path` does not start with a pipe character (`|`), treat it as the name of
a file to open using the specified mode (defaulting to "r").

The `mode` is either a string or an integer.  If it is an integer, it must be
bitwise-or of open(2) flags, such as File::RDWR or File::EXCL.  If it is a
string, it is either "fmode", "fmode:ext_enc", or "fmode:ext_enc:int_enc".

See the documentation of IO.new for full documentation of the `mode` string
directives.

If a file is being created, its initial permissions may be set using the
`perm` parameter.  See File.new and the open(2) and chmod(2) man pages for a
description of permissions.

If a block is specified, it will be invoked with the IO object as a parameter,
and the IO will be automatically closed when the block terminates.  The call
returns the value of the block.

If `path` starts with a pipe character (`"|"`), a subprocess is created,
connected to the caller by a pair of pipes.  The returned IO object may be
used to write to the standard input and read from the standard output of this
subprocess.

If the command following the pipe is a single minus sign (`"|-"`), Ruby forks,
and this subprocess is connected to the parent.  If the command is not `"-"`,
the subprocess runs the command.

When the subprocess is ruby (opened via `"|-"`), the `open` call returns
`nil`.  If a block is associated with the open call, that block will run twice
--- once in the parent and once in the child.

The block parameter will be an IO object in the parent and `nil` in the child.
The parent's `IO` object will be connected to the child's $stdin and $stdout. 
The subprocess will be terminated at the end of the block.

### Examples

Reading from "testfile":

    open("testfile") do |f|
      print f.gets
    end

Produces:

    This is line one

Open a subprocess and read its output:

    cmd = open("|date")
    print cmd.gets
    cmd.close

Produces:

    Wed Apr  9 08:56:31 CDT 2003

Open a subprocess running the same Ruby program:

    f = open("|-", "w+")
    if f == nil
      puts "in Child"
      exit
    else
      puts "Got: #{f.gets}"
    end

Produces:

    Got: in Child

Open a subprocess using a block to receive the IO object:

    open "|-" do |f|
      if f then
        # parent process
        puts "Got: #{f.gets}"
      else
        # child process
        puts "in Child"
      end
    end

Produces:

    Got: in Child


# Kernel#open_uri_original_open

(from ruby core)
---
    open_uri_original_open(*args)

---


# Kernel#pp

(from ruby core)
---
    pp(*objs)

---

prints arguments in pretty form.

pp returns argument(s).


# Kernel#require

(from ruby core)
---
    require(path)

---

When RubyGems is required, Kernel#require is replaced with our own which is
capable of loading gems on demand.

When you call `require 'x'`, this is what happens:
*   If the file can be loaded from the existing Ruby loadpath, it is.
*   Otherwise, installed gems are searched for a file that matches. If it's
    found in gem 'y', that gem is activated (added to the loadpath).


The normal `require` functionality of returning false if that file has already
been loaded is preserved.


# Kernel#scanf

(from ruby core)
---
    scanf(format, &b)

---

Scans STDIN for data matching `format`.  See IO#scanf for details.

See Scanf for details on creating a format string.

You will need to require 'scanf' to use Kernel#scanf.


# Kernel#y

(from ruby core)
---
    y(*objects)

---

An alias for Psych.dump_stream meant to be used with IRB.


(from gem activesupport-5.1.2)
---


---
# Instance methods:

    class_eval
    concern
    enable_warnings
    silence_warnings
    suppress
    with_warnings

# Kernel#class_eval

(from gem activesupport-5.1.2)
---
    class_eval(*args, &block)

---

class_eval on an object acts like singleton_class.class_eval.


# Kernel#concern

(from gem activesupport-5.1.2)
---
    concern(topic, &module_definition)

---

A shortcut to define a toplevel concern, not within a module.

See Module::Concerning for more.


# Kernel#enable_warnings

(from gem activesupport-5.1.2)
---
    enable_warnings() { || ... }

---

Sets $VERBOSE to `true` for the duration of the block and back to its original
value afterwards.


# Kernel#silence_warnings

(from gem activesupport-5.1.2)
---
    silence_warnings() { || ... }

---

Sets $VERBOSE to `nil` for the duration of the block and back to its original
value afterwards.

    silence_warnings do
      value = noisy_call # no warning voiced
    end

    noisy_call # warning voiced


# Kernel#suppress

(from gem activesupport-5.1.2)
---
    suppress(*exception_classes) { || ... }

---

Blocks and ignores any exception passed as argument if raised within the
block.

    suppress(ZeroDivisionError) do
      1/0
      puts 'This code is NOT reached'
    end

    puts 'This code gets executed and nothing related to ZeroDivisionError was seen'


# Kernel#with_warnings

(from gem activesupport-5.1.2)
---
    with_warnings(flag) { || ... }

---

Sets $VERBOSE for the duration of the block and back to its original value
afterwards.


(from gem builder-3.2.3)
---
Since Ruby is very dynamic, methods added to the ancestors of BlankSlate
*after BlankSlate is defined* will show up in the list of available BlankSlate
methods.  We handle this by defining a hook in the Object and Kernel classes
that will hide any method defined after BlankSlate has been loaded.
---
# Class methods:

    blank_slate_method_added
    method_added

# Kernel::blank_slate_method_added

(from gem builder-3.2.3)
---
    blank_slate_method_added(name)

---


# Kernel::method_added

(from gem builder-3.2.3)
---
    method_added(name)

---

Detect method additions to Kernel and remove them in the BlankSlate class.


(from gem byebug-9.0.6)
---
Adds a `byebug` method to the Kernel module.

Dropping a `byebug` call anywhere in your code, you get a debug prompt.
---
# Instance methods:

    byebug
    debugger

# Kernel#byebug

(from gem byebug-9.0.6)
---
    byebug()

---


# Kernel#debugger

(from gem byebug-9.0.6)
---
    debugger()

---


(from gem i18n-0.8.6)
---
# Instance methods:

    suppress_warnings

# Kernel#suppress_warnings

(from gem i18n-0.8.6)
---
    suppress_warnings() { || ... }

---


(from gem minitest-5.10.3)
---
Kernel extensions for minitest
---
# Instance methods:

    describe

# Kernel#describe

(from gem minitest-5.10.3)
---
    describe(desc, *additional_desc, &block)

---

Describe a series of expectations for a given target `desc`.

Defines a test class subclassing from either Minitest::Spec or from the
surrounding describe's class. The surrounding class may subclass
Minitest::Spec manually in order to easily share code:

    class MySpec < Minitest::Spec
      # ... shared code ...
    end

    class TestStuff < MySpec
      it "does stuff" do
        # shared code available here
      end
      describe "inner stuff" do
        it "still does stuff" do
          # ...and here
        end
      end
    end

For more information on getting started with writing specs, see:

http://www.rubyinside.com/a-minitestspec-tutorial-elegant-spec-style-testing-t
hat-comes-with-ruby-5354.html

For some suggestions on how to improve your specs, try:

http://betterspecs.org

but do note that several items there are debatable or specific to rspec.

For more information about expectations, see Minitest::Expectations.


(from gem web-console-3.5.1)
---
# Instance methods:

    console

# Kernel#console

(from gem web-console-3.5.1)
---
    console(binding = Bindex.current_bindings.second)

---

Instructs Web Console to render a console in the specified binding.

If `binding` isn't explicitly given it will default to the binding of the
previous frame. E.g. the one that invoked `console`.

Raises DoubleRenderError if a double `console` invocation per request is
detected.


---
Also found in:
    gem bundler-1.15.3

