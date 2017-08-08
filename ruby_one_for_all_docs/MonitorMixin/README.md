# MonitorMixin

(from ruby core)
---
In concurrent programming, a monitor is an object or module intended to be
used safely by more than one thread.  The defining characteristic of a monitor
is that its methods are executed with mutual exclusion.  That is, at each
point in time, at most one thread may be executing any of its methods. This
mutual exclusion greatly simplifies reasoning about the implementation of
monitors compared to reasoning about parallel code that updates a data
structure.

You can read more about the general principles on the Wikipedia page for
[Monitors](http://en.wikipedia.org/wiki/Monitor_%28synchronization%29)

## Examples

### Simple object.extend

    require 'monitor.rb'

    buf = []
    buf.extend(MonitorMixin)
    empty_cond = buf.new_cond

    # consumer
    Thread.start do
      loop do
        buf.synchronize do
          empty_cond.wait_while { buf.empty? }
          print buf.shift
        end
      end
    end

    # producer
    while line = ARGF.gets
      buf.synchronize do
        buf.push(line)
        empty_cond.signal
      end
    end

The consumer thread waits for the producer thread to push a line to buf while
`buf.empty?`.  The producer thread (main thread) reads a line from ARGF and
pushes it into buf then calls `empty_cond.signal` to notify the consumer
thread of new data.

### Simple Class include

    require 'monitor'

    class SynchronizedArray < Array

      include MonitorMixin

      def initialize(*args)
        super(*args)
      end

      alias :old_shift :shift
      alias :old_unshift :unshift

      def shift(n=1)
        self.synchronize do
          self.old_shift(n)
        end
      end

      def unshift(item)
        self.synchronize do
          self.old_unshift(item)
        end
      end

      # other methods ...
    end

`SynchronizedArray` implements an Array with synchronized access to items.
This Class is implemented as subclass of Array which includes the MonitorMixin
module.
---
# Class methods:

    extend_object
    new

# Instance methods:

    mon_check_owner
    mon_enter
    mon_enter_for_cond
    mon_exit
    mon_exit_for_cond
    mon_initialize
    mon_synchronize
    mon_try_enter
    new_cond
    synchronize
    try_mon_enter

# MonitorMixin::extend_object

(from ruby core)
---
    extend_object(obj)

---


# MonitorMixin::new

(from ruby core)
---
    new(*args)

---

Use `extend MonitorMixin` or `include MonitorMixin` instead of this
constructor.  Have look at the examples above to understand how to use this
module.


# MonitorMixin#mon_enter

(from ruby core)
---
    mon_enter()

---

Enters exclusive section.


# MonitorMixin#mon_exit

(from ruby core)
---
    mon_exit()

---

Leaves exclusive section.


# MonitorMixin#mon_synchronize

(from ruby core)
---
    mon_synchronize() { || ... }

---

Enters exclusive section and executes the block.  Leaves the exclusive section
automatically when the block exits.  See example under `MonitorMixin`.


# MonitorMixin#mon_try_enter

(from ruby core)
---
    mon_try_enter()

---

Attempts to enter exclusive section.  Returns `false` if lock fails.


# MonitorMixin#new_cond

(from ruby core)
---
    new_cond()

---

Creates a new MonitorMixin::ConditionVariable associated with the receiver.


# MonitorMixin#synchronize

(from ruby core)
---
    synchronize()

---


# MonitorMixin#try_mon_enter

(from ruby core)
---
    try_mon_enter()

---

For backward compatibility


# MonitorMixin#mon_check_owner

(from ruby core)
---
    mon_check_owner()

---


# MonitorMixin#mon_enter_for_cond

(from ruby core)
---
    mon_enter_for_cond(count)

---


# MonitorMixin#mon_exit_for_cond

(from ruby core)
---
    mon_exit_for_cond()

---


# MonitorMixin#mon_initialize

(from ruby core)
---
    mon_initialize()

---

Initializes the MonitorMixin after being included in a class or when an object
has been extended with the MonitorMixin


