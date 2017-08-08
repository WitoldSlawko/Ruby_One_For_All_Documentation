# SyntaxError < ScriptError

(from ruby core)
---
Raised when encountering Ruby code with an invalid syntax.

    eval("1+1=2")

*raises the exception:*

    SyntaxError: (eval):1: syntax error, unexpected '=', expecting $end
---
# Class methods:

    new

# SyntaxError::new

(from ruby core)
---
    SyntaxError.new([msg])  -> syntax_error

---

Construct a SyntaxError exception.


