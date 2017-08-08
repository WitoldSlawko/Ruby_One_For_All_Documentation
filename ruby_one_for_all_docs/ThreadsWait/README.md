# ThreadsWait < Object

---
# Extended by:
Exception2MessageMapper (from ruby core)

(from ruby core)
---
This class watches for termination of multiple threads.  Basic functionality
(wait until specified threads have terminated) can be accessed through the
class method ThreadsWait::all_waits.  Finer control can be gained using
instance methods.

Example:

    ThreadsWait.all_waits(thr1, thr2, ...) do |t|
      STDERR.puts "Thread #{t} has terminated."
    end

    th = ThreadsWait.new(thread1,...)
    th.next_wait # next one to be done
---
# Class methods:

    all_waits
    new

# Instance methods:

    all_waits
    empty?
    finished?
    join
    join_nowait
    next_wait
    threads

# Attributes:

    attr_reader threads

# ThreadsWait::all_waits

(from ruby core)
---
    all_waits(*threads) { |thread| ... }

---

Waits until all specified threads have terminated.  If a block is provided, it
is executed for each thread as they terminate.


# ThreadsWait::new

(from ruby core)
---
    new(*threads)

---

Creates a ThreadsWait object, specifying the threads to wait on. Non-blocking.


# ThreadsWait#all_waits

(from ruby core)
---
    all_waits() { |th| ... }

---

Waits until all of the specified threads are terminated.  If a block is
supplied for the method, it is executed for each thread termination.

Raises exceptions in the same manner as `next_wait`.


# ThreadsWait#empty?

(from ruby core)
---
    empty?()

---

Returns `true` if there are no threads in the pool still running.


# ThreadsWait#finished?

(from ruby core)
---
    finished?()

---

Returns `true` if any thread has terminated and is ready to be collected.


# ThreadsWait#join

(from ruby core)
---
    join(*threads)

---

Waits for specified threads to terminate, and returns when one of the threads
terminated.


# ThreadsWait#join_nowait

(from ruby core)
---
    join_nowait(*threads)

---

Specifies the threads that this object will wait for, but does not actually
wait.


# ThreadsWait#next_wait

(from ruby core)
---
    next_wait(nonblock = nil)

---

Waits until any of the specified threads has terminated, and returns the one
that does.

If there is no thread to wait, raises `ErrNoWaitingThread`.  If `nonblock` is
true, and there is no terminated thread, raises `ErrNoFinishedThread`.


