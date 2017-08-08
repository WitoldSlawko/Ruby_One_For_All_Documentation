# PP < PrettyPrint

---
# Includes:
PPMethods (from ruby core)

(from ruby core)
---
A pretty-printer for Ruby objects.

All examples assume you have loaded the PP class with:
    require 'pp'

## What PP Does

Standard output by #p returns this:
    #<PP:0x81fedf0 @genspace=#<Proc:0x81feda0>, @group_queue=#<PrettyPrint::GroupQueue:0x81fed3c @queue=[[#<PrettyPrint::Group:0x81fed78 @breakables=[], @depth=0, @break=false>], []]>, @buffer=[], @newline="\n", @group_stack=[#<PrettyPrint::Group:0x81fed78 @breakables=[], @depth=0, @break=false>], @buffer_width=0, @indent=0, @maxwidth=79, @output_width=2, @output=#<IO:0x8114ee4>>

Pretty-printed output returns this:
    #<PP:0x81fedf0
     @buffer=[],
     @buffer_width=0,
     @genspace=#<Proc:0x81feda0>,
     @group_queue=
      #<PrettyPrint::GroupQueue:0x81fed3c
       @queue=
        [[#<PrettyPrint::Group:0x81fed78 @break=false, @breakables=[], @depth=0>],
         []]>,
     @group_stack=
      [#<PrettyPrint::Group:0x81fed78 @break=false, @breakables=[], @depth=0>],
     @indent=0,
     @maxwidth=79,
     @newline="\n",
     @output=#<IO:0x8114ee4>,
     @output_width=2>

## Usage

    pp(obj)             #=> obj
    pp obj              #=> obj
    pp(obj1, obj2, ...) #=> [obj1, obj2, ...]
    pp()                #=> nil

Output `obj(s)` to `$>` in pretty printed format.

It returns `obj(s)`.

## Output Customization

To define a customized pretty printing function for your classes, redefine
method `#pretty_print(pp)` in the class.

`#pretty_print` takes the `pp` argument, which is an instance of the PP class.
The method uses #text, #breakable, #nest, #group and #pp to print the object.

## Pretty-Print JSON

To pretty-print JSON refer to JSON#pretty_generate.

## Author
Tanaka Akira <akr@fsij.org>
---
# Class methods:

    pp
    sharing_detection
    singleline_pp

# Attributes:

    attr_accessor sharing_detection

# PP::pp

(from ruby core)
---
    pp(obj, out=$>, width=79)

---

Outputs `obj` to `out` in pretty printed format of `width` columns in width.

If `out` is omitted, `$>` is assumed. If `width` is omitted, 79 is assumed.

PP.pp returns `out`.


# PP::singleline_pp

(from ruby core)
---
    singleline_pp(obj, out=$>)

---

Outputs `obj` to `out` like PP.pp but with no indent and newline.

PP.singleline_pp returns `out`.


