# XMP < Object

(from ruby core)
---
An example printer for irb.

It's much like the standard library PrettyPrint, that shows the value of each
expression as it runs.

In order to use this library, you must first require it:

    require 'irb/xmp'

Now, you can take advantage of the Object#xmp convenience method.

    xmp <<END
      foo = "bar"
      baz = 42
    END
    #=> foo = "bar"
      #==>"bar"
    #=> baz = 42
      #==>42

You can also create an XMP object, with an optional binding to print
expressions in the given binding:

    ctx = binding
    x = XMP.new ctx
    x.puts
    #=> today = "a good day"
      #==>"a good day"
    ctx.eval 'today # is what?'
    #=> "a good day"
---
# Class methods:

    new

# Instance methods:

    puts

# XMP::new

(from ruby core)
---
    new(bind = nil)

---

Creates a new XMP object.

The top-level binding or, optional `bind` parameter will be used when creating
the workspace. See WorkSpace.new for more information.

This uses the `:XMP` prompt mode, see IRB@Customizing+the+IRB+Prompt for full
detail.


# XMP#puts

(from ruby core)
---
    puts(exps)

---

Evaluates the given `exps`, for example:

    require 'irb/xmp'
    x = XMP.new

    x.puts '{:a => 1, :b => 2, :c => 3}'
    #=> {:a => 1, :b => 2, :c => 3}
      # ==>{:a=>1, :b=>2, :c=>3}
    x.puts 'foo = "bar"'
    # => foo = "bar"
      # ==>"bar"


