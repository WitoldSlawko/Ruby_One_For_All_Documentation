# RbConfig

(from ruby core)
---
The module storing Ruby interpreter configurations on building.

This file was created by mkconfig.rb when ruby was built.  It contains build
information for ruby which is used e.g. by mkmf to build compatible native
extensions.  Any changes made to this file will be lost the next time ruby is
built.
---
# Constants:

CONFIG
:   The hash configurations stored.
DESTDIR
:   DESTDIR on make install.
MAKEFILE_CONFIG
:   Almost same with CONFIG. MAKEFILE_CONFIG has other variable reference like
    below.

        MAKEFILE_CONFIG["bindir"] = "$(exec_prefix)/bin"

    The values of this constant is used for creating Makefile.

        require 'rbconfig'

        print <<-END_OF_MAKEFILE
        prefix = #{Config::MAKEFILE_CONFIG['prefix']}
        exec_prefix = #{Config::MAKEFILE_CONFIG['exec_prefix']}
        bindir = #{Config::MAKEFILE_CONFIG['bindir']}
        END_OF_MAKEFILE

        => prefix = /usr/local
           exec_prefix = $(prefix)
           bindir = $(exec_prefix)/bin  MAKEFILE_CONFIG = {}

    RbConfig.expand is used for resolving references like above in rbconfig.

        require 'rbconfig'
        p Config.expand(Config::MAKEFILE_CONFIG["bindir"])
        # => "/usr/local/bin"
TOPDIR
:   Ruby installed directory.


# Class methods:

    expand
    ruby

# RbConfig::expand

(from ruby core)
---
    RbConfig.expand(val)         -> string
    RbConfig.expand(val, config) -> string

---

expands variable with given `val` value.

    RbConfig.expand("$(bindir)") # => /home/foobar/all-ruby/ruby19x/bin


# RbConfig::ruby

(from ruby core)
---
    RbConfig.ruby -> path

---

returns the absolute pathname of the ruby command.


---
Also found in:
    gem byebug-9.0.6
    gem ffi-1.9.18
    gem nokogiri-1.8.0
    gem pg-0.21.0
    gem sqlite3-1.3.13

