# Concurrent

---
# Extended by:
(from gem concurrent-ruby-1.0.5)

Utility::EngineDetector

@!visibility private

Utility::NativeExtensionLoader

@!visibility private

    Concern::Logging

(from gem concurrent-ruby-1.0.5)
---
Modern concurrency tools for Ruby. Inspired by Erlang, Clojure, Scala,
Haskell, F#, C#, Java, and classic concurrency patterns.

The design goals of this gem are:

*   Stay true to the spirit of the languages providing inspiration
*   But implement in a way that makes sense for Ruby
*   Keep the semantics as idiomatic Ruby as possible
*   Support features that make sense in Ruby
*   Exclude features that don't make sense in Ruby
*   Be small, lean, and loosely coupled





@!macro [new] thread_safe_variable_comparison

    ## Thread-safe Variable Classes

    Each of the thread-safe variable classes is designed to solve a different
    problem. In general:

    * *{Concurrent::Agent}:* Shared, mutable variable providing independent,
      uncoordinated, *asynchronous* change of individual values. Best used when
      the value will undergo frequent, complex updates. Suitable when the result
      of an update does not need to be known immediately.
    * *{Concurrent::Atom}:* Shared, mutable variable providing independent,
      uncoordinated, *synchronous* change of individual values. Best used when
      the value will undergo frequent reads but only occasional, though complex,
      updates. Suitable when the result of an update must be known immediately.
    * *{Concurrent::AtomicReference}:* A simple object reference that can be
      atomically. Updates are synchronous but fast. Best used when updates a
      simple set operations. Not suitable when updates are complex.
      {Concurrent::AtomicBoolean} and {Concurrent::AtomicFixnum} are similar
      but optimized for the given data type.
    * *{Concurrent::Exchanger}:* Shared, stateless synchronization point. Used
      when two or more threads need to exchange data. The threads will pair then
      block on each other until the exchange is complete.
    * *{Concurrent::MVar}:* Shared synchronization point. Used when one thread
      must give a value to another, which must take the value. The threads will
      block on each other until the exchange is complete.
    * *{Concurrent::ThreadLocalVar}:* Shared, mutable, isolated variable which
      holds a different value for each thread which has access. Often used as
      an instance variable in objects which must maintain different state
      for different threads.
    * *{Concurrent::TVar}:* Shared, mutable variables which provide
      *coordinated*, *synchronous*, change of *many* stated. Used when multiple
      value must change together, in an all-or-nothing transaction.


















































































































---
# Constants:

AtExit
:   @see AtExitImplementation @!visibility private
AtomicBooleanImplementation
:   @!visibility private @!macro internal_implementation_note
AtomicFixnumImplementation
:   @!visibility private @!macro internal_implementation_note
CancelledOperationError
:   Raised when an asynchronous operation is cancelled before execution.
ConfigurationError
:   Raised when errors occur during configuration.
CountDownLatchImplementation
:   @!visibility private @!macro internal_implementation_note
EDGE_VERSION
:   [not documented]
Error
:   [not documented]
ExchangerImplementation
:   @!visibility private @!macro internal_implementation_note
GLOBAL_FAST_EXECUTOR
:   @!visibility private
GLOBAL_IMMEDIATE_EXECUTOR
:   @!visibility private
GLOBAL_IO_EXECUTOR
:   @!visibility private
GLOBAL_LOGGER
:   @!visibility private
GLOBAL_MONOTONIC_CLOCK
:   Clock that cannot be set and represents monotonic time since some
    unspecified starting point.

    @!visibility private
GLOBAL_TIMER_SET
:   @!visibility private
IllegalOperationError
:   Raised when an operation is attempted which is not legal given the
    receiver's current state
ImmutabilityError
:   Raised when an attempt is made to violate an immutability guarantee.
InitializationError
:   Raised when an object's methods are called when it has not been properly
    initialized.
LifecycleError
:   Raised when a lifecycle method (such as `stop`) is called in an improper
    sequence or when the object is in an inappropriate state.
MaxRestartFrequencyError
:   Raised when an object with a start/stop lifecycle has been started an
    excessive number of times. Often used in conjunction with a restart policy
    or strategy.
NULL
:   Various classes within allows for `nil` values to be stored, so a special
    `NULL` token is required to indicate the "nil-ness". @!visibility private
NULL_LOGGER
:   Suppresses all output when used for logging.
PromiseExecutionError
:   [not documented]
RejectedExecutionError
:   Raised by an `Executor` when it is unable to process a given task,
    possibly because of a reject policy or other internal error.
ResourceLimitError
:   Raised when any finite resource, such as a lock counter, exceeds its
    maximum limit/threshold.
SemaphoreImplementation
:   @!visibility private @!macro internal_implementation_note
SingleThreadExecutorImplementation
:   [not documented]
ThreadLocalVarImplementation
:   @!visibility private @!macro internal_implementation_note
ThreadPoolExecutorImplementation
:   [not documented]
TimeoutError
:   Raised when an operation times out.
VERSION
:   [not documented]


# Class methods:

    abort_transaction
    atomically
    call_dataflow
    create_simple_logger
    create_stdlib_logger
    dataflow
    dataflow!
    dataflow_with
    dataflow_with!
    disable_at_exit_handlers!
    executor
    global_fast_executor
    global_immediate_executor
    global_io_executor
    global_logger
    global_logger=
    global_timer_set
    leave_transaction
    monotonic_time
    new
    new_fast_executor
    new_io_executor
    physical_processor_count
    processor_count
    use_simple_logger
    use_stdlib_logger

# Instance methods:

    abort_transaction
    atomically
    call_dataflow
    dataflow
    dataflow!
    dataflow_with
    dataflow_with!
    get_time
    leave_transaction
    monotonic_time

# Concurrent::abort_transaction

(from gem concurrent-ruby-1.0.5)
---
    abort_transaction()

---

Abort a currently running transaction - see `Concurrent::atomically`.


# Concurrent::atomically

(from gem concurrent-ruby-1.0.5)
---
    atomically() { || ... }

---

Run a block that reads and writes `TVar`s as a single atomic transaction. With
respect to the value of `TVar` objects, the transaction is atomic, in that it
either happens or it does not, consistent, in that the `TVar` objects involved
will never enter an illegal state, and isolated, in that transactions never
interfere with each other. You may recognise these properties from database
transactions.

There are some very important and unusual semantics that you must be aware of:

*   Most importantly, the block that you pass to atomically may be executed
        more than once. In most cases your code should be free of
        side-effects, except for via TVar.

*   If an exception escapes an atomically block it will abort the transaction.

*   It is undefined behaviour to use callcc or Fiber with atomically.

*   If you create a new thread within an atomically, it will not be part of
        the transaction. Creating a thread counts as a side-effect.


Transactions within transactions are flattened to a single transaction.

@example
    a = new TVar(100_000)
    b = new TVar(100)

    Concurrent::atomically do
      a.value -= 10
      b.value += 10
    end


# Concurrent::call_dataflow

(from gem concurrent-ruby-1.0.5)
---
    call_dataflow(method, executor, *inputs, &block)

---


# Concurrent::create_simple_logger

(from gem concurrent-ruby-1.0.5)
---
    create_simple_logger(level = Logger::FATAL, output = $stderr)

---

@return [Logger] Logger with provided level and output.


# Concurrent::create_stdlib_logger

(from gem concurrent-ruby-1.0.5)
---
    create_stdlib_logger(level = Logger::FATAL, output = $stderr)

---

@return [Logger] Logger with provided level and output. @deprecated


# Concurrent::dataflow

(from gem concurrent-ruby-1.0.5)
---
    dataflow(*inputs, &block)

---

{include:file:doc/dataflow.md}

@param [Future] inputs zero or more `Future` operations that this dataflow
depends upon

@yield The operation to perform once all the dependencies are met @yieldparam
[Future] inputs each of the `Future` inputs to the dataflow @yieldreturn
[Object] the result of the block operation

@return [Object] the result of all the operations

@raise [ArgumentError] if no block is given @raise [ArgumentError] if any of
the inputs are not `IVar`s


# Concurrent::dataflow!

(from gem concurrent-ruby-1.0.5)
---
    dataflow!(*inputs, &block)

---


# Concurrent::dataflow_with

(from gem concurrent-ruby-1.0.5)
---
    dataflow_with(executor, *inputs, &block)

---


# Concurrent::dataflow_with!

(from gem concurrent-ruby-1.0.5)
---
    dataflow_with!(executor, *inputs, &block)

---


# Concurrent::disable_at_exit_handlers!

(from gem concurrent-ruby-1.0.5)
---
    disable_at_exit_handlers!()

---

Disables AtExit handlers including pool auto-termination handlers. When
disabled it will be the application programmer's responsibility to ensure that
the handlers are shutdown properly prior to application exit by calling
{AtExit.run} method.

@note this option should be needed only because of `at_exit` ordering
    issues which may arise when running some of the testing frameworks.
    E.g. Minitest's test-suite runs itself in `at_exit` callback which
    executes after the pools are already terminated. Then auto termination
    needs to be disabled and called manually after test-suite ends.

@note This method should **never** be called
    from within a gem. It should *only* be used from within the main
    application and even then it should be used only when necessary.

@see AtExit


# Concurrent::executor

(from gem concurrent-ruby-1.0.5)
---
    executor(executor_identifier)

---

General access point to global executors. @param [Symbol, Executor]
executor_identifier symbols:
    - :fast - {Concurrent.global_fast_executor}
    - :io - {Concurrent.global_io_executor}
    - :immediate - {Concurrent.global_immediate_executor}

@return [Executor]


# Concurrent::global_fast_executor

(from gem concurrent-ruby-1.0.5)
---
    global_fast_executor()

---

Global thread pool optimized for short, fast **operations**.

@return [ThreadPoolExecutor] the thread pool


# Concurrent::global_immediate_executor

(from gem concurrent-ruby-1.0.5)
---
    global_immediate_executor()

---


# Concurrent::global_io_executor

(from gem concurrent-ruby-1.0.5)
---
    global_io_executor()

---

Global thread pool optimized for long, blocking (IO) **tasks**.

@return [ThreadPoolExecutor] the thread pool


# Concurrent::global_logger

(from gem concurrent-ruby-1.0.5)
---
    global_logger()

---


# Concurrent::global_logger=

(from gem concurrent-ruby-1.0.5)
---
    global_logger=(value)

---


# Concurrent::global_timer_set

(from gem concurrent-ruby-1.0.5)
---
    global_timer_set()

---

Global thread pool user for global **timers**.

@return [Concurrent::TimerSet] the thread pool


# Concurrent::leave_transaction

(from gem concurrent-ruby-1.0.5)
---
    leave_transaction()

---

Leave a transaction without committing or aborting - see
`Concurrent::atomically`.


# Concurrent::monotonic_time

(from gem concurrent-ruby-1.0.5)
---
    monotonic_time()

---

@!macro [attach] monotonic_get_time

    Returns the current time a tracked by the application monotonic clock.

    @return [Float] The current monotonic time when `since` not given else
      the elapsed monotonic time between `since` and the current time

    @!macro monotonic_clock_warning


# Concurrent::new

(from gem concurrent-ruby-1.0.5)
---
    new()

---


# Concurrent::new_fast_executor

(from gem concurrent-ruby-1.0.5)
---
    new_fast_executor(opts = {})

---


# Concurrent::new_io_executor

(from gem concurrent-ruby-1.0.5)
---
    new_io_executor(opts = {})

---


# Concurrent::physical_processor_count

(from gem concurrent-ruby-1.0.5)
---
    physical_processor_count()

---


# Concurrent::processor_count

(from gem concurrent-ruby-1.0.5)
---
    processor_count()

---


# Concurrent::use_simple_logger

(from gem concurrent-ruby-1.0.5)
---
    use_simple_logger(level = Logger::FATAL, output = $stderr)

---

Use logger created by #create_simple_logger to log concurrent-ruby messages.


# Concurrent::use_stdlib_logger

(from gem concurrent-ruby-1.0.5)
---
    use_stdlib_logger(level = Logger::FATAL, output = $stderr)

---

Use logger created by #create_stdlib_logger to log concurrent-ruby messages.
@deprecated


# Concurrent#get_time

(from gem concurrent-ruby-1.0.5)
---
    get_time()

---

@!visibility private


# Concurrent#abort_transaction

(from gem concurrent-ruby-1.0.5)
---
    abort_transaction()

---

Abort a currently running transaction - see `Concurrent::atomically`.


# Concurrent#atomically

(from gem concurrent-ruby-1.0.5)
---
    atomically() { || ... }

---

Run a block that reads and writes `TVar`s as a single atomic transaction. With
respect to the value of `TVar` objects, the transaction is atomic, in that it
either happens or it does not, consistent, in that the `TVar` objects involved
will never enter an illegal state, and isolated, in that transactions never
interfere with each other. You may recognise these properties from database
transactions.

There are some very important and unusual semantics that you must be aware of:

*   Most importantly, the block that you pass to atomically may be executed
        more than once. In most cases your code should be free of
        side-effects, except for via TVar.

*   If an exception escapes an atomically block it will abort the transaction.

*   It is undefined behaviour to use callcc or Fiber with atomically.

*   If you create a new thread within an atomically, it will not be part of
        the transaction. Creating a thread counts as a side-effect.


Transactions within transactions are flattened to a single transaction.

@example
    a = new TVar(100_000)
    b = new TVar(100)

    Concurrent::atomically do
      a.value -= 10
      b.value += 10
    end


# Concurrent#call_dataflow

(from gem concurrent-ruby-1.0.5)
---
    call_dataflow(method, executor, *inputs, &block)

---


# Concurrent#dataflow

(from gem concurrent-ruby-1.0.5)
---
    dataflow(*inputs, &block)

---

{include:file:doc/dataflow.md}

@param [Future] inputs zero or more `Future` operations that this dataflow
depends upon

@yield The operation to perform once all the dependencies are met @yieldparam
[Future] inputs each of the `Future` inputs to the dataflow @yieldreturn
[Object] the result of the block operation

@return [Object] the result of all the operations

@raise [ArgumentError] if no block is given @raise [ArgumentError] if any of
the inputs are not `IVar`s


# Concurrent#dataflow!

(from gem concurrent-ruby-1.0.5)
---
    dataflow!(*inputs, &block)

---


# Concurrent#dataflow_with

(from gem concurrent-ruby-1.0.5)
---
    dataflow_with(executor, *inputs, &block)

---


# Concurrent#dataflow_with!

(from gem concurrent-ruby-1.0.5)
---
    dataflow_with!(executor, *inputs, &block)

---


# Concurrent#leave_transaction

(from gem concurrent-ruby-1.0.5)
---
    leave_transaction()

---

Leave a transaction without committing or aborting - see
`Concurrent::atomically`.


# Concurrent#monotonic_time

(from gem concurrent-ruby-1.0.5)
---
    monotonic_time()

---

@!macro [attach] monotonic_get_time

    Returns the current time a tracked by the application monotonic clock.

    @return [Float] The current monotonic time when `since` not given else
      the elapsed monotonic time between `since` and the current time

    @!macro monotonic_clock_warning


