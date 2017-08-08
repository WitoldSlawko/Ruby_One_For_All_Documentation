# NameError < StandardError

(from ruby core)
---
Raised when a given name is invalid or undefined.

    puts foo

*raises the exception:*

    NameError: undefined local variable or method `foo' for main:Object

Since constant names must start with a capital:

    Integer.const_set :answer, 42

*raises the exception:*

    NameError: wrong constant name answer
---
# Class methods:

    new

# Instance methods:

    local_variables
    name
    receiver

# NameError::new

(from ruby core)
---
    NameError.new([msg, *, name])  -> name_error

---

Construct a new NameError exception. If given the *name* parameter may
subsequently be examined using the `NameError.name` method.


# NameError#local_variables

(from ruby core)
---
    name_error.local_variables  ->  array

---

Return a list of the local variable names defined where this NameError
exception was raised.

Internal use only.


# NameError#name

(from ruby core)
---
    name_error.name    ->  string or nil

---

Return the name associated with this NameError exception.


# NameError#receiver

(from ruby core)
---
    name_error.receiver  -> object

---

Return the receiver associated with this NameError exception.


(from gem activesupport-5.1.2)
---
# Instance methods:

    missing_name
    missing_name?

# NameError#missing_name

(from gem activesupport-5.1.2)
---
    missing_name()

---

Extract the name of the missing constant from the exception message.

    begin
      HelloWorld
    rescue NameError => e
      e.missing_name
    end
    # => "HelloWorld"


# NameError#missing_name?

(from gem activesupport-5.1.2)
---
    missing_name?(name)

---

Was this exception raised because the given name was missing?

    begin
      HelloWorld
    rescue NameError => e
      e.missing_name?("HelloWorld")
    end
    # => true


