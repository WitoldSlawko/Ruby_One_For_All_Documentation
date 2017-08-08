# ConditionVariable < Object

(from ruby core)
---
ConditionVariable objects augment class Mutex. Using condition variables, it
is possible to suspend while in the middle of a critical section until a
resource becomes available.

Example:

    require 'thread'

    mutex = Mutex.new
    resource = ConditionVariable.new

    a = Thread.new {
       mutex.synchronize {
         # Thread 'a' now needs the resource
         resource.wait(mutex)
         # 'a' can now have the resource
       }
    }

    b = Thread.new {
       mutex.synchronize {
         # Thread 'b' has finished using the resource
         resource.signal
       }
    }
---
# Class methods:

    new

# Instance methods:

    broadcast
    signal
    wait

# ConditionVariable::new

(from ruby core)
---
    new()

---

Creates a new condition variable instance.


# ConditionVariable#broadcast

(from ruby core)
---
    broadcast()

---

Wakes up all threads waiting for this lock.


# ConditionVariable#signal

(from ruby core)
---
    signal()

---

Wakes up the first thread in line waiting for this lock.


# ConditionVariable#wait

(from ruby core)
---
    wait(mutex, timeout=nil)

---

Releases the lock held in `mutex` and waits; reacquires the lock on wakeup.

If `timeout` is given, this method returns after `timeout` seconds passed,
even if no other thread doesn't signal.


