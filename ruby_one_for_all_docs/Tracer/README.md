# Tracer < Object

(from ruby core)
---
Outputs a source level execution trace of a Ruby program.

It does this by registering an event handler with Kernel#set_trace_func for
processing incoming events.  It also provides methods for filtering unwanted
trace output (see Tracer.add_filter, Tracer.on, and Tracer.off).

## Example

Consider the following Ruby script

    class A
      def square(a)
        return a*a
      end
    end

    a = A.new
    a.square(5)

Running the above script using `ruby -r tracer example.rb` will output the
following trace to STDOUT (Note you can also explicitly `require 'tracer'`)

    #0:<internal:lib/rubygems/custom_require>:38:Kernel:<: -
    #0:example.rb:3::-: class A
    #0:example.rb:3::C: class A
    #0:example.rb:4::-:   def square(a)
    #0:example.rb:7::E: end
    #0:example.rb:9::-: a = A.new
    #0:example.rb:10::-: a.square(5)
    #0:example.rb:4:A:>:   def square(a)
    #0:example.rb:5:A:-:     return a*a
    #0:example.rb:6:A:<:   end
     |  |         | |  |
     |  |         | |   ---------------------+ event
     |  |         |  ------------------------+ class
     |  |          --------------------------+ line
     |   ------------------------------------+ filename
      ---------------------------------------+ thread

Symbol table used for displaying incoming events:

+}+
:   call a C-language routine
+{+
:   return from a C-language routine
+>+
:   call a Ruby method
`C`
:   start a class or module definition
`E`
:   finish a class or module definition
`-`
:   execute code on a new line
+^+
:   raise an exception
+<+
:   return from a Ruby method


## Copyright

by Keiju ISHITSUKA(keiju@ishitsuka.com)
---
# Constants:

EVENT_SYMBOL
:   Symbol table used for displaying trace information
Single
:   Reference to singleton instance of Tracer
display_c_call
:   [not documented]
display_process_id
:   [not documented]
display_thread_id
:   [not documented]
stdout
:   [not documented]
verbose
:   [not documented]


# Class methods:

    add_filter
    display_c_call
    display_c_call?
    display_process_id
    display_process_id?
    display_thread_id
    display_thread_id?
    off
    on
    set_get_line_procs
    stdout
    stdout_mutex
    verbose
    verbose?

# Attributes:

    attr_accessor display_c_call
    attr_accessor display_c_call?
    attr_accessor display_process_id
    attr_accessor display_process_id?
    attr_accessor display_thread_id
    attr_accessor display_thread_id?
    attr_accessor stdout
    attr_accessor verbose
    attr_accessor verbose?
    attr_reader stdout_mutex

# Tracer::add_filter

(from ruby core)
---
    add_filter(p = proc)

---

Used to filter unwanted trace output

Example which only outputs lines of code executed within the Kernel class:

    Tracer.add_filter do |event, file, line, id, binding, klass, *rest|
      "Kernel" == klass.to_s
    end


# Tracer::off

(from ruby core)
---
    off()

---

Disable tracing


# Tracer::on

(from ruby core)
---
    on() { || ... }

---

Start tracing

### Example

    Tracer.on
    # code to trace here
    Tracer.off

You can also pass a block:

    Tracer.on {
      # trace everything in this block
    }


# Tracer::set_get_line_procs

(from ruby core)
---
    set_get_line_procs(file_name, p = proc)

---

Register an event handler `p` which is called everytime a line in `file_name`
is executed.

Example:

    Tracer.set_get_line_procs("example.rb", lambda { |line|
      puts "line number executed is #{line}"
    })


