# Shellwords

(from ruby core)
---
## Manipulates strings like the UNIX Bourne shell

This module manipulates strings according to the word parsing rules of the
UNIX Bourne shell.

The shellwords() function was originally a port of shellwords.pl, but modified
to conform to the Shell & Utilities volume of the IEEE Std 1003.1-2008, 2016
Edition [1].

### Usage

You can use Shellwords to parse a string into a Bourne shell friendly Array.

    require 'shellwords'

    argv = Shellwords.split('three blind "mice"')
    argv #=> ["three", "blind", "mice"]

Once you've required Shellwords, you can use the #split alias
String#shellsplit.

    argv = "see how they run".shellsplit
    argv #=> ["see", "how", "they", "run"]

Be careful you don't leave a quote unmatched.

    argv = "they all ran after the farmer's wife".shellsplit
         #=> ArgumentError: Unmatched double quote: ...

In this case, you might want to use Shellwords.escape, or its alias
String#shellescape.

This method will escape the String for you to safely use with a Bourne shell.

    argv = Shellwords.escape("special's.txt")
    argv #=> "special\\'s.txt"
    system("cat " + argv)

Shellwords also comes with a core extension for Array, Array#shelljoin.

    argv = %w{ls -lta lib}
    system(argv.shelljoin)

You can use this method to create an escaped string out of an array of tokens
separated by a space. In this example we used the literal shortcut for
Array.new.

### Authors
*   Wakou Aoyama
*   Akinori MUSHA <knu@iDaemons.org>


### Contact
*   Akinori MUSHA <knu@iDaemons.org> (current maintainer)


### Resources

1: [IEEE Std 1003.1-2008, 2016 Edition, the Shell & Utilities
volume](http://pubs.opengroup.org/onlinepubs/9699919799/utilities/contents.htm
l)
---
# Class methods:

    escape
    join
    shellescape
    shelljoin
    shellsplit
    shellwords
    split

# Instance methods:

    shellescape
    shelljoin
    shellsplit
    shellwords

# Shellwords::escape

(from ruby core)
---
    escape(str)

---


# Shellwords::join

(from ruby core)
---
    join(array)

---


# Shellwords::shellescape

(from ruby core)
---
    shellescape(str)

---

Escapes a string so that it can be safely used in a Bourne shell command line.
 `str` can be a non-string object that responds to `to_s`.

Note that a resulted string should be used unquoted and is not intended for
use in double quotes nor in single quotes.

    argv = Shellwords.escape("It's better to give than to receive")
    argv #=> "It\\'s\\ better\\ to\\ give\\ than\\ to\\ receive"

String#shellescape is a shorthand for this function.

    argv = "It's better to give than to receive".shellescape
    argv #=> "It\\'s\\ better\\ to\\ give\\ than\\ to\\ receive"

    # Search files in lib for method definitions
    pattern = "^[ \t]*def "
    open("| grep -Ern #{pattern.shellescape} lib") { |grep|
      grep.each_line { |line|
        file, lineno, matched_line = line.split(':', 3)
        # ...
      }
    }

It is the caller's responsibility to encode the string in the right encoding
for the shell environment where this string is used.

Multibyte characters are treated as multibyte characters, not as bytes.

Returns an empty quoted String if `str` has a length of zero.


# Shellwords::shelljoin

(from ruby core)
---
    shelljoin(array)

---

Builds a command line string from an argument list, `array`.

All elements are joined into a single string with fields separated by a space,
where each element is escaped for the Bourne shell and stringified using
`to_s`.

    ary = ["There's", "a", "time", "and", "place", "for", "everything"]
    argv = Shellwords.join(ary)
    argv #=> "There\\'s a time and place for everything"

Array#shelljoin is a shortcut for this function.

    ary = ["Don't", "rock", "the", "boat"]
    argv = ary.shelljoin
    argv #=> "Don\\'t rock the boat"

You can also mix non-string objects in the elements as allowed in Array#join.

    output = `#{['ps', '-p', $$].shelljoin}`


# Shellwords::shellsplit

(from ruby core)
---
    shellsplit(line)

---

Splits a string into an array of tokens in the same way the UNIX Bourne shell
does.

    argv = Shellwords.split('here are "two words"')
    argv #=> ["here", "are", "two words"]

Note, however, that this is not a command line parser.  Shell metacharacters
except for the single and double quotes and backslash are not treated as such.

    argv = Shellwords.split('ruby my_prog.rb | less')
    argv #=> ["ruby", "my_prog.rb", "|", "less"]

String#shellsplit is a shortcut for this function.

    argv = 'here are "two words"'.shellsplit
    argv #=> ["here", "are", "two words"]


# Shellwords::shellwords

(from ruby core)
---
    shellwords(line)

---


# Shellwords::split

(from ruby core)
---
    split(line)

---


# Shellwords#shellescape

(from ruby core)
---
    shellescape(str)

---

Escapes a string so that it can be safely used in a Bourne shell command line.
 `str` can be a non-string object that responds to `to_s`.

Note that a resulted string should be used unquoted and is not intended for
use in double quotes nor in single quotes.

    argv = Shellwords.escape("It's better to give than to receive")
    argv #=> "It\\'s\\ better\\ to\\ give\\ than\\ to\\ receive"

String#shellescape is a shorthand for this function.

    argv = "It's better to give than to receive".shellescape
    argv #=> "It\\'s\\ better\\ to\\ give\\ than\\ to\\ receive"

    # Search files in lib for method definitions
    pattern = "^[ \t]*def "
    open("| grep -Ern #{pattern.shellescape} lib") { |grep|
      grep.each_line { |line|
        file, lineno, matched_line = line.split(':', 3)
        # ...
      }
    }

It is the caller's responsibility to encode the string in the right encoding
for the shell environment where this string is used.

Multibyte characters are treated as multibyte characters, not as bytes.

Returns an empty quoted String if `str` has a length of zero.


# Shellwords#shelljoin

(from ruby core)
---
    shelljoin(array)

---

Builds a command line string from an argument list, `array`.

All elements are joined into a single string with fields separated by a space,
where each element is escaped for the Bourne shell and stringified using
`to_s`.

    ary = ["There's", "a", "time", "and", "place", "for", "everything"]
    argv = Shellwords.join(ary)
    argv #=> "There\\'s a time and place for everything"

Array#shelljoin is a shortcut for this function.

    ary = ["Don't", "rock", "the", "boat"]
    argv = ary.shelljoin
    argv #=> "Don\\'t rock the boat"

You can also mix non-string objects in the elements as allowed in Array#join.

    output = `#{['ps', '-p', $$].shelljoin}`


# Shellwords#shellsplit

(from ruby core)
---
    shellsplit(line)

---

Splits a string into an array of tokens in the same way the UNIX Bourne shell
does.

    argv = Shellwords.split('here are "two words"')
    argv #=> ["here", "are", "two words"]

Note, however, that this is not a command line parser.  Shell metacharacters
except for the single and double quotes and backslash are not treated as such.

    argv = Shellwords.split('ruby my_prog.rb | less')
    argv #=> ["ruby", "my_prog.rb", "|", "less"]

String#shellsplit is a shortcut for this function.

    argv = 'here are "two words"'.shellsplit
    argv #=> ["here", "are", "two words"]


# Shellwords#shellwords

(from ruby core)
---
    shellwords(line)

---


