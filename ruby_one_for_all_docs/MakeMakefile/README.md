# MakeMakefile

(from ruby core)
---
mkmf.rb is used by Ruby C extensions to generate a Makefile which will
correctly compile and link the C extension to Ruby and a third-party library.
---
# Constants:

ASSEMBLE_C
:   Command which will translate C files to assembler sources in the generated
    Makefile
ASSEMBLE_CXX
:   Command which will translate C++ files to assembler sources in the
    generated Makefile
CLEANINGS
:   Makefile rules that will clean the extension build directory
COMMON_HEADERS
:   Common headers for Ruby C extensions
COMMON_LIBS
:   Common libraries for Ruby C extensions
COMPILE_C
:   Command which will compile C files in the generated Makefile
COMPILE_CXX
:   Command which will compile C++ files in the generated Makefile
COMPILE_RULES
:   make compile rules
CONFIG
:   The makefile configuration using the defaults from when Ruby was built.
CXX_EXT
:   Extensions for files complied with a C++ compiler
C_EXT
:   Extensions for files compiled with a C compiler
EXPORT_PREFIX
:   [not documented]
HDR_EXT
:   Extensions for header files
LIBARG
:   Argument which will add a library to the linker
LIBPATHFLAG
:   Argument which will add a library path to the linker
LINK_SO
:   Command which will link a shared library
MAIN_DOES_NOTHING
:   A C main function which does no work
ORIG_LIBPATH
:   [not documented]
RPATHFLAG
:   [not documented]
RULE_SUBST
:   [not documented]
SRC_EXT
:   Extensions for source files
TRY_LINK
:   Command which will compile a program in order to test linking a library
UNIVERSAL_INTS
:   [not documented]


# Instance methods:

    check_signedness
    check_sizeof
    convertible_int
    create_header
    create_makefile
    depend_rules
    dir_config
    dummy_makefile
    enable_config
    find_executable
    find_header
    find_library
    find_type
    have_const
    have_framework
    have_func
    have_header
    have_library
    have_macro
    have_struct_member
    have_type
    have_var
    pkg_config
    try_const
    try_type
    with_config

# MakeMakefile#check_signedness

(from ruby core)
---
    check_signedness(type, headers = nil, opts = nil, &b)

---

Returns the signedness of the given `type`.  You may optionally specify
additional `headers` to search in for the `type`.

If the `type` is found and is a numeric type, a macro is passed as a
preprocessor constant to the compiler using the `type` name, in uppercase,
prepended with `SIGNEDNESS_OF_`, followed by the `type` name, followed by `=X`
where "X" is positive integer if the `type` is unsigned and a negative integer
if the `type` is signed.

For example, if `size_t` is defined as unsigned, then
`check_signedness('size_t')` would return +1 and the `SIGNEDNESS_OF_SIZE_T=+1`
preprocessor macro would be passed to the compiler.  The
`SIGNEDNESS_OF_INT=-1` macro would be set for `check_signedness('int')`


# MakeMakefile#check_sizeof

(from ruby core)
---
    check_sizeof(type, headers = nil, opts = "", &b)

---

Returns the size of the given `type`.  You may optionally specify additional
`headers` to search in for the `type`.

If found, a macro is passed as a preprocessor constant to the compiler using
the type name, in uppercase, prepended with `SIZEOF_`, followed by the type
name, followed by `=X` where "X" is the actual size.

For example, if `check_sizeof('mystruct')` returned 12, then the
`SIZEOF_MYSTRUCT=12` preprocessor macro would be passed to the compiler.


# MakeMakefile#convertible_int

(from ruby core)
---
    convertible_int(type, headers = nil, opts = nil, &b)

---

Returns the convertible integer type of the given `type`.  You may optionally
specify additional `headers` to search in for the `type`. *convertible* means
actually the same type, or typedef'd from the same type.

If the `type` is an integer type and the *convertible* type is found, the
following macros are passed as preprocessor constants to the compiler using
the `type` name, in uppercase.

*   `TYPEOF_`, followed by the `type` name, followed by `=X` where "X" is the
    found *convertible* type name.
*   `TYP2NUM` and `NUM2TYP`, where `TYP` is the `type` name in uppercase with
    replacing an `_t` suffix with "T", followed by `=X` where "X" is the macro
    name to convert `type` to an Integer object, and vice versa.


For example, if `foobar_t` is defined as unsigned long, then
`convertible_int("foobar_t")` would return "unsigned long", and define these
macros:

    #define TYPEOF_FOOBAR_T unsigned long
    #define FOOBART2NUM ULONG2NUM
    #define NUM2FOOBART NUM2ULONG


# MakeMakefile#create_header

(from ruby core)
---
    create_header(header = "extconf.h")

---

Generates a header file consisting of the various macro definitions generated
by other methods such as have_func and have_header. These are then wrapped in
a custom `#ifndef` based on the `header` file name, which defaults to
"extconf.h".

For example:

    # extconf.rb
    require 'mkmf'
    have_func('realpath')
    have_header('sys/utime.h')
    create_header
    create_makefile('foo')

The above script would generate the following extconf.h file:

    #ifndef EXTCONF_H
    #define EXTCONF_H
    #define HAVE_REALPATH 1
    #define HAVE_SYS_UTIME_H 1
    #endif

Given that the create_header method generates a file based on definitions set
earlier in your extconf.rb file, you will probably want to make this one of
the last methods you call in your script.


# MakeMakefile#create_makefile

(from ruby core)
---
    create_makefile(target, srcprefix = nil) { |conf| ... }

---

Generates the Makefile for your extension, passing along any options and
preprocessor constants that you may have generated through other methods.

The `target` name should correspond the name of the global function name
defined within your C extension, minus the `Init_`.  For example, if your C
extension is defined as `Init_foo`, then your target would simply be "foo".

If any "/" characters are present in the target name, only the last name is
interpreted as the target name, and the rest are considered toplevel directory
names, and the generated Makefile will be altered accordingly to follow that
directory structure.

For example, if you pass "test/foo" as a target name, your extension will be
installed under the "test" directory.  This means that in order to load the
file within a Ruby program later, that directory structure will have to be
followed, e.g. `require 'test/foo'`.

The `srcprefix` should be used when your source files are not in the same
directory as your build script. This will not only eliminate the need for you
to manually copy the source files into the same directory as your build
script, but it also sets the proper `target_prefix` in the generated Makefile.

Setting the `target_prefix` will, in turn, install the generated binary in a
directory under your `RbConfig::CONFIG['sitearchdir']` that mimics your local
filesystem when you run `make install`.

For example, given the following file tree:

    ext/
      extconf.rb
      test/
        foo.c

And given the following code:

    create_makefile('test/foo', 'test')

That will set the `target_prefix` in the generated Makefile to "test". That,
in turn, will create the following file tree when installed via the `make
install` command:

    /path/to/ruby/sitearchdir/test/foo.so

It is recommended that you use this approach to generate your makefiles,
instead of copying files around manually, because some third party libraries
may depend on the `target_prefix` being set properly.

The `srcprefix` argument can be used to override the default source directory,
i.e. the current directory.  It is included as part of the `VPATH` and added
to the list of `INCFLAGS`.


# MakeMakefile#depend_rules

(from ruby core)
---
    depend_rules(depend)

---

Processes the data contents of the "depend" file.  Each line of this file is
expected to be a file name.

Returns the output of findings, in Makefile format.


# MakeMakefile#dir_config

(from ruby core)
---
    dir_config(target)
    dir_config(target, prefix)
    dir_config(target, idefault, ldefault)

---

Sets a `target` name that the user can then use to configure various "with"
options with on the command line by using that name.  For example, if the
target is set to "foo", then the user could use the `--with-foo-dir=prefix`,
`--with-foo-include=dir` and `--with-foo-lib=dir` command line options to tell
where to search for header/library files.

You may pass along additional parameters to specify default values.  If one is
given it is taken as default `prefix`, and if two are given they are taken as
"include" and "lib" defaults in that order.

In any case, the return value will be an array of determined "include" and
"lib" directories, either of which can be nil if no corresponding command line
option is given when no default value is specified.

Note that dir_config only adds to the list of places to search for libraries
and include files.  It does not link the libraries into your application.


# MakeMakefile#dummy_makefile

(from ruby core)
---
    dummy_makefile(srcdir)

---

creates a stub Makefile.


# MakeMakefile#enable_config

(from ruby core)
---
    enable_config(config, default=nil) { |config, default| ... }

---

Tests for the presence of an `--enable-`*config* or `--disable-`*config*
option. Returns `true` if the enable option is given, `false` if the disable
option is given, and the default value otherwise.

This can be useful for adding custom definitions, such as debug information.

Example:

    if enable_config("debug")
       $defs.push("-DOSSL_DEBUG") unless $defs.include? "-DOSSL_DEBUG"
    end


# MakeMakefile#find_executable

(from ruby core)
---
    find_executable(bin, path = nil)

---

Searches for the executable `bin` on `path`.  The default path is your `PATH`
environment variable. If that isn't defined, it will resort to searching
/usr/local/bin, /usr/ucb, /usr/bin and /bin.

If found, it will return the full path, including the executable name, of
where it was found.

Note that this method does not actually affect the generated Makefile.


# MakeMakefile#find_header

(from ruby core)
---
    find_header(header, *paths)

---

Instructs mkmf to search for the given `header` in any of the `paths`
provided, and returns whether or not it was found in those paths.

If the header is found then the path it was found on is added to the list of
included directories that are sent to the compiler (via the `-I` switch).


# MakeMakefile#find_library

(from ruby core)
---
    find_library(lib, func, *paths, &b)

---

Returns whether or not the entry point `func` can be found within the library
`lib` in one of the `paths` specified, where `paths` is an array of strings. 
If `func` is `nil` , then the `main()` function is used as the entry point.

If `lib` is found, then the path it was found on is added to the list of
library paths searched and linked against.


# MakeMakefile#find_type

(from ruby core)
---
    find_type(type, opt, *headers, &b)

---

Returns where the static type `type` is defined.

You may also pass additional flags to `opt` which are then passed along to the
compiler.

See also `have_type`.


# MakeMakefile#have_const

(from ruby core)
---
    have_const(const, headers = nil, opt = "", &b)

---

Returns whether or not the constant `const` is defined.  You may optionally
pass the `type` of `const` as `[const, type]`, such as:

    have_const(%w[PTHREAD_MUTEX_INITIALIZER pthread_mutex_t], "pthread.h")

You may also pass additional `headers` to check against in addition to the
common header files, and additional flags to `opt` which are then passed along
to the compiler.

If found, a macro is passed as a preprocessor constant to the compiler using
the type name, in uppercase, prepended with `HAVE_CONST_`.

For example, if `have_const('foo')` returned true, then the `HAVE_CONST_FOO`
preprocessor macro would be passed to the compiler.


# MakeMakefile#have_framework

(from ruby core)
---
    have_framework(fw, &b)

---

Returns whether or not the given `framework` can be found on your system. If
found, a macro is passed as a preprocessor constant to the compiler using the
framework name, in uppercase, prepended with `HAVE_FRAMEWORK_`.

For example, if `have_framework('Ruby')` returned true, then the
`HAVE_FRAMEWORK_RUBY` preprocessor macro would be passed to the compiler.

If `fw` is a pair of the framework name and its header file name that header
file is checked, instead of the normally used header file which is named same
as the framework.


# MakeMakefile#have_func

(from ruby core)
---
    have_func(func, headers = nil, opt = "", &b)

---

Returns whether or not the function `func` can be found in the common header
files, or within any `headers` that you provide.  If found, a macro is passed
as a preprocessor constant to the compiler using the function name, in
uppercase, prepended with `HAVE_`.

To check functions in an additional library, you need to check that library
first using `have_library()`.  The `func` shall be either mere function name
or function name with arguments.

For example, if `have_func('foo')` returned `true`, then the `HAVE_FOO`
preprocessor macro would be passed to the compiler.


# MakeMakefile#have_header

(from ruby core)
---
    have_header(header, preheaders = nil, opt = "", &b)

---

Returns whether or not the given `header` file can be found on your system. If
found, a macro is passed as a preprocessor constant to the compiler using the
header file name, in uppercase, prepended with `HAVE_`.

For example, if `have_header('foo.h')` returned true, then the `HAVE_FOO_H`
preprocessor macro would be passed to the compiler.


# MakeMakefile#have_library

(from ruby core)
---
    have_library(lib, func = nil, headers = nil, opt = "", &b)

---

Returns whether or not the given entry point `func` can be found within `lib`.
 If `func` is `nil`, the `main()` entry point is used by default.  If found,
it adds the library to list of libraries to be used when linking your
extension.

If `headers` are provided, it will include those header files as the header
files it looks in when searching for `func`.

The real name of the library to be linked can be altered by `--with-FOOlib`
configuration option.


# MakeMakefile#have_macro

(from ruby core)
---
    have_macro(macro, headers = nil, opt = "", &b)

---

Returns whether or not `macro` is defined either in the common header files or
within any `headers` you provide.

Any options you pass to `opt` are passed along to the compiler.


# MakeMakefile#have_struct_member

(from ruby core)
---
    have_struct_member(type, member, headers = nil, opt = "", &b)

---

Returns whether or not the struct of type `type` contains `member`.  If it
does not, or the struct type can't be found, then false is returned. You may
optionally specify additional `headers` in which to look for the struct (in
addition to the common header files).

If found, a macro is passed as a preprocessor constant to the compiler using
the type name and the member name, in uppercase, prepended with `HAVE_`.

For example, if `have_struct_member('struct foo', 'bar')` returned true, then
the `HAVE_STRUCT_FOO_BAR` preprocessor macro would be passed to the compiler.

`HAVE_ST_BAR` is also defined for backward compatibility.


# MakeMakefile#have_type

(from ruby core)
---
    have_type(type, headers = nil, opt = "", &b)

---

Returns whether or not the static type `type` is defined.  You may optionally
pass additional `headers` to check against in addition to the common header
files.

You may also pass additional flags to `opt` which are then passed along to the
compiler.

If found, a macro is passed as a preprocessor constant to the compiler using
the type name, in uppercase, prepended with `HAVE_TYPE_`.

For example, if `have_type('foo')` returned true, then the `HAVE_TYPE_FOO`
preprocessor macro would be passed to the compiler.


# MakeMakefile#have_var

(from ruby core)
---
    have_var(var, headers = nil, opt = "", &b)

---

Returns whether or not the variable `var` can be found in the common header
files, or within any `headers` that you provide.  If found, a macro is passed
as a preprocessor constant to the compiler using the variable name, in
uppercase, prepended with `HAVE_`.

To check variables in an additional library, you need to check that library
first using `have_library()`.

For example, if `have_var('foo')` returned true, then the `HAVE_FOO`
preprocessor macro would be passed to the compiler.


# MakeMakefile#pkg_config

(from ruby core)
---
    pkg_config(pkg, option=nil)

---

Returns compile/link information about an installed library in a tuple of
`[cflags, ldflags, libs]`, by using the command found first in the following
commands:

1.  If `--with-{pkg}-config={command}` is given via command line option:
    `{command} {option}`

2.  `{pkg}-config {option}`

3.  `pkg-config {option} {pkg}`


Where {option} is, for instance, `--cflags`.

The values obtained are appended to +$CFLAGS+, +$LDFLAGS+ and +$libs+.

If an `option` argument is given, the config command is invoked with the
option and a stripped output string is returned without modifying any of the
global values mentioned above.


# MakeMakefile#try_const

(from ruby core)
---
    try_const(const, headers = nil, opt = "", &b)

---

Returns whether or not the constant `const` is defined.

See also `have_const`


# MakeMakefile#try_type

(from ruby core)
---
    try_type(type, headers = nil, opt = "", &b)

---

Returns whether or not the static type `type` is defined.

See also `have_type`


# MakeMakefile#with_config

(from ruby core)
---
    with_config(config, default=nil) { |config, default| ... }

---

Tests for the presence of a `--with-`*config* or `--without-`*config* option. 
Returns `true` if the with option is given, `false` if the without option is
given, and the default value otherwise.

This can be useful for adding custom definitions, such as debug information.

Example:

    if with_config("debug")
       $defs.push("-DOSSL_DEBUG") unless $defs.include? "-DOSSL_DEBUG"
    end


