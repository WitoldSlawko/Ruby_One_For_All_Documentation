# Exception2MessageMapper

---
# Extended by:
Exception2MessageMapper (from ruby core)

(from ruby core)
---
Helper module for easily defining exceptions with predefined messages.

## Usage

1.
    class Foo
      extend Exception2MessageMapper
      def_e2message ExistingExceptionClass, "message..."
      def_exception :NewExceptionClass, "message..."[, superclass]
      ...
    end

2.
    module Error
      extend Exception2MessageMapper
      def_e2message ExistingExceptionClass, "message..."
      def_exception :NewExceptionClass, "message..."[, superclass]
      ...
    end
    class Foo
      include Error
      ...
    end

    foo = Foo.new
    foo.Fail ....

3.
    module Error
      extend Exception2MessageMapper
      def_e2message ExistingExceptionClass, "message..."
      def_exception :NewExceptionClass, "message..."[, superclass]
      ...
    end
    class Foo
      extend Exception2MessageMapper
      include Error
      ...
    end

    Foo.Fail NewExceptionClass, arg...
    Foo.Fail ExistingExceptionClass, arg...
---
# Class methods:

    included

# Instance methods:

    Fail
    Raise
    bind
    def_e2message
    def_exception
    fail

# Exception2MessageMapper::included

(from ruby core)
---
    included(mod)

---


# Exception2MessageMapper#Fail

(from ruby core)
---
    Fail(err = nil, *rest)

---


# Exception2MessageMapper#Raise

(from ruby core)
---
    Raise(err = nil, *rest)

---


# Exception2MessageMapper#bind

(from ruby core)
---
    bind(cl)

---


# Exception2MessageMapper#def_e2message

(from ruby core)
---
    def_e2message(c, m)

---

def_e2message(c, m)
        c:  exception
        m:  message_form
    define exception c with message m.


# Exception2MessageMapper#def_exception

(from ruby core)
---
    def_exception(n, m, s = StandardError)

---

def_exception(n, m, s)
        n:  exception_name
        m:  message_form
        s:  superclass(default: StandardError)
    define exception named ``c'' with message m.


# Exception2MessageMapper#fail

(from ruby core)
---
    fail(err = nil, *rest)

---


