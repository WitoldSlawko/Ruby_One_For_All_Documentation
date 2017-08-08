# Ripper < Object

(from ruby core)
---
Ripper is a Ruby script parser.

You can get information from the parser with event-based style. Information
such as abstract syntax trees or simple lexical analysis of the Ruby program.

## Usage

Ripper provides an easy interface for parsing your program into a symbolic
expression tree (or S-expression).

Understanding the output of the parser may come as a challenge, it's
recommended you use PP to format the output for legibility.

    require 'ripper'
    require 'pp'

    pp Ripper.sexp('def hello(world) "Hello, #{world}!"; end')
      #=> [:program,
           [[:def,
             [:@ident, "hello", [1, 4]],
             [:paren,
              [:params, [[:@ident, "world", [1, 10]]], nil, nil, nil, nil, nil, nil]],
             [:bodystmt,
              [[:string_literal,
                [:string_content,
                 [:@tstring_content, "Hello, ", [1, 18]],
                 [:string_embexpr, [[:var_ref, [:@ident, "world", [1, 27]]]]],
                 [:@tstring_content, "!", [1, 33]]]]],
              nil,
              nil,
              nil]]]]

You can see in the example above, the expression starts with `:program`.

From here, a method definition at `:def`, followed by the method's identifier
`:@ident`. After the method's identifier comes the parentheses `:paren` and
the method parameters under `:params`.

Next is the method body, starting at `:bodystmt` (`stmt` meaning statement),
which contains the full definition of the method.

In our case, we're simply returning a String, so next we have the
`:string_literal` expression.

Within our `:string_literal` you'll notice two `@tstring_content`, this is the
literal part for `Hello, ` and `!`. Between the two `@tstring_content`
statements is a `:string_embexpr`, where *embexpr* is an embedded expression.
Our expression consists of a local variable, or `var_ref`, with the identifier
(`@ident`) of `world`.

## Resources

*   [Ruby
    Inside](http://www.rubyinside.com/using-ripper-to-see-how-ruby-is-parsing-
    your-code-5270.html)


## Requirements

*   ruby 1.9 (support CVS HEAD only)
*   bison 1.28 or later (Other yaccs do not work)


## License

    Ruby License.

                                                  Minero Aoki
                                          aamine@loveruby.net
                                        http://i.loveruby.net






---
# Constants:

EVENTS
:   This array contains name of all ripper events.
PARSER_EVENTS
:   This array contains name of parser events.
SCANNER_EVENTS
:   This array contains name of scanner events.
Version
:   version of Ripper



# Class methods:

    dedent_string
    lex
    new
    parse
    sexp
    sexp_raw
    slice
    tokenize

# Instance methods:

    _dispatch_0
    _dispatch_1
    _dispatch_2
    _dispatch_3
    _dispatch_4
    _dispatch_5
    _dispatch_6
    _dispatch_7
    column
    compile_error
    dedent_string
    encoding
    end_seen?
    error?
    filename
    lineno
    parse
    warn
    warning
    yydebug
    yydebug=

# Ripper::dedent_string

(from ruby core)
---
    dedent_string(p1, p2)

---


# Ripper::lex

(from ruby core)
---
    lex(src, filename = '-', lineno = 1)

---

Tokenizes the Ruby program and returns an array of an array, which is
formatted like `[[lineno, column], type, token]`.

    require 'ripper'
    require 'pp'

    pp Ripper.lex("def m(a) nil end")
      #=> [[[1,  0], :on_kw,     "def"],
           [[1,  3], :on_sp,     " "  ],
           [[1,  4], :on_ident,  "m"  ],
           [[1,  5], :on_lparen, "("  ],
           [[1,  6], :on_ident,  "a"  ],
           [[1,  7], :on_rparen, ")"  ],
           [[1,  8], :on_sp,     " "  ],
           [[1,  9], :on_kw,     "nil"],
           [[1, 12], :on_sp,     " "  ],
           [[1, 13], :on_kw,     "end"]]


# Ripper::new

(from ruby core)
---
    Ripper.new(src, filename="(ripper)", lineno=1) -> ripper

---

Create a new Ripper object. *src* must be a String, an IO, or an Object which
has #gets method.

This method does not starts parsing. See also Ripper#parse and Ripper.parse.


# Ripper::parse

(from ruby core)
---
    parse(src, filename = '(ripper)', lineno = 1)

---

Parses the given Ruby program read from `src`. `src` must be a String or an IO
or a object with a #gets method.


# Ripper::sexp

(from ruby core)
---
    sexp(src, filename = '-', lineno = 1)

---

EXPERIMENTAL
:   Parses `src` and create S-exp tree. Returns more readable tree rather than
    Ripper.sexp_raw. This method is mainly for developer use.

        require 'ripper'
        require 'pp'

        pp Ripper.sexp("def m(a) nil end")
          #=> [:program,
               [[:def,
                [:@ident, "m", [1, 4]],
                [:paren, [:params, [[:@ident, "a", [1, 6]]], nil, nil, nil, nil]],
                [:bodystmt, [[:var_ref, [:@kw, "nil", [1, 9]]]], nil, nil, nil]]]]



# Ripper::sexp_raw

(from ruby core)
---
    sexp_raw(src, filename = '-', lineno = 1)

---

EXPERIMENTAL
:   Parses `src` and create S-exp tree. This method is mainly for developer
    use.

        require 'ripper'
        require 'pp'

        pp Ripper.sexp_raw("def m(a) nil end")
          #=> [:program,
               [:stmts_add,
                [:stmts_new],
                [:def,
                 [:@ident, "m", [1, 4]],
                 [:paren, [:params, [[:@ident, "a", [1, 6]]], nil, nil, nil]],
                 [:bodystmt,
                  [:stmts_add, [:stmts_new], [:var_ref, [:@kw, "nil", [1, 9]]]],
                  nil,
                  nil,
                  nil]]]]



# Ripper::slice

(from ruby core)
---
    slice(src, pattern, n = 0)

---

EXPERIMENTAL
:   Parses `src` and return a string which was matched to `pattern`. `pattern`
    should be described as Regexp.

        require 'ripper'

        p Ripper.slice('def m(a) nil end', 'ident')                   #=> "m"
        p Ripper.slice('def m(a) nil end', '[ident lparen rparen]+')  #=> "m(a)"
        p Ripper.slice("<<EOS\nstring\nEOS",
                       'heredoc_beg nl $(tstring_content*) heredoc_end', 1)
            #=> "string\n"



# Ripper::tokenize

(from ruby core)
---
    tokenize(src, filename = '-', lineno = 1)

---

Tokenizes the Ruby program and returns an array of strings.

    p Ripper.tokenize("def m(a) nil end")
       # => ["def", " ", "m", "(", "a", ")", " ", "nil", " ", "end"]


# Ripper#column

(from ruby core)
---
    ripper#column   -> Integer

---

Return column number of current parsing line. This number starts from 0.


# Ripper#encoding

(from ruby core)
---
    ripper#encoding   -> encoding

---

Return encoding of the source.


# Ripper#end_seen?

(from ruby core)
---
    ripper#end_seen?   -> Boolean

---

Return true if parsed source ended by +_*END*_+.


# Ripper#error?

(from ruby core)
---
    ripper#error?   -> Boolean

---

Return true if parsed source has errors.


# Ripper#filename

(from ruby core)
---
    ripper#filename   -> String

---

Return current parsing filename.


# Ripper#lineno

(from ruby core)
---
    ripper#lineno   -> Integer

---

Return line number of current parsing line. This number starts from 1.


# Ripper#parse

(from ruby core)
---
    ripper#parse

---

Start parsing and returns the value of the root action.


# Ripper#yydebug

(from ruby core)
---
    ripper.yydebug   -> true or false

---

Get yydebug.


# Ripper#yydebug=

(from ruby core)
---
    ripper.yydebug = flag

---

Set yydebug.


# Ripper#_dispatch_0

(from ruby core)
---
    _dispatch_0()

---


# Ripper#_dispatch_1

(from ruby core)
---
    _dispatch_1(a)

---


# Ripper#_dispatch_2

(from ruby core)
---
    _dispatch_2(a, b)

---


# Ripper#_dispatch_3

(from ruby core)
---
    _dispatch_3(a, b, c)

---


# Ripper#_dispatch_4

(from ruby core)
---
    _dispatch_4(a, b, c, d)

---


# Ripper#_dispatch_5

(from ruby core)
---
    _dispatch_5(a, b, c, d, e)

---


# Ripper#_dispatch_6

(from ruby core)
---
    _dispatch_6(a, b, c, d, e, f)

---


# Ripper#_dispatch_7

(from ruby core)
---
    _dispatch_7(a, b, c, d, e, f, g)

---


# Ripper#compile_error

(from ruby core)
---
    compile_error(msg)

---

This method is called when the parser found syntax error.


# Ripper#dedent_string

(from ruby core)
---
    dedent_string(p1, p2)

---


# Ripper#warn

(from ruby core)
---
    warn(fmt, *args)

---

This method is called when weak warning is produced by the parser. `fmt` and
`args` is printf style.


# Ripper#warning

(from ruby core)
---
    warning(fmt, *args)

---

This method is called when strong warning is produced by the parser. `fmt` and
`args` is printf style.


