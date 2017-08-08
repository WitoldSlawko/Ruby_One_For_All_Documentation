# Class < Module

(from ruby core)
---

Extends any Class to include *json_creatable?* method.

Classes in Ruby are first-class objects---each is an instance of class
`Class`.

Typically, you create a new class by using:

    class Name
     # some code describing the class behavior
    end

When a new class is created, an object of type Class is initialized and
assigned to a global constant (`Name` in this case).

When `Name.new` is called to create a new object, the `new` method in `Class`
is run by default. This can be demonstrated by overriding `new` in `Class`:

    class Class
      alias old_new new
      def new(*args)
        print "Creating a new ", self.name, "\n"
        old_new(*args)
      end
    end

    class Name
    end

    n = Name.new

*produces:*

    Creating a new Name

Classes, modules, and objects are interrelated. In the diagram that follows,
the vertical arrows represent inheritance, and the parentheses metaclasses.
All metaclasses are instances of the class `Class'.
                             +---------+             +-...
                             |         |             |
             BasicObject-----|-->(BasicObject)-------|-...
                 ^           |         ^             |
                 |           |         |             |
              Object---------|----->(Object)---------|-...
                 ^           |         ^             |
                 |           |         |             |
                 +-------+   |         +--------+    |
                 |       |   |         |        |    |
                 |    Module-|---------|--->(Module)-|-...
                 |       ^   |         |        ^    |
                 |       |   |         |        |    |
                 |     Class-|---------|---->(Class)-|-...
                 |       ^   |         |        ^    |
                 |       +---+         |        +----+
                 |                     |
    obj--->OtherClass---------->(OtherClass)-----------...
---
# Class methods:

    new

# Instance methods:

    allocate
    inherited
    json_creatable?
    new
    superclass

# Class::new

(from ruby core)
---
    Class.new(super_class=Object)               -> a_class
    Class.new(super_class=Object) { |mod| ... } -> a_class

---

Creates a new anonymous (unnamed) class with the given superclass (or `Object`
if no parameter is given). You can give a class a name by assigning the class
object to a constant.

If a block is given, it is passed the class object, and the block is evaluated
in the context of this class like `class_eval`.

    fred = Class.new do
      def meth1
        "hello"
      end
      def meth2
        "bye"
      end
    end

    a = fred.new     #=> #<#<Class:0x100381890>:0x100376b98>
    a.meth1          #=> "hello"
    a.meth2          #=> "bye"

Assign the class to a constant (name starting uppercase) if you want to treat
it like a regular class.


# Class#allocate

(from ruby core)
---
    class.allocate()   ->   obj

---

Allocates space for a new object of *class*'s class and does not call
initialize on the new instance. The returned object must be an instance of
*class*.

    klass = Class.new do
      def initialize(*args)
        @initialized = true
      end

      def initialized?
        @initialized || false
      end
    end

    klass.allocate.initialized? #=> false


# Class#json_creatable?

(from ruby core)
---
    json_creatable?()

---

Returns true if this class can be used to create an instance from a serialised
JSON string. The class has to implement a class method *json_create* that
expects a hash as first parameter. The hash should include the required data.


# Class#new

(from ruby core)
---
    class.new(args, ...)    ->  obj

---

Calls `allocate` to create a new object of *class*'s class, then invokes that
object's `initialize` method, passing it *args*. This is the method that ends
up getting called whenever an object is constructed using .new.


# Class#superclass

(from ruby core)
---
    class.superclass -> a_super_class or nil

---

Returns the superclass of *class*, or `nil`.

    File.superclass          #=> IO
    IO.superclass            #=> Object
    Object.superclass        #=> BasicObject
    class Foo; end
    class Bar < Foo; end
    Bar.superclass           #=> Foo

Returns nil when the given class does not have a parent class:

    BasicObject.superclass   #=> nil


# Class#inherited

(from ruby core)
---
    inherited(subclass)

---

Callback invoked whenever a subclass of the current class is created.

Example:

    class Foo
      def self.inherited(subclass)
        puts "New subclass: #{subclass}"
      end
    end

    class Bar < Foo
    end

    class Baz < Bar
    end

*produces:*

    New subclass: Bar
    New subclass: Baz


(from gem activesupport-5.1.2)
---

---
# Instance methods:

    class_attribute
    descendants
    subclasses

# Class#class_attribute

(from gem activesupport-5.1.2)
---
    class_attribute(*attrs)

---

Declare a class-level attribute whose value is inheritable by subclasses.
Subclasses can change their own value and it will not impact parent class.

    class Base
      class_attribute :setting
    end

    class Subclass < Base
    end

    Base.setting = true
    Subclass.setting            # => true
    Subclass.setting = false
    Subclass.setting            # => false
    Base.setting                # => true

In the above case as long as Subclass does not assign a value to setting by
performing `Subclass.setting = *something`*, `Subclass.setting` would read
value assigned to parent class. Once Subclass assigns a value then the value
assigned by Subclass would be returned.

This matches normal Ruby method inheritance: think of writing an attribute on
a subclass as overriding the reader method. However, you need to be aware when
using `class_attribute` with mutable structures as `Array` or `Hash`. In such
cases, you don't want to do changes in place. Instead use setters:

    Base.setting = []
    Base.setting                # => []
    Subclass.setting            # => []

    # Appending in child changes both parent and child because it is the same object:
    Subclass.setting << :foo
    Base.setting               # => [:foo]
    Subclass.setting           # => [:foo]

    # Use setters to not propagate changes:
    Base.setting = []
    Subclass.setting += [:foo]
    Base.setting               # => []
    Subclass.setting           # => [:foo]

For convenience, an instance predicate method is defined as well. To skip it,
pass `instance_predicate: false`.

    Subclass.setting?       # => false

Instances may overwrite the class value in the same way:

    Base.setting = true
    object = Base.new
    object.setting          # => true
    object.setting = false
    object.setting          # => false
    Base.setting            # => true

To opt out of the instance reader method, pass `instance_reader: false`.

    object.setting          # => NoMethodError
    object.setting?         # => NoMethodError

To opt out of the instance writer method, pass `instance_writer: false`.

    object.setting = false  # => NoMethodError

To opt out of both instance methods, pass `instance_accessor: false`.


# Class#descendants

(from gem activesupport-5.1.2)
---
    descendants()

---

Returns an array with all classes that are < than its receiver.

    class C; end
    C.descendants # => []

    class B < C; end
    C.descendants # => [B]

    class A < B; end
    C.descendants # => [B, A]

    class D < C; end
    C.descendants # => [B, A, D]


# Class#subclasses

(from gem activesupport-5.1.2)
---
    subclasses()

---

Returns an array with the direct children of `self`.

    class Foo; end
    class Bar < Foo; end
    class Baz < Bar; end

    Foo.subclasses # => [Bar]


