# Process

(from ruby core)
---
# Constants:

CLOCK_BOOTTIME
:   [not documented]
CLOCK_BOOTTIME_ALARM
:   [not documented]
CLOCK_MONOTONIC
:   [not documented]
CLOCK_MONOTONIC_COARSE
:   [not documented]
CLOCK_MONOTONIC_FAST
:   [not documented]
CLOCK_MONOTONIC_PRECISE
:   [not documented]
CLOCK_MONOTONIC_RAW
:   [not documented]
CLOCK_MONOTONIC_RAW_APPROX
:   [not documented]
CLOCK_PROCESS_CPUTIME_ID
:   [not documented]
CLOCK_PROF
:   [not documented]
CLOCK_REALTIME
:   [not documented]
CLOCK_REALTIME_ALARM
:   [not documented]
CLOCK_REALTIME_COARSE
:   [not documented]
CLOCK_REALTIME_FAST
:   [not documented]
CLOCK_REALTIME_PRECISE
:   [not documented]
CLOCK_SECOND
:   [not documented]
CLOCK_THREAD_CPUTIME_ID
:   [not documented]
CLOCK_UPTIME
:   [not documented]
CLOCK_UPTIME_FAST
:   [not documented]
CLOCK_UPTIME_PRECISE
:   [not documented]
CLOCK_UPTIME_RAW
:   [not documented]
CLOCK_UPTIME_RAW_APPROX
:   [not documented]
CLOCK_VIRTUAL
:   [not documented]
PRIO_PGRP
:   see Process.setpriority

PRIO_PROCESS
:   see Process.setpriority

PRIO_USER
:   see Process.setpriority

RLIMIT_AS
:   Maximum size of the process's virtual memory (address space) in bytes.

    see the system getrlimit(2) manual for details.
RLIMIT_CORE
:   Maximum size of the core file.

    see the system getrlimit(2) manual for details.
RLIMIT_CPU
:   CPU time limit in seconds.

    see the system getrlimit(2) manual for details.
RLIMIT_DATA
:   Maximum size of the process's data segment.

    see the system getrlimit(2) manual for details.
RLIMIT_FSIZE
:   Maximum size of files that the process may create.

    see the system getrlimit(2) manual for details.
RLIMIT_MEMLOCK
:   Maximum number of bytes of memory that may be locked into RAM.

    see the system getrlimit(2) manual for details.
RLIMIT_MSGQUEUE
:   Specifies the limit on the number of bytes that can be allocated for POSIX
    message queues for the real user ID of the calling process.

    see the system getrlimit(2) manual for details.
RLIMIT_NICE
:   Specifies a ceiling to which the process's nice value can be raised.

    see the system getrlimit(2) manual for details.
RLIMIT_NOFILE
:   Specifies a value one greater than the maximum file descriptor number that
    can be opened by this process.

    see the system getrlimit(2) manual for details.
RLIMIT_NPROC
:   The maximum number of processes that can be created for the real user ID
    of the calling process.

    see the system getrlimit(2) manual for details.
RLIMIT_RSS
:   Specifies the limit (in pages) of the process's resident set.

    see the system getrlimit(2) manual for details.
RLIMIT_RTPRIO
:   Specifies a ceiling on the real-time priority that may be set for this
    process.

    see the system getrlimit(2) manual for details.
RLIMIT_RTTIME
:   Specifies limit on CPU time this process scheduled under a real-time
    scheduling policy can consume.

    see the system getrlimit(2) manual for details.
RLIMIT_SBSIZE
:   Maximum size of the socket buffer.
RLIMIT_SIGPENDING
:   Specifies a limit on the number of signals that may be queued for the real
    user ID of the calling process.

    see the system getrlimit(2) manual for details.
RLIMIT_STACK
:   Maximum size of the stack, in bytes.

    see the system getrlimit(2) manual for details.
RLIM_INFINITY
:   see Process.setrlimit

RLIM_SAVED_CUR
:   see Process.setrlimit

RLIM_SAVED_MAX
:   see Process.setrlimit

WNOHANG
:   see Process.wait

WUNTRACED
:   see Process.wait



# Class methods:

    abort
    argv0
    clock_getres
    clock_gettime
    daemon
    detach
    egid
    egid=
    euid
    euid=
    exec
    exit
    exit!
    fork
    getpgid
    getpgrp
    getpriority
    getrlimit
    getsid
    gid
    gid=
    groups
    groups=
    initgroups
    kill
    maxgroups
    maxgroups=
    pid
    ppid
    setpgid
    setpgrp
    setpriority
    setproctitle
    setrlimit
    setsid
    spawn
    times
    uid
    uid=
    wait
    wait2
    waitall
    waitpid
    waitpid2

# Process::abort

(from ruby core)
---
    abort
    Kernel::abort([msg])
    Process.abort([msg])

---

Terminate execution immediately, effectively by calling `Kernel.exit(false)`.
If *msg* is given, it is written to STDERR prior to terminating.


# Process::argv0

(from ruby core)
---
    Process.argv0  -> frozen_string

---

Returns the name of the script being executed.  The value is not affected by
assigning a new value to $0.

This method first appeared in Ruby 2.1 to serve as a global variable free
means to get the script name.


# Process::clock_getres

(from ruby core)
---
    Process.clock_getres(clock_id [, unit])   -> number

---

Returns the time resolution returned by POSIX clock_getres() function.

`clock_id` specifies a kind of clock. See the document of
`Process.clock_gettime` for details.

`clock_id` can be a symbol as `Process.clock_gettime`. However the result may
not be accurate. For example,
+Process.clock_getres(:GETTIMEOFDAY_BASED_CLOCK_REALTIME)+ returns 1.0e-06
which means 1 microsecond, but actual resolution can be more coarse.

If the given `clock_id` is not supported, Errno::EINVAL is raised.

`unit` specifies a type of the return value. `Process.clock_getres` accepts
`unit` as `Process.clock_gettime`. The default value, `:float_second`, is also
same as `Process.clock_gettime`.

`Process.clock_getres` also accepts `:hertz` as `unit`. `:hertz` means a the
reciprocal of `:float_second`.

`:hertz` can be used to obtain the exact value of the clock ticks per second
for times() function and CLOCKS_PER_SEC for clock() function.

+Process.clock_getres(:TIMES_BASED_CLOCK_PROCESS_CPUTIME_ID, :hertz)+ returns
the clock ticks per second.

+Process.clock_getres(:CLOCK_BASED_CLOCK_PROCESS_CPUTIME_ID, :hertz)+ returns
CLOCKS_PER_SEC.

    p Process.clock_getres(Process::CLOCK_MONOTONIC)
    #=> 1.0e-09


# Process::clock_gettime

(from ruby core)
---
    Process.clock_gettime(clock_id [, unit])   -> number

---

Returns a time returned by POSIX clock_gettime() function.

    p Process.clock_gettime(Process::CLOCK_MONOTONIC)
    #=> 896053.968060096

`clock_id` specifies a kind of clock. It is specified as a constant which
begins with `Process::CLOCK_` such as Process::CLOCK_REALTIME and
Process::CLOCK_MONOTONIC.

The supported constants depends on OS and version. Ruby provides following
types of `clock_id` if available.

CLOCK_REALTIME
:   SUSv2 to 4, Linux 2.5.63, FreeBSD 3.0, NetBSD 2.0, OpenBSD 2.1, macOS
    10.12
CLOCK_MONOTONIC
:   SUSv3 to 4, Linux 2.5.63, FreeBSD 3.0, NetBSD 2.0, OpenBSD 3.4, macOS
    10.12
CLOCK_PROCESS_CPUTIME_ID
:   SUSv3 to 4, Linux 2.5.63, OpenBSD 5.4, macOS 10.12
CLOCK_THREAD_CPUTIME_ID
:   SUSv3 to 4, Linux 2.5.63, FreeBSD 7.1, OpenBSD 5.4, macOS 10.12
CLOCK_VIRTUAL
:   FreeBSD 3.0, OpenBSD 2.1
CLOCK_PROF
:   FreeBSD 3.0, OpenBSD 2.1
CLOCK_REALTIME_FAST
:   FreeBSD 8.1
CLOCK_REALTIME_PRECISE
:   FreeBSD 8.1
CLOCK_REALTIME_COARSE
:   Linux 2.6.32
CLOCK_REALTIME_ALARM
:   Linux 3.0
CLOCK_MONOTONIC_FAST
:   FreeBSD 8.1
CLOCK_MONOTONIC_PRECISE
:   FreeBSD 8.1
CLOCK_MONOTONIC_COARSE
:   Linux 2.6.32
CLOCK_MONOTONIC_RAW
:   Linux 2.6.28, macOS 10.12
CLOCK_MONOTONIC_RAW_APPROX
:   macOS 10.12
CLOCK_BOOTTIME
:   Linux 2.6.39
CLOCK_BOOTTIME_ALARM
:   Linux 3.0
CLOCK_UPTIME
:   FreeBSD 7.0, OpenBSD 5.5
CLOCK_UPTIME_FAST
:   FreeBSD 8.1
CLOCK_UPTIME_RAW
:   macOS 10.12
CLOCK_UPTIME_RAW_APPROX
:   macOS 10.12
CLOCK_UPTIME_PRECISE
:   FreeBSD 8.1
CLOCK_SECOND
:   FreeBSD 8.1


Note that SUS stands for Single Unix Specification. SUS contains POSIX and
clock_gettime is defined in the POSIX part. SUS defines CLOCK_REALTIME
mandatory but CLOCK_MONOTONIC, CLOCK_PROCESS_CPUTIME_ID and
CLOCK_THREAD_CPUTIME_ID are optional.

Also, several symbols are accepted as `clock_id`. There are emulations for
clock_gettime().

For example, Process::CLOCK_REALTIME is defined as
`:GETTIMEOFDAY_BASED_CLOCK_REALTIME` when clock_gettime() is not available.

Emulations for `CLOCK_REALTIME`:
:GETTIMEOFDAY_BASED_CLOCK_REALTIME
:   Use gettimeofday() defined by SUS. (SUSv4 obsoleted it, though.) The
    resolution is 1 microsecond.
:TIME_BASED_CLOCK_REALTIME
:   Use time() defined by ISO C. The resolution is 1 second.


Emulations for `CLOCK_MONOTONIC`:
:MACH_ABSOLUTE_TIME_BASED_CLOCK_MONOTONIC
:   Use mach_absolute_time(), available on Darwin. The resolution is CPU
    dependent.
:TIMES_BASED_CLOCK_MONOTONIC
:   Use the result value of times() defined by POSIX. POSIX defines it as
    "times() shall return the elapsed real time, in clock ticks, since an
    arbitrary point in the past (for example, system start-up time)". For
    example, GNU/Linux returns a value based on jiffies and it is monotonic.
    However, 4.4BSD uses gettimeofday() and it is not monotonic. (FreeBSD uses
    clock_gettime(CLOCK_MONOTONIC) instead, though.) The resolution is the
    clock tick. "getconf CLK_TCK" command shows the clock ticks per second.
    (The clock ticks per second is defined by HZ macro in older systems.) If
    it is 100 and clock_t is 32 bits integer type, the resolution is 10
    millisecond and cannot represent over 497 days.


Emulations for `CLOCK_PROCESS_CPUTIME_ID`:
:GETRUSAGE_BASED_CLOCK_PROCESS_CPUTIME_ID
:   Use getrusage() defined by SUS. getrusage() is used with RUSAGE_SELF to
    obtain the time only for the calling process (excluding the time for child
    processes). The result is addition of user time (ru_utime) and system time
    (ru_stime). The resolution is 1 microsecond.
:TIMES_BASED_CLOCK_PROCESS_CPUTIME_ID
:   Use times() defined by POSIX. The result is addition of user time
    (tms_utime) and system time (tms_stime). tms_cutime and tms_cstime are
    ignored to exclude the time for child processes. The resolution is the
    clock tick. "getconf CLK_TCK" command shows the clock ticks per second.
    (The clock ticks per second is defined by HZ macro in older systems.) If
    it is 100, the resolution is 10 millisecond.
:CLOCK_BASED_CLOCK_PROCESS_CPUTIME_ID
:   Use clock() defined by ISO C. The resolution is 1/CLOCKS_PER_SEC.
    CLOCKS_PER_SEC is the C-level macro defined by time.h. SUS defines
    CLOCKS_PER_SEC is 1000000. Non-Unix systems may define it a different
    value, though. If CLOCKS_PER_SEC is 1000000 as SUS, the resolution is 1
    microsecond. If CLOCKS_PER_SEC is 1000000 and clock_t is 32 bits integer
    type, it cannot represent over 72 minutes.


If the given `clock_id` is not supported, Errno::EINVAL is raised.

`unit` specifies a type of the return value.

:float_second
:   number of seconds as a float (default)
:float_millisecond
:   number of milliseconds as a float
:float_microsecond
:   number of microseconds as a float
:second
:   number of seconds as an integer
:millisecond
:   number of milliseconds as an integer
:microsecond
:   number of microseconds as an integer
:nanosecond
:   number of nanoseconds as an integer


The underlying function, clock_gettime(), returns a number of nanoseconds.
Float object (IEEE 754 double) is not enough to represent the return value for
CLOCK_REALTIME. If the exact nanoseconds value is required, use `:nanoseconds`
as the `unit`.

The origin (zero) of the returned value varies. For example, system start up
time, process start up time, the Epoch, etc.

The origin in CLOCK_REALTIME is defined as the Epoch (1970-01-01 00:00:00
UTC). But some systems count leap seconds and others doesn't. So the result
can be interpreted differently across systems. Time.now is recommended over
CLOCK_REALTIME.


# Process::daemon

(from ruby core)
---
    Process.daemon()                        -> 0
    Process.daemon(nochdir=nil,noclose=nil) -> 0

---

Detach the process from controlling terminal and run in the background as
system daemon.  Unless the argument nochdir is true (i.e. non false), it
changes the current working directory to the root ("/"). Unless the argument
noclose is true, daemon() will redirect standard input, standard output and
standard error to /dev/null. Return zero on success, or raise one of Errno::*.


(from gem puma-3.9.1)
---
    daemon(nochdir=false, noclose=false)

---


# Process::detach

(from ruby core)
---
    Process.detach(pid)   -> thread

---

Some operating systems retain the status of terminated child processes until
the parent collects that status (normally using some variant of `wait()`). If
the parent never collects this status, the child stays around as a *zombie*
process. `Process::detach` prevents this by setting up a separate Ruby thread
whose sole job is to reap the status of the process *pid* when it terminates.
Use `detach` only when you do not intend to explicitly wait for the child to
terminate.

The waiting thread returns the exit status of the detached process when it
terminates, so you can use `Thread#join` to know the result.  If specified
*pid* is not a valid child process ID, the thread returns `nil` immediately.

The waiting thread has `pid` method which returns the pid.

In this first example, we don't reap the first child process, so it appears as
a zombie in the process status display.

    p1 = fork { sleep 0.1 }
    p2 = fork { sleep 0.2 }
    Process.waitpid(p2)
    sleep 2
    system("ps -ho pid,state -p #{p1}")

*produces:*

    27389 Z

In the next example, `Process::detach` is used to reap the child
automatically.

    p1 = fork { sleep 0.1 }
    p2 = fork { sleep 0.2 }
    Process.detach(p1)
    Process.waitpid(p2)
    sleep 2
    system("ps -ho pid,state -p #{p1}")

*(produces no output)*


# Process::egid

(from ruby core)
---
    Process.egid          -> integer
    Process::GID.eid      -> integer
    Process::Sys.geteid   -> integer

---

Returns the effective group ID for this process. Not available on all
platforms.

    Process.egid   #=> 500


# Process::egid=

(from ruby core)
---
    Process.egid = integer   -> integer

---

Sets the effective group ID for this process. Not available on all platforms.


# Process::euid

(from ruby core)
---
    Process.euid           -> integer
    Process::UID.eid       -> integer
    Process::Sys.geteuid   -> integer

---

Returns the effective user ID for this process.

    Process.euid   #=> 501


# Process::euid=

(from ruby core)
---
    Process.euid= user

---

Sets the effective user ID for this process. Not available on all platforms.


# Process::exec

(from ruby core)
---
    exec([env,] command... [,options])

---

Replaces the current process by running the given external *command*, which
can take one of the following forms:

`exec(commandline)`
:   command line string which is passed to the standard shell
`exec(cmdname, arg1, ...)`
:   command name and one or more arguments (no shell)
`exec([cmdname, argv0], arg1, ...)`
:   command name, [argv](0) and zero or more arguments (no shell)


In the first form, the string is taken as a command line that is subject to
shell expansion before being executed.

The standard shell always means `"/bin/sh"` on Unix-like systems, same as
`ENV["RUBYSHELL"]` (or `ENV["COMSPEC"]` on Windows NT series), and similar.

If the string from the first form (`exec("command")`) follows these simple
rules:

*   no meta characters
*   no shell reserved word and no special built-in
*   Ruby invokes the command directly without shell


You can force shell invocation by adding ";" to the string (because ";" is a
meta character).

Note that this behavior is observable by pid obtained (return value of spawn()
and IO#pid for IO.popen) is the pid of the invoked command, not shell.

In the second form (`exec("command1", "arg1", ...)`), the first is taken as a
command name and the rest are passed as parameters to command with no shell
expansion.

In the third form (`exec(["command", "argv0"], "arg1", ...)`), starting a
two-element array at the beginning of the command, the first element is the
command to be executed, and the second argument is used as the `argv[0]`
value, which may show up in process listings.

In order to execute the command, one of the `exec(2)` system calls are used,
so the running command may inherit some of the environment of the original
program (including open file descriptors).

This behavior is modified by the given `env` and `options` parameters. See
::spawn for details.

If the command fails to execute (typically `Errno::ENOENT` when it was not
found) a SystemCallError exception is raised.

This method modifies process attributes according to given `options` before
`exec(2)` system call. See ::spawn for more details about the given `options`.

The modified attributes may be retained when `exec(2)` system call fails.

For example, hard resource limits are not restorable.

Consider to create a child process using ::spawn or Kernel#system if this is
not acceptable.

    exec "echo *"       # echoes list of files in current directory
    # never get here

    exec "echo", "*"    # echoes an asterisk
    # never get here


# Process::exit

(from ruby core)
---
    exit(status=true)
    Kernel::exit(status=true)
    Process::exit(status=true)

---

Initiates the termination of the Ruby script by raising the `SystemExit`
exception. This exception may be caught. The optional parameter is used to
return a status code to the invoking environment. `true` and `FALSE` of
*status* means success and failure respectively.  The interpretation of other
integer values are system dependent.

    begin
      exit
      puts "never get here"
    rescue SystemExit
      puts "rescued a SystemExit exception"
    end
    puts "after begin block"

*produces:*

    rescued a SystemExit exception
    after begin block

Just prior to termination, Ruby executes any `at_exit` functions (see
Kernel::at_exit) and runs any object finalizers (see
ObjectSpace::define_finalizer).

    at_exit { puts "at_exit function" }
    ObjectSpace.define_finalizer("string",  proc { puts "in finalizer" })
    exit

*produces:*

    at_exit function
    in finalizer


# Process::exit!

(from ruby core)
---
    Process.exit!(status=false)

---

Exits the process immediately. No exit handlers are run. *status* is returned
to the underlying system as the exit status.

    Process.exit!(true)


# Process::fork

(from ruby core)
---
    Kernel.fork  [{ block }]   -> integer or nil
    Process.fork [{ block }]   -> integer or nil

---

Creates a subprocess. If a block is specified, that block is run in the
subprocess, and the subprocess terminates with a status of zero. Otherwise,
the `fork` call returns twice, once in the parent, returning the process ID of
the child, and once in the child, returning *nil*. The child process can exit
using `Kernel.exit!` to avoid running any `at_exit` functions. The parent
process should use `Process.wait` to collect the termination statuses of its
children or use `Process.detach` to register disinterest in their status;
otherwise, the operating system may accumulate zombie processes.

The thread calling fork is the only thread in the created child process. fork
doesn't copy other threads.

If fork is not usable, Process.respond_to?(:fork) returns false.

Note that fork(2) is not available on some platforms like Windows and NetBSD
4. Therefore you should use spawn() instead of fork().


# Process::getpgid

(from ruby core)
---
    Process.getpgid(pid)   -> integer

---

Returns the process group ID for the given process id. Not available on all
platforms.

    Process.getpgid(Process.ppid())   #=> 25527


# Process::getpgrp

(from ruby core)
---
    Process.getpgrp   -> integer

---

Returns the process group ID for this process. Not available on all platforms.

    Process.getpgid(0)   #=> 25527
    Process.getpgrp      #=> 25527


# Process::getpriority

(from ruby core)
---
    Process.getpriority(kind, integer)   -> integer

---

Gets the scheduling priority for specified process, process group, or user.
*kind* indicates the kind of entity to find: one of `Process::PRIO_PGRP`,
`Process::PRIO_USER`, or `Process::PRIO_PROCESS`. *integer* is an id
indicating the particular process, process group, or user (an id of 0 means
*current*). Lower priorities are more favorable for scheduling. Not available
on all platforms.

    Process.getpriority(Process::PRIO_USER, 0)      #=> 19
    Process.getpriority(Process::PRIO_PROCESS, 0)   #=> 19


# Process::getrlimit

(from ruby core)
---
    Process.getrlimit(resource)   -> [cur_limit, max_limit]

---

Gets the resource limit of the process. *cur_limit* means current (soft) limit
and *max_limit* means maximum (hard) limit.

*resource* indicates the kind of resource to limit. It is specified as a
symbol such as `:CORE`, a string such as `"CORE"` or a constant such as
`Process::RLIMIT_CORE`. See Process.setrlimit for details.

*cur_limit* and *max_limit* may be `Process::RLIM_INFINITY`,
`Process::RLIM_SAVED_MAX` or `Process::RLIM_SAVED_CUR`. See Process.setrlimit
and the system getrlimit(2) manual for details.


# Process::getsid

(from ruby core)
---
    Process.getsid()      -> integer
    Process.getsid(pid)   -> integer

---

Returns the session ID for the given process id. If not given, return current
process sid. Not available on all platforms.

    Process.getsid()                #=> 27422
    Process.getsid(0)               #=> 27422
    Process.getsid(Process.pid())   #=> 27422


# Process::gid

(from ruby core)
---
    Process.gid           -> integer
    Process::GID.rid      -> integer
    Process::Sys.getgid   -> integer

---

Returns the (real) group ID for this process.

    Process.gid   #=> 500


# Process::gid=

(from ruby core)
---
    Process.gid= integer   -> integer

---

Sets the group ID for this process.


# Process::groups

(from ruby core)
---
    Process.groups   -> array

---

Get an `Array` of the gids of groups in the supplemental group access list for
this process.

    Process.groups   #=> [27, 6, 10, 11]


# Process::groups=

(from ruby core)
---
    Process.groups= array   -> array

---

Set the supplemental group access list to the given `Array` of group IDs.

    Process.groups   #=> [0, 1, 2, 3, 4, 6, 10, 11, 20, 26, 27]
    Process.groups = [27, 6, 10, 11]   #=> [27, 6, 10, 11]
    Process.groups   #=> [27, 6, 10, 11]


# Process::initgroups

(from ruby core)
---
    Process.initgroups(username, gid)   -> array

---

Initializes the supplemental group access list by reading the system group
database and using all groups of which the given user is a member. The group
with the specified *gid* is also added to the list. Returns the resulting
`Array` of the gids of all the groups in the supplementary group access list.
Not available on all platforms.

    Process.groups   #=> [0, 1, 2, 3, 4, 6, 10, 11, 20, 26, 27]
    Process.initgroups( "mgranger", 30 )   #=> [30, 6, 10, 11]
    Process.groups   #=> [30, 6, 10, 11]


# Process::kill

(from ruby core)
---
    Process.kill(signal, pid, ...)    -> integer

---

Sends the given signal to the specified process id(s) if *pid* is positive. If
*pid* is zero *signal* is sent to all processes whose group ID is equal to the
group ID of the process. *signal* may be an integer signal number or a POSIX
signal name (either with or without a `SIG` prefix). If *signal* is negative
(or starts with a minus sign), kills process groups instead of processes. Not
all signals are available on all platforms. The keys and values of
`Signal.list` are known signal names and numbers, respectively.

    pid = fork do
       Signal.trap("HUP") { puts "Ouch!"; exit }
       # ... do some work ...
    end
    # ...
    Process.kill("HUP", pid)
    Process.wait

*produces:*

    Ouch!

If *signal* is an integer but wrong for signal, `Errno::EINVAL` or
`RangeError` will be raised. Otherwise unless *signal* is a `String` or a
`Symbol`, and a known signal name, `ArgumentError` will be raised.

Also, `Errno::ESRCH` or `RangeError` for invalid *pid*, `Errno::EPERM` when
failed because of no privilege, will be raised.  In these cases, signals may
have been sent to preceding processes.


# Process::maxgroups

(from ruby core)
---
    Process.maxgroups   -> integer

---

Returns the maximum number of gids allowed in the supplemental group access
list.

    Process.maxgroups   #=> 32


# Process::maxgroups=

(from ruby core)
---
    Process.maxgroups= integer   -> integer

---

Sets the maximum number of gids allowed in the supplemental group access list.


# Process::pid

(from ruby core)
---
    Process.pid   -> integer

---

Returns the process id of this process. Not available on all platforms.

    Process.pid   #=> 27415


# Process::ppid

(from ruby core)
---
    Process.ppid   -> integer

---

Returns the process id of the parent of this process. Returns untrustworthy
value on Win32/64. Not available on all platforms.

    puts "I am #{Process.pid}"
    Process.fork { puts "Dad is #{Process.ppid}" }

*produces:*

    I am 27417
    Dad is 27417


# Process::setpgid

(from ruby core)
---
    Process.setpgid(pid, integer)   -> 0

---

Sets the process group ID of *pid* (0 indicates this process) to *integer*.
Not available on all platforms.


# Process::setpgrp

(from ruby core)
---
    Process.setpgrp   -> 0

---

Equivalent to `setpgid(0,0)`. Not available on all platforms.


# Process::setpriority

(from ruby core)
---
    Process.setpriority(kind, integer, priority)   -> 0

---

See `Process#getpriority`.

    Process.setpriority(Process::PRIO_USER, 0, 19)      #=> 0
    Process.setpriority(Process::PRIO_PROCESS, 0, 19)   #=> 0
    Process.getpriority(Process::PRIO_USER, 0)          #=> 19
    Process.getpriority(Process::PRIO_PROCESS, 0)       #=> 19


# Process::setproctitle

(from ruby core)
---
    Process.setproctitle(string)  -> string

---

Sets the process title that appears on the ps(1) command.  Not necessarily
effective on all platforms.  No exception will be raised regardless of the
result, nor will NotImplementedError be raised even if the platform does not
support the feature.

Calling this method does not affect the value of $0.

    Process.setproctitle('myapp: worker #%d' % worker_id)

This method first appeared in Ruby 2.1 to serve as a global variable free
means to change the process title.


# Process::setrlimit

(from ruby core)
---
    Process.setrlimit(resource, cur_limit, max_limit)        -> nil
    Process.setrlimit(resource, cur_limit)                   -> nil

---

Sets the resource limit of the process. *cur_limit* means current (soft) limit
and *max_limit* means maximum (hard) limit.

If *max_limit* is not given, *cur_limit* is used.

*resource* indicates the kind of resource to limit. It should be a symbol such
as `:CORE`, a string such as `"CORE"` or a constant such as
`Process::RLIMIT_CORE`. The available resources are OS dependent. Ruby may
support following resources.

AS
:   total available memory (bytes) (SUSv3, NetBSD, FreeBSD, OpenBSD but
    4.4BSD-Lite)
CORE
:   core size (bytes) (SUSv3)
CPU
:   CPU time (seconds) (SUSv3)
DATA
:   data segment (bytes) (SUSv3)
FSIZE
:   file size (bytes) (SUSv3)
MEMLOCK
:   total size for mlock(2) (bytes) (4.4BSD, GNU/Linux)
MSGQUEUE
:   allocation for POSIX message queues (bytes) (GNU/Linux)
NICE
:   ceiling on process's nice(2) value (number) (GNU/Linux)
NOFILE
:   file descriptors (number) (SUSv3)
NPROC
:   number of processes for the user (number) (4.4BSD, GNU/Linux)
RSS
:   resident memory size (bytes) (4.2BSD, GNU/Linux)
RTPRIO
:   ceiling on the process's real-time priority (number) (GNU/Linux)
RTTIME
:   CPU time for real-time process (us) (GNU/Linux)
SBSIZE
:   all socket buffers (bytes) (NetBSD, FreeBSD)
SIGPENDING
:   number of queued signals allowed (signals) (GNU/Linux)
STACK
:   stack size (bytes) (SUSv3)


*cur_limit* and *max_limit* may be `:INFINITY`, `"INFINITY"` or
`Process::RLIM_INFINITY`, which means that the resource is not limited. They
may be `Process::RLIM_SAVED_MAX`, `Process::RLIM_SAVED_CUR` and corresponding
symbols and strings too. See system setrlimit(2) manual for details.

The following example raises the soft limit of core size to the hard limit to
try to make core dump possible.

    Process.setrlimit(:CORE, Process.getrlimit(:CORE)[1])


# Process::setsid

(from ruby core)
---
    Process.setsid   -> integer

---

Establishes this process as a new session and process group leader, with no
controlling tty. Returns the session id. Not available on all platforms.

    Process.setsid   #=> 27422


# Process::spawn

(from ruby core)
---
    spawn([env,] command... [,options])     -> pid
    Process.spawn([env,] command... [,options])     -> pid

---

spawn executes specified command and return its pid.

    pid = spawn("tar xf ruby-2.0.0-p195.tar.bz2")
    Process.wait pid

    pid = spawn(RbConfig.ruby, "-eputs'Hello, world!'")
    Process.wait pid

This method is similar to Kernel#system but it doesn't wait for the command to
finish.

The parent process should use `Process.wait` to collect the termination status
of its child or use `Process.detach` to register disinterest in their status;
otherwise, the operating system may accumulate zombie processes.

spawn has bunch of options to specify process attributes:

    env: hash
      name => val : set the environment variable
      name => nil : unset the environment variable

      the keys and the values except for +nil+ must be strings.
    command...:
      commandline                 : command line string which is passed to the standard shell
      cmdname, arg1, ...          : command name and one or more arguments (This form does not use the shell. See below for caveats.)
      [cmdname, argv0], arg1, ... : command name, argv[0] and zero or more arguments (no shell)
    options: hash
      clearing environment variables:
        :unsetenv_others => true   : clear environment variables except specified by env
        :unsetenv_others => false  : don't clear (default)
      process group:
        :pgroup => true or 0 : make a new process group
        :pgroup => pgid      : join the specified process group
        :pgroup => nil       : don't change the process group (default)
      create new process group: Windows only
        :new_pgroup => true  : the new process is the root process of a new process group
        :new_pgroup => false : don't create a new process group (default)
      resource limit: resourcename is core, cpu, data, etc.  See Process.setrlimit.
        :rlimit_resourcename => limit
        :rlimit_resourcename => [cur_limit, max_limit]
      umask:
        :umask => int
      redirection:
        key:
          FD              : single file descriptor in child process
          [FD, FD, ...]   : multiple file descriptor in child process
        value:
          FD                        : redirect to the file descriptor in parent process
          string                    : redirect to file with open(string, "r" or "w")
          [string]                  : redirect to file with open(string, File::RDONLY)
          [string, open_mode]       : redirect to file with open(string, open_mode, 0644)
          [string, open_mode, perm] : redirect to file with open(string, open_mode, perm)
          [:child, FD]              : redirect to the redirected file descriptor
          :close                    : close the file descriptor in child process
        FD is one of follows
          :in     : the file descriptor 0 which is the standard input
          :out    : the file descriptor 1 which is the standard output
          :err    : the file descriptor 2 which is the standard error
          integer : the file descriptor of specified the integer
          io      : the file descriptor specified as io.fileno
      file descriptor inheritance: close non-redirected non-standard fds (3, 4, 5, ...) or not
        :close_others => true  : don't inherit
      current directory:
        :chdir => str

      The 'cmdname, arg1, ...' form does not use the shell. However,
      on different OSes, different things are provided as built-in
      commands. An example of this is 'echo', which is a built-in
      on Windows, but is a normal program on Linux and Mac OS X.
      This means that `Process.spawn 'echo', '%Path%'` will display
      the contents of the `%Path%` environment variable on Windows,
      but `Process.spawn 'echo', '$PATH'` prints the literal '$PATH'.

If a hash is given as `env`, the environment is updated by `env` before
`exec(2)` in the child process. If a pair in `env` has nil as the value, the
variable is deleted.

    # set FOO as BAR and unset BAZ.
    pid = spawn({"FOO"=>"BAR", "BAZ"=>nil}, command)

If a hash is given as `options`, it specifies process group, create new
process group, resource limit, current directory, umask and redirects for the
child process. Also, it can be specified to clear environment variables.

The `:unsetenv_others` key in `options` specifies to clear environment
variables, other than specified by `env`.

    pid = spawn(command, :unsetenv_others=>true) # no environment variable
    pid = spawn({"FOO"=>"BAR"}, command, :unsetenv_others=>true) # FOO only

The `:pgroup` key in `options` specifies a process group. The corresponding
value should be true, zero, a positive integer, or nil. true and zero cause
the process to be a process leader of a new process group. A non-zero positive
integer causes the process to join the provided process group. The default
value, nil, causes the process to remain in the same process group.

    pid = spawn(command, :pgroup=>true) # process leader
    pid = spawn(command, :pgroup=>10) # belongs to the process group 10

The `:new_pgroup` key in `options` specifies to pass
`CREATE_NEW_PROCESS_GROUP` flag to `CreateProcessW()` that is Windows API.
This option is only for Windows. true means the new process is the root
process of the new process group. The new process has CTRL+C disabled. This
flag is necessary for `Process.kill(:SIGINT, pid)` on the subprocess.
:new_pgroup is false by default.

    pid = spawn(command, :new_pgroup=>true)  # new process group
    pid = spawn(command, :new_pgroup=>false) # same process group

The `:rlimit_`*foo* key specifies a resource limit. *foo* should be one of
resource types such as `core`. The corresponding value should be an integer or
an array which have one or two integers: same as cur_limit and max_limit
arguments for Process.setrlimit.

    cur, max = Process.getrlimit(:CORE)
    pid = spawn(command, :rlimit_core=>[0,max]) # disable core temporary.
    pid = spawn(command, :rlimit_core=>max) # enable core dump
    pid = spawn(command, :rlimit_core=>0) # never dump core.

The `:umask` key in `options` specifies the umask.

    pid = spawn(command, :umask=>077)

The :in, :out, :err, an integer, an IO and an array key specifies a
redirection. The redirection maps a file descriptor in the child process.

For example, stderr can be merged into stdout as follows:

    pid = spawn(command, :err=>:out)
    pid = spawn(command, 2=>1)
    pid = spawn(command, STDERR=>:out)
    pid = spawn(command, STDERR=>STDOUT)

The hash keys specifies a file descriptor in the child process started by
`spawn`. :err, 2 and STDERR specifies the standard error stream (stderr).

The hash values specifies a file descriptor in the parent process which
invokes `spawn`. :out, 1 and STDOUT specifies the standard output stream
(stdout).

In the above example, the standard output in the child process is not
specified. So it is inherited from the parent process.

The standard input stream (stdin) can be specified by :in, 0 and STDIN.

A filename can be specified as a hash value.

    pid = spawn(command, :in=>"/dev/null") # read mode
    pid = spawn(command, :out=>"/dev/null") # write mode
    pid = spawn(command, :err=>"log") # write mode
    pid = spawn(command, [:out, :err]=>"/dev/null") # write mode
    pid = spawn(command, 3=>"/dev/null") # read mode

For stdout and stderr (and combination of them), it is opened in write mode.
Otherwise read mode is used.

For specifying flags and permission of file creation explicitly, an array is
used instead.

    pid = spawn(command, :in=>["file"]) # read mode is assumed
    pid = spawn(command, :in=>["file", "r"])
    pid = spawn(command, :out=>["log", "w"]) # 0644 assumed
    pid = spawn(command, :out=>["log", "w", 0600])
    pid = spawn(command, :out=>["log", File::WRONLY|File::EXCL|File::CREAT, 0600])

The array specifies a filename, flags and permission. The flags can be a
string or an integer. If the flags is omitted or nil, File::RDONLY is assumed.
The permission should be an integer. If the permission is omitted or nil, 0644
is assumed.

If an array of IOs and integers are specified as a hash key, all the elements
are redirected.

    # stdout and stderr is redirected to log file.
    # The file "log" is opened just once.
    pid = spawn(command, [:out, :err]=>["log", "w"])

Another way to merge multiple file descriptors is [:child, fd]. [:child, fd]
means the file descriptor in the child process. This is different from fd. For
example, :err=>:out means redirecting child stderr to parent stdout. But
:err=>[:child, :out] means redirecting child stderr to child stdout. They
differ if stdout is redirected in the child process as follows.

    # stdout and stderr is redirected to log file.
    # The file "log" is opened just once.
    pid = spawn(command, :out=>["log", "w"], :err=>[:child, :out])

[:child, :out] can be used to merge stderr into stdout in IO.popen. In this
case, IO.popen redirects stdout to a pipe in the child process and [:child,
:out] refers the redirected stdout.

    io = IO.popen(["sh", "-c", "echo out; echo err >&2", :err=>[:child, :out]])
    p io.read #=> "out\nerr\n"

The `:chdir` key in `options` specifies the current directory.

    pid = spawn(command, :chdir=>"/var/tmp")

spawn closes all non-standard unspecified descriptors by default. The
"standard" descriptors are 0, 1 and 2. This behavior is specified by
:close_others option. :close_others doesn't affect the standard descriptors
which are closed only if :close is specified explicitly.

    pid = spawn(command, :close_others=>true)  # close 3,4,5,... (default)
    pid = spawn(command, :close_others=>false) # don't close 3,4,5,...

:close_others is true by default for spawn and IO.popen.

Note that fds which close-on-exec flag is already set are closed regardless of
:close_others option.

So IO.pipe and spawn can be used as IO.popen.

    # similar to r = IO.popen(command)
    r, w = IO.pipe
    pid = spawn(command, :out=>w)   # r, w is closed in the child process.
    w.close

:close is specified as a hash value to close a fd individually.

    f = open(foo)
    system(command, f=>:close)        # don't inherit f.

If a file descriptor need to be inherited, io=>io can be used.

    # valgrind has --log-fd option for log destination.
    # log_w=>log_w indicates log_w.fileno inherits to child process.
    log_r, log_w = IO.pipe
    pid = spawn("valgrind", "--log-fd=#{log_w.fileno}", "echo", "a", log_w=>log_w)
    log_w.close
    p log_r.read

It is also possible to exchange file descriptors.

    pid = spawn(command, :out=>:err, :err=>:out)

The hash keys specify file descriptors in the child process. The hash values
specifies file descriptors in the parent process. So the above specifies
exchanging stdout and stderr. Internally, `spawn` uses an extra file
descriptor to resolve such cyclic file descriptor mapping.

See `Kernel.exec` for the standard shell.


# Process::times

(from ruby core)
---
    Process.times   -> aProcessTms

---

Returns a `Tms` structure (see `Process::Tms`) that contains user and system
CPU times for this process, and also for children processes.

    t = Process.times
    [ t.utime, t.stime, t.cutime, t.cstime ]   #=> [0.0, 0.02, 0.00, 0.00]


# Process::uid

(from ruby core)
---
    Process.uid           -> integer
    Process::UID.rid      -> integer
    Process::Sys.getuid   -> integer

---

Returns the (real) user ID of this process.

    Process.uid   #=> 501


# Process::uid=

(from ruby core)
---
    Process.uid= user   -> numeric

---

Sets the (user) user ID for this process. Not available on all platforms.


# Process::wait

(from ruby core)
---
    Process.wait()                     -> integer
    Process.wait(pid=-1, flags=0)      -> integer
    Process.waitpid(pid=-1, flags=0)   -> integer

---

Waits for a child process to exit, returns its process id, and sets `$?` to a
`Process::Status` object containing information on that process. Which child
it waits on depends on the value of *pid*:

> 0
:   Waits for the child whose process ID equals *pid*.

0
:   Waits for any child whose process group ID equals that of the calling
    process.

-1
:   Waits for any child process (the default if no *pid* is given).

< -1
:   Waits for any child whose process group ID equals the absolute value of
    *pid*.


The *flags* argument may be a logical or of the flag values `Process::WNOHANG`
(do not block if no child available) or `Process::WUNTRACED` (return stopped
children that haven't been reported). Not all flags are available on all
platforms, but a flag value of zero will work on all platforms.

Calling this method raises a SystemCallError if there are no child processes.
Not available on all platforms.

    include Process
    fork { exit 99 }                 #=> 27429
    wait                             #=> 27429
    $?.exitstatus                    #=> 99

    pid = fork { sleep 3 }           #=> 27440
    Time.now                         #=> 2008-03-08 19:56:16 +0900
    waitpid(pid, Process::WNOHANG)   #=> nil
    Time.now                         #=> 2008-03-08 19:56:16 +0900
    waitpid(pid, 0)                  #=> 27440
    Time.now                         #=> 2008-03-08 19:56:19 +0900


# Process::wait2

(from ruby core)
---
    Process.wait2(pid=-1, flags=0)      -> [pid, status]

---

Waits for a child process to exit (see Process::waitpid for exact semantics)
and returns an array containing the process id and the exit status (a
`Process::Status` object) of that child. Raises a SystemCallError if there are
no child processes.

    Process.fork { exit 99 }   #=> 27437
    pid, status = Process.wait2
    pid                        #=> 27437
    status.exitstatus          #=> 99


# Process::waitall

(from ruby core)
---
    Process.waitall   -> [ [pid1,status1], ...]

---

Waits for all children, returning an array of *pid*/*status* pairs (where
*status* is a `Process::Status` object).

    fork { sleep 0.2; exit 2 }   #=> 27432
    fork { sleep 0.1; exit 1 }   #=> 27433
    fork {            exit 0 }   #=> 27434
    p Process.waitall

*produces*:

    [[30982, #<Process::Status: pid 30982 exit 0>],
     [30979, #<Process::Status: pid 30979 exit 1>],
     [30976, #<Process::Status: pid 30976 exit 2>]]


# Process::waitpid

(from ruby core)
---
    Process.waitpid(pid=-1, flags=0)   -> integer

---

Waits for a child process to exit, returns its process id, and sets `$?` to a
`Process::Status` object containing information on that process. Which child
it waits on depends on the value of *pid*:

> 0
:   Waits for the child whose process ID equals *pid*.

0
:   Waits for any child whose process group ID equals that of the calling
    process.

-1
:   Waits for any child process (the default if no *pid* is given).

< -1
:   Waits for any child whose process group ID equals the absolute value of
    *pid*.


The *flags* argument may be a logical or of the flag values `Process::WNOHANG`
(do not block if no child available) or `Process::WUNTRACED` (return stopped
children that haven't been reported). Not all flags are available on all
platforms, but a flag value of zero will work on all platforms.

Calling this method raises a SystemCallError if there are no child processes.
Not available on all platforms.

    include Process
    fork { exit 99 }                 #=> 27429
    wait                             #=> 27429
    $?.exitstatus                    #=> 99

    pid = fork { sleep 3 }           #=> 27440
    Time.now                         #=> 2008-03-08 19:56:16 +0900
    waitpid(pid, Process::WNOHANG)   #=> nil
    Time.now                         #=> 2008-03-08 19:56:16 +0900
    waitpid(pid, 0)                  #=> 27440
    Time.now                         #=> 2008-03-08 19:56:19 +0900


# Process::waitpid2

(from ruby core)
---
    Process.waitpid2(pid=-1, flags=0)   -> [pid, status]

---

Waits for a child process to exit (see Process::waitpid for exact semantics)
and returns an array containing the process id and the exit status (a
`Process::Status` object) of that child. Raises a SystemCallError if there are
no child processes.

    Process.fork { exit 99 }   #=> 27437
    pid, status = Process.wait2
    pid                        #=> 27437
    status.exitstatus          #=> 99


(from gem puma-3.9.1)
---
# Class methods:

    daemon

# Process::daemon

(from ruby core)
---
    Process.daemon()                        -> 0
    Process.daemon(nochdir=nil,noclose=nil) -> 0

---

Detach the process from controlling terminal and run in the background as
system daemon.  Unless the argument nochdir is true (i.e. non false), it
changes the current working directory to the root ("/"). Unless the argument
noclose is true, daemon() will redirect standard input, standard output and
standard error to /dev/null. Return zero on success, or raise one of Errno::*.


(from gem puma-3.9.1)
---
    daemon(nochdir=false, noclose=false)

---


---
Also found in:
    gem activesupport-5.1.2
    gem capybara-2.14.4

