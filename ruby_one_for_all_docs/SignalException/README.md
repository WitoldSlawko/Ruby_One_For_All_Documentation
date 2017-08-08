# SignalException < Exception

(from ruby core)
---
Raised when a signal is received.

    begin
      Process.kill('HUP',Process.pid)
      sleep # wait for receiver to handle signal sent by Process.kill
    rescue SignalException => e
      puts "received Exception #{e}"
    end

*produces:*

    received Exception SIGHUP
---
# Class methods:

    new

# Instance methods:

    signo

# SignalException::new

(from ruby core)
---
    SignalException.new(sig_name)              ->  signal_exception
    SignalException.new(sig_number [, name])   ->  signal_exception

---

Construct a new SignalException object.  `sig_name` should be a known signal
name.


# SignalException#signo

(from ruby core)
---
    signal_exception.signo   ->  num

---

Returns a signal number.


