# ERB < Object

(from ruby core)
---
# Class methods:

    new
    version

# Instance methods:

    def_class
    def_method
    def_module
    encoding
    filename
    lineno
    location=
    make_compiler
    new_toplevel
    result
    run
    set_eoutvar
    src

# Attributes:

    attr_accessor filename
    attr_accessor lineno
    attr_reader encoding
    attr_reader src

# ERB::new

(from ruby core)
---
    new(str, safe_level=nil, trim_mode=nil, eoutvar='_erbout')

---

Constructs a new ERB object with the template specified in *str*.

An ERB object works by building a chunk of Ruby code that will output the
completed template when run. If *safe_level* is set to a non-nil value, ERB
code will be run in a separate thread with **$SAFE** set to the provided
level.

If *trim_mode* is passed a String containing one or more of the following
modifiers, ERB will adjust its code generation as listed:

    %  enables Ruby code processing for lines beginning with %
    <> omit newline for lines starting with <% and ending in %>
    >  omit newline for lines ending in %>
    -  omit blank lines ending in -%>

*eoutvar* can be used to set the name of the variable ERB will build up its
output in.  This is useful when you need to run multiple ERB templates through
the same binding and/or when you want to control where output ends up.  Pass
the name of the variable to be used inside a String.

### Example

    require "erb"

    # build data class
    class Listings
      PRODUCT = { :name => "Chicken Fried Steak",
                  :desc => "A well messages pattie, breaded and fried.",
                  :cost => 9.95 }

      attr_reader :product, :price

      def initialize( product = "", price = "" )
        @product = product
        @price = price
      end

      def build
        b = binding
        # create and run templates, filling member data variables
        ERB.new(<<-'END_PRODUCT'.gsub(/^\s+/, ""), 0, "", "@product").result b
          <%= PRODUCT[:name] %>
          <%= PRODUCT[:desc] %>
        END_PRODUCT
        ERB.new(<<-'END_PRICE'.gsub(/^\s+/, ""), 0, "", "@price").result b
          <%= PRODUCT[:name] %> -- <%= PRODUCT[:cost] %>
          <%= PRODUCT[:desc] %>
        END_PRICE
      end
    end

    # setup template data
    listings = Listings.new
    listings.build

    puts listings.product + "\n" + listings.price

*Generates*

    Chicken Fried Steak
    A well messages pattie, breaded and fried.

    Chicken Fried Steak -- 9.95
    A well messages pattie, breaded and fried.


# ERB::version

(from ruby core)
---
    version()

---

Returns revision information for the erb.rb module.


# ERB#def_class

(from ruby core)
---
    def_class(superklass=Object, methodname='result')

---

Define unnamed class which has *methodname* as instance method, and return it.

example:
    class MyClass_
      def initialize(arg1, arg2)
        @arg1 = arg1;  @arg2 = arg2
      end
    end
    filename = 'example.rhtml'  # @arg1 and @arg2 are used in example.rhtml
    erb = ERB.new(File.read(filename))
    erb.filename = filename
    MyClass = erb.def_class(MyClass_, 'render()')
    print MyClass.new('foo', 123).render()


# ERB#def_method

(from ruby core)
---
    def_method(mod, methodname, fname='(ERB)')

---

Define *methodname* as instance method of *mod* from compiled Ruby source.

example:
    filename = 'example.rhtml'   # 'arg1' and 'arg2' are used in example.rhtml
    erb = ERB.new(File.read(filename))
    erb.def_method(MyClass, 'render(arg1, arg2)', filename)
    print MyClass.new.render('foo', 123)


# ERB#def_module

(from ruby core)
---
    def_module(methodname='erb')

---

Create unnamed module, define *methodname* as instance method of it, and
return it.

example:
    filename = 'example.rhtml'   # 'arg1' and 'arg2' are used in example.rhtml
    erb = ERB.new(File.read(filename))
    erb.filename = filename
    MyModule = erb.def_module('render(arg1, arg2)')
    class MyClass
      include MyModule
    end


# ERB#location=

(from ruby core)
---
    location=((filename, lineno))

---


# ERB#make_compiler

(from ruby core)
---
    make_compiler(trim_mode)

---

Creates a new compiler for ERB.  See ERB::Compiler.new for details


# ERB#result

(from ruby core)
---
    result(b=new_toplevel)

---

Executes the generated ERB code to produce a completed template, returning the
results of that code.  (See ERB::new for details on how this process can be
affected by *safe_level*.)

*b* accepts a Binding object which is used to set the context of code
evaluation.


# ERB#run

(from ruby core)
---
    run(b=new_toplevel)

---

Generate results and print them. (see ERB#result)


# ERB#set_eoutvar

(from ruby core)
---
    set_eoutvar(compiler, eoutvar = '_erbout')

---

Can be used to set *eoutvar* as described in ERB::new.  It's probably easier
to just use the constructor though, since calling this method requires the
setup of an ERB *compiler* object.


# ERB#new_toplevel

(from ruby core)
---
    new_toplevel()

---

Returns a new binding each time **near** TOPLEVEL_BINDING for runs that do not
specify a binding.


---
Also found in:
    gem activesupport-5.1.2

