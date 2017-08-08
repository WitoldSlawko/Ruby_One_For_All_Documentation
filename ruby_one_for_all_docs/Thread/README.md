# Thread < Object

(from ruby core)
---


Threads are the Ruby implementation for a concurrent programming model.

Programs that require multiple threads of execution are a perfect candidate
for Ruby's Thread class.

For example, we can create a new thread separate from the main thread's
execution using ::new.

    thr = Thread.new { puts "Whats the big deal" }

Then we are able to pause the execution of the main thread and allow our new
thread to finish, using #join:

    thr.join #=> "Whats the big deal"

If we don't call `thr.join` before the main thread terminates, then all other
threads including `thr` will be killed.

Alternatively, you can use an array for handling multiple threads at once,
like in the following example:

    threads = []
    threads << Thread.new { puts "Whats the big deal" }
    threads << Thread.new { 3.times { puts "Threads are fun!" } }

After creating a few threads we wait for them all to finish consecutively.

    threads.each { |thr| thr.join }

### Thread initialization

In order to create new threads, Ruby provides ::new, ::start, and ::fork. A
block must be provided with each of these methods, otherwise a ThreadError
will be raised.

When subclassing the Thread class, the `initialize` method of your subclass
will be ignored by ::start and ::fork. Otherwise, be sure to call super in
your `initialize` method.

### Thread termination

For terminating threads, Ruby provides a variety of ways to do this.

The class method ::kill, is meant to exit a given thread:

    thr = Thread.new { ... }
    Thread.kill(thr) # sends exit() to thr

Alternatively, you can use the instance method #exit, or any of its aliases
#kill or #terminate.

    thr.exit

### Thread status

Ruby provides a few instance methods for querying the state of a given thread.
To get a string with the current thread's state use #status

    thr = Thread.new { sleep }
    thr.status # => "sleep"
    thr.exit
    thr.status # => false

You can also use #alive? to tell if the thread is running or sleeping, and
#stop? if the thread is dead or sleeping.

### Thread variables and scope

Since threads are created with blocks, the same rules apply to other Ruby
blocks for variable scope. Any local variables created within this block are
accessible to only this thread.

#### Fiber-local vs. Thread-local

Each fiber has its own bucket for Thread#[] storage. When you set a new
fiber-local it is only accessible within this Fiber. To illustrate:

    Thread.new {
      Thread.current[:foo] = "bar"
      Fiber.new {
        p Thread.current[:foo] # => nil
      }.resume
    }.join

This example uses #[] for getting and #[]= for setting fiber-locals, you can
also use #keys to list the fiber-locals for a given thread and #key? to check
if a fiber-local exists.

When it comes to thread-locals, they are accessible within the entire scope of
the thread. Given the following example:

    Thread.new{
      Thread.current.thread_variable_set(:foo, 1)
      p Thread.current.thread_variable_get(:foo) # => 1
      Fiber.new{
        Thread.current.thread_variable_set(:foo, 2)
        p Thread.current.thread_variable_get(:foo) # => 2
      }.resume
      p Thread.current.thread_variable_get(:foo)   # => 2
    }.join

You can see that the thread-local `:foo` carried over into the fiber and was
changed to `2` by the end of the thread.

This example makes use of #thread_variable_set to create new thread-locals,
and #thread_variable_get to reference them.

There is also #thread_variables to list all thread-locals, and
#thread_variable? to check if a given thread-local exists.

### Exception handling

Any thread can raise an exception using the #raise instance method, which
operates similarly to Kernel#raise.

However, it's important to note that an exception that occurs in any thread
except the main thread depends on #abort_on_exception. This option is `false`
by default, meaning that any unhandled exception will cause the thread to
terminate silently when waited on by either #join or #value. You can change
this default by either #abort_on_exception= `true` or setting $DEBUG to
`true`.

With the addition of the class method ::handle_interrupt, you can now handle
exceptions asynchronously with threads.

### Scheduling

Ruby provides a few ways to support scheduling threads in your program.

The first way is by using the class method ::stop, to put the current running
thread to sleep and schedule the execution of another thread.

Once a thread is asleep, you can use the instance method #wakeup to mark your
thread as eligible for scheduling.

You can also try ::pass, which attempts to pass execution to another thread
but is dependent on the OS whether a running thread will switch or not. The
same goes for #priority, which lets you hint to the thread scheduler which
threads you want to take precedence when passing execution. This method is
also dependent on the OS and may be ignored on some platforms.
---
# Class methods:

    DEBUG
    DEBUG=
    abort_on_exception
    abort_on_exception=
    current
    exclusive
    exit
    fork
    handle_interrupt
    kill
    list
    main
    new
    pass
    pending_interrupt?
    report_on_exception
    report_on_exception=
    start
    stop

# Instance methods:

    []
    []=
    abort_on_exception
    abort_on_exception=
    add_trace_func
    alive?
    backtrace
    backtrace_locations
    exit
    group
    inspect
    join
    key?
    keys
    kill
    name
    name=
    pending_interrupt?
    priority
    priority=
    raise
    report_on_exception
    report_on_exception=
    run
    safe_level
    set_trace_func
    status
    stop?
    terminate
    thread_variable?
    thread_variable_get
    thread_variable_set
    thread_variables
    value
    wakeup

# Thread::abort_on_exception

(from ruby core)
---
    Thread.abort_on_exception   -> true or false

---

Returns the status of the global ``abort on exception'' condition.

The default is `false`.

When set to `true`, if any thread is aborted by an exception, the raised
exception will be re-raised in the main thread.

Can also be specified by the global $DEBUG flag or command line option `-d`.

See also ::abort_on_exception=.

There is also an instance level method to set this for a specific thread, see
#abort_on_exception.


# Thread::abort_on_exception=

(from ruby core)
---
    Thread.abort_on_exception= boolean   -> true or false

---

When set to `true`, if any thread is aborted by an exception, the raised
exception will be re-raised in the main thread. Returns the new state.

    Thread.abort_on_exception = true
    t1 = Thread.new do
      puts  "In new thread"
      raise "Exception from thread"
    end
    sleep(1)
    puts "not reached"

This will produce:

    In new thread
    prog.rb:4: Exception from thread (RuntimeError)
     from prog.rb:2:in `initialize'
     from prog.rb:2:in `new'
     from prog.rb:2

See also ::abort_on_exception.

There is also an instance level method to set this for a specific thread, see
#abort_on_exception=.


# Thread::current

(from ruby core)
---
    Thread.current   -> thread

---

Returns the currently executing thread.

    Thread.current   #=> #<Thread:0x401bdf4c run>


# Thread::exclusive

(from ruby core)
---
    Thread.exclusive { block }   => obj

---

Wraps the block in a single, VM-global Mutex.synchronize, returning the value
of the block. A thread executing inside the exclusive section will only block
other threads which also use the Thread.exclusive mechanism.


# Thread::exit

(from ruby core)
---
    Thread.exit   -> thread

---

Terminates the currently running thread and schedules another thread to be
run.

If this thread is already marked to be killed, ::exit returns the Thread.

If this is the main thread, or the last  thread, exit the process.


# Thread::fork

(from ruby core)
---
    Thread.fork([args]*) {|args| block }    -> thread

---

Basically the same as ::new. However, if class Thread is subclassed, then
calling `start` in that subclass will not invoke the subclass's `initialize`
method.


# Thread::handle_interrupt

(from ruby core)
---
    Thread.handle_interrupt(hash) { ... } -> result of the block

---

Changes asynchronous interrupt timing.

*interrupt* means asynchronous event and corresponding procedure by
Thread#raise, Thread#kill, signal trap (not supported yet) and main thread
termination (if main thread terminates, then all other thread will be killed).

The given `hash` has pairs like `ExceptionClass => :TimingSymbol`. Where the
ExceptionClass is the interrupt handled by the given block. The TimingSymbol
can be one of the following symbols:

`:immediate`
:   Invoke interrupts immediately.
`:on_blocking`
:   Invoke interrupts while *BlockingOperation*.
`:never`
:   Never invoke all interrupts.


*BlockingOperation* means that the operation will block the calling thread,
such as read and write.  On CRuby implementation, *BlockingOperation* is any
operation executed without GVL.

Masked asynchronous interrupts are delayed until they are enabled. This method
is similar to sigprocmask(3).

### NOTE

Asynchronous interrupts are difficult to use.

If you need to communicate between threads, please consider to use another way
such as Queue.

Or use them with deep understanding about this method.

### Usage

In this example, we can guard from Thread#raise exceptions.

Using the `:never` TimingSymbol the RuntimeError exception will always be
ignored in the first block of the main thread. In the second
::handle_interrupt block we can purposefully handle RuntimeError exceptions.

    th = Thread.new do
      Thread.handle_interrupt(RuntimeError => :never) {
        begin
          # You can write resource allocation code safely.
          Thread.handle_interrupt(RuntimeError => :immediate) {
            # ...
          }
        ensure
          # You can write resource deallocation code safely.
        end
      }
    end
    Thread.pass
    # ...
    th.raise "stop"

While we are ignoring the RuntimeError exception, it's safe to write our
resource allocation code. Then, the ensure block is where we can safely
deallocate your resources.

#### Guarding from Timeout::Error

In the next example, we will guard from the Timeout::Error exception. This
will help prevent from leaking resources when Timeout::Error exceptions occur
during normal ensure clause. For this example we use the help of the standard
library Timeout, from lib/timeout.rb

    require 'timeout'
    Thread.handle_interrupt(Timeout::Error => :never) {
      timeout(10){
        # Timeout::Error doesn't occur here
        Thread.handle_interrupt(Timeout::Error => :on_blocking) {
          # possible to be killed by Timeout::Error
          # while blocking operation
        }
        # Timeout::Error doesn't occur here
      }
    }

In the first part of the `timeout` block, we can rely on Timeout::Error being
ignored. Then in the `Timeout::Error => :on_blocking` block, any operation
that will block the calling thread is susceptible to a Timeout::Error
exception being raised.

#### Stack control settings

It's possible to stack multiple levels of ::handle_interrupt blocks in order
to control more than one ExceptionClass and TimingSymbol at a time.

    Thread.handle_interrupt(FooError => :never) {
      Thread.handle_interrupt(BarError => :never) {
         # FooError and BarError are prohibited.
      }
    }

#### Inheritance with ExceptionClass

All exceptions inherited from the ExceptionClass parameter will be considered.

    Thread.handle_interrupt(Exception => :never) {
      # all exceptions inherited from Exception are prohibited.
    }


# Thread::kill

(from ruby core)
---
    Thread.kill(thread)   -> thread

---

Causes the given `thread` to exit, see also Thread::exit.

    count = 0
    a = Thread.new { loop { count += 1 } }
    sleep(0.1)       #=> 0
    Thread.kill(a)   #=> #<Thread:0x401b3d30 dead>
    count            #=> 93947
    a.alive?         #=> false


# Thread::list

(from ruby core)
---
    Thread.list   -> array

---

Returns an array of Thread objects for all threads that are either runnable or
stopped.

    Thread.new { sleep(200) }
    Thread.new { 1000000.times {|i| i*i } }
    Thread.new { Thread.stop }
    Thread.list.each {|t| p t}

This will produce:

    #<Thread:0x401b3e84 sleep>
    #<Thread:0x401b3f38 run>
    #<Thread:0x401b3fb0 sleep>
    #<Thread:0x401bdf4c run>


# Thread::main

(from ruby core)
---
    Thread.main   -> thread

---

Returns the main thread.


# Thread::new

(from ruby core)
---
    Thread.new { ... }                  -> thread
    Thread.new(*args, &proc)            -> thread
    Thread.new(*args) { |args| ... }    -> thread

---

Creates a new thread executing the given block.

Any `args` given to ::new will be passed to the block:

    arr = []
    a, b, c = 1, 2, 3
    Thread.new(a,b,c) { |d,e,f| arr << d << e << f }.join
    arr #=> [1, 2, 3]

A ThreadError exception is raised if ::new is called without a block.

If you're going to subclass Thread, be sure to call super in your `initialize`
method, otherwise a ThreadError will be raised.


# Thread::pass

(from ruby core)
---
    Thread.pass   -> nil

---

Give the thread scheduler a hint to pass execution to another thread. A
running thread may or may not switch, it depends on OS and processor.


# Thread::pending_interrupt?

(from ruby core)
---
    Thread.pending_interrupt?(error = nil) -> true/false

---

Returns whether or not the asynchronous queue is empty.

Since Thread::handle_interrupt can be used to defer asynchronous events, this
method can be used to determine if there are any deferred events.

If you find this method returns true, then you may finish `:never` blocks.

For example, the following method processes deferred asynchronous events
immediately.

    def Thread.kick_interrupt_immediately
      Thread.handle_interrupt(Object => :immediate) {
        Thread.pass
      }
    end

If `error` is given, then check only for `error` type deferred events.

### Usage

    th = Thread.new{
      Thread.handle_interrupt(RuntimeError => :on_blocking){
        while true
          ...
          # reach safe point to invoke interrupt
          if Thread.pending_interrupt?
            Thread.handle_interrupt(Object => :immediate){}
          end
          ...
        end
      }
    }
    ...
    th.raise # stop thread

This example can also be written as the following, which you should use to
avoid asynchronous interrupts.

    flag = true
    th = Thread.new{
      Thread.handle_interrupt(RuntimeError => :on_blocking){
        while true
          ...
          # reach safe point to invoke interrupt
          break if flag == false
          ...
        end
      }
    }
    ...
    flag = false # stop thread


# Thread::report_on_exception

(from ruby core)
---
    Thread.report_on_exception   -> true or false

---

Returns the status of the global ``report on exception'' condition.

The default is `false`.

When set to `true`, all threads will report the exception if an exception is
raised in any thread.

See also ::report_on_exception=.

There is also an instance level method to set this for a specific thread, see
#report_on_exception.


# Thread::report_on_exception=

(from ruby core)
---
    Thread.report_on_exception= boolean   -> true or false

---

When set to `true`, all threads will report the exception if an exception is
raised.  Returns the new state.

    Thread.report_on_exception = true
    t1 = Thread.new do
      puts  "In new thread"
      raise "Exception from thread"
    end
    sleep(1)
    puts "In the main thread"

This will produce:

    In new thread
    prog.rb:4: Exception from thread (RuntimeError)
     from prog.rb:2:in `initialize'
     from prog.rb:2:in `new'
     from prog.rb:2
    In the main thread

See also ::report_on_exception.

There is also an instance level method to set this for a specific thread, see
#report_on_exception=.


# Thread::start

(from ruby core)
---
    Thread.start([args]*) {|args| block }   -> thread

---

Basically the same as ::new. However, if class Thread is subclassed, then
calling `start` in that subclass will not invoke the subclass's `initialize`
method.


# Thread::stop

(from ruby core)
---
    Thread.stop   -> nil

---

Stops execution of the current thread, putting it into a ``sleep'' state, and
schedules execution of another thread.

    a = Thread.new { print "a"; Thread.stop; print "c" }
    sleep 0.1 while a.status!='sleep'
    print "b"
    a.run
    a.join
    #=> "abc"


# Thread#[]

(from ruby core)
---
    thr[sym]   -> obj or nil

---

Attribute Reference---Returns the value of a fiber-local variable (current
thread's root fiber if not explicitly inside a Fiber), using either a symbol
or a string name. If the specified variable does not exist, returns `nil`.

    [
      Thread.new { Thread.current["name"] = "A" },
      Thread.new { Thread.current[:name]  = "B" },
      Thread.new { Thread.current["name"] = "C" }
    ].each do |th|
      th.join
      puts "#{th.inspect}: #{th[:name]}"
    end

This will produce:

    #<Thread:0x00000002a54220 dead>: A
    #<Thread:0x00000002a541a8 dead>: B
    #<Thread:0x00000002a54130 dead>: C

Thread#[] and Thread#[]= are not thread-local but fiber-local. This confusion
did not exist in Ruby 1.8 because fibers are only available since Ruby 1.9.
Ruby 1.9 chooses that the methods behaves fiber-local to save following idiom
for dynamic scope.

    def meth(newvalue)
      begin
        oldvalue = Thread.current[:name]
        Thread.current[:name] = newvalue
        yield
      ensure
        Thread.current[:name] = oldvalue
      end
    end

The idiom may not work as dynamic scope if the methods are thread-local and a
given block switches fiber.

    f = Fiber.new {
      meth(1) {
        Fiber.yield
      }
    }
    meth(2) {
      f.resume
    }
    f.resume
    p Thread.current[:name]
    #=> nil if fiber-local
    #=> 2 if thread-local (The value 2 is leaked to outside of meth method.)

For thread-local variables, please see #thread_variable_get and
#thread_variable_set.


# Thread#[]=

(from ruby core)
---
    thr[sym] = obj   -> obj

---

Attribute Assignment---Sets or creates the value of a fiber-local variable,
using either a symbol or a string.

See also Thread#[].

For thread-local variables, please see #thread_variable_set and
#thread_variable_get.


# Thread#abort_on_exception

(from ruby core)
---
    thr.abort_on_exception   -> true or false

---

Returns the status of the thread-local ``abort on exception'' condition for
this `thr`.

The default is `false`.

See also #abort_on_exception=.

There is also a class level method to set this for all threads, see
::abort_on_exception.


# Thread#abort_on_exception=

(from ruby core)
---
    thr.abort_on_exception= boolean   -> true or false

---

When set to `true`, if this `thr` is aborted by an exception, the raised
exception will be re-raised in the main thread.

See also #abort_on_exception.

There is also a class level method to set this for all threads, see
::abort_on_exception=.


# Thread#add_trace_func

(from ruby core)
---
    thr.add_trace_func(proc)    -> proc

---

Adds *proc* as a handler for tracing.

See Thread#set_trace_func and Kernel#set_trace_func.


# Thread#alive?

(from ruby core)
---
    thr.alive?   -> true or false

---

Returns `true` if `thr` is running or sleeping.

    thr = Thread.new { }
    thr.join                #=> #<Thread:0x401b3fb0 dead>
    Thread.current.alive?   #=> true
    thr.alive?              #=> false

See also #stop? and #status.


# Thread#backtrace

(from ruby core)
---
    thread.backtrace    -> array

---

Returns the current backtrace of the target thread.


# Thread#backtrace_locations

(from ruby core)
---
    thread.backtrace_locations(*args)   -> array or nil

---

Returns the execution stack for the target thread---an array containing
backtrace location objects.

See Thread::Backtrace::Location for more information.

This method behaves similarly to Kernel#caller_locations except it applies to
a specific thread.


# Thread#exit

(from ruby core)
---
    thr.exit        -> thr or nil
    thr.kill        -> thr or nil
    thr.terminate   -> thr or nil

---

Terminates `thr` and schedules another thread to be run.

If this thread is already marked to be killed, #exit returns the Thread.

If this is the main thread, or the last thread, exits the process.


# Thread#group

(from ruby core)
---
    thr.group   -> thgrp or nil

---

Returns the ThreadGroup which contains the given thread, or returns `nil` if
`thr` is not a member of any group.

    Thread.main.group   #=> #<ThreadGroup:0x4029d914>


# Thread#inspect

(from ruby core)
---
    thr.inspect   -> string

---

Dump the name, id, and status of *thr* to a string.


# Thread#join

(from ruby core)
---
    thr.join          -> thr
    thr.join(limit)   -> thr

---

The calling thread will suspend execution and run this `thr`.

Does not return until `thr` exits or until the given `limit` seconds have
passed.

If the time limit expires, `nil` will be returned, otherwise `thr` is
returned.

Any threads not joined will be killed when the main program exits.

If `thr` had previously raised an exception and the ::abort_on_exception or
$DEBUG flags are not set, (so the exception has not yet been processed), it
will be processed at this time.

    a = Thread.new { print "a"; sleep(10); print "b"; print "c" }
    x = Thread.new { print "x"; Thread.pass; print "y"; print "z" }
    x.join # Let thread x finish, thread a will be killed on exit.
    #=> "axyz"

The following example illustrates the `limit` parameter.

    y = Thread.new { 4.times { sleep 0.1; puts 'tick... ' }}
    puts "Waiting" until y.join(0.15)

This will produce:

    tick...
    Waiting
    tick...
    Waiting
    tick...
    tick...


# Thread#key?

(from ruby core)
---
    thr.key?(sym)   -> true or false

---

Returns `true` if the given string (or symbol) exists as a fiber-local
variable.

    me = Thread.current
    me[:oliver] = "a"
    me.key?(:oliver)    #=> true
    me.key?(:stanley)   #=> false


# Thread#keys

(from ruby core)
---
    thr.keys   -> array

---

Returns an array of the names of the fiber-local variables (as Symbols).

    thr = Thread.new do
      Thread.current[:cat] = 'meow'
      Thread.current["dog"] = 'woof'
    end
    thr.join   #=> #<Thread:0x401b3f10 dead>
    thr.keys   #=> [:dog, :cat]


# Thread#kill

(from ruby core)
---
    thr.exit        -> thr or nil
    thr.kill        -> thr or nil
    thr.terminate   -> thr or nil

---

Terminates `thr` and schedules another thread to be run.

If this thread is already marked to be killed, #exit returns the Thread.

If this is the main thread, or the last thread, exits the process.


# Thread#name

(from ruby core)
---
    thr.name   -> string

---

show the name of the thread.


# Thread#name=

(from ruby core)
---
    thr.name=(name)   -> string

---

set given name to the ruby thread. On some platform, it may set the name to
pthread and/or kernel.


# Thread#pending_interrupt?

(from ruby core)
---
    target_thread.pending_interrupt?(error = nil) -> true/false

---

Returns whether or not the asynchronous queue is empty for the target thread.

If `error` is given, then check only for `error` type deferred events.

See ::pending_interrupt? for more information.


# Thread#priority

(from ruby core)
---
    thr.priority   -> integer

---

Returns the priority of *thr*. Default is inherited from the current thread
which creating the new thread, or zero for the initial main thread;
higher-priority thread will run more frequently than lower-priority threads
(but lower-priority threads can also run).

This is just hint for Ruby thread scheduler.  It may be ignored on some
platform.

    Thread.current.priority   #=> 0


# Thread#priority=

(from ruby core)
---
    thr.priority= integer   -> thr

---

Sets the priority of *thr* to *integer*. Higher-priority threads will run more
frequently than lower-priority threads (but lower-priority threads can also
run).

This is just hint for Ruby thread scheduler.  It may be ignored on some
platform.

    count1 = count2 = 0
    a = Thread.new do
          loop { count1 += 1 }
        end
    a.priority = -1

    b = Thread.new do
          loop { count2 += 1 }
        end
    b.priority = -2
    sleep 1   #=> 1
    count1    #=> 622504
    count2    #=> 5832


# Thread#raise

(from ruby core)
---
    thr.raise
    thr.raise(string)
    thr.raise(exception [, string [, array]])

---

Raises an exception from the given thread. The caller does not have to be
`thr`. See Kernel#raise for more information.

    Thread.abort_on_exception = true
    a = Thread.new { sleep(200) }
    a.raise("Gotcha")

This will produce:

    prog.rb:3: Gotcha (RuntimeError)
     from prog.rb:2:in `initialize'
     from prog.rb:2:in `new'
     from prog.rb:2


# Thread#report_on_exception

(from ruby core)
---
    thr.report_on_exception   -> true or false

---

Returns the status of the thread-local ``report on exception'' condition for
this `thr`.

The default is `false`.

See also #report_on_exception=.

There is also a class level method to set this for all threads, see
::report_on_exception.


# Thread#report_on_exception=

(from ruby core)
---
    thr.report_on_exception= boolean   -> true or false

---

When set to `true`, all threads (including the main program) will report the
exception if an exception is raised in this `thr`.

See also #report_on_exception.

There is also a class level method to set this for all threads, see
::report_on_exception=.


# Thread#run

(from ruby core)
---
    thr.run   -> thr

---

Wakes up `thr`, making it eligible for scheduling.

    a = Thread.new { puts "a"; Thread.stop; puts "c" }
    sleep 0.1 while a.status!='sleep'
    puts "Got here"
    a.run
    a.join

This will produce:

    a
    Got here
    c

See also the instance method #wakeup.


# Thread#safe_level

(from ruby core)
---
    thr.safe_level   -> integer

---

Returns the safe level in effect for *thr*. Setting thread-local safe levels
can help when implementing sandboxes which run insecure code.

    thr = Thread.new { $SAFE = 1; sleep }
    Thread.current.safe_level   #=> 0
    thr.safe_level              #=> 1


# Thread#set_trace_func

(from ruby core)
---
    thr.set_trace_func(proc)    -> proc
    thr.set_trace_func(nil)     -> nil

---

Establishes *proc* on *thr* as the handler for tracing, or disables tracing if
the parameter is `nil`.

See Kernel#set_trace_func.


# Thread#status

(from ruby core)
---
    thr.status   -> string, false or nil

---

Returns the status of `thr`.

`"sleep"`
:   Returned if this thread is sleeping or waiting on I/O
`"run"`
:   When this thread is executing
`"aborting"`
:   If this thread is aborting
`false`
:   When this thread is terminated normally
`nil`
:   If terminated with an exception.


    a = Thread.new { raise("die now") }
    b = Thread.new { Thread.stop }
    c = Thread.new { Thread.exit }
    d = Thread.new { sleep }
    d.kill                  #=> #<Thread:0x401b3678 aborting>
    a.status                #=> nil
    b.status                #=> "sleep"
    c.status                #=> false
    d.status                #=> "aborting"
    Thread.current.status   #=> "run"

See also the instance methods #alive? and #stop?


# Thread#stop?

(from ruby core)
---
    thr.stop?   -> true or false

---

Returns `true` if `thr` is dead or sleeping.

    a = Thread.new { Thread.stop }
    b = Thread.current
    a.stop?   #=> true
    b.stop?   #=> false

See also #alive? and #status.


# Thread#terminate

(from ruby core)
---
    thr.terminate   -> thr or nil

---

Terminates `thr` and schedules another thread to be run.

If this thread is already marked to be killed, #exit returns the Thread.

If this is the main thread, or the last thread, exits the process.


# Thread#thread_variable?

(from ruby core)
---
    thr.thread_variable?(key)   -> true or false

---

Returns `true` if the given string (or symbol) exists as a thread-local
variable.

    me = Thread.current
    me.thread_variable_set(:oliver, "a")
    me.thread_variable?(:oliver)    #=> true
    me.thread_variable?(:stanley)   #=> false

Note that these are not fiber local variables.  Please see Thread#[] and
Thread#thread_variable_get for more details.


# Thread#thread_variable_get

(from ruby core)
---
    thr.thread_variable_get(key)  -> obj or nil

---

Returns the value of a thread local variable that has been set.  Note that
these are different than fiber local values.  For fiber local values, please
see Thread#[] and Thread#[]=.

Thread local values are carried along with threads, and do not respect fibers.
 For example:

    Thread.new {
      Thread.current.thread_variable_set("foo", "bar") # set a thread local
      Thread.current["foo"] = "bar"                    # set a fiber local

      Fiber.new {
        Fiber.yield [
          Thread.current.thread_variable_get("foo"), # get the thread local
          Thread.current["foo"],                     # get the fiber local
        ]
      }.resume
    }.join.value # => ['bar', nil]

The value "bar" is returned for the thread local, where nil is returned for
the fiber local.  The fiber is executed in the same thread, so the thread
local values are available.


# Thread#thread_variable_set

(from ruby core)
---
    thr.thread_variable_set(key, value)

---

Sets a thread local with `key` to `value`.  Note that these are local to
threads, and not to fibers.  Please see Thread#thread_variable_get and
Thread#[] for more information.


# Thread#thread_variables

(from ruby core)
---
    thr.thread_variables   -> array

---

Returns an array of the names of the thread-local variables (as Symbols).

    thr = Thread.new do
      Thread.current.thread_variable_set(:cat, 'meow')
      Thread.current.thread_variable_set("dog", 'woof')
    end
    thr.join               #=> #<Thread:0x401b3f10 dead>
    thr.thread_variables   #=> [:dog, :cat]

Note that these are not fiber local variables.  Please see Thread#[] and
Thread#thread_variable_get for more details.


# Thread#value

(from ruby core)
---
    thr.value   -> obj

---

Waits for `thr` to complete, using #join, and returns its value or raises the
exception which terminated the thread.

    a = Thread.new { 2 + 2 }
    a.value   #=> 4

    b = Thread.new { raise 'something went wrong' }
    b.value   #=> RuntimeError: something went wrong


# Thread#wakeup

(from ruby core)
---
    thr.wakeup   -> thr

---

Marks a given thread as eligible for scheduling, however it may still remain
blocked on I/O.

**Note:** This does not invoke the scheduler, see #run for more information.

    c = Thread.new { Thread.stop; puts "hey!" }
    sleep 0.1 while c.status!='sleep'
    c.wakeup
    c.join
    #=> "hey!"


