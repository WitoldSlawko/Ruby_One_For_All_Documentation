# ChildProcess

(from gem childprocess-0.7.1)
---






















---
# Constants:

VERSION
:   [not documented]


# Class methods:

    arch
    build
    close_on_exec
    is_64_bit?
    jruby?
    linux?
    logger
    new
    os
    platform
    platform_name
    posix_spawn=
    posix_spawn?
    unix?
    warn_once
    windows?
    workaround_older_macosx_misreported_cpu?

# Attributes:

    attr_writer logger

# ChildProcess::arch

(from gem childprocess-0.7.1)
---
    arch()

---


# ChildProcess::build

(from gem childprocess-0.7.1)
---
    build(*args)

---


# ChildProcess::close_on_exec

(from gem childprocess-0.7.1)
---
    close_on_exec(file)

---

By default, a child process will inherit open file descriptors from the parent
process. This helper provides a cross-platform way of making sure that doesn't
happen for the given file/io.


# ChildProcess::jruby?

(from gem childprocess-0.7.1)
---
    jruby?()

---


# ChildProcess::linux?

(from gem childprocess-0.7.1)
---
    linux?()

---


# ChildProcess::logger

(from gem childprocess-0.7.1)
---


# ChildProcess::new

(from gem childprocess-0.7.1)
---
    new(*args)

---


# ChildProcess::os

(from gem childprocess-0.7.1)
---
    os()

---


# ChildProcess::platform

(from gem childprocess-0.7.1)
---
    platform()

---


# ChildProcess::platform_name

(from gem childprocess-0.7.1)
---
    platform_name()

---


# ChildProcess::posix_spawn=

(from gem childprocess-0.7.1)
---
    posix_spawn=(bool)

---

Set this to true to enable experimental use of posix_spawn.


# ChildProcess::posix_spawn?

(from gem childprocess-0.7.1)
---
    posix_spawn?()

---


# ChildProcess::unix?

(from gem childprocess-0.7.1)
---
    unix?()

---


# ChildProcess::windows?

(from gem childprocess-0.7.1)
---
    windows?()

---


# ChildProcess::is_64_bit?

(from gem childprocess-0.7.1)
---
    is_64_bit?()

---

@return [Boolean] `true` if this Ruby represents `1` in 64 bits (8 bytes).


# ChildProcess::warn_once

(from gem childprocess-0.7.1)
---
    warn_once(msg)

---


# ChildProcess::workaround_older_macosx_misreported_cpu?

(from gem childprocess-0.7.1)
---
    workaround_older_macosx_misreported_cpu?()

---

Workaround: detect the situation that an older Darwin Ruby is actually 64-bit,
but is misreporting cpu as i686, which would imply 32-bit.

@return [Boolean] `true` if:
    (a) on Mac OS X
    (b) actually running in 64-bit mode


