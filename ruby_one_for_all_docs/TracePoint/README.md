# TracePoint < Object

(from ruby core)
---
A class that provides the functionality of Kernel#set_trace_func in a nice
Object-Oriented API.

## Example

We can use TracePoint to gather information specifically for exceptions:

    trace = TracePoint.new(:raise) do |tp|
        p [tp.lineno, tp.event, tp.raised_exception]
    end
    #=> #<TracePoint:disabled>

    trace.enable
    #=> false

    0 / 0
    #=> [5, :raise, #<ZeroDivisionError: divided by 0>]

## Events

If you don't specify the type of events you want to listen for, TracePoint
will include all available events.

**Note** do not depend on current event set, as this list is subject to
change. Instead, it is recommended you specify the type of events you want to
use.

To filter what is traced, you can pass any of the following as `events`:

`:line`
:   execute code on a new line
`:class`
:   start a class or module definition
`:end`
:   finish a class or module definition
`:call`
:   call a Ruby method
`:return`
:   return from a Ruby method
`:c_call`
:   call a C-language routine
`:c_return`
:   return from a C-language routine
`:raise`
:   raise an exception
`:b_call`
:   event hook at block entry
`:b_return`
:   event hook at block ending
`:thread_begin`
:   event hook at thread beginning
`:thread_end`
:   event hook at thread ending
`:fiber_switch`
:   event hook at fiber switch

---
# Class methods:

    new
    stat
    trace

# Instance methods:

    binding
    callee_id
    defined_class
    disable
    enable
    enabled?
    event
    inspect
    lineno
    method_id
    path
    raised_exception
    return_value
    self

# TracePoint::new

(from ruby core)
---
    TracePoint.new(*events) { |obj| block }          -> obj

---

Returns a new TracePoint object, not enabled by default.

Next, in order to activate the trace, you must use TracePoint.enable

    trace = TracePoint.new(:call) do |tp|
        p [tp.lineno, tp.defined_class, tp.method_id, tp.event]
    end
    #=> #<TracePoint:disabled>

    trace.enable
    #=> false

    puts "Hello, TracePoint!"
    # ...
    # [48, IRB::Notifier::AbstractNotifier, :printf, :call]
    # ...

When you want to deactivate the trace, you must use TracePoint.disable

    trace.disable

See TracePoint@Events for possible events and more information.

A block must be given, otherwise a ThreadError is raised.

If the trace method isn't included in the given events filter, a RuntimeError
is raised.

    TracePoint.trace(:line) do |tp|
        p tp.raised_exception
    end
    #=> RuntimeError: 'raised_exception' not supported by this event

If the trace method is called outside block, a RuntimeError is raised.

    TracePoint.trace(:line) do |tp|
      $tp = tp
    end
    $tp.line #=> access from outside (RuntimeError)

Access from other threads is also forbidden.


# TracePoint::stat

(from ruby core)
---
    TracePoint.stat -> obj

---

Returns internal information of TracePoint.

The contents of the returned value are implementation specific. It may be
changed in future.

This method is only for debugging TracePoint itself.


# TracePoint::trace

(from ruby core)
---
    TracePoint.trace(*events) { |obj| block }        -> obj

---

A convenience method for TracePoint.new, that activates the trace
automatically.

    trace = TracePoint.trace(:call) { |tp| [tp.lineno, tp.event] }
    #=> #<TracePoint:enabled>

    trace.enabled? #=> true


# TracePoint#binding

(from ruby core)
---
    binding()

---

Return the generated binding object from event


# TracePoint#callee_id

(from ruby core)
---
    callee_id()

---

Return the called name of the method being called


# TracePoint#defined_class

(from ruby core)
---
    defined_class()

---

Return class or module of the method being called.

    class C; def foo; end; end
    trace = TracePoint.new(:call) do |tp|
      p tp.defined_class #=> C
    end.enable do
      C.new.foo
    end

If method is defined by a module, then that module is returned.

    module M; def foo; end; end
    class C; include M; end;
    trace = TracePoint.new(:call) do |tp|
      p tp.defined_class #=> M
    end.enable do
      C.new.foo
    end

**Note:** #defined_class returns singleton class.

6th block parameter of Kernel#set_trace_func passes original class of attached
by singleton class.

**This is a difference between Kernel#set_trace_func and TracePoint.**

    class C; def self.foo; end; end
    trace = TracePoint.new(:call) do |tp|
      p tp.defined_class #=> #<Class:C>
    end.enable do
      C.foo
    end


# TracePoint#disable

(from ruby core)
---
    trace.disable                -> true or false
    trace.disable { block } -> obj

---

Deactivates the trace

Return true if trace was enabled. Return false if trace was disabled.

    trace.enabled?       #=> true
    trace.disable        #=> false (previous status)
    trace.enabled?       #=> false
    trace.disable        #=> false

If a block is given, the trace will only be disable within the scope of the
block.

    trace.enabled?
    #=> true

    trace.disable do
        trace.enabled?
        # only disabled for this block
    end

    trace.enabled?
    #=> true

Note: You cannot access event hooks within the block.

    trace.disable { p tp.lineno }
    #=> RuntimeError: access from outside


# TracePoint#enable

(from ruby core)
---
    trace.enable         -> true or false
    trace.enable { block }       -> obj

---

Activates the trace

Return true if trace was enabled. Return false if trace was disabled.

    trace.enabled?  #=> false
    trace.enable    #=> false (previous state)
                    #   trace is enabled
    trace.enabled?  #=> true
    trace.enable    #=> true (previous state)
                    #   trace is still enabled

If a block is given, the trace will only be enabled within the scope of the
block.

    trace.enabled?
    #=> false

    trace.enable do
        trace.enabled?
        # only enabled for this block
    end

    trace.enabled?
    #=> false

Note: You cannot access event hooks within the block.

    trace.enable { p tp.lineno }
    #=> RuntimeError: access from outside


# TracePoint#enabled?

(from ruby core)
---
    trace.enabled?           -> true or false

---

The current status of the trace


# TracePoint#event

(from ruby core)
---
    event()

---

Type of event

See TracePoint@Events for more information.


# TracePoint#inspect

(from ruby core)
---
    trace.inspect  -> string

---

Return a string containing a human-readable TracePoint status.


# TracePoint#lineno

(from ruby core)
---
    lineno()

---

Line number of the event


# TracePoint#method_id

(from ruby core)
---
    method_id()

---

Return the name at the definition of the method being called


# TracePoint#path

(from ruby core)
---
    path()

---

Path of the file being run


# TracePoint#raised_exception

(from ruby core)
---
    raised_exception()

---

Value from exception raised on the `:raise` event


# TracePoint#return_value

(from ruby core)
---
    return_value()

---

Return value from `:return`, `c_return`, and `b_return` event


# TracePoint#self

(from ruby core)
---
    self()

---

Return the trace object during event

Same as TracePoint#binding:
    trace.binding.eval('self')


