# Exception < Object

(from ruby core)
---
Descendants of class Exception are used to communicate between Kernel#raise
and `rescue` statements in `begin ... end` blocks. Exception objects carry
information about the exception -- its type (the exception's class name), an
optional descriptive string, and optional traceback information.  Exception
subclasses may add additional information like NameError#name.

Programs may make subclasses of Exception, typically of StandardError or
RuntimeError, to provide custom classes and add additional information. See
the subclass list below for defaults for `raise` and `rescue`.

When an exception has been raised but not yet handled (in `rescue`, `ensure`,
`at_exit` and `END` blocks) the global variable `$!` will contain the current
exception and `$@` contains the current exception's backtrace.

It is recommended that a library should have one subclass of StandardError or
RuntimeError and have specific exception types inherit from it.  This allows
the user to rescue a generic exception type to catch all exceptions the
library may raise even if future versions of the library add new exception
subclasses.

For example:

    class MyLibrary
      class Error < RuntimeError
      end

      class WidgetError < Error
      end

      class FrobError < Error
      end

    end

To handle both WidgetError and FrobError the library user can rescue
MyLibrary::Error.

The built-in subclasses of Exception are:

*   NoMemoryError
*   ScriptError
    *   LoadError
    *   NotImplementedError
    *   SyntaxError

*   SecurityError
*   SignalException
    *   Interrupt

*   StandardError -- default for `rescue`
    *   ArgumentError
        *   UncaughtThrowError

    *   EncodingError
    *   FiberError
    *   IOError
        *   EOFError

    *   IndexError
        *   KeyError
        *   StopIteration

    *   LocalJumpError
    *   NameError
        *   NoMethodError

    *   RangeError
        *   FloatDomainError

    *   RegexpError
    *   RuntimeError -- default for `raise`
    *   SystemCallError
        *   Errno::*

    *   ThreadError
    *   TypeError
    *   ZeroDivisionError

*   SystemExit
*   SystemStackError
*   fatal -- impossible to rescue


---
# Class methods:

    exception
    json_create
    new

# Instance methods:

    ==
    as_json
    backtrace
    backtrace_locations
    cause
    exception
    inspect
    message
    set_backtrace
    to_json
    to_s

# Exception::exception

(from ruby core)
---
    exc.exception(string)  ->  an_exception or exc

---

With no argument, or if the argument is the same as the receiver, return the
receiver. Otherwise, create a new exception object of the same class as the
receiver, but with a message equal to `string.to_str`.


# Exception::json_create

(from ruby core)
---
    json_create(object)

---

Deserializes JSON string by constructing new Exception object with message `m`
and backtrace `b` serialized with `to_json`


# Exception::new

(from ruby core)
---
    Exception.new(msg = nil)   ->  exception

---

Construct a new Exception object, optionally passing in a message.


# Exception#==

(from ruby core)
---
    exc == obj   -> true or false

---

Equality---If *obj* is not an `Exception`, returns `false`. Otherwise, returns
`true` if *exc* and *obj* share same class, messages, and backtrace.


# Exception#as_json

(from ruby core)
---
    as_json(*)

---

Returns a hash, that will be turned into a JSON object and represent this
object.


(from gem activesupport-5.1.2)
---
    as_json(options = nil)

---


# Exception#backtrace

(from ruby core)
---
    exception.backtrace    -> array

---

Returns any backtrace associated with the exception. The backtrace is an array
of strings, each containing either ``filename:lineNo: in `method''' or
``filename:lineNo.''

    def a
      raise "boom"
    end

    def b
      a()
    end

    begin
      b()
    rescue => detail
      print detail.backtrace.join("\n")
    end

*produces:*

    prog.rb:2:in `a'
    prog.rb:6:in `b'
    prog.rb:10


# Exception#backtrace_locations

(from ruby core)
---
    exception.backtrace_locations    -> array

---

Returns any backtrace associated with the exception. This method is similar to
Exception#backtrace, but the backtrace is an array of
Thread::Backtrace::Location.

Now, this method is not affected by Exception#set_backtrace().


# Exception#cause

(from ruby core)
---
    exception.cause   -> an_exception or nil

---

Returns the previous exception ($!) at the time this exception was raised.
This is useful for wrapping exceptions and retaining the original exception
information.


# Exception#exception

(from ruby core)
---
    exc.exception(string)  ->  an_exception or exc

---

With no argument, or if the argument is the same as the receiver, return the
receiver. Otherwise, create a new exception object of the same class as the
receiver, but with a message equal to `string.to_str`.


# Exception#inspect

(from ruby core)
---
    exception.inspect   -> string

---

Return this exception's class name and message


# Exception#message

(from ruby core)
---
    exception.message   ->  string

---

Returns the result of invoking `exception.to_s`. Normally this returns the
exception's message or name. By supplying a to_str method, exceptions are
agreeing to be used where Strings are expected.


# Exception#set_backtrace

(from ruby core)
---
    exc.set_backtrace(backtrace)   ->  array

---

Sets the backtrace information associated with `exc`. The `backtrace` must be
an array of String objects or a single String in the format described in
Exception#backtrace.


# Exception#to_json

(from ruby core)
---
    to_json(*args)

---

Stores class name (Exception) with message `m` and backtrace array `b` as JSON
string


# Exception#to_s

(from ruby core)
---
    exception.to_s   ->  string

---

Returns exception's message (or the name of the exception if no message is
set).


(from gem activesupport-5.1.2)
---
# Instance methods:

    as_json

# Exception#as_json

(from ruby core)
---
    as_json(*)

---

Returns a hash, that will be turned into a JSON object and represent this
object.


(from gem activesupport-5.1.2)
---
    as_json(options = nil)

---


(from gem bindex-0.5.0)
---
# Instance methods:

    bindings

# Exception#bindings

(from gem bindex-0.5.0)
---
    bindings()

---


(from gem byebug-9.0.6)
---
Extends the extension class to be able to pass information about the debugging
environment from the c-extension to the user.
---
# Instance methods:

    __bb_context

# Attributes:

    attr_reader __bb_context

