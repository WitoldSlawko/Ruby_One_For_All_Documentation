# Byebug

---
# Includes:
Helpers::ReflectionHelper (from gem byebug-9.0.6)

(from gem byebug-9.0.6)
---
## Summary

This is a singleton class allows controlling byebug. Use it to start/stop
byebug, set/remove breakpoints, etc.

Main Container for all of Byebug's code






























































Main debugger's container module. Everything is defined under this module














Namespace for all of byebug's code












Remote debugging functionality.

@todo Refactor & add tests



















Reopen main module to define the library version
---
# Constants:

PORT
:   Port number used for remote debugging
VERSION
:   [not documented]


# Class methods:

    actual_control_port
    actual_port
    add_catchpoint
    attach
    breakpoints
    catchpoints
    contexts
    current_context
    debug_load
    handle_post_mortem
    interrupt
    load_settings
    parse_host_and_port
    post_mortem=
    post_mortem?
    raised_exception
    start
    start_client
    start_control
    start_server
    started?
    stop
    stoppable?
    thread_context
    tracing=
    tracing?
    verbose=
    verbose?
    wait_connection

# Instance methods:

    after_repl
    displays
    init_file
    mode
    prompt
    rc_dirs
    run_init_script
    run_rc_file
    without_exceptions

# Attributes:

    attr_accessor actual_port
    attr_accessor displays
    attr_accessor init_file
    attr_accessor mode
    attr_accessor wait_connection
    attr_reader actual_control_port

# Byebug::add_catchpoint

(from gem byebug-9.0.6)
---
    Byebug.add_catchpoint(exception) -> exception

---

Adds a new exception to the catchpoints hash.


# Byebug::attach

(from gem byebug-9.0.6)
---
    attach()

---

Enters byebug right before (or right after if *before* is false) return events
occur. Before entering byebug the init script is read.


# Byebug::breakpoints

(from gem byebug-9.0.6)
---
    Byebug.breakpoints -> array

---

Returns an array of breakpoints.


# Byebug::catchpoints

(from gem byebug-9.0.6)
---
    Byebug.catchpoints -> hash

---

Returns the catchpoints hash.


# Byebug::contexts

(from gem byebug-9.0.6)
---
    Byebug.contexts -> array

---

Returns an array of all contexts.


# Byebug::current_context

(from gem byebug-9.0.6)
---
    Byebug.current_context -> context

---

Returns the current context.
    <i>Note:</i> Byebug.current_context.thread == Thread.current


# Byebug::debug_load

(from gem byebug-9.0.6)
---
    Byebug.debug_load(file, stop = false) -> nil

---

Same as Kernel#load but resets current context's frames. `stop` parameter
forces byebug to stop at the first line of code in `file`


# Byebug::handle_post_mortem

(from gem byebug-9.0.6)
---
    handle_post_mortem()

---

Saves information about the unhandled exception and gives a byebug prompt back
to the user before program termination.


# Byebug::interrupt

(from gem byebug-9.0.6)
---
    interrupt()

---

Interrupts the current thread


# Byebug::load_settings

(from gem byebug-9.0.6)
---
    load_settings()

---


# Byebug::parse_host_and_port

(from gem byebug-9.0.6)
---
    parse_host_and_port(host_port_spec)

---


# Byebug::post_mortem=

(from gem byebug-9.0.6)
---
    Byebug.post_mortem = bool

---

Sets post-moterm flag.


# Byebug::post_mortem?

(from gem byebug-9.0.6)
---
    Byebug.post_mortem? -> bool

---

Returns `true` if post-mortem debugging is enabled.


# Byebug::raised_exception

(from gem byebug-9.0.6)
---
    Byebug.raised_exception -> exception

---

Returns raised exception when in post_mortem mode.


# Byebug::start

(from gem byebug-9.0.6)
---
    Byebug.start -> bool

---

The return value is the value of !Byebug.started? *before* issuing the
`start`; That is, `true` is returned, unless byebug was previously started.


# Byebug::start_client

(from gem byebug-9.0.6)
---
    start_client(host = 'localhost', port = PORT)

---

Connects to the remote byebug


# Byebug::start_control

(from gem byebug-9.0.6)
---
    start_control(host = nil, ctrl_port = PORT + 1)

---


# Byebug::start_server

(from gem byebug-9.0.6)
---
    start_server(host = nil, port = PORT) { || ... }

---

Starts a remote byebug


# Byebug::started?

(from gem byebug-9.0.6)
---
    Byebug.started? -> bool

---

Returns `true` byebug is started.


# Byebug::stop

(from gem byebug-9.0.6)
---
    Byebug.stop -> bool

---

This method disables byebug. It returns `true` if byebug was already disabled,
otherwise it returns `false`.


# Byebug::stoppable?

(from gem byebug-9.0.6)
---
    stoppable?()

---


# Byebug::thread_context

(from gem byebug-9.0.6)
---
    Byebug.thread_context(thread) -> context

---

Returns context of the thread passed as an argument.


# Byebug::tracing=

(from gem byebug-9.0.6)
---
    Byebug.tracing = bool

---

Sets the global tracing flag.


# Byebug::tracing?

(from gem byebug-9.0.6)
---
    Byebug.tracing? -> bool

---

Returns `true` if global tracing is enabled.


# Byebug::verbose=

(from gem byebug-9.0.6)
---
    Byebug.verbose = bool

---

Sets the global verbose flag for TracePoint API events is enabled.


# Byebug::verbose?

(from gem byebug-9.0.6)
---
    Byebug.verbose? -> bool

---

Returns `true` if global verbose flag for TracePoint API events is enabled.


# Byebug#after_repl

(from gem byebug-9.0.6)
---
    after_repl()

---


# Byebug#prompt

(from gem byebug-9.0.6)
---
    prompt()

---

Prompt shown before reading a command.


# Byebug#run_init_script

(from gem byebug-9.0.6)
---
    run_init_script()

---

Runs normal byebug initialization scripts.

Reads and executes the commands from init file (if any) in the current working
directory. This is only done if the current directory is different from your
home directory. Thus, you can have more than one init file, one generic in
your home directory, and another, specific to the program you are debugging,
in the directory where you invoke byebug.


# Byebug#rc_dirs

(from gem byebug-9.0.6)
---
    rc_dirs()

---

List of folders to load rc files from

@note Files will be loaded in the order specified here.


# Byebug#run_rc_file

(from gem byebug-9.0.6)
---
    run_rc_file(base_path)

---

Runs a initialization script file


# Byebug#without_exceptions

(from gem byebug-9.0.6)
---
    without_exceptions() { || ... }

---


