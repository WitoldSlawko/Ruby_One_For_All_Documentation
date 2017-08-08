# SystemExit < Exception

(from ruby core)
---
Raised by `exit` to initiate the termination of the script.
---
# Class methods:

    new

# Instance methods:

    status
    success?

# SystemExit::new

(from ruby core)
---
    SystemExit.new              -> system_exit
    SystemExit.new(status)      -> system_exit
    SystemExit.new(status, msg) -> system_exit
    SystemExit.new(msg)         -> system_exit

---

Create a new `SystemExit` exception with the given status and message. Status
is true, false, or an integer. If status is not given, true is used.


# SystemExit#status

(from ruby core)
---
    system_exit.status   -> integer

---

Return the status value associated with this system exit.


# SystemExit#success?

(from ruby core)
---
    system_exit.success?  -> true or false

---

Returns `true` if exiting successful, `false` if not.


