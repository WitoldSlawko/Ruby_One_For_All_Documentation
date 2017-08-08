# SassListen

(from gem sass-listen-4.0.0)
---



Listener implementation for BSD's `kqueue`. @see
http://www.freebsd.org/cgi/man.cgi?query=kqueue @see
https://github.com/mat813/rb-kqueue/blob/master/lib/rb-kqueue/queue.rb






This class just aggregates configuration object to avoid Listener specs from
exploding with huge test setup blocks









Code copied from https://github.com/celluloid/celluloid-fsm












---
# Constants:

VERSION
:   [not documented]


# Class methods:

    logger
    logger=
    setup_default_logger_if_unset
    stop
    to

# SassListen::logger

(from gem sass-listen-4.0.0)
---
    logger()

---


# SassListen::logger=

(from gem sass-listen-4.0.0)
---
    logger=(logger)

---


# SassListen::setup_default_logger_if_unset

(from gem sass-listen-4.0.0)
---
    setup_default_logger_if_unset()

---


# SassListen::stop

(from gem sass-listen-4.0.0)
---
    stop()

---

This is used by the `listen` binary to handle Ctrl-C


# SassListen::to

(from gem sass-listen-4.0.0)
---
    to(*args, &block)

---

Listens to file system modifications on a either single directory or multiple
directories.

@param (see SassListen::Listener#new)

@yield [modified, added, removed] the changed files @yieldparam
[Array<String>] modified the list of modified files @yieldparam
[Array<String>] added the list of added files @yieldparam [Array<String>]
removed the list of removed files

@return [SassListen::Listener] the listener


