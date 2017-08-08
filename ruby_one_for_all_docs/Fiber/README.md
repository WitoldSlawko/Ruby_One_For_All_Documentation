# Fiber < Object

(from ruby core)
---
Fibers are primitives for implementing light weight cooperative concurrency in
Ruby. Basically they are a means of creating code blocks that can be paused
and resumed, much like threads. The main difference is that they are never
preempted and that the scheduling must be done by the programmer and not the
VM.

As opposed to other stackless light weight concurrency models, each fiber
comes with a small 4KB stack. This enables the fiber to be paused from deeply
nested function calls within the fiber block.

When a fiber is created it will not run automatically. Rather it must be
explicitly asked to run using the `Fiber#resume` method. The code running
inside the fiber can give up control by calling `Fiber.yield` in which case it
yields control back to caller (the caller of the `Fiber#resume`).

Upon yielding or termination the Fiber returns the value of the last executed
expression

For instance:

    fiber = Fiber.new do
      Fiber.yield 1
      2
    end

    puts fiber.resume
    puts fiber.resume
    puts fiber.resume

*produces*

    1
    2
    FiberError: dead fiber called

The `Fiber#resume` method accepts an arbitrary number of parameters, if it is
the first call to `resume` then they will be passed as block arguments.
Otherwise they will be the return value of the call to `Fiber.yield`

Example:

    fiber = Fiber.new do |first|
      second = Fiber.yield first + 2
    end

    puts fiber.resume 10
    puts fiber.resume 14
    puts fiber.resume 18

*produces*

    12
    14
    FiberError: dead fiber called
---
# Class methods:

    current
    yield

# Instance methods:

    alive?
    resume
    transfer

# Fiber::current

(from ruby core)
---
    Fiber.current() -> fiber

---

Returns the current fiber. You need to `require 'fiber'` before using this
method. If you are not running in the context of a fiber this method will
return the root fiber.


# Fiber::yield

(from ruby core)
---
    Fiber.yield(args, ...) -> obj

---

Yields control back to the context that resumed the fiber, passing along any
arguments that were passed to it. The fiber will resume processing at this
point when `resume` is called next. Any arguments passed to the next `resume`
will be the value that this `Fiber.yield` expression evaluates to.


# Fiber#alive?

(from ruby core)
---
    fiber.alive? -> true or false

---

Returns true if the fiber can still be resumed (or transferred to). After
finishing execution of the fiber block this method will always return false.
You need to `require 'fiber'` before using this method.


# Fiber#resume

(from ruby core)
---
    fiber.resume(args, ...) -> obj

---

Resumes the fiber from the point at which the last `Fiber.yield` was called,
or starts running it if it is the first call to `resume`. Arguments passed to
resume will be the value of the `Fiber.yield` expression or will be passed as
block parameters to the fiber's block if this is the first `resume`.

Alternatively, when resume is called it evaluates to the arguments passed to
the next `Fiber.yield` statement inside the fiber's block or to the block
value if it runs to completion without any `Fiber.yield`


# Fiber#transfer

(from ruby core)
---
    fiber.transfer(args, ...) -> obj

---

Transfer control to another fiber, resuming it from where it last stopped or
starting it if it was not resumed before. The calling fiber will be suspended
much like in a call to `Fiber.yield`. You need to `require 'fiber'` before
using this method.

The fiber which receives the transfer call is treats it much like a resume
call. Arguments passed to transfer are treated like those passed to resume.

You cannot resume a fiber that transferred control to another one. This will
cause a double resume error. You need to transfer control back to this fiber
before it can yield and resume.

Example:

    fiber1 = Fiber.new do
      puts "In Fiber 1"
      Fiber.yield
    end

    fiber2 = Fiber.new do
      puts "In Fiber 2"
      fiber1.transfer
      puts "Never see this message"
    end

    fiber3 = Fiber.new do
      puts "In Fiber 3"
    end

    fiber2.resume
    fiber3.resume

*produces*

    In fiber 2
    In fiber 1
    In fiber 3


