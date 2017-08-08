# Parser

(from gem parser-2.4.0.0)
---
@api public


















































---
# Constants:

CurrentRuby
:   [not documented]
MESSAGES
:   Diagnostic messages (errors, warnings and notices) that can be generated.

    @see Diagnostic

    @api public
VERSION
:   [not documented]


# Class methods:

    check_for_encoding_support
    warn_syntax_deviation

# Parser::check_for_encoding_support

(from gem parser-2.4.0.0)
---
    check_for_encoding_support()

---

Verify that the current Ruby implementation supports Encoding. @raise
[RuntimeError]


# Parser::warn_syntax_deviation

(from gem parser-2.4.0.0)
---
    warn_syntax_deviation(feature, version)

---


