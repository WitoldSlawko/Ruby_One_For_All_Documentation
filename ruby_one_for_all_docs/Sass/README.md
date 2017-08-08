# Sass

---
# Extended by:
(from gem sass-3.5.1)
    Features
    Sass::Version

(from gem sass-3.5.1)
---
The module that contains everything Sass-related:

*   {Sass::Engine} is the class used to render Sass/SCSS within Ruby code.
*   {Sass::Plugin} is interfaces with web frameworks (Rails and Merb in
    particular).
*   {Sass::SyntaxError} is raised when Sass encounters an error.
*   {Sass::CSS} handles conversion of CSS to Sass.


Also see the {file:SASS_REFERENCE.md full Sass reference}.






























































---
# Constants:

Callable
:   A Sass mixin or function.

    `name`: `String` : The name of the mixin/function.

    `args`: `Array<(Script::Tree::Node, Script::Tree::Node)>` : The arguments
    for the mixin/function.
        Each element is a tuple containing the variable node of the argument
        and the parse tree for the default value of the argument.

    `splat`: `Script::Tree::Node?` : The variable node of the splat argument
    for this callable, or null.

    `environment`: {Sass::Environment} : The environment in which the
    mixin/function was defined.
        This is captured so that the mixin/function can have access
        to local variables defined in its scope.

    `tree`: `Array<Tree::Node>` : The parse tree for the mixin/function.

    `has_content`: `Boolean` : Whether the callable accepts a content block.

    `type`: `String` : The user-friendly name of the type of the callable.

    `origin`: `Symbol` : From whence comes the callable: `:stylesheet`,
    `:builtin`, `:css`
        A callable with an origin of `:stylesheet` was defined in the stylesheet itself.
        A callable with an origin of `:builtin` was defined in ruby.
        A callable (function) with an origin of `:css` returns a function call with arguments to CSS.
GENERIC_LOADED
:   [not documented]
MERB_LOADED
:   [not documented]
RAILS_LOADED
:   [not documented]
ROOT_DIR
:   The root directory of the Sass source tree. This may be overridden by the
    package manager if the lib directory is separated from the main source
    tree. @api public
VERSION
:   A string representing the version of Sass. A more fine-grained
    representation is available from Sass.version. @api public


# Class methods:

    compile
    compile_file
    load_paths
    logger
    logger=
    tests_running

# Attributes:

    attr_accessor tests_running

# Sass::compile

(from gem sass-3.5.1)
---
    compile(contents, options = {})

---

Compile a Sass or SCSS string to CSS. Defaults to SCSS.

@param contents [String] The contents of the Sass file. @param options
[{Symbol => Object}] An options hash;
    see {file:SASS_REFERENCE.md#Options the Sass options documentation}

@raise [Sass::SyntaxError] if there's an error in the document @raise
[Encoding::UndefinedConversionError] if the source encoding
    cannot be converted to UTF-8

@raise [ArgumentError] if the document uses an unknown encoding with
`@charset`


# Sass::compile_file

(from gem sass-3.5.1)
---
    compile_file(filename, *args)

---

Compile a file on disk to CSS.

@raise [Sass::SyntaxError] if there's an error in the document @raise
[Encoding::UndefinedConversionError] if the source encoding
    cannot be converted to UTF-8

@raise [ArgumentError] if the document uses an unknown encoding with
`@charset`

@overload compile_file(filename, options = {})
    Return the compiled CSS rather than writing it to a file.

    @param filename [String] The path to the Sass, SCSS, or CSS file on disk.
    @param options [{Symbol => Object}] An options hash;
      see {file:SASS_REFERENCE.md#Options the Sass options documentation}
    @return [String] The compiled CSS.

@overload compile_file(filename, css_filename, options = {})
    Write the compiled CSS to a file.

    @param filename [String] The path to the Sass, SCSS, or CSS file on disk.
    @param options [{Symbol => Object}] An options hash;
      see {file:SASS_REFERENCE.md#Options the Sass options documentation}
    @param css_filename [String] The location to which to write the compiled CSS.


# Sass::load_paths

(from gem sass-3.5.1)
---
    load_paths()

---

The global load paths for Sass files. This is meant for plugins and libraries
to register the paths to their Sass stylesheets to that they may be
`@imported`. This load path is used by every instance of {Sass::Engine}. They
are lower-precedence than any load paths passed in via the
{file:SASS_REFERENCE.md#load_paths-option `:load_paths` option}.

If the `SASS_PATH` environment variable is set, the initial value of
`load_paths` will be initialized based on that. The variable should be a
colon-separated list of path names (semicolon-separated on Windows).

Note that files on the global load path are never compiled to CSS themselves,
even if they aren't partials. They exist only to be imported.

@example
    Sass.load_paths << File.dirname(__FILE__ + '/sass')

@return [Array<String, Pathname, Sass::Importers::Base>]


# Sass::logger

(from gem sass-3.5.1)
---
    logger()

---


# Sass::logger=

(from gem sass-3.5.1)
---
    logger=(l)

---


(from gem sass-rails-5.0.6)
---








---
