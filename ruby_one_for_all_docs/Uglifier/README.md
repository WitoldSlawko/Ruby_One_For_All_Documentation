# Uglifier < Object

(from gem uglifier-3.2.0)
---
A wrapper around the UglifyJS interface

---
# Constants:

DEFAULTS
:   Default options for compilation
ES5FallbackPath
:   ES5 shims source path
Error
:   Error class for compilation errors.
HarmonySourcePath
:   UglifyJS with Harmony source path
LEGACY_OPTIONS
:   [not documented]
MANGLE_PROPERTIES_DEFAULTS
:   [not documented]
SOURCE_MAP_DEFAULTS
:   [not documented]
SourceMapPath
:   Source Map path
SourcePath
:   UglifyJS source path
SplitFallbackPath
:   String.split shim source path
UglifyJSWrapperPath
:   UglifyJS wrapper path
VERSION
:   Current version of Uglifier.


# Class methods:

    compile
    compile_with_map
    new

# Instance methods:

    comment_options
    comment_setting
    compile
    compile_with_map
    compress
    compressor_options
    conditional_option
    enclose_options
    encode_regexp
    extract_source_mapping_url
    input_source_map
    keep_fnames?
    mangle_options
    mangle_properties_options
    negate_iife_block
    output_options
    parse_options
    read_source
    run_uglifyjs
    sanitize_map_root
    screw_ie8?
    source_map_options
    source_with

# Uglifier::compile

(from gem uglifier-3.2.0)
---
    compile(source, options = {})

---

Minifies JavaScript code using implicit context.

@param source [IO, String] valid JS source code. @param options [Hash]
optional overrides to `Uglifier::DEFAULTS` @return [String] minified code.


# Uglifier::compile_with_map

(from gem uglifier-3.2.0)
---
    compile_with_map(source, options = {})

---

Minifies JavaScript code and generates a source map using implicit context.

@param source [IO, String] valid JS source code. @param options [Hash]
optional overrides to `Uglifier::DEFAULTS` @return [Array(String, String)]
minified code and source map.


# Uglifier::new

(from gem uglifier-3.2.0)
---
    new(options = {})

---

Initialize new context for Uglifier with given options

@param options [Hash] optional overrides to `Uglifier::DEFAULTS`


# Uglifier#compile

(from gem uglifier-3.2.0)
---
    compile(source)

---

Minifies JavaScript code

@param source [IO, String] valid JS source code. @return [String] minified
code.


# Uglifier#compile_with_map

(from gem uglifier-3.2.0)
---
    compile_with_map(source)

---

Minifies JavaScript code and generates a source map

@param source [IO, String] valid JS source code. @return [Array(String,
String)] minified code and source map.


# Uglifier#compress

(from gem uglifier-3.2.0)
---
    compress(source)

---


# Uglifier#comment_options

(from gem uglifier-3.2.0)
---
    comment_options()

---


# Uglifier#comment_setting

(from gem uglifier-3.2.0)
---
    comment_setting()

---


# Uglifier#compressor_options

(from gem uglifier-3.2.0)
---
    compressor_options()

---


# Uglifier#conditional_option

(from gem uglifier-3.2.0)
---
    conditional_option(value, defaults, overrides = {})

---


# Uglifier#enclose_options

(from gem uglifier-3.2.0)
---
    enclose_options()

---


# Uglifier#encode_regexp

(from gem uglifier-3.2.0)
---
    encode_regexp(regexp)

---


# Uglifier#extract_source_mapping_url

(from gem uglifier-3.2.0)
---
    extract_source_mapping_url(source)

---


# Uglifier#input_source_map

(from gem uglifier-3.2.0)
---
    input_source_map(source, generate_map)

---


# Uglifier#keep_fnames?

(from gem uglifier-3.2.0)
---
    keep_fnames?(type)

---


# Uglifier#mangle_options

(from gem uglifier-3.2.0)
---
    mangle_options()

---


# Uglifier#mangle_properties_options

(from gem uglifier-3.2.0)
---
    mangle_properties_options()

---


# Uglifier#negate_iife_block

(from gem uglifier-3.2.0)
---
    negate_iife_block()

---

Prevent negate_iife when wrap_iife is true


# Uglifier#output_options

(from gem uglifier-3.2.0)
---
    output_options()

---


# Uglifier#parse_options

(from gem uglifier-3.2.0)
---
    parse_options()

---


# Uglifier#read_source

(from gem uglifier-3.2.0)
---
    read_source(source)

---


# Uglifier#run_uglifyjs

(from gem uglifier-3.2.0)
---
    run_uglifyjs(input, generate_map)

---

Run UglifyJS for given source code


# Uglifier#sanitize_map_root

(from gem uglifier-3.2.0)
---
    sanitize_map_root(map)

---


# Uglifier#screw_ie8?

(from gem uglifier-3.2.0)
---
    screw_ie8?()

---


# Uglifier#source_map_options

(from gem uglifier-3.2.0)
---
    source_map_options(input_map)

---


# Uglifier#source_with

(from gem uglifier-3.2.0)
---
    source_with(path)

---


