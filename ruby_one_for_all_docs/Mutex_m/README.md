# Mutex_m

(from ruby core)
---
# mutex_m.rb

When 'mutex_m' is required, any object that extends or includes Mutex_m will
be treated like a Mutex.

Start by requiring the standard library Mutex_m:

    require "mutex_m.rb"

From here you can extend an object with Mutex instance methods:

    obj = Object.new
    obj.extend Mutex_m

Or mixin Mutex_m into your module to your class inherit Mutex instance
methods.

    class Foo
      include Mutex_m
      # ...
    end
    obj = Foo.new
    # this obj can be handled like Mutex
---
# Instance methods:

    mu_lock
    mu_locked?
    mu_synchronize
    mu_try_lock
    mu_unlock
    sleep

# Mutex_m#mu_lock

(from ruby core)
---
    mu_lock()

---

See Mutex#lock


# Mutex_m#mu_locked?

(from ruby core)
---
    mu_locked?()

---

See Mutex#locked?


# Mutex_m#mu_synchronize

(from ruby core)
---
    mu_synchronize(&block)

---

See Mutex#synchronize


# Mutex_m#mu_try_lock

(from ruby core)
---
    mu_try_lock()

---

See Mutex#try_lock


# Mutex_m#mu_unlock

(from ruby core)
---
    mu_unlock()

---

See Mutex#unlock


# Mutex_m#sleep

(from ruby core)
---
    sleep(timeout = nil)

---

See Mutex#sleep


