# Puma

(from gem puma-3.9.1)
---
















Conservative native JRuby/Java implementation of IOBuffer backed by a
ByteArrayOutputStream and conversion between Ruby String and Java bytes














---
# Constants:

HTTP_STATUS_CODES
:   Every standard HTTP code mapped to the appropriate message. Generated
    with: curl -s
    https://www.iana.org/assignments/http-status-codes/http-status-codes-1.csv
    | \
        ruby -ne 'm = /^(\d{3}),(?!Unassigned|\(Unused\))([^,]+)/.match($_) and \
                  puts "#{m[1]} => \x27#{m[2].strip}\x27,"'
IS_JRUBY
:   [not documented]
IS_WINDOWS
:   [not documented]
Plugins
:   [not documented]
STATUS_WITH_NO_ENTITY_BODY
:   For some HTTP status codes the client only expects headers.


# Class methods:

    cli_config
    jruby?
    run
    windows?

# Attributes:

    attr_accessor cli_config

# Puma::jruby?

(from gem puma-3.9.1)
---
    jruby?()

---


# Puma::run

(from gem puma-3.9.1)
---
    run(opts={}) { |c| ... }

---


# Puma::windows?

(from gem puma-3.9.1)
---
    windows?()

---


