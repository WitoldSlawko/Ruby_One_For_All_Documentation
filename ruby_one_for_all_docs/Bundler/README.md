# Bundler

(from gem bundler-1.15.3)
---

































































Some versions of the Bundler 1.1 RC series introduced corrupted lockfiles.
There were two major problems:

*   multiple copies of the same GIT section appeared in the lockfile
*   when this happened, those sections got multiple copies of gems in those
    sections.


As a result, Bundler 1.1 contains code that fixes the earlier corruption. We
will remove this fix-up code in Bundler 1.2.











































Ruby 1.9.3 and old RubyGems don't play nice with frozen version strings
rubocop:disable MutableConstant



---
# Constants:

Deprecate
:   [not documented]
FREEBSD
:   [not documented]
NULL
:   [not documented]
ORIGINAL_ENV
:   [not documented]
SUDO_MUTEX
:   [not documented]
VERSION
:   We're doing this because we might write tests that deal with other
    versions of bundler and we are unsure how to handle this better.
WINDOWS
:   [not documented]
YamlLibrarySyntaxError
:   [not documented]


# Class methods:

    app_cache
    app_config_path
    bin_path
    bundle_path
    cache
    clean_env
    clean_exec
    clean_system
    clear_gemspec_cache
    configure
    configure_gem_home
    configure_gem_home_and_path
    configure_gem_path
    current_ruby
    default_bundle_dir
    default_gemfile
    default_lockfile
    definition
    environment
    eval_gemspec
    eval_yaml_gemspec
    feature_flag
    git_present?
    home
    install_path
    load
    load_gemspec
    load_gemspec_uncached
    load_marshal
    local_platform
    locked_gems
    mkdir_p
    original_env
    overwrite_loaded_gem_version
    read_file
    require
    require_thor_actions
    requires_sudo?
    reset!
    reset_paths!
    reset_rubygems!
    rm_rf
    root
    ruby_scope
    rubygems
    settings
    setup
    specs_path
    sudo
    system_bindir
    tmp
    tmp_home_path
    ui
    ui=
    user_bundle_path
    user_cache
    user_home
    which
    with_clean_env
    with_env
    with_friendly_errors
    with_original_env

# Attributes:

    attr_writer bundle_path

# Bundler::app_cache

(from gem bundler-1.15.3)
---
    app_cache(custom_path = nil)

---


# Bundler::app_config_path

(from gem bundler-1.15.3)
---
    app_config_path()

---


# Bundler::bin_path

(from gem bundler-1.15.3)
---
    bin_path()

---

Returns absolute location of where binstubs are installed to.


# Bundler::bundle_path

(from gem bundler-1.15.3)
---


# Bundler::cache

(from gem bundler-1.15.3)
---
    cache()

---


# Bundler::clean_env

(from gem bundler-1.15.3)
---
    clean_env()

---

@deprecated Use `original_env` instead @return [Hash] Environment with all
bundler-related variables removed


# Bundler::clean_exec

(from gem bundler-1.15.3)
---
    clean_exec(*args)

---


# Bundler::clean_system

(from gem bundler-1.15.3)
---
    clean_system(*args)

---


# Bundler::clear_gemspec_cache

(from gem bundler-1.15.3)
---
    clear_gemspec_cache()

---


# Bundler::configure

(from gem bundler-1.15.3)
---
    configure()

---


# Bundler::current_ruby

(from gem bundler-1.15.3)
---
    current_ruby()

---

Returns current version of Ruby

@return [CurrentRuby] Current version of Ruby


# Bundler::default_bundle_dir

(from gem bundler-1.15.3)
---
    default_bundle_dir()

---


# Bundler::default_gemfile

(from gem bundler-1.15.3)
---
    default_gemfile()

---


# Bundler::default_lockfile

(from gem bundler-1.15.3)
---
    default_lockfile()

---


# Bundler::definition

(from gem bundler-1.15.3)
---
    definition(unlock = nil)

---

Returns an instance of Bundler::Definition for given Gemfile and lockfile

@param unlock [Hash, Boolean, nil] Gems that have been requested
    to be updated or true if all gems should be updated

@return [Bundler::Definition]


# Bundler::environment

(from gem bundler-1.15.3)
---
    environment()

---


# Bundler::feature_flag

(from gem bundler-1.15.3)
---
    feature_flag()

---


# Bundler::git_present?

(from gem bundler-1.15.3)
---
    git_present?()

---


# Bundler::home

(from gem bundler-1.15.3)
---
    home()

---


# Bundler::install_path

(from gem bundler-1.15.3)
---
    install_path()

---


# Bundler::load

(from gem bundler-1.15.3)
---
    load()

---


# Bundler::load_gemspec

(from gem bundler-1.15.3)
---
    load_gemspec(file, validate = false)

---


# Bundler::load_gemspec_uncached

(from gem bundler-1.15.3)
---
    load_gemspec_uncached(file, validate = false)

---


# Bundler::load_marshal

(from gem bundler-1.15.3)
---
    load_marshal(data)

---


# Bundler::local_platform

(from gem bundler-1.15.3)
---
    local_platform()

---


# Bundler::locked_gems

(from gem bundler-1.15.3)
---
    locked_gems()

---


# Bundler::mkdir_p

(from gem bundler-1.15.3)
---
    mkdir_p(path)

---


# Bundler::original_env

(from gem bundler-1.15.3)
---
    original_env()

---

@return [Hash] Environment present before Bundler was activated


# Bundler::read_file

(from gem bundler-1.15.3)
---
    read_file(file)

---


# Bundler::require

(from gem bundler-1.15.3)
---
    require(*groups)

---


# Bundler::require_thor_actions

(from gem bundler-1.15.3)
---
    require_thor_actions()

---


# Bundler::requires_sudo?

(from gem bundler-1.15.3)
---
    requires_sudo?()

---


# Bundler::reset!

(from gem bundler-1.15.3)
---
    reset!()

---


# Bundler::reset_paths!

(from gem bundler-1.15.3)
---
    reset_paths!()

---


# Bundler::reset_rubygems!

(from gem bundler-1.15.3)
---
    reset_rubygems!()

---


# Bundler::rm_rf

(from gem bundler-1.15.3)
---
    rm_rf(path)

---


# Bundler::root

(from gem bundler-1.15.3)
---
    root()

---


# Bundler::ruby_scope

(from gem bundler-1.15.3)
---
    ruby_scope()

---


# Bundler::rubygems

(from gem bundler-1.15.3)
---
    rubygems()

---


# Bundler::settings

(from gem bundler-1.15.3)
---
    settings()

---


# Bundler::setup

(from gem bundler-1.15.3)
---
    setup(*groups)

---


# Bundler::specs_path

(from gem bundler-1.15.3)
---
    specs_path()

---


# Bundler::sudo

(from gem bundler-1.15.3)
---
    sudo(str)

---


# Bundler::system_bindir

(from gem bundler-1.15.3)
---
    system_bindir()

---


# Bundler::tmp

(from gem bundler-1.15.3)
---
    tmp(name = Process.pid.to_s)

---


# Bundler::tmp_home_path

(from gem bundler-1.15.3)
---
    tmp_home_path(login, warning)

---


# Bundler::ui

(from gem bundler-1.15.3)
---
    ui()

---


# Bundler::ui=

(from gem bundler-1.15.3)
---
    ui=(ui)

---


# Bundler::user_bundle_path

(from gem bundler-1.15.3)
---
    user_bundle_path()

---


# Bundler::user_cache

(from gem bundler-1.15.3)
---
    user_cache()

---


# Bundler::user_home

(from gem bundler-1.15.3)
---
    user_home()

---


# Bundler::which

(from gem bundler-1.15.3)
---
    which(executable)

---


# Bundler::with_clean_env

(from gem bundler-1.15.3)
---
    with_clean_env() { || ... }

---


# Bundler::with_friendly_errors

(from gem bundler-1.15.3)
---
    with_friendly_errors() { || ... }

---


# Bundler::with_original_env

(from gem bundler-1.15.3)
---
    with_original_env() { || ... }

---


# Bundler::configure_gem_home

(from gem bundler-1.15.3)
---
    configure_gem_home()

---


# Bundler::configure_gem_home_and_path

(from gem bundler-1.15.3)
---
    configure_gem_home_and_path()

---


# Bundler::configure_gem_path

(from gem bundler-1.15.3)
---
    configure_gem_path(env = ENV, settings = self.settings)

---


# Bundler::eval_gemspec

(from gem bundler-1.15.3)
---
    eval_gemspec(path, contents)

---


# Bundler::eval_yaml_gemspec

(from gem bundler-1.15.3)
---
    eval_yaml_gemspec(path, contents)

---


# Bundler::overwrite_loaded_gem_version

(from gem bundler-1.15.3)
---
    overwrite_loaded_gem_version()

---


# Bundler::with_env

(from gem bundler-1.15.3)
---
    with_env(env) { || ... }

---

@param env [Hash]


