# Readline

(from ruby core)
---
The Readline module provides interface for GNU Readline. This module defines a
number of methods to facilitate completion and accesses input history from the
Ruby interpreter. This module supported Edit Line(libedit) too. libedit is
compatible with GNU Readline.

GNU Readline
:   http://www.gnu.org/directory/readline.html
libedit
:   http://www.thrysoee.dk/editline/


Reads one inputted line with line edit by Readline.readline method. At this
time, the facilitatation completion and the key bind like Emacs can be
operated like GNU Readline.

    require "readline"
    while buf = Readline.readline("> ", true)
      p buf
    end

The content that the user input can be recorded to the history. The history
can be accessed by Readline::HISTORY constant.

    require "readline"
    while buf = Readline.readline("> ", true)
      p Readline::HISTORY.to_a
      print("-> ", buf, "\n")
    end

Documented by Kouji Takao <kouji dot takao at gmail dot com>.
---
# Constants:

FILENAME_COMPLETION_PROC
:   The Object with the call method that is a completion for filename. This is
    sets by Readline.completion_proc= method.
HISTORY
:   The history buffer. It extends Enumerable module, so it behaves just like
    an array. For example, gets the fifth content that the user input by
    [HISTORY](4).
USERNAME_COMPLETION_PROC
:   The Object with the call method that is a completion for usernames. This
    is sets by Readline.completion_proc= method.
VERSION
:   Version string of GNU Readline or libedit.



# Class methods:

    basic_quote_characters
    basic_quote_characters=
    basic_word_break_characters
    basic_word_break_characters=
    completer_quote_characters
    completer_quote_characters=
    completer_word_break_characters
    completer_word_break_characters=
    completion_append_character
    completion_append_character=
    completion_case_fold
    completion_case_fold=
    completion_proc
    completion_proc=
    delete_text
    emacs_editing_mode
    emacs_editing_mode?
    filename_quote_characters
    filename_quote_characters=
    get_screen_size
    input=
    insert_text
    line_buffer
    output=
    point
    point=
    pre_input_hook
    pre_input_hook=
    quoting_detection_proc
    quoting_detection_proc=
    readline
    redisplay
    refresh_line
    set_screen_size
    special_prefixes
    special_prefixes=
    vi_editing_mode
    vi_editing_mode?

# Readline::basic_quote_characters

(from ruby core)
---
    Readline.basic_quote_characters -> string

---

Gets a list of quote characters which can cause a word break.

Raises NotImplementedError if the using readline library does not support.


# Readline::basic_quote_characters=

(from ruby core)
---
    Readline.basic_quote_characters = string

---

Sets a list of quote characters which can cause a word break.

Raises NotImplementedError if the using readline library does not support.


# Readline::basic_word_break_characters

(from ruby core)
---
    Readline.basic_word_break_characters -> string

---

Gets the basic list of characters that signal a break between words for the
completer routine.

Raises NotImplementedError if the using readline library does not support.


# Readline::basic_word_break_characters=

(from ruby core)
---
    Readline.basic_word_break_characters = string

---

Sets the basic list of characters that signal a break between words for the
completer routine. The default is the characters which break words for
completion in Bash: " t\n\"\\'`@$><=;|&{(".

Raises NotImplementedError if the using readline library does not support.


# Readline::completer_quote_characters

(from ruby core)
---
    Readline.completer_quote_characters -> string

---

Gets a list of characters which can be used to quote a substring of the line.

Raises NotImplementedError if the using readline library does not support.


# Readline::completer_quote_characters=

(from ruby core)
---
    Readline.completer_quote_characters = string

---

Sets a list of characters which can be used to quote a substring of the line.
Completion occurs on the entire substring, and within the substring
Readline.completer_word_break_characters are treated as any other character,
unless they also appear within this list.

Raises NotImplementedError if the using readline library does not support.


# Readline::completer_word_break_characters

(from ruby core)
---
    Readline.completer_word_break_characters -> string

---

Gets the basic list of characters that signal a break between words for
rl_complete_internal().

Raises NotImplementedError if the using readline library does not support.


# Readline::completer_word_break_characters=

(from ruby core)
---
    Readline.completer_word_break_characters = string

---

Sets the basic list of characters that signal a break between words for
rl_complete_internal(). The default is the value of
Readline.basic_word_break_characters.

Raises NotImplementedError if the using readline library does not support.


# Readline::completion_append_character

(from ruby core)
---
    Readline.completion_append_character -> char

---

Returns a string containing a character to be appended on completion. The
default is a space (" ").

Raises NotImplementedError if the using readline library does not support.


# Readline::completion_append_character=

(from ruby core)
---
    Readline.completion_append_character = char

---

Specifies a character to be appended on completion. Nothing will be appended
if an empty string ("") or nil is specified.

For example:
    require "readline"

    Readline.readline("> ", true)
    Readline.completion_append_character = " "

Result:
    >
    Input "/var/li".

    > /var/li
    Press TAB key.

    > /var/lib
    Completes "b" and appends " ". So, you can continuously input "/usr".

    > /var/lib /usr

NOTE: Only one character can be specified. When "string" is specified, sets
only "s" that is the first.

    require "readline"

    Readline.completion_append_character = "string"
    p Readline.completion_append_character # => "s"

Raises NotImplementedError if the using readline library does not support.


# Readline::completion_case_fold

(from ruby core)
---
    Readline.completion_case_fold -> bool

---

Returns true if completion ignores case. If no, returns false.

NOTE: Returns the same object that is specified by
Readline.completion_case_fold= method.

    require "readline"

    Readline.completion_case_fold = "This is a String."
    p Readline.completion_case_fold # => "This is a String."


# Readline::completion_case_fold=

(from ruby core)
---
    Readline.completion_case_fold = bool

---

Sets whether or not to ignore case on completion.


# Readline::completion_proc

(from ruby core)
---
    Readline.completion_proc -> proc

---

Returns the completion Proc object.


# Readline::completion_proc=

(from ruby core)
---
    Readline.completion_proc = proc

---

Specifies a Proc object `proc` to determine completion behavior.  It should
take input string and return an array of completion candidates.

The default completion is used if `proc` is nil.

The String that is passed to the Proc depends on the
Readline.completer_word_break_characters property.  By default the word under
the cursor is passed to the Proc.  For example, if the input is "foo bar" then
only "bar" would be passed to the completion Proc.

Upon successful completion the Readline.completion_append_character will be
appended to the input so the user can start working on their next argument.

# Examples

## Completion for a Static List

    require 'readline'

    LIST = [
      'search', 'download', 'open',
      'help', 'history', 'quit',
      'url', 'next', 'clear',
      'prev', 'past'
    ].sort

    comp = proc { |s| LIST.grep(/^#{Regexp.escape(s)}/) }

    Readline.completion_append_character = " "
    Readline.completion_proc = comp

    while line = Readline.readline('> ', true)
      p line
    end

## Completion For Directory Contents

    require 'readline'

    Readline.completion_append_character = " "
    Readline.completion_proc = Proc.new do |str|
      Dir[str+'*'].grep(/^#{Regexp.escape(str)}/)
    end

    while line = Readline.readline('> ', true)
      p line
    end

# Autocomplete strategies

When working with auto-complete there are some strategies that work well. To
get some ideas you can take a look at the
[completion.rb](http://svn.ruby-lang.org/repos/ruby/trunk/lib/irb/completion.r
b) file for irb.

The common strategy is to take a list of possible completions and filter it
down to those completions that start with the user input.  In the above
examples Enumerator.grep is used.  The input is escaped to prevent Regexp
special characters from interfering with the matching.

It may also be helpful to use the Abbrev library to generate completions.

Raises ArgumentError if `proc` does not respond to the call method.


# Readline::delete_text

(from ruby core)
---
    Readline.delete_text([start[, length]]) -> self
    Readline.delete_text(start..end)        -> self
    Readline.delete_text()                  -> self

---

Delete text between start and end in the current line.

See GNU Readline's rl_delete_text function.

Raises NotImplementedError if the using readline library does not support.


# Readline::emacs_editing_mode

(from ruby core)
---
    Readline.emacs_editing_mode -> nil

---

Specifies Emacs editing mode. The default is this mode. See the manual of GNU
Readline for details of Emacs editing mode.

Raises NotImplementedError if the using readline library does not support.


# Readline::emacs_editing_mode?

(from ruby core)
---
    Readline.emacs_editing_mode? -> bool

---

Returns true if emacs mode is active. Returns false if not.

Raises NotImplementedError if the using readline library does not support.


# Readline::filename_quote_characters

(from ruby core)
---
    Readline.filename_quote_characters -> string

---

Gets a list of characters that cause a filename to be quoted by the completer
when they appear in a completed filename.

Raises NotImplementedError if the using readline library does not support.


# Readline::filename_quote_characters=

(from ruby core)
---
    Readline.filename_quote_characters = string

---

Sets a list of characters that cause a filename to be quoted by the completer
when they appear in a completed filename. The default is nil.

Raises NotImplementedError if the using readline library does not support.


# Readline::get_screen_size

(from ruby core)
---
    Readline.get_screen_size -> [rows, columns]

---

Returns the terminal's rows and columns.

See GNU Readline's rl_get_screen_size function.

Raises NotImplementedError if the using readline library does not support.


# Readline::input=

(from ruby core)
---
    Readline.input = input

---

Specifies a File object `input` that is input stream for Readline.readline
method.


# Readline::insert_text

(from ruby core)
---
    Readline.insert_text(string) -> self

---

Insert text into the line at the current cursor position.

See GNU Readline's rl_insert_text function.

Raises NotImplementedError if the using readline library does not support.


# Readline::line_buffer

(from ruby core)
---
    Readline.line_buffer -> string

---

Returns the full line that is being edited. This is useful from within the
complete_proc for determining the context of the completion request.

The length of `Readline.line_buffer` and GNU Readline's rl_end are same.

Raises NotImplementedError if the using readline library does not support.


# Readline::output=

(from ruby core)
---
    Readline.output = output

---

Specifies a File object `output` that is output stream for Readline.readline
method.


# Readline::point

(from ruby core)
---
    Readline.point -> int

---

Returns the index of the current cursor position in `Readline.line_buffer`.

The index in `Readline.line_buffer` which matches the start of input-string
passed to completion_proc is computed by subtracting the length of
input-string from `Readline.point`.

    start = (the length of input-string) - Readline.point

Raises NotImplementedError if the using readline library does not support.


# Readline::point=

(from ruby core)
---
    Readline.point = int

---

Set the index of the current cursor position in `Readline.line_buffer`.

Raises NotImplementedError if the using readline library does not support.

See `Readline.point`.


# Readline::pre_input_hook

(from ruby core)
---
    Readline.pre_input_hook -> proc

---

Returns a Proc object `proc` to call after the first prompt has been printed
and just before readline starts reading input characters. The default is nil.

Raises NotImplementedError if the using readline library does not support.


# Readline::pre_input_hook=

(from ruby core)
---
    Readline.pre_input_hook = proc

---

Specifies a Proc object `proc` to call after the first prompt has been printed
and just before readline starts reading input characters.

See GNU Readline's rl_pre_input_hook variable.

Raises ArgumentError if `proc` does not respond to the call method.

Raises NotImplementedError if the using readline library does not support.


# Readline::quoting_detection_proc

(from ruby core)
---
    Readline.quoting_detection_proc -> proc

---

Returns the quoting detection Proc object.


# Readline::quoting_detection_proc=

(from ruby core)
---
    Readline.quoting_detection_proc = proc

---

Specifies a Proc object `proc` to determine if a character in the user's input
is escaped. It should take the user's input and the index of the character in
question as input, and return a boolean (true if the specified character is
escaped).

Readline will only call this proc with characters specified in
`completer_quote_characters`, to discover if they indicate the end of a quoted
argument, or characters specified in `completer_word_break_characters`, to
discover if they indicate a break between arguments.

If `completer_quote_characters` is not set, or if the user input doesn't
contain one of the `completer_quote_characters` or a ++ character, Readline
will not attempt to use this proc at all.

Raises ArgumentError if `proc` does not respond to the call method.


# Readline::readline

(from ruby core)
---
    Readline.readline(prompt = "", add_hist = false) -> string or nil

---

Shows the `prompt` and reads the inputted line with line editing. The inputted
line is added to the history if `add_hist` is true.

Returns nil when the inputted line is empty and user inputs EOF (Presses ^D on
UNIX).

Raises IOError exception if one of below conditions are satisfied.
1.  stdin was closed.
2.  stdout was closed.


This method supports thread. Switches the thread context when waits inputting
line.

Supports line edit when inputs line. Provides VI and Emacs editing mode.
Default is Emacs editing mode.

NOTE: Terminates ruby interpreter and does not return the terminal status
after user pressed '^C' when wait inputting line. Give 3 examples that avoid
it.

*   Catches the Interrupt exception by pressed ^C after returns terminal
    status:

        require "readline"

        stty_save = `stty -g`.chomp
        begin
          while buf = Readline.readline
              p buf
              end
            rescue Interrupt
              system("stty", stty_save)
              exit
            end
          end
        end

*   Catches the INT signal by pressed ^C after returns terminal status:

        require "readline"

        stty_save = `stty -g`.chomp
        trap("INT") { system "stty", stty_save; exit }

        while buf = Readline.readline
          p buf
        end

*   Ignores pressing ^C:

        require "readline"

        trap("INT", "SIG_IGN")

        while buf = Readline.readline
          p buf
        end


Can make as follows with Readline::HISTORY constant. It does not record to the
history if the inputted line is empty or the same it as last one.

    require "readline"

    while buf = Readline.readline("> ", true)
      # p Readline::HISTORY.to_a
      Readline::HISTORY.pop if /^\s*$/ =~ buf

      begin
        if Readline::HISTORY[Readline::HISTORY.length-2] == buf
          Readline::HISTORY.pop
        end
      rescue IndexError
      end

      # p Readline::HISTORY.to_a
      print "-> ", buf, "\n"
    end


# Readline::redisplay

(from ruby core)
---
    Readline.redisplay -> self

---

Change what's displayed on the screen to reflect the current contents.

See GNU Readline's rl_redisplay function.

Raises NotImplementedError if the using readline library does not support.


# Readline::refresh_line

(from ruby core)
---
    Readline.refresh_line -> nil

---

Clear the current input line.


# Readline::set_screen_size

(from ruby core)
---
    Readline.set_screen_size(rows, columns) -> self

---

Set terminal size to `rows` and `columns`.

See GNU Readline's rl_set_screen_size function.

Raises NotImplementedError if the using readline library does not support.


# Readline::special_prefixes

(from ruby core)
---
    Readline.special_prefixes -> string

---

Gets the list of characters that are word break characters, but should be left
in text when it is passed to the completion function.

See GNU Readline's rl_special_prefixes variable.

Raises NotImplementedError if the using readline library does not support.


# Readline::special_prefixes=

(from ruby core)
---
    Readline.special_prefixes = string

---

Sets the list of characters that are word break characters, but should be left
in text when it is passed to the completion function. Programs can use this to
help determine what kind of completing to do. For instance, Bash sets this
variable to "$@" so that it can complete shell variables and hostnames.

See GNU Readline's rl_special_prefixes variable.

Raises NotImplementedError if the using readline library does not support.


# Readline::vi_editing_mode

(from ruby core)
---
    Readline.vi_editing_mode -> nil

---

Specifies VI editing mode. See the manual of GNU Readline for details of VI
editing mode.

Raises NotImplementedError if the using readline library does not support.


# Readline::vi_editing_mode?

(from ruby core)
---
    Readline.vi_editing_mode? -> bool

---

Returns true if vi mode is active. Returns false if not.

Raises NotImplementedError if the using readline library does not support.


