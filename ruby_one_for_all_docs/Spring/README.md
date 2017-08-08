# Spring

(from gem spring-2.0.2)
---




















Some parts adapted from http://golang.org/src/pkg/json/decode.go and
http://golang.org/src/pkg/utf8/utf8.go













---
# Constants:

IGNORE_SIGNALS
:   [not documented]
ORIGINAL_ENV
:   [not documented]
STOP_TIMEOUT
:   [not documented]
VERSION
:   [not documented]


# Class methods:

    after_fork
    after_fork_callbacks
    application_root
    application_root_path
    command
    command?
    commands
    failsafe_thread
    find_project_root
    gemfile
    project_root_path
    quiet
    register_command
    verify_environment
    watch
    watch_interval
    watch_method
    watch_method=
    watcher

# Attributes:

    attr_accessor application_root
    attr_accessor quiet
    attr_accessor watch_interval
    attr_reader commands
    attr_reader watch_method
    attr_writer watcher

# Spring::after_fork

(from gem spring-2.0.2)
---
    after_fork(&block)

---


# Spring::after_fork_callbacks

(from gem spring-2.0.2)
---
    after_fork_callbacks()

---


# Spring::application_root_path

(from gem spring-2.0.2)
---
    application_root_path()

---


# Spring::command

(from gem spring-2.0.2)
---
    command(name)

---


# Spring::command?

(from gem spring-2.0.2)
---
    command?(name)

---


# Spring::failsafe_thread

(from gem spring-2.0.2)
---
    failsafe_thread() { || ... }

---


# Spring::gemfile

(from gem spring-2.0.2)
---
    gemfile()

---


# Spring::project_root_path

(from gem spring-2.0.2)
---
    project_root_path()

---


# Spring::register_command

(from gem spring-2.0.2)
---
    register_command(name, command = nil)

---


# Spring::verify_environment

(from gem spring-2.0.2)
---
    verify_environment()

---


# Spring::watch

(from gem spring-2.0.2)
---
    watch(*items)

---


# Spring::watch_method=

(from gem spring-2.0.2)
---
    watch_method=(method)

---


# Spring::watcher

(from gem spring-2.0.2)
---


# Spring::find_project_root

(from gem spring-2.0.2)
---
    find_project_root(current_dir)

---


---
Also found in:
    gem spring-watcher-listen-2.0.1

