# PrettyPrint < Object

(from ruby core)
---
This class implements a pretty printing algorithm. It finds line breaks and
nice indentations for grouped structure.

By default, the class assumes that primitive elements are strings and each
byte in the strings have single column in width. But it can be used for other
situations by giving suitable arguments for some methods:
*   newline object and space generation block for PrettyPrint.new
*   optional width argument for PrettyPrint#text
*   PrettyPrint#breakable


There are several candidate uses:
*   text formatting using proportional fonts
*   multibyte characters which has columns different to number of bytes
*   non-string formatting


## Bugs
*   Box based formatting?
*   Other (better) model/algorithm?


Report any bugs at http://bugs.ruby-lang.org

## References
Christian Lindig, Strictly Pretty, March 2000,
http://www.st.cs.uni-sb.de/~lindig/papers/#pretty

Philip Wadler, A prettier printer, March 1998,
http://homepages.inf.ed.ac.uk/wadler/topics/language-design.html#prettier

## Author
Tanaka Akira <akr@fsij.org>
---
# Class methods:

    format
    new
    singleline_format

# Instance methods:

    break_outmost_groups
    breakable
    current_group
    fill_breakable
    flush
    genspace
    group
    group_queue
    group_sub
    indent
    maxwidth
    nest
    newline
    output
    text

# Attributes:

    attr_reader genspace
    attr_reader group_queue
    attr_reader indent
    attr_reader maxwidth
    attr_reader newline
    attr_reader output

# PrettyPrint::format

(from ruby core)
---
    format(output=''.dup, maxwidth=79, newline="\n", genspace=lambda {|n| ' ' * n}) { |q| ... }

---

This is a convenience method which is same as follows:

    begin
      q = PrettyPrint.new(output, maxwidth, newline, &genspace)
      ...
      q.flush
      output
    end


# PrettyPrint::new

(from ruby core)
---
    new(output=''.dup, maxwidth=79, newline="\n", &genspace)

---

Creates a buffer for pretty printing.

`output` is an output target. If it is not specified, '' is assumed. It should
have a << method which accepts the first argument `obj` of PrettyPrint#text,
the first argument `sep` of PrettyPrint#breakable, the first argument
`newline` of PrettyPrint.new, and the result of a given block for
PrettyPrint.new.

`maxwidth` specifies maximum line length. If it is not specified, 79 is
assumed. However actual outputs may overflow `maxwidth` if long non-breakable
texts are provided.

`newline` is used for line breaks. "n" is used if it is not specified.

The block is used to generate spaces. {|width| ' ' * width} is used if it is
not given.


# PrettyPrint::singleline_format

(from ruby core)
---
    singleline_format(output=''.dup, maxwidth=nil, newline=nil, genspace=nil) { |q| ... }

---

This is similar to PrettyPrint::format but the result has no breaks.

`maxwidth`, `newline` and `genspace` are ignored.

The invocation of `breakable` in the block doesn't break a line and is treated
as just an invocation of `text`.


# PrettyPrint#break_outmost_groups

(from ruby core)
---
    break_outmost_groups()

---

Breaks the buffer into lines that are shorter than #maxwidth


# PrettyPrint#breakable

(from ruby core)
---
    breakable(sep=' ', width=sep.length)

---

This says "you can break a line here if necessary", and a `width`-column text
`sep` is inserted if a line is not broken at the point.

If `sep` is not specified, " " is used.

If `width` is not specified, `sep.length` is used. You will have to specify
this when `sep` is a multibyte character, for example.


# PrettyPrint#current_group

(from ruby core)
---
    current_group()

---

Returns the group most recently added to the stack.

Contrived example:
    out = ""
    => ""
    q = PrettyPrint.new(out)
    => #<PrettyPrint:0x82f85c0 @output="", @maxwidth=79, @newline="\n", @genspace=#<Proc:0x82f8368@/home/vbatts/.rvm/rubies/ruby-head/lib/ruby/2.0.0/prettyprint.rb:82 (lambda)>, @output_width=0, @buffer_width=0, @buffer=[], @group_stack=[#<PrettyPrint::Group:0x82f8138 @depth=0, @breakables=[], @break=false>], @group_queue=#<PrettyPrint::GroupQueue:0x82fb7c0 @queue=[[#<PrettyPrint::Group:0x82f8138 @depth=0, @breakables=[], @break=false>]]>, @indent=0>
    q.group {
      q.text q.current_group.inspect
      q.text q.newline
      q.group(q.current_group.depth + 1) {
        q.text q.current_group.inspect
        q.text q.newline
        q.group(q.current_group.depth + 1) {
          q.text q.current_group.inspect
          q.text q.newline
          q.group(q.current_group.depth + 1) {
            q.text q.current_group.inspect
            q.text q.newline
          }
        }
      }
    }
    => 284
     puts out
    #<PrettyPrint::Group:0x8354758 @depth=1, @breakables=[], @break=false>
    #<PrettyPrint::Group:0x8354550 @depth=2, @breakables=[], @break=false>
    #<PrettyPrint::Group:0x83541cc @depth=3, @breakables=[], @break=false>
    #<PrettyPrint::Group:0x8347e54 @depth=4, @breakables=[], @break=false>


# PrettyPrint#fill_breakable

(from ruby core)
---
    fill_breakable(sep=' ', width=sep.length)

---

This is similar to #breakable except the decision to break or not is
determined individually.

Two #fill_breakable under a group may cause 4 results: (break,break),
(break,non-break), (non-break,break), (non-break,non-break). This is different
to #breakable because two #breakable under a group may cause 2 results:
(break,break), (non-break,non-break).

The text `sep` is inserted if a line is not broken at this point.

If `sep` is not specified, " " is used.

If `width` is not specified, `sep.length` is used. You will have to specify
this when `sep` is a multibyte character, for example.


# PrettyPrint#flush

(from ruby core)
---
    flush()

---

outputs buffered data.


# PrettyPrint#group

(from ruby core)
---
    group(indent=0, open_obj='', close_obj='', open_width=open_obj.length, close_width=close_obj.length) { || ... }

---

Groups line break hints added in the block. The line break hints are all to be
used or not.

If `indent` is specified, the method call is regarded as nested by
nest(indent) { ... }.

If `open_obj` is specified, `text open_obj, open_width` is called before
grouping. If `close_obj` is specified, `text close_obj, close_width` is called
after grouping.


# PrettyPrint#group_sub

(from ruby core)
---
    group_sub() { || ... }

---

Takes a block and queues a new group that is indented 1 level further.


# PrettyPrint#nest

(from ruby core)
---
    nest(indent) { || ... }

---

Increases left margin after newline with `indent` for line breaks added in the
block.


# PrettyPrint#text

(from ruby core)
---
    text(obj, width=obj.length)

---

This adds `obj` as a text of `width` columns in width.

If `width` is not specified, obj.length is used.


