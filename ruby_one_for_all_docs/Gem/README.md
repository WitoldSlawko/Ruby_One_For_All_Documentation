# Gem

(from ruby core)
---
RubyGems is the Ruby standard for publishing and managing third party
libraries.

For user documentation, see:

*   `gem help` and `gem help [command]`
*   [RubyGems User Guide](http://guides.rubygems.org/)
*   [Frequently Asked Questions](http://guides.rubygems.org/faqs)


For gem developer documentation see:

*   [Creating Gems](http://guides.rubygems.org/make-your-own-gem)
*   Gem::Specification
*   Gem::Version for version dependency notes


Further RubyGems documentation can be found at:

*   [RubyGems Guides](http://guides.rubygems.org)
*   [RubyGems API](http://rubygems.rubyforge.org/rdoc) (also available from
    `gem server`)


## RubyGems Plugins

As of RubyGems 1.3.2, RubyGems will load plugins installed in gems or
$LOAD_PATH.  Plugins must be named 'rubygems_plugin' (.rb, .so, etc) and
placed at the root of your gem's #require_path.  Plugins are discovered via
Gem::find_files then loaded.  Take care when implementing a plugin as your
plugin file may be loaded multiple times if multiple versions of your gem are
installed.

For an example plugin, see the graph gem which adds a `gem graph` command.

## RubyGems Defaults, Packaging

RubyGems defaults are stored in rubygems/defaults.rb.  If you're packaging
RubyGems or implementing Ruby you can change RubyGems' defaults.

For RubyGems packagers, provide lib/rubygems/defaults/operating_system.rb and
override any defaults from lib/rubygems/defaults.rb.

For Ruby implementers, provide lib/rubygems/defaults/#{RUBY_ENGINE}.rb and
override any defaults from lib/rubygems/defaults.rb.

If you need RubyGems to perform extra work on install or uninstall, your
defaults override file can set pre and post install and uninstall hooks. See
Gem::pre_install, Gem::pre_uninstall, Gem::post_install, Gem::post_uninstall.

## Bugs

You can submit bugs to the [RubyGems bug
tracker](https://github.com/rubygems/rubygems/issues) on GitHub

## Credits

RubyGems is currently maintained by Eric Hodel.

RubyGems was originally developed at RubyConf 2003 by:

*   Rich Kilmer  -- rich(at)infoether.com
*   Chad Fowler  -- chad(at)chadfowler.com
*   David Black  -- dblack(at)wobblini.net
*   Paul Brannan -- paul(at)atdesk.com
*   Jim Weirich   -- jim(at)weirichhouse.org


Contributors:

*   Gavin Sinclair     -- gsinclair(at)soyabean.com.au
*   George Marrows     -- george.marrows(at)ntlworld.com
*   Dick Davies        -- rasputnik(at)hellooperator.net
*   Mauricio Fernandez -- batsman.geo(at)yahoo.com
*   Simon Strandgaard  -- neoneye(at)adslhome.dk
*   Dave Glasser       -- glasser(at)mit.edu
*   Paul Duncan        -- pabs(at)pablotron.org
*   Ville Aine         -- vaine(at)cs.helsinki.fi
*   Eric Hodel         -- drbrain(at)segment7.net
*   Daniel Berger      -- djberg96(at)gmail.com
*   Phil Hagelberg     -- technomancy(at)gmail.com
*   Ryan Davis         -- ryand-ruby(at)zenspider.com
*   Evan Phoenix       -- evan(at)fallingsnow.net
*   Steve Klabnik      -- steve(at)steveklabnik.com


(If your name is missing, PLEASE let us know!)

See [LICENSE.txt](rdoc-ref:lib/rubygems/LICENSE.txt) for permissions.

Thanks!

-The RubyGems Team






---
# Constants:

DEFAULT_HOST
:   [not documented]
GEM_DEP_FILES
:   [not documented]
LOADED_SPECS_MUTEX
:   [not documented]
MARSHAL_SPEC_DIR
:   Location of Marshal quick gemspecs on remote repositories
RDoc
:   Gem::RDoc provides methods to generate RDoc and ri data for installed gems
    upon gem installation.

    This file is automatically required by RubyGems 1.9 and newer.
READ_BINARY_ERRORS
:   Exception classes used in a Gem.read_binary `rescue` statement. Not all of
    these are defined in Ruby 1.8.7, hence the need for this convoluted setup.
REPOSITORY_DEFAULT_GEM_SUBDIRECTORIES
:   Subdirectories in a gem repository for default gems
REPOSITORY_SUBDIRECTORIES
:   Subdirectories in a gem repository
RUBYGEMS_DIR
:   [not documented]
VERSION
:   [not documented]
WIN_PATTERNS
:   An Array of Regexps that match windows Ruby platforms.
WRITE_BINARY_ERRORS
:   Exception classes used in Gem.write_binary `rescue` statement. Not all of
    these are defined in Ruby 1.8.7.


# Class methods:

    bin_path
    binary_mode
    bindir
    clear_default_specs
    clear_paths
    config_file
    configuration
    configuration=
    datadir
    default_bindir
    default_cert_path
    default_dir
    default_exec_format
    default_ext_dir_for
    default_gems_use_full_paths?
    default_key_path
    default_path
    default_rubygems_dirs
    default_sources
    default_spec_cache_dir
    deflate
    detect_gemdeps
    dir
    done_installing
    done_installing_hooks
    ensure_default_gem_subdirectories
    ensure_gem_subdirectories
    env_requirement
    find_files
    find_home
    find_latest_files
    find_spec_for_exe
    find_unresolved_default_spec
    finish_resolve
    gemdeps
    gunzip
    gzip
    host
    host=
    inflate
    install
    latest_rubygems_version
    latest_spec_for
    latest_version_for
    load_env_plugins
    load_path_insert_index
    load_plugins
    load_yaml
    loaded_specs
    location_of_caller
    marshal_version
    needs
    path
    path_separator
    paths
    paths=
    platform_defaults
    platforms
    platforms=
    post_build
    post_build_hooks
    post_install
    post_install_hooks
    post_reset
    post_reset_hooks
    post_uninstall
    post_uninstall_hooks
    pre_install
    pre_install_hooks
    pre_reset
    pre_reset_hooks
    pre_uninstall
    pre_uninstall_hooks
    prefix
    read_binary
    refresh
    register_default_spec
    remove_unresolved_default_spec
    ruby
    ruby=
    ruby_api_version
    ruby_engine
    ruby_version
    rubygems_version
    searcher=
    sources
    sources=
    spec_cache_dir
    suffix_pattern
    suffixes
    time
    try_activate
    ui
    use_gemdeps
    use_paths
    user_dir
    user_home
    win_platform=
    win_platform?
    write_binary

# Attributes:

    attr_reader done_installing_hooks
    attr_reader gemdeps
    attr_reader loaded_specs
    attr_reader post_build_hooks
    attr_reader post_install_hooks
    attr_reader post_reset_hooks
    attr_reader post_uninstall_hooks
    attr_reader pre_install_hooks
    attr_reader pre_reset_hooks
    attr_reader pre_uninstall_hooks

# Gem::bin_path

(from ruby core)
---
    bin_path(name, exec_name = nil, *requirements)

---

Find the full path to the executable for gem `name`.  If the `exec_name` is
not given, the gem's default_executable is chosen, otherwise the specified
executable's path is returned.  `requirements` allows you to specify specific
gem versions.


# Gem::binary_mode

(from ruby core)
---
    binary_mode()

---

The mode needed to read a file as straight binary.


# Gem::bindir

(from ruby core)
---
    bindir(install_dir=Gem.dir)

---

The path where gem executables are to be installed.


# Gem::clear_default_specs

(from ruby core)
---
    clear_default_specs()

---

Clear default gem related variables. It is for test


# Gem::clear_paths

(from ruby core)
---
    clear_paths()

---

Reset the `dir` and `path` values.  The next time `dir` or `path` is
requested, the values will be calculated from scratch.  This is mainly used by
the unit tests to provide test isolation.


# Gem::config_file

(from ruby core)
---
    config_file()

---

The path to standard location of the user's .gemrc file.


# Gem::configuration

(from ruby core)
---
    configuration()

---

The standard configuration object for gems.


# Gem::configuration=

(from ruby core)
---
    configuration=(config)

---

Use the given configuration object (which implements the ConfigFile protocol)
as the standard configuration object.


# Gem::datadir

(from ruby core)
---
    datadir(gem_name)

---

The path to the data directory specified by the gem name.  If the package is
not available as a gem, return nil.


# Gem::default_bindir

(from ruby core)
---
    default_bindir()

---

The default directory for binaries


# Gem::default_cert_path

(from ruby core)
---
    default_cert_path()

---

The default signing certificate chain path


# Gem::default_dir

(from ruby core)
---
    default_dir()

---

Default home directory path to be used if an alternate value is not specified
in the environment


# Gem::default_exec_format

(from ruby core)
---
    default_exec_format()

---

Deduce Ruby's --program-prefix and --program-suffix from its install name


# Gem::default_ext_dir_for

(from ruby core)
---
    default_ext_dir_for(base_dir)

---

Returns binary extensions dir for specified RubyGems base dir or nil if such
directory cannot be determined.

By default, the binary extensions are located side by side with their Ruby
counterparts, therefore nil is returned


# Gem::default_gems_use_full_paths?

(from ruby core)
---
    default_gems_use_full_paths?()

---

Whether to expect full paths in default gems - true for non-MRI ruby
implementations


# Gem::default_key_path

(from ruby core)
---
    default_key_path()

---

The default signing key path


# Gem::default_path

(from ruby core)
---
    default_path()

---

Default gem load path


# Gem::default_rubygems_dirs

(from ruby core)
---
    default_rubygems_dirs()

---

Paths where RubyGems' .rb files and bin files are installed


# Gem::default_sources

(from ruby core)
---
    default_sources()

---

An Array of the default sources that come with RubyGems


# Gem::default_spec_cache_dir

(from ruby core)
---
    default_spec_cache_dir()

---

Default spec directory path to be used if an alternate value is not specified
in the environment


# Gem::deflate

(from ruby core)
---
    deflate(data)

---

A Zlib::Deflate.deflate wrapper


# Gem::detect_gemdeps

(from ruby core)
---
    detect_gemdeps(path = nil)

---

TODO remove with RubyGems 3.0


# Gem::dir

(from ruby core)
---
    dir()

---

The path where gems are to be installed.


# Gem::done_installing

(from ruby core)
---
    done_installing(&hook)

---

Adds a post-installs hook that will be passed a Gem::DependencyInstaller and a
list of installed specifications when Gem::DependencyInstaller#install is
complete


# Gem::ensure_default_gem_subdirectories

(from ruby core)
---
    ensure_default_gem_subdirectories(dir = Gem.dir, mode = nil)

---

Quietly ensure the Gem directory `dir` contains all the proper subdirectories
for handling default gems.  If we can't create a directory due to a permission
problem, then we will silently continue.

If `mode` is given, missing directories are created with this mode.

World-writable directories will never be created.


# Gem::ensure_gem_subdirectories

(from ruby core)
---
    ensure_gem_subdirectories(dir = Gem.dir, mode = nil)

---

Quietly ensure the Gem directory `dir` contains all the proper subdirectories.
 If we can't create a directory due to a permission problem, then we will
silently continue.

If `mode` is given, missing directories are created with this mode.

World-writable directories will never be created.


# Gem::env_requirement

(from ruby core)
---
    env_requirement(gem_name)

---


# Gem::find_files

(from ruby core)
---
    find_files(glob, check_load_path=true)

---

Returns a list of paths matching `glob` that can be used by a gem to pick up
features from other gems.  For example:

    Gem.find_files('rdoc/discover').each do |path| load path end

if `check_load_path` is true (the default), then find_files also searches
$LOAD_PATH for files as well as gems.

Note that find_files will return all files even if they are from different
versions of the same gem.  See also find_latest_files


# Gem::find_latest_files

(from ruby core)
---
    find_latest_files(glob, check_load_path=true)

---

Returns a list of paths matching `glob` from the latest gems that can be used
by a gem to pick up features from other gems.  For example:

    Gem.find_latest_files('rdoc/discover').each do |path| load path end

if `check_load_path` is true (the default), then find_latest_files also
searches $LOAD_PATH for files as well as gems.

Unlike find_files, find_latest_files will return only files from the latest
version of a gem.


# Gem::find_unresolved_default_spec

(from ruby core)
---
    find_unresolved_default_spec(path)

---

Find a Gem::Specification of default gem from `path`


# Gem::finish_resolve

(from ruby core)
---
    finish_resolve(request_set=Gem::RequestSet.new)

---


# Gem::gunzip

(from ruby core)
---
    gunzip(data)

---

Zlib::GzipReader wrapper that unzips `data`.


# Gem::gzip

(from ruby core)
---
    gzip(data)

---

Zlib::GzipWriter wrapper that zips `data`.


# Gem::host

(from ruby core)
---
    host()

---

Get the default RubyGems API host. This is normally `https://rubygems.org`.


# Gem::host=

(from ruby core)
---
    host=(host)

---

Set the default RubyGems API host.


# Gem::inflate

(from ruby core)
---
    inflate(data)

---

A Zlib::Inflate#inflate wrapper


# Gem::install

(from ruby core)
---
    install(name, version = Gem::Requirement.default, *options)

---

Top level install helper method. Allows you to install gems interactively:

    % irb
    >> Gem.install "minitest"
    Fetching: minitest-3.0.1.gem (100%)
    => [#<Gem::Specification:0x1013b4528 @name="minitest", ...>]


# Gem::latest_rubygems_version

(from ruby core)
---
    latest_rubygems_version()

---

Returns the latest release version of RubyGems.


# Gem::latest_spec_for

(from ruby core)
---
    latest_spec_for(name)

---

Returns the latest release-version specification for the gem `name`.


# Gem::latest_version_for

(from ruby core)
---
    latest_version_for(name)

---

Returns the version of the latest release-version of gem `name`


# Gem::load_env_plugins

(from ruby core)
---
    load_env_plugins()

---

Find all 'rubygems_plugin' files in $LOAD_PATH and load them


# Gem::load_path_insert_index

(from ruby core)
---
    load_path_insert_index()

---

The index to insert activated gem paths into the $LOAD_PATH. The activated
gem's paths are inserted before site lib directory by default.


# Gem::load_plugins

(from ruby core)
---
    load_plugins()

---

Find the 'rubygems_plugin' files in the latest installed gems and load them


# Gem::load_yaml

(from ruby core)
---
    load_yaml()

---

Loads YAML, preferring Psych


# Gem::location_of_caller

(from ruby core)
---
    location_of_caller()

---

The file name and line number of the caller of the caller of this method.


# Gem::marshal_version

(from ruby core)
---
    marshal_version()

---

The version of the Marshal format for your Ruby.


# Gem::needs

(from ruby core)
---
    needs() { |rs| ... }

---


# Gem::path

(from ruby core)
---
    path()

---


# Gem::path_separator

(from ruby core)
---
    path_separator()

---

How String Gem paths should be split.  Overridable for esoteric platforms.


# Gem::paths

(from ruby core)
---
    paths()

---

Retrieve the PathSupport object that RubyGems uses to lookup files.


# Gem::paths=

(from ruby core)
---
    paths=(env)

---

Initialize the filesystem paths to use from `env`. `env` is a hash-like object
(typically ENV) that is queried for 'GEM_HOME', 'GEM_PATH', and
'GEM_SPEC_CACHE' Keys for the `env` hash should be Strings, and values of the
hash should be Strings or `nil`.


# Gem::platform_defaults

(from ruby core)
---
    platform_defaults()

---

Default options for gem commands.

The options here should be structured as an array of string "gem" command
names as keys and a string of the default options as values.

Example:

def self.platform_defaults
    {
        'install' => '--no-rdoc --no-ri --env-shebang',
        'update' => '--no-rdoc --no-ri --env-shebang'
    }

end


# Gem::platforms

(from ruby core)
---
    platforms()

---

Array of platforms this RubyGems supports.


# Gem::platforms=

(from ruby core)
---
    platforms=(platforms)

---

Set array of platforms this RubyGems supports (primarily for testing).


# Gem::post_build

(from ruby core)
---
    post_build(&hook)

---

Adds a post-build hook that will be passed an Gem::Installer instance when
Gem::Installer#install is called.  The hook is called after the gem has been
extracted and extensions have been built but before the executables or gemspec
has been written.  If the hook returns `false` then the gem's files will be
removed and the install will be aborted.


# Gem::post_install

(from ruby core)
---
    post_install(&hook)

---

Adds a post-install hook that will be passed an Gem::Installer instance when
Gem::Installer#install is called


# Gem::post_reset

(from ruby core)
---
    post_reset(&hook)

---

Adds a hook that will get run after Gem::Specification.reset is run.


# Gem::post_uninstall

(from ruby core)
---
    post_uninstall(&hook)

---

Adds a post-uninstall hook that will be passed a Gem::Uninstaller instance and
the spec that was uninstalled when Gem::Uninstaller#uninstall is called


# Gem::pre_install

(from ruby core)
---
    pre_install(&hook)

---

Adds a pre-install hook that will be passed an Gem::Installer instance when
Gem::Installer#install is called.  If the hook returns `false` then the
install will be aborted.


# Gem::pre_reset

(from ruby core)
---
    pre_reset(&hook)

---

Adds a hook that will get run before Gem::Specification.reset is run.


# Gem::pre_uninstall

(from ruby core)
---
    pre_uninstall(&hook)

---

Adds a pre-uninstall hook that will be passed an Gem::Uninstaller instance and
the spec that will be uninstalled when Gem::Uninstaller#uninstall is called


# Gem::prefix

(from ruby core)
---
    prefix()

---

The directory prefix this RubyGems was installed at. If your prefix is in a
standard location (ie, rubygems is installed where you'd expect it to be),
then prefix returns nil.


# Gem::read_binary

(from ruby core)
---
    read_binary(path)

---

Safely read a file in binary mode on all platforms.


# Gem::refresh

(from ruby core)
---
    refresh()

---

Refresh available gems from disk.


# Gem::register_default_spec

(from ruby core)
---
    register_default_spec(spec)

---

Register a Gem::Specification for default gem.

Two formats for the specification are supported:

*   MRI 2.0 style, where spec.files contains unprefixed require names. The
    spec's filenames will be registered as-is.
*   New style, where spec.files contains files prefixed with paths from
    spec.require_paths. The prefixes are stripped before registering the
    spec's filenames. Unprefixed files are omitted.



# Gem::remove_unresolved_default_spec

(from ruby core)
---
    remove_unresolved_default_spec(spec)

---

Remove needless Gem::Specification of default gem from unresolved default gem
list


# Gem::ruby

(from ruby core)
---
    ruby()

---

The path to the running Ruby interpreter.


# Gem::ruby=

(from ruby core)
---
    ruby=(ruby)

---

Allows setting path to Ruby.  This method is available when requiring
'rubygems/test_case'


# Gem::ruby_api_version

(from ruby core)
---
    ruby_api_version()

---

Returns a String containing the API compatibility version of Ruby


# Gem::ruby_engine

(from ruby core)
---
    ruby_engine()

---

A wrapper around RUBY_ENGINE const that may not be defined


# Gem::ruby_version

(from ruby core)
---
    ruby_version()

---

A Gem::Version for the currently running Ruby.


# Gem::rubygems_version

(from ruby core)
---
    rubygems_version()

---

A Gem::Version for the currently running RubyGems


# Gem::searcher=

(from ruby core)
---
    searcher=(searcher)

---

Allows setting the gem path searcher.  This method is available when requiring
'rubygems/test_case'


# Gem::sources

(from ruby core)
---
    sources()

---

Returns an Array of sources to fetch remote gems from. Uses default_sources if
the sources list is empty.


# Gem::sources=

(from ruby core)
---
    sources=(new_sources)

---

Need to be able to set the sources without calling Gem.sources.replace since
that would cause an infinite loop.

DOC: This comment is not documentation about the method itself, it's more of a
code comment about the implementation.


# Gem::spec_cache_dir

(from ruby core)
---
    spec_cache_dir()

---


# Gem::suffix_pattern

(from ruby core)
---
    suffix_pattern()

---

Glob pattern for require-able path suffixes.


# Gem::suffixes

(from ruby core)
---
    suffixes()

---

Suffixes for require-able paths.


# Gem::time

(from ruby core)
---
    time(msg, width = 0, display = Gem.configuration.verbose) { || ... }

---

Prints the amount of time the supplied block takes to run using the debug UI
output.


# Gem::try_activate

(from ruby core)
---
    try_activate(path)

---

Try to activate a gem containing `path`. Returns true if activation succeeded
or wasn't needed because it was already activated. Returns false if it can't
find the path in a gem.


# Gem::ui

(from ruby core)
---
    ui()

---

Lazily loads DefaultUserInteraction and returns the default UI.


# Gem::use_gemdeps

(from ruby core)
---
    use_gemdeps(path = nil)

---

Looks for a gem dependency file at `path` and activates the gems in the file
if found.  If the file is not found an ArgumentError is raised.

If `path` is not given the RUBYGEMS_GEMDEPS environment variable is used, but
if no file is found no exception is raised.

If '-' is given for `path` RubyGems searches up from the current working
directory for gem dependency files (gem.deps.rb, Gemfile, Isolate) and
activates the gems in the first one found.

You can run this automatically when rubygems starts.  To enable, set the
`RUBYGEMS_GEMDEPS` environment variable to either the path of your gem
dependencies file or "-" to auto-discover in parent directories.

NOTE: Enabling automatic discovery on multiuser systems can lead to execution
of arbitrary code when used from directories outside your control.


# Gem::use_paths

(from ruby core)
---
    use_paths(home, *paths)

---

Use the `home` and `paths` values for Gem.dir and Gem.path.  Used mainly by
the unit tests to provide environment isolation.


# Gem::user_dir

(from ruby core)
---
    user_dir()

---

Path for gems in the user's home directory


# Gem::user_home

(from ruby core)
---
    user_home()

---

The home directory for the user.


# Gem::win_platform=

(from ruby core)
---
    win_platform=(val)

---

Allows toggling Windows behavior.  This method is available when requiring
'rubygems/test_case'


# Gem::win_platform?

(from ruby core)
---
    win_platform?()

---

Is this a windows platform?


# Gem::write_binary

(from ruby core)
---
    write_binary(path, data)

---

Safely write a file in binary mode on all platforms.


# Gem::find_home

(from ruby core)
---
    find_home()

---

Finds the user's home directory.


# Gem::find_spec_for_exe

(from ruby core)
---
    find_spec_for_exe(name, exec_name, requirements)

---


(from gem bundler-1.15.3)
---

---
(from gem yard-0.9.9)
---
# Class methods:

    source_index

# Gem::source_index

(from gem yard-0.9.9)
---
    source_index()

---

Returns the Gem::SourceIndex of specifications that are in the Gem.path


---
Also found in:
    gem capybara-2.14.4
    gem solargraph-0.9.2
    gem spring-2.0.2

