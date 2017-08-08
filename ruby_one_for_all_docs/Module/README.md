# Module < Object

---
# Includes:
Concerning (from gem activesupport-5.1.2)

(from ruby core)
---


A `Module` is a collection of methods and constants. The methods in a module
may be instance methods or module methods. Instance methods appear as methods
in a class when the module is included, module methods do not. Conversely,
module methods may be called without creating an encapsulating object, while
instance methods may not. (See `Module#module_function`.)

In the descriptions that follow, the parameter *sym* refers to a symbol, which
is either a quoted string or a `Symbol` (such as `:name`).

    module Mod
      include Math
      CONST = 1
      def meth
        #  ...
      end
    end
    Mod.class              #=> Module
    Mod.constants          #=> [:CONST, :PI, :E]
    Mod.instance_methods   #=> [:meth]
---
# Class methods:

    constants
    nesting
    new
    used_modules

# Instance methods:

    <
    <=
    <=>
    ==
    ===
    >
    >=
    alias_method
    ancestors
    append_features
    attr
    attr_accessor
    attr_reader
    attr_writer
    autoload
    autoload?
    class_eval
    class_exec
    class_variable_defined?
    class_variable_get
    class_variable_set
    class_variables
    const_defined?
    const_get
    const_missing
    const_set
    constants
    define_method
    deprecate_constant
    extend_object
    extended
    freeze
    include
    include?
    included
    included_modules
    inspect
    instance_method
    instance_methods
    method_added
    method_defined?
    method_removed
    method_undefined
    module_eval
    module_exec
    module_function
    name
    prepend
    prepend_features
    prepended
    private
    private_class_method
    private_constant
    private_instance_methods
    private_method_defined?
    protected
    protected_instance_methods
    protected_method_defined?
    psych_yaml_as
    public
    public_class_method
    public_constant
    public_instance_method
    public_instance_methods
    public_method_defined?
    refine
    remove_class_variable
    remove_const
    remove_method
    singleton_class?
    to_s
    undef_method
    using
    yaml_as

# Module::constants

(from ruby core)
---
    Module.constants   -> array
    Module.constants(inherited)   -> array

---

In the first form, returns an array of the names of all constants accessible
from the point of call. This list includes the names of all modules and
classes defined in the global scope.

    Module.constants.first(4)
       # => [:ARGF, :ARGV, :ArgumentError, :Array]

    Module.constants.include?(:SEEK_SET)   # => false

    class IO
      Module.constants.include?(:SEEK_SET) # => true
    end

The second form calls the instance method `constants`.


# Module::nesting

(from ruby core)
---
    Module.nesting    -> array

---

Returns the list of `Modules` nested at the point of call.

    module M1
      module M2
        $a = Module.nesting
      end
    end
    $a           #=> [M1::M2, M1]
    $a[0].name   #=> "M1::M2"


# Module::new

(from ruby core)
---
    Module.new                  -> mod
    Module.new {|mod| block }   -> mod

---

Creates a new anonymous module. If a block is given, it is passed the module
object, and the block is evaluated in the context of this module like
`module_eval`.

    fred = Module.new do
      def meth1
        "hello"
      end
      def meth2
        "bye"
      end
    end
    a = "my string"
    a.extend(fred)   #=> "my string"
    a.meth1          #=> "hello"
    a.meth2          #=> "bye"

Assign the module to a constant (name starting uppercase) if you want to treat
it like a regular module.


# Module::used_modules

(from ruby core)
---
    used_modules -> array

---

Returns an array of all modules used in the current scope. The ordering of
modules in the resulting array is not defined.

    module A
      refine Object do
      end
    end

    module B
      refine Object do
      end
    end

    using A
    using B
    p Module.used_modules

*produces:*

    [B, A]


# Module#<

(from ruby core)
---
    mod < other   ->  true, false, or nil

---

Returns true if *mod* is a subclass of *other*. Returns `nil` if there's no
relationship between the two. (Think of the relationship in terms of the class
definition: "class A < B" implies "A < B".)


# Module#<=

(from ruby core)
---
    mod <= other   ->  true, false, or nil

---

Returns true if *mod* is a subclass of *other* or is the same as *other*.
Returns `nil` if there's no relationship between the two. (Think of the
relationship in terms of the class definition: "class A < B" implies "A < B".)


# Module#<=>

(from ruby core)
---
    module <=> other_module   -> -1, 0, +1, or nil

---

Comparison---Returns -1, 0, +1 or nil depending on whether `module` includes
`other_module`, they are the same, or if `module` is included by
`other_module`.

Returns `nil` if `module` has no relationship with `other_module`, if
`other_module` is not a module, or if the two values are incomparable.


# Module#==

(from ruby core)
---
    obj == other        -> true or false
    obj.equal?(other)   -> true or false
    obj.eql?(other)     -> true or false

---

Equality --- At the `Object` level, `==` returns `true` only if `obj` and
`other` are the same object. Typically, this method is overridden in
descendant classes to provide class-specific meaning.

Unlike `==`, the `equal?` method should never be overridden by subclasses as
it is used to determine object identity (that is, `a.equal?(b)` if and only if
`a` is the same object as `b`):

    obj = "a"
    other = obj.dup

    obj == other      #=> true
    obj.equal? other  #=> false
    obj.equal? obj    #=> true

The `eql?` method returns `true` if `obj` and `other` refer to the same hash
key.  This is used by Hash to test members for equality.  For objects of class
`Object`, `eql?` is synonymous with `==`.  Subclasses normally continue this
tradition by aliasing `eql?` to their overridden `==` method, but there are
exceptions.  `Numeric` types, for example, perform type conversion across
`==`, but not across `eql?`, so:

    1 == 1.0     #=> true
    1.eql? 1.0   #=> false


# Module#===

(from ruby core)
---
    mod === obj    -> true or false

---

Case Equality---Returns `true` if *obj* is an instance of *mod* or an instance
of one of *mod*'s descendants. Of limited use for modules, but can be used in
`case` statements to classify objects by class.


# Module#>

(from ruby core)
---
    mod > other   ->  true, false, or nil

---

Returns true if *mod* is an ancestor of *other*. Returns `nil` if there's no
relationship between the two. (Think of the relationship in terms of the class
definition: "class A < B" implies "B > A".)


# Module#>=

(from ruby core)
---
    mod >= other   ->  true, false, or nil

---

Returns true if *mod* is an ancestor of *other*, or the two modules are the
same. Returns `nil` if there's no relationship between the two. (Think of the
relationship in terms of the class definition: "class A < B" implies "B > A".)


# Module#ancestors

(from ruby core)
---
    mod.ancestors -> array

---

Returns a list of modules included/prepended in *mod* (including *mod*
itself).

    module Mod
      include Math
      include Comparable
      prepend Enumerable
    end

    Mod.ancestors        #=> [Enumerable, Mod, Comparable, Math]
    Math.ancestors       #=> [Math]
    Enumerable.ancestors #=> [Enumerable]


# Module#autoload

(from ruby core)
---
    mod.autoload(module, filename)   -> nil

---

Registers *filename* to be loaded (using `Kernel::require`) the first time
that *module* (which may be a `String` or a symbol) is accessed in the
namespace of *mod*.

    module A
    end
    A.autoload(:B, "b")
    A::B.doit            # autoloads "b"


# Module#autoload?

(from ruby core)
---
    mod.autoload?(name)   -> String or nil

---

Returns *filename* to be loaded if *name* is registered as `autoload` in the
namespace of *mod*.

    module A
    end
    A.autoload(:B, "b")
    A.autoload?(:B)            #=> "b"


# Module#class_eval

(from ruby core)
---
    mod.class_eval(string [, filename [, lineno]])  -> obj
    mod.class_eval {|mod| block }                   -> obj

---

Evaluates the string or block in the context of *mod*, except that when a
block is given, constant/class variable lookup is not affected. This can be
used to add methods to a class. `module_eval` returns the result of evaluating
its argument. The optional *filename* and *lineno* parameters set the text for
error messages.

    class Thing
    end
    a = %q{def hello() "Hello there!" end}
    Thing.module_eval(a)
    puts Thing.new.hello()
    Thing.module_eval("invalid code", "dummy", 123)

*produces:*

    Hello there!
    dummy:123:in `module_eval': undefined local variable
        or method `code' for Thing:Class


# Module#class_exec

(from ruby core)
---
    mod.class_exec(arg...) {|var...| block }        -> obj

---

Evaluates the given block in the context of the class/module. The method
defined in the block will belong to the receiver. Any arguments passed to the
method will be passed to the block. This can be used if the block needs to
access instance variables.

    class Thing
    end
    Thing.class_exec{
      def hello() "Hello there!" end
    }
    puts Thing.new.hello()

*produces:*

    Hello there!


# Module#class_variable_defined?

(from ruby core)
---
    obj.class_variable_defined?(symbol)    -> true or false
    obj.class_variable_defined?(string)    -> true or false

---

Returns `true` if the given class variable is defined in *obj*. String
arguments are converted to symbols.

    class Fred
      @@foo = 99
    end
    Fred.class_variable_defined?(:@@foo)    #=> true
    Fred.class_variable_defined?(:@@bar)    #=> false


# Module#class_variable_get

(from ruby core)
---
    mod.class_variable_get(symbol)    -> obj
    mod.class_variable_get(string)    -> obj

---

Returns the value of the given class variable (or throws a `NameError`
exception). The `@@` part of the variable name should be included for regular
class variables. String arguments are converted to symbols.

    class Fred
      @@foo = 99
    end
    Fred.class_variable_get(:@@foo)     #=> 99


# Module#class_variable_set

(from ruby core)
---
    obj.class_variable_set(symbol, obj)    -> obj
    obj.class_variable_set(string, obj)    -> obj

---

Sets the class variable named by *symbol* to the given object. If the class
variable name is passed as a string, that string is converted to a symbol.

    class Fred
      @@foo = 99
      def foo
        @@foo
      end
    end
    Fred.class_variable_set(:@@foo, 101)     #=> 101
    Fred.new.foo                             #=> 101


# Module#class_variables

(from ruby core)
---
    mod.class_variables(inherit=true)    -> array

---

Returns an array of the names of class variables in *mod*. This includes the
names of class variables in any included modules, unless the *inherit*
parameter is set to `false`.

    class One
      @@var1 = 1
    end
    class Two < One
      @@var2 = 2
    end
    One.class_variables          #=> [:@@var1]
    Two.class_variables          #=> [:@@var2, :@@var1]
    Two.class_variables(false)   #=> [:@@var2]


# Module#const_defined?

(from ruby core)
---
    mod.const_defined?(sym, inherit=true)   -> true or false
    mod.const_defined?(str, inherit=true)   -> true or false

---

Says whether *mod* or its ancestors have a constant with the given name:

    Float.const_defined?(:EPSILON)      #=> true, found in Float itself
    Float.const_defined?("String")      #=> true, found in Object (ancestor)
    BasicObject.const_defined?(:Hash)   #=> false

If *mod* is a `Module`, additionally `Object` and its ancestors are checked:

    Math.const_defined?(:String)   #=> true, found in Object

In each of the checked classes or modules, if the constant is not present but
there is an autoload for it, `true` is returned directly without autoloading:

    module Admin
      autoload :User, 'admin/user'
    end
    Admin.const_defined?(:User)   #=> true

If the constant is not found the callback `const_missing` is **not** called
and the method returns `false`.

If `inherit` is false, the lookup only checks the constants in the receiver:

    IO.const_defined?(:SYNC)          #=> true, found in File::Constants (ancestor)
    IO.const_defined?(:SYNC, false)   #=> false, not found in IO itself

In this case, the same logic for autoloading applies.

If the argument is not a valid constant name a `NameError` is raised with the
message "wrong constant name *name*":

    Hash.const_defined? 'foobar'   #=> NameError: wrong constant name foobar


# Module#const_get

(from ruby core)
---
    mod.const_get(sym, inherit=true)    -> obj
    mod.const_get(str, inherit=true)    -> obj

---

Checks for a constant with the given name in *mod*. If `inherit` is set, the
lookup will also search the ancestors (and `Object` if *mod* is a `Module`).

The value of the constant is returned if a definition is found, otherwise a
`NameError` is raised.

    Math.const_get(:PI)   #=> 3.14159265358979

This method will recursively look up constant names if a namespaced class name
is provided.  For example:

    module Foo; class Bar; end end
    Object.const_get 'Foo::Bar'

The `inherit` flag is respected on each lookup.  For example:

    module Foo
      class Bar
        VAL = 10
      end

      class Baz < Bar; end
    end

    Object.const_get 'Foo::Baz::VAL'         # => 10
    Object.const_get 'Foo::Baz::VAL', false  # => NameError

If the argument is not a valid constant name a `NameError` will be raised with
a warning "wrong constant name".

    Object.const_get 'foobar' #=> NameError: wrong constant name foobar


# Module#const_missing

(from ruby core)
---
    mod.const_missing(sym)    -> obj

---

Invoked when a reference is made to an undefined constant in *mod*. It is
passed a symbol for the undefined constant, and returns a value to be used for
that constant. The following code is an example of the same:

    def Foo.const_missing(name)
      name # return the constant name as Symbol
    end

    Foo::UNDEFINED_CONST    #=> :UNDEFINED_CONST: symbol returned

In the next example when a reference is made to an undefined constant, it
attempts to load a file whose name is the lowercase version of the constant
(thus class `Fred` is assumed to be in file `fred.rb`).  If found, it returns
the loaded class. It therefore implements an autoload feature similar to
Kernel#autoload and Module#autoload.

    def Object.const_missing(name)
      @looked_for ||= {}
      str_name = name.to_s
      raise "Class not found: #{name}" if @looked_for[str_name]
      @looked_for[str_name] = 1
      file = str_name.downcase
      require file
      klass = const_get(name)
      return klass if klass
      raise "Class not found: #{name}"
    end


# Module#const_set

(from ruby core)
---
    mod.const_set(sym, obj)    -> obj
    mod.const_set(str, obj)    -> obj

---

Sets the named constant to the given object, returning that object. Creates a
new constant if no constant with the given name previously existed.

    Math.const_set("HIGH_SCHOOL_PI", 22.0/7.0)   #=> 3.14285714285714
    Math::HIGH_SCHOOL_PI - Math::PI              #=> 0.00126448926734968

If `sym` or `str` is not a valid constant name a `NameError` will be raised
with a warning "wrong constant name".

    Object.const_set('foobar', 42) #=> NameError: wrong constant name foobar


# Module#constants

(from ruby core)
---
    mod.constants(inherit=true)    -> array

---

Returns an array of the names of the constants accessible in *mod*. This
includes the names of constants in any included modules (example at start of
section), unless the *inherit* parameter is set to `false`.

The implementation makes no guarantees about the order in which the constants
are yielded.

    IO.constants.include?(:SYNC)        #=> true
    IO.constants(false).include?(:SYNC) #=> false

Also see `Module::const_defined?`.


# Module#deprecate_constant

(from ruby core)
---
    mod.deprecate_constant(symbol, ...)    => mod

---

Makes a list of existing constants deprecated.


# Module#freeze

(from ruby core)
---
    mod.freeze       -> mod

---

Prevents further modifications to *mod*.

This method returns self.


# Module#include

(from ruby core)
---
    include(module, ...)    -> self

---

Invokes `Module.append_features` on each parameter in reverse order.


# Module#include?

(from ruby core)
---
    mod.include?(module)    -> true or false

---

Returns `true` if *module* is included in *mod* or one of *mod*'s ancestors.

    module A
    end
    class B
      include A
    end
    class C < B
    end
    B.include?(A)   #=> true
    C.include?(A)   #=> true
    A.include?(A)   #=> false


# Module#included_modules

(from ruby core)
---
    mod.included_modules -> array

---

Returns the list of modules included in *mod*.

    module Mixin
    end

    module Outer
      include Mixin
    end

    Mixin.included_modules   #=> []
    Outer.included_modules   #=> [Mixin]


# Module#inspect

(from ruby core)
---
    inspect()

---


# Module#instance_method

(from ruby core)
---
    mod.instance_method(symbol)   -> unbound_method

---

Returns an `UnboundMethod` representing the given instance method in *mod*.

    class Interpreter
      def do_a() print "there, "; end
      def do_d() print "Hello ";  end
      def do_e() print "!\n";     end
      def do_v() print "Dave";    end
      Dispatcher = {
        "a" => instance_method(:do_a),
        "d" => instance_method(:do_d),
        "e" => instance_method(:do_e),
        "v" => instance_method(:do_v)
      }
      def interpret(string)
        string.each_char {|b| Dispatcher[b].bind(self).call }
      end
    end

    interpreter = Interpreter.new
    interpreter.interpret('dave')

*produces:*

    Hello there, Dave!


# Module#instance_methods

(from ruby core)
---
    mod.instance_methods(include_super=true)   -> array

---

Returns an array containing the names of the public and protected instance
methods in the receiver. For a module, these are the public and protected
methods; for a class, they are the instance (not singleton) methods. If the
optional parameter is `false`, the methods of any ancestors are not included.

    module A
      def method1()  end
    end
    class B
      include A
      def method2()  end
    end
    class C < B
      def method3()  end
    end

    A.instance_methods(false)                   #=> [:method1]
    B.instance_methods(false)                   #=> [:method2]
    B.instance_methods(true).include?(:method1) #=> true
    C.instance_methods(false)                   #=> [:method3]
    C.instance_methods.include?(:method2)       #=> true


# Module#method_defined?

(from ruby core)
---
    mod.method_defined?(symbol)    -> true or false
    mod.method_defined?(string)    -> true or false

---

Returns `true` if the named method is defined by *mod* (or its included
modules and, if *mod* is a class, its ancestors). Public and protected methods
are matched. String arguments are converted to symbols.

    module A
      def method1()  end
      def protected_method1()  end
      protected :protected_method1
    end
    class B
      def method2()  end
      def private_method2()  end
      private :private_method2
    end
    class C < B
      include A
      def method3()  end
    end

    A.method_defined? :method1              #=> true
    C.method_defined? "method1"             #=> true
    C.method_defined? "method2"             #=> true
    C.method_defined? "method3"             #=> true
    C.method_defined? "protected_method1"   #=> true
    C.method_defined? "method4"             #=> false
    C.method_defined? "private_method2"     #=> false


# Module#module_eval

(from ruby core)
---
    mod.module_eval(string [, filename [, lineno]]) -> obj
    mod.module_eval {|mod| block }                  -> obj

---

Evaluates the string or block in the context of *mod*, except that when a
block is given, constant/class variable lookup is not affected. This can be
used to add methods to a class. `module_eval` returns the result of evaluating
its argument. The optional *filename* and *lineno* parameters set the text for
error messages.

    class Thing
    end
    a = %q{def hello() "Hello there!" end}
    Thing.module_eval(a)
    puts Thing.new.hello()
    Thing.module_eval("invalid code", "dummy", 123)

*produces:*

    Hello there!
    dummy:123:in `module_eval': undefined local variable
        or method `code' for Thing:Class


# Module#module_exec

(from ruby core)
---
    mod.module_exec(arg...) {|var...| block }       -> obj

---

Evaluates the given block in the context of the class/module. The method
defined in the block will belong to the receiver. Any arguments passed to the
method will be passed to the block. This can be used if the block needs to
access instance variables.

    class Thing
    end
    Thing.class_exec{
      def hello() "Hello there!" end
    }
    puts Thing.new.hello()

*produces:*

    Hello there!


# Module#name

(from ruby core)
---
    mod.name    -> string

---

Returns the name of the module *mod*.  Returns nil for anonymous modules.


# Module#prepend

(from ruby core)
---
    prepend(module, ...)    -> self

---

Invokes `Module.prepend_features` on each parameter in reverse order.


# Module#private_class_method

(from ruby core)
---
    mod.private_class_method(symbol, ...)   -> mod
    mod.private_class_method(string, ...)   -> mod

---

Makes existing class methods private. Often used to hide the default
constructor `new`.

String arguments are converted to symbols.

    class SimpleSingleton  # Not thread safe
      private_class_method :new
      def SimpleSingleton.create(*args, &block)
        @me = new(*args, &block) if ! @me
        @me
      end
    end


# Module#private_constant

(from ruby core)
---
    mod.private_constant(symbol, ...)    => mod

---

Makes a list of existing constants private.


# Module#private_instance_methods

(from ruby core)
---
    mod.private_instance_methods(include_super=true)    -> array

---

Returns a list of the private instance methods defined in *mod*. If the
optional parameter is `false`, the methods of any ancestors are not included.

    module Mod
      def method1()  end
      private :method1
      def method2()  end
    end
    Mod.instance_methods           #=> [:method2]
    Mod.private_instance_methods   #=> [:method1]


# Module#private_method_defined?

(from ruby core)
---
    mod.private_method_defined?(symbol)    -> true or false
    mod.private_method_defined?(string)    -> true or false

---

Returns `true` if the named private method is defined by _ mod_ (or its
included modules and, if *mod* is a class, its ancestors). String arguments
are converted to symbols.

    module A
      def method1()  end
    end
    class B
      private
      def method2()  end
    end
    class C < B
      include A
      def method3()  end
    end

    A.method_defined? :method1            #=> true
    C.private_method_defined? "method1"   #=> false
    C.private_method_defined? "method2"   #=> true
    C.method_defined? "method2"           #=> false


# Module#protected_instance_methods

(from ruby core)
---
    mod.protected_instance_methods(include_super=true)   -> array

---

Returns a list of the protected instance methods defined in *mod*. If the
optional parameter is `false`, the methods of any ancestors are not included.


# Module#protected_method_defined?

(from ruby core)
---
    mod.protected_method_defined?(symbol)   -> true or false
    mod.protected_method_defined?(string)   -> true or false

---

Returns `true` if the named protected method is defined by *mod* (or its
included modules and, if *mod* is a class, its ancestors). String arguments
are converted to symbols.

    module A
      def method1()  end
    end
    class B
      protected
      def method2()  end
    end
    class C < B
      include A
      def method3()  end
    end

    A.method_defined? :method1              #=> true
    C.protected_method_defined? "method1"   #=> false
    C.protected_method_defined? "method2"   #=> true
    C.method_defined? "method2"             #=> true


# Module#psych_yaml_as

(from ruby core)
---
    psych_yaml_as(url)

---


# Module#public_class_method

(from ruby core)
---
    mod.public_class_method(symbol, ...)    -> mod
    mod.public_class_method(string, ...)    -> mod

---

Makes a list of existing class methods public.

String arguments are converted to symbols.


# Module#public_constant

(from ruby core)
---
    mod.public_constant(symbol, ...)    => mod

---

Makes a list of existing constants public.


# Module#public_instance_method

(from ruby core)
---
    mod.public_instance_method(symbol)   -> unbound_method

---

Similar to *instance_method*, searches public method only.


# Module#public_instance_methods

(from ruby core)
---
    mod.public_instance_methods(include_super=true)   -> array

---

Returns a list of the public instance methods defined in *mod*. If the
optional parameter is `false`, the methods of any ancestors are not included.


# Module#public_method_defined?

(from ruby core)
---
    mod.public_method_defined?(symbol)   -> true or false
    mod.public_method_defined?(string)   -> true or false

---

Returns `true` if the named public method is defined by *mod* (or its included
modules and, if *mod* is a class, its ancestors). String arguments are
converted to symbols.

    module A
      def method1()  end
    end
    class B
      protected
      def method2()  end
    end
    class C < B
      include A
      def method3()  end
    end

    A.method_defined? :method1           #=> true
    C.public_method_defined? "method1"   #=> true
    C.public_method_defined? "method2"   #=> false
    C.method_defined? "method2"          #=> true


# Module#remove_class_variable

(from ruby core)
---
    remove_class_variable(sym)    -> obj

---

Removes the definition of the *sym*, returning that constant's value.

    class Dummy
      @@var = 99
      puts @@var
      remove_class_variable(:@@var)
      p(defined? @@var)
    end

*produces:*

    99
    nil


# Module#singleton_class?

(from ruby core)
---
    mod.singleton_class?    -> true or false

---

Returns `true` if *mod* is a singleton class or `false` if it is an ordinary
class or module.

    class C
    end
    C.singleton_class?                  #=> false
    C.singleton_class.singleton_class?  #=> true


# Module#to_s

(from ruby core)
---
    mod.to_s   -> string

---

Returns a string representing this module or class. For basic classes and
modules, this is the name. For singletons, we show information on the thing
we're attached to as well.


# Module#yaml_as

(from ruby core)
---
    yaml_as(url)

---


# Module#alias_method

(from ruby core)
---
    alias_method(new_name, old_name)   -> self

---

Makes *new_name* a new copy of the method *old_name*. This can be used to
retain access to methods that are overridden.

    module Mod
      alias_method :orig_exit, :exit
      def exit(code=0)
        puts "Exiting with code #{code}"
        orig_exit(code)
      end
    end
    include Mod
    exit(99)

*produces:*

    Exiting with code 99


# Module#append_features

(from ruby core)
---
    append_features(mod)   -> mod

---

When this module is included in another, Ruby calls `append_features` in this
module, passing it the receiving module in *mod*. Ruby's default
implementation is to add the constants, methods, and module variables of this
module to *mod* if this module has not already been added to *mod* or one of
its ancestors. See also `Module#include`.


(from gem builder-3.2.3)
---
    append_features(mod)

---


# Module#attr

(from ruby core)
---
    attr(*args)

---


# Module#attr_accessor

(from ruby core)
---
    attr_accessor(symbol, ...)    -> nil
    attr_accessor(string, ...)    -> nil

---

Defines a named attribute for this module, where the name is
*symbol.*`id2name`, creating an instance variable (`@name`) and a
corresponding access method to read it. Also creates a method called `name=`
to set the attribute. String arguments are converted to symbols.

    module Mod
      attr_accessor(:one, :two)
    end
    Mod.instance_methods.sort   #=> [:one, :one=, :two, :two=]


# Module#attr_reader

(from ruby core)
---
    attr_reader(symbol, ...)  -> nil
    attr(symbol, ...)         -> nil
    attr_reader(string, ...)  -> nil
    attr(string, ...)         -> nil

---

Creates instance variables and corresponding methods that return the value of
each instance variable. Equivalent to calling ```attr`*:name*'' on each name
in turn. String arguments are converted to symbols.


# Module#attr_writer

(from ruby core)
---
    attr_writer(symbol, ...)    -> nil
    attr_writer(string, ...)    -> nil

---

Creates an accessor method to allow assignment to the attribute
*symbol*`.id2name`. String arguments are converted to symbols.


# Module#define_method

(from ruby core)
---
    define_method(symbol, method)     -> symbol
    define_method(symbol) { block }   -> symbol

---

Defines an instance method in the receiver. The *method* parameter can be a
`Proc`, a `Method` or an `UnboundMethod` object. If a block is specified, it
is used as the method body. This block is evaluated using `instance_eval`, a
point that is tricky to demonstrate because `define_method` is private. (This
is why we resort to the `send` hack in this example.)

    class A
      def fred
        puts "In Fred"
      end
      def create_method(name, &block)
        self.class.send(:define_method, name, &block)
      end
      define_method(:wilma) { puts "Charge it!" }
    end
    class B < A
      define_method(:barney, instance_method(:fred))
    end
    a = B.new
    a.barney
    a.wilma
    a.create_method(:betty) { p self }
    a.betty

*produces:*

    In Fred
    Charge it!
    #<B:0x401b39e8>


# Module#extend_object

(from ruby core)
---
    extend_object(obj)    -> obj

---

Extends the specified object by adding this module's constants and methods
(which are added as singleton methods). This is the callback method used by
`Object#extend`.

    module Picky
      def Picky.extend_object(o)
        if String === o
          puts "Can't add Picky to a String"
        else
          puts "Picky added to #{o.class}"
          super
        end
      end
    end
    (s = Array.new).extend Picky  # Call Object.extend
    (s = "quick brown fox").extend Picky

*produces:*

    Picky added to Array
    Can't add Picky to a String


# Module#extended

(from ruby core)
---
    extended(othermod)

---

The equivalent of `included`, but for extended modules.

    module A
      def self.extended(mod)
        puts "#{self} extended in #{mod}"
      end
    end
    module Enumerable
      extend A
    end
     # => prints "A extended in Enumerable"


# Module#included

(from ruby core)
---
    included(othermod)

---

Callback invoked whenever the receiver is included in another module or class.
This should be used in preference to `Module.append_features` if your code
wants to perform some action when a module is included in another.

    module A
      def A.included(mod)
        puts "#{self} included in #{mod}"
      end
    end
    module Enumerable
      include A
    end
     # => prints "A included in Enumerable"


# Module#method_added

(from ruby core)
---
    method_added(method_name)

---

Invoked as a callback whenever an instance method is added to the receiver.

    module Chatty
      def self.method_added(method_name)
        puts "Adding #{method_name.inspect}"
      end
      def self.some_class_method() end
      def some_instance_method() end
    end

*produces:*

    Adding :some_instance_method


# Module#method_removed

(from ruby core)
---
    method_removed(method_name)

---

Invoked as a callback whenever an instance method is removed from the
receiver.

    module Chatty
      def self.method_removed(method_name)
        puts "Removing #{method_name.inspect}"
      end
      def self.some_class_method() end
      def some_instance_method() end
      class << self
        remove_method :some_class_method
      end
      remove_method :some_instance_method
    end

*produces:*

    Removing :some_instance_method


# Module#method_undefined

(from ruby core)
---
    method_undefined(p1)

---

Not documented


# Module#module_function

(from ruby core)
---
    module_function(symbol, ...)    -> self
    module_function(string, ...)    -> self

---

Creates module functions for the named methods. These functions may be called
with the module as a receiver, and also become available as instance methods
to classes that mix in the module. Module functions are copies of the
original, and so may be changed independently. The instance-method versions
are made private. If used with no arguments, subsequently defined methods
become module functions. String arguments are converted to symbols.

    module Mod
      def one
        "This is one"
      end
      module_function :one
    end
    class Cls
      include Mod
      def call_one
        one
      end
    end
    Mod.one     #=> "This is one"
    c = Cls.new
    c.call_one  #=> "This is one"
    module Mod
      def one
        "This is the new one"
      end
    end
    Mod.one     #=> "This is one"
    c.call_one  #=> "This is the new one"


# Module#prepend_features

(from ruby core)
---
    prepend_features(mod)   -> mod

---

When this module is prepended in another, Ruby calls `prepend_features` in
this module, passing it the receiving module in *mod*. Ruby's default
implementation is to overlay the constants, methods, and module variables of
this module to *mod* if this module has not already been added to *mod* or one
of its ancestors. See also `Module#prepend`.


# Module#prepended

(from ruby core)
---
    prepended(othermod)

---

The equivalent of `included`, but for prepended modules.

    module A
      def self.prepended(mod)
        puts "#{self} prepended to #{mod}"
      end
    end
    module Enumerable
      prepend A
    end
     # => prints "A prepended to Enumerable"


# Module#private

(from ruby core)
---
    private                 -> self
    private(symbol, ...)    -> self
    private(string, ...)    -> self

---

With no arguments, sets the default visibility for subsequently defined
methods to private. With arguments, sets the named methods to have private
visibility. String arguments are converted to symbols.

    module Mod
      def a()  end
      def b()  end
      private
      def c()  end
      private :a
    end
    Mod.private_instance_methods   #=> [:a, :c]


# Module#protected

(from ruby core)
---
    protected                -> self
    protected(symbol, ...)   -> self
    protected(string, ...)   -> self

---

With no arguments, sets the default visibility for subsequently defined
methods to protected. With arguments, sets the named methods to have protected
visibility. String arguments are converted to symbols.


# Module#public

(from ruby core)
---
    public                 -> self
    public(symbol, ...)    -> self
    public(string, ...)    -> self

---

With no arguments, sets the default visibility for subsequently defined
methods to public. With arguments, sets the named methods to have public
visibility. String arguments are converted to symbols.


# Module#refine

(from ruby core)
---
    refine(mod) { block }   -> module

---

Refine *mod* in the receiver.

Returns a module, where refined methods are defined.


# Module#remove_const

(from ruby core)
---
    remove_const(sym)   -> obj

---

Removes the definition of the given constant, returning that constant's
previous value.  If that constant referred to a module, this will not change
that module's name and can lead to confusion.


# Module#remove_method

(from ruby core)
---
    remove_method(symbol)   -> self
    remove_method(string)   -> self

---

Removes the method identified by *symbol* from the current class. For an
example, see `Module.undef_method`. String arguments are converted to symbols.


# Module#undef_method

(from ruby core)
---
    undef_method(symbol)    -> self
    undef_method(string)    -> self

---

Prevents the current class from responding to calls to the named method.
Contrast this with `remove_method`, which deletes the method from the
particular class; Ruby will still search superclasses and mixed-in modules for
a possible receiver. String arguments are converted to symbols.

    class Parent
      def hello
        puts "In parent"
      end
    end
    class Child < Parent
      def hello
        puts "In child"
      end
    end

    c = Child.new
    c.hello

    class Child
      remove_method :hello  # remove from child, still in parent
    end
    c.hello

    class Child
      undef_method :hello   # prevent any calls to 'hello'
    end
    c.hello

*produces:*

    In child
    In parent
    prog.rb:23: undefined method `hello' for #<Child:0x401b3bb4> (NoMethodError)


# Module#using

(from ruby core)
---
    using(module)    -> self

---

Import class refinements from *module* into the current class or module
definition.


(from gem activesupport-5.1.2)
---



Extends the module object with class/module and instance accessors for
class/module attributes, just like the native attr* accessors for instance
attributes.

Extends the module object with class/module and instance accessors for
class/module attributes, just like the native attr* accessors for instance
attributes, but does so on a per-thread basis.

So the values are scoped within the Thread.current space under the class name
of the module.






---
# Constants:

DELEGATION_RESERVED_KEYWORDS
:   [not documented]
DELEGATION_RESERVED_METHOD_NAMES
:   [not documented]
RUBY_RESERVED_KEYWORDS
:   [not documented]


# Class methods:

    attr_internal_naming_format

# Instance methods:

    alias_attribute
    anonymous?
    attr_internal
    attr_internal_accessor
    attr_internal_define
    attr_internal_ivar_name
    attr_internal_reader
    attr_internal_writer
    cattr_accessor
    cattr_reader
    cattr_writer
    delegate
    delegate_missing_to
    deprecate
    mattr_accessor
    mattr_reader
    mattr_writer
    parent
    parent_name
    parents
    redefine_method
    remove_possible_method
    remove_possible_singleton_method
    thread_cattr_accessor
    thread_mattr_accessor

# Attributes:

    attr_accessor attr_internal_naming_format

# Module#alias_attribute

(from gem activesupport-5.1.2)
---
    alias_attribute(new_name, old_name)

---

Allows you to make aliases for attributes, which includes getter, setter, and
a predicate.

    class Content < ActiveRecord::Base
      # has a title attribute
    end

    class Email < Content
      alias_attribute :subject, :title
    end

    e = Email.find(1)
    e.title    # => "Superstars"
    e.subject  # => "Superstars"
    e.subject? # => true
    e.subject = "Megastars"
    e.title    # => "Megastars"


# Module#anonymous?

(from gem activesupport-5.1.2)
---
    anonymous?()

---

A module may or may not have a name.

    module M; end
    M.name # => "M"

    m = Module.new
    m.name # => nil

`anonymous?` method returns true if module does not have a name, false
otherwise:

    Module.new.anonymous? # => true

    module M; end
    M.anonymous?          # => false

A module gets a name when it is first assigned to a constant. Either via the
`module` or `class` keyword or by an explicit assignment:

    m = Module.new # creates an anonymous module
    m.anonymous?   # => true
    M = m          # m gets a name here as a side-effect
    m.name         # => "M"
    m.anonymous?   # => false


# Module#attr_internal

(from gem activesupport-5.1.2)
---
    attr_internal(*attrs)

---


# Module#attr_internal_accessor

(from gem activesupport-5.1.2)
---
    attr_internal_accessor(*attrs)

---

Declares an attribute reader and writer backed by an internally-named instance
variable.


# Module#attr_internal_reader

(from gem activesupport-5.1.2)
---
    attr_internal_reader(*attrs)

---

Declares an attribute reader backed by an internally-named instance variable.


# Module#attr_internal_writer

(from gem activesupport-5.1.2)
---
    attr_internal_writer(*attrs)

---

Declares an attribute writer backed by an internally-named instance variable.


# Module#cattr_accessor

(from gem activesupport-5.1.2)
---
    cattr_accessor(*syms, &blk)

---


# Module#cattr_reader

(from gem activesupport-5.1.2)
---
    cattr_reader(*syms)

---


# Module#cattr_writer

(from gem activesupport-5.1.2)
---
    cattr_writer(*syms)

---


# Module#delegate

(from gem activesupport-5.1.2)
---
    delegate(*methods, to: nil, prefix: nil, allow_nil: nil)

---

Provides a `delegate` class method to easily expose contained objects' public
methods as your own.

#### Options
*   `:to` - Specifies the target object
*   `:prefix` - Prefixes the new method with the target name or a custom
    prefix
*   `:allow_nil` - if set to true, prevents a `Module::DelegationError` from
    being raised


The macro receives one or more method names (specified as symbols or strings)
and the name of the target object via the `:to` option (also a symbol or
string).

Delegation is particularly useful with Active Record associations:

    class Greeter < ActiveRecord::Base
      def hello
        'hello'
      end

      def goodbye
        'goodbye'
      end
    end

    class Foo < ActiveRecord::Base
      belongs_to :greeter
      delegate :hello, to: :greeter
    end

    Foo.new.hello   # => "hello"
    Foo.new.goodbye # => NoMethodError: undefined method `goodbye' for #<Foo:0x1af30c>

Multiple delegates to the same target are allowed:

    class Foo < ActiveRecord::Base
      belongs_to :greeter
      delegate :hello, :goodbye, to: :greeter
    end

    Foo.new.goodbye # => "goodbye"

Methods can be delegated to instance variables, class variables, or constants
by providing them as a symbols:

    class Foo
      CONSTANT_ARRAY = [0,1,2,3]
      @@class_array  = [4,5,6,7]

      def initialize
        @instance_array = [8,9,10,11]
      end
      delegate :sum, to: :CONSTANT_ARRAY
      delegate :min, to: :@@class_array
      delegate :max, to: :@instance_array
    end

    Foo.new.sum # => 6
    Foo.new.min # => 4
    Foo.new.max # => 11

It's also possible to delegate a method to the class by using `:class`:

    class Foo
      def self.hello
        "world"
      end

      delegate :hello, to: :class
    end

    Foo.new.hello # => "world"

Delegates can optionally be prefixed using the `:prefix` option. If the value
is `true`, the delegate methods are prefixed with the name of the object being
delegated to.

    Person = Struct.new(:name, :address)

    class Invoice < Struct.new(:client)
      delegate :name, :address, to: :client, prefix: true
    end

    john_doe = Person.new('John Doe', 'Vimmersvej 13')
    invoice = Invoice.new(john_doe)
    invoice.client_name    # => "John Doe"
    invoice.client_address # => "Vimmersvej 13"

It is also possible to supply a custom prefix.

    class Invoice < Struct.new(:client)
      delegate :name, :address, to: :client, prefix: :customer
    end

    invoice = Invoice.new(john_doe)
    invoice.customer_name    # => 'John Doe'
    invoice.customer_address # => 'Vimmersvej 13'

If the target is `nil` and does not respond to the delegated method a
`Module::DelegationError` is raised, as with any other value. Sometimes,
however, it makes sense to be robust to that situation and that is the purpose
of the `:allow_nil` option: If the target is not `nil`, or it is and responds
to the method, everything works as usual. But if it is `nil` and does not
respond to the delegated method, `nil` is returned.

    class User < ActiveRecord::Base
      has_one :profile
      delegate :age, to: :profile
    end

    User.new.age
    # => Module::DelegationError: User#age delegated to profile.age, but profile is nil

But if not having a profile yet is fine and should not be an error condition:

    class User < ActiveRecord::Base
      has_one :profile
      delegate :age, to: :profile, allow_nil: true
    end

    User.new.age # nil

Note that if the target is not `nil` then the call is attempted regardless of
the `:allow_nil` option, and thus an exception is still raised if said object
does not respond to the method:

    class Foo
      def initialize(bar)
        @bar = bar
      end

      delegate :name, to: :@bar, allow_nil: true
    end

    Foo.new("Bar").name # raises NoMethodError: undefined method `name'

The target method must be public, otherwise it will raise `NoMethodError`.


# Module#delegate_missing_to

(from gem activesupport-5.1.2)
---
    delegate_missing_to(target)

---

When building decorators, a common pattern may emerge:

    class Partition
      def initialize(first_event)
        @events = [ first_event ]
      end

      def people
        if @events.first.detail.people.any?
          @events.collect { |e| Array(e.detail.people) }.flatten.uniq
        else
          @events.collect(&:creator).uniq
        end
      end

      private
        def respond_to_missing?(name, include_private = false)
          @events.respond_to?(name, include_private)
        end

        def method_missing(method, *args, &block)
          @events.send(method, *args, &block)
        end
    end

With `Module#delegate_missing_to`, the above is condensed to:

    class Partition
      delegate_missing_to :@events

      def initialize(first_event)
        @events = [ first_event ]
      end

      def people
        if @events.first.detail.people.any?
          @events.collect { |e| Array(e.detail.people) }.flatten.uniq
        else
          @events.collect(&:creator).uniq
        end
      end
    end

The target can be anything callable within the object. E.g. instance
variables, methods, constants and the likes.


# Module#deprecate

(from gem activesupport-5.1.2)
---
    deprecate(*method_names)

---

    deprecate :foo
    deprecate bar: 'message'
    deprecate :foo, :bar, baz: 'warning!', qux: 'gone!'

You can also use custom deprecator instance:

    deprecate :foo, deprecator: MyLib::Deprecator.new
    deprecate :foo, bar: "warning!", deprecator: MyLib::Deprecator.new

Custom deprecators must respond to
`deprecation_warning(deprecated_method_name, message, caller_backtrace)`
method where you can implement your custom warning behavior.

    class MyLib::Deprecator
      def deprecation_warning(deprecated_method_name, message, caller_backtrace = nil)
        message = "#{deprecated_method_name} is deprecated and will be removed from MyLibrary | #{message}"
        Kernel.warn message
      end
    end


# Module#mattr_accessor

(from gem activesupport-5.1.2)
---
    mattr_accessor(*syms, &blk)

---

Defines both class and instance accessors for class attributes. All class and
instance methods created will be public, even if this method is called with a
private or protected access modifier.

    module HairColors
      mattr_accessor :hair_colors
    end

    class Person
      include HairColors
    end

    HairColors.hair_colors = [:brown, :black, :blonde, :red]
    HairColors.hair_colors # => [:brown, :black, :blonde, :red]
    Person.new.hair_colors # => [:brown, :black, :blonde, :red]

If a subclass changes the value then that would also change the value for
parent class. Similarly if parent class changes the value then that would
change the value of subclasses too.

    class Male < Person
    end

    Male.new.hair_colors << :blue
    Person.new.hair_colors # => [:brown, :black, :blonde, :red, :blue]

To opt out of the instance writer method, pass `instance_writer: false`. To
opt out of the instance reader method, pass `instance_reader: false`.

    module HairColors
      mattr_accessor :hair_colors, instance_writer: false, instance_reader: false
    end

    class Person
      include HairColors
    end

    Person.new.hair_colors = [:brown]  # => NoMethodError
    Person.new.hair_colors             # => NoMethodError

Or pass `instance_accessor: false`, to opt out both instance methods.

    module HairColors
      mattr_accessor :hair_colors, instance_accessor: false
    end

    class Person
      include HairColors
    end

    Person.new.hair_colors = [:brown]  # => NoMethodError
    Person.new.hair_colors             # => NoMethodError

Also you can pass a block to set up the attribute with a default value.

    module HairColors
      mattr_accessor :hair_colors do
        [:brown, :black, :blonde, :red]
      end
    end

    class Person
      include HairColors
    end

    Person.class_variable_get("@@hair_colors") # => [:brown, :black, :blonde, :red]


# Module#mattr_reader

(from gem activesupport-5.1.2)
---
    mattr_reader(*syms) { || ... }

---

Defines a class attribute and creates a class and instance reader methods. The
underlying class variable is set to `nil`, if it is not previously defined.
All class and instance methods created will be public, even if this method is
called with a private or protected access modifier.

    module HairColors
      mattr_reader :hair_colors
    end

    HairColors.hair_colors # => nil
    HairColors.class_variable_set("@@hair_colors", [:brown, :black])
    HairColors.hair_colors # => [:brown, :black]

The attribute name must be a valid method name in Ruby.

    module Foo
      mattr_reader :"1_Badname"
    end
    # => NameError: invalid attribute name: 1_Badname

If you want to opt out the creation on the instance reader method, pass
`instance_reader: false` or `instance_accessor: false`.

    module HairColors
      mattr_reader :hair_colors, instance_reader: false
    end

    class Person
      include HairColors
    end

    Person.new.hair_colors # => NoMethodError

Also, you can pass a block to set up the attribute with a default value.

    module HairColors
      mattr_reader :hair_colors do
        [:brown, :black, :blonde, :red]
      end
    end

    class Person
      include HairColors
    end

    Person.new.hair_colors # => [:brown, :black, :blonde, :red]


# Module#mattr_writer

(from gem activesupport-5.1.2)
---
    mattr_writer(*syms) { || ... }

---

Defines a class attribute and creates a class and instance writer methods to
allow assignment to the attribute. All class and instance methods created will
be public, even if this method is called with a private or protected access
modifier.

    module HairColors
      mattr_writer :hair_colors
    end

    class Person
      include HairColors
    end

    HairColors.hair_colors = [:brown, :black]
    Person.class_variable_get("@@hair_colors") # => [:brown, :black]
    Person.new.hair_colors = [:blonde, :red]
    HairColors.class_variable_get("@@hair_colors") # => [:blonde, :red]

If you want to opt out the instance writer method, pass `instance_writer:
false` or `instance_accessor: false`.

    module HairColors
      mattr_writer :hair_colors, instance_writer: false
    end

    class Person
      include HairColors
    end

    Person.new.hair_colors = [:blonde, :red] # => NoMethodError

Also, you can pass a block to set up the attribute with a default value.

    module HairColors
      mattr_writer :hair_colors do
        [:brown, :black, :blonde, :red]
      end
    end

    class Person
      include HairColors
    end

    Person.class_variable_get("@@hair_colors") # => [:brown, :black, :blonde, :red]


# Module#parent

(from gem activesupport-5.1.2)
---
    parent()

---

Returns the module which contains this one according to its name.

    module M
      module N
      end
    end
    X = M::N

    M::N.parent # => M
    X.parent    # => M

The parent of top-level and anonymous modules is Object.

    M.parent          # => Object
    Module.new.parent # => Object


# Module#parent_name

(from gem activesupport-5.1.2)
---
    parent_name()

---

Returns the name of the module containing this one.

    M::N.parent_name # => "M"


# Module#parents

(from gem activesupport-5.1.2)
---
    parents()

---

Returns all the parents of this module according to its name, ordered from
nested outwards. The receiver is not contained within the result.

    module M
      module N
      end
    end
    X = M::N

    M.parents    # => [Object]
    M::N.parents # => [M, Object]
    X.parents    # => [M, Object]


# Module#redefine_method

(from gem activesupport-5.1.2)
---
    redefine_method(method, &block)

---

Replaces the existing method definition, if there is one, with the passed
block as its body.


# Module#remove_possible_method

(from gem activesupport-5.1.2)
---
    remove_possible_method(method)

---

Removes the named method, if it exists.


# Module#remove_possible_singleton_method

(from gem activesupport-5.1.2)
---
    remove_possible_singleton_method(method)

---

Removes the named singleton method, if it exists.


# Module#thread_cattr_accessor

(from gem activesupport-5.1.2)
---
    thread_cattr_accessor(*syms)

---


# Module#thread_mattr_accessor

(from gem activesupport-5.1.2)
---
    thread_mattr_accessor(*syms)

---

Defines both class and instance accessors for class attributes.

    class Account
      thread_mattr_accessor :user
    end

    Account.user = "DHH"
    Account.user     # => "DHH"
    Account.new.user # => "DHH"

If a subclass changes the value, the parent class' value is not changed.
Similarly, if the parent class changes the value, the value of subclasses is
not changed.

    class Customer < Account
    end

    Customer.user = "Rafael"
    Customer.user # => "Rafael"
    Account.user  # => "DHH"

To opt out of the instance writer method, pass `instance_writer: false`. To
opt out of the instance reader method, pass `instance_reader: false`.

    class Current
      thread_mattr_accessor :user, instance_writer: false, instance_reader: false
    end

    Current.new.user = "DHH"  # => NoMethodError
    Current.new.user          # => NoMethodError

Or pass `instance_accessor: false`, to opt out both instance methods.

    class Current
      mattr_accessor :user, instance_accessor: false
    end

    Current.new.user = "DHH"  # => NoMethodError
    Current.new.user          # => NoMethodError


# Module#attr_internal_define

(from gem activesupport-5.1.2)
---
    attr_internal_define(attr_name, type)

---


# Module#attr_internal_ivar_name

(from gem activesupport-5.1.2)
---
    attr_internal_ivar_name(attr)

---


(from gem builder-3.2.3)
---
Also, modules included into Object need to be scanned and have their instance
methods removed from blank slate.  In theory, modules included into Kernel
would have to be removed as well, but a "feature" of Ruby prevents late
includes into modules from being exposed in the first place.
---
# Instance methods:

    append_features
    blankslate_original_append_features

# Module#append_features

(from ruby core)
---
    append_features(mod)   -> mod

---

When this module is included in another, Ruby calls `append_features` in this
module, passing it the receiving module in *mod*. Ruby's default
implementation is to add the constants, methods, and module variables of this
module to *mod* if this module has not already been added to *mod* or one of
its ancestors. See also `Module#include`.


(from gem builder-3.2.3)
---
    append_features(mod)

---


# Module#blankslate_original_append_features

(from gem builder-3.2.3)
---
    blankslate_original_append_features(mod)

---


(from gem yard-0.9.9)
---
# Instance methods:

    class_name
    namespace_name

# Module#class_name

(from gem yard-0.9.9)
---
    class_name()

---

Returns the class name of a full module namespace path

@example
    module A::B::C; class_name end # => "C"

@return [String] the last part of a module path


# Module#namespace_name

(from gem yard-0.9.9)
---
    namespace_name()

---

Returns the module namespace path minus the class/module name

@example
    module A::B::C; namespace_name end # => "A::B"

@return [String] the namespace minus the class/module name


---
Also found in:
    gem minitest-5.10.3
    gem rake-12.0.0

