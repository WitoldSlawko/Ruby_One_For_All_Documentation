# Capybara

---
# Extended by:
(from gem capybara-2.14.4)
    Forwardable
    Capybara::DSL

(from gem capybara-2.14.4)
---





































---
# Constants:

Query
:   @deprecated This class and its methods are not supposed to be used by
    users of Capybara's public API.
        It may be removed in future versions of Capybara.
VERSION
:   [not documented]


# Class methods:

    HTML
    add_selector
    config
    configure
    current_driver
    current_driver=
    current_session
    drivers
    included
    mode
    modify_selector
    register_driver
    register_server
    reset!
    reset_sessions!
    run_default_server
    servers
    session_name
    session_name=
    session_options
    session_pool
    string
    use_default_driver
    using_driver
    using_session
    using_wait_time

# Capybara::add_selector

(from gem capybara-2.14.4)
---
    add_selector(name, &block)

---

Add a new selector to Capybara. Selectors can be used by various methods in
Capybara to find certain elements on the page in a more convenient way. For
example adding a selector to find certain table rows might look like this:

    Capybara.add_selector(:row) do
      xpath { |num| ".//tbody/tr[#{num}]" }
    end

This makes it possible to use this selector in a variety of ways:

    find(:row, 3)
    page.find('table#myTable').find(:row, 3).text
    page.find('table#myTable').has_selector?(:row, 3)
    within(:row, 3) { expect(page).to have_content('$100.000') }

Here is another example:

    Capybara.add_selector(:id) do
      xpath { |id| XPath.descendant[XPath.attr(:id) == id.to_s] }
    end

Note that this particular selector already ships with Capybara.

@param [Symbol] name    The name of the selector to add @yield                
 A block executed in the context of the new {Capybara::Selector}


# Capybara::configure

(from gem capybara-2.14.4)
---
    configure() { |configure_deprecator| ... }

---

Configure Capybara to suit your needs.

    Capybara.configure do |config|
      config.run_server = false
      config.app_host   = 'http://www.google.com'
    end

### Configurable options

app_host = String/nil
:   The default host to use when giving a relative URL to visit, must be a
    valid URL e.g. http://www.example.com
always_include_port = Boolean
:   Whether the Rack server's port should automatically be inserted into every
    visited URL (Default: false)
asset_host = String
:   Where dynamic assets are hosted - will be prepended to relative asset
    locations if present (Default: nil)
run_server = Boolean
:   Whether to start a Rack server for the given Rack app (Default: true)
raise_server_errors = Boolean
:   Should errors raised in the server be raised in the tests? (Default: true)
server_errors = Array<Class>
:   Error classes that should be raised in the tests if they are raised in the
    server and Capybara.raise_server_errors is true (Default: [StandardError])
default_selector = :css/:xpath
:   Methods which take a selector use the given type by default (Default:
    :css)
default_max_wait_time = Numeric
:   The maximum number of seconds to wait for asynchronous processes to finish
    (Default: 2)
ignore_hidden_elements = Boolean
:   Whether to ignore hidden elements on the page (Default: true)
automatic_reload = Boolean
:   Whether to automatically reload elements as Capybara is waiting (Default:
    true)
save_path = String
:   Where to put pages saved through save_(page|screenshot),
    save_and_open_(page|screenshot) (Default: Dir.pwd)
wait_on_first_by_default = Boolean
:   Whether Node#first defaults to Capybara waiting behavior for at least 1
    element to match (Default: false)
automatic_label_click = Boolean
:   Whether Node#choose, Node#check, Node#uncheck will attempt to click the
    associated label element if the checkbox/radio button are non-visible
    (Default: false)
enable_aria_label = Boolean
:   Whether fields, links, and buttons will match against aria-label attribute
    (Default: false)
reuse_server = Boolean
:   Reuse the server thread between multiple sessions using the same app
    object (Default: true)
threadsafe = Boolean
:   Whether sessions can be configured individually (Default: false)
server = Symbol
:   The name of the registered server to use when running the app under test
    (Default: :webrick)


### DSL Options

when using capybara/dsl, the following options are also available:

default_driver = Symbol
:   The name of the driver to use by default. (Default: :rack_test)
javascript_driver = Symbol
:   The name of a driver to use for JavaScript enabled tests. (Default:
    :selenium)



# Capybara::current_driver

(from gem capybara-2.14.4)
---
    current_driver()

---

@return [Symbol]    The name of the driver currently in use


# Capybara::current_driver=

(from gem capybara-2.14.4)
---
    current_driver=(name)

---


# Capybara::current_session

(from gem capybara-2.14.4)
---
    current_session()

---

The current Capybara::Session based on what is set as Capybara.app and
Capybara.current_driver

@return [Capybara::Session]     The currently used session


# Capybara::drivers

(from gem capybara-2.14.4)
---
    drivers()

---


# Capybara::included

(from gem capybara-2.14.4)
---
    included(base)

---


# Capybara::mode

(from gem capybara-2.14.4)
---
    mode()

---


# Capybara::modify_selector

(from gem capybara-2.14.4)
---
    modify_selector(name, &block)

---

Modify a selector previously created by {Capybara.add_selector}. For example,
adding a new filter to the :button selector to filter based on button style (a
class) might look like this

    Capybara.modify_selector(:button) do
      filter (:style, valid_values: [:primary, :secondary]) { |node, style| node[:class].split.include? "btn-#{style}" }
    end

@param [Symbol] name    The name of the selector to modify @yield             
    A block executed in the context of the existing {Capybara::Selector}


# Capybara::register_driver

(from gem capybara-2.14.4)
---
    register_driver(name, &block)

---

Register a new driver for Capybara.

    Capybara.register_driver :rack_test do |app|
      Capybara::RackTest::Driver.new(app)
    end

@param [Symbol] name                    The name of the new driver @yield
[app]                            This block takes a rack app and returns a
Capybara driver @yieldparam [<Rack>] app                The rack application
that this driver runs against. May be nil. @yieldreturn
[Capybara::Driver::Base]   A Capybara driver instance


# Capybara::register_server

(from gem capybara-2.14.4)
---
    register_server(name, &block)

---

Register a new server for Capybara.

    Capybara.register_server :webrick do |app, port, host|
      require 'rack/handler/webrick'
      Rack::Handler::WEBrick.run(app, ...)
    end

@param [Symbol] name                    The name of the new driver @yield
[app, port, host]                This block takes a rack app and a port and
returns a rack server listening on that port @yieldparam [<Rack>] app         
      The rack application that this server will contain. @yieldparam port    
                   The port number the server should listen on @yieldparam
host                        The host/ip to bind to @yieldreturn
[Capybara::Driver::Base]   A Capybara driver instance


# Capybara::reset!

(from gem capybara-2.14.4)
---
    reset!()

---


# Capybara::reset_sessions!

(from gem capybara-2.14.4)
---
    reset_sessions!()

---

Reset sessions, cleaning out the pool of sessions. This will remove any
session information such as cookies.


# Capybara::run_default_server

(from gem capybara-2.14.4)
---
    run_default_server(app, port)

---

Runs Capybara's default server for the given application and port under most
circumstances you should not have to call this method manually.

@param [Rack Application] app    The rack application to run @param [Integer]
port              The port to run the application on


# Capybara::servers

(from gem capybara-2.14.4)
---
    servers()

---


# Capybara::session_name

(from gem capybara-2.14.4)
---
    session_name()

---

The current session name.

@return [Symbol]    The name of the currently used session.


# Capybara::session_name=

(from gem capybara-2.14.4)
---
    session_name=(name)

---


# Capybara::session_options

(from gem capybara-2.14.4)
---
    session_options()

---


# Capybara::string

(from gem capybara-2.14.4)
---
    string(html)

---

Wraps the given string, which should contain an HTML document or fragment in a
{Capybara::Node::Simple} which exposes all {Capybara::Node::Matchers},
{Capybara::Node::Finders} and {Capybara::Node::DocumentMatchers}. This allows
you to query any string containing HTML in the exact same way you would query
the current document in a Capybara session.

Example: A single element

    node = Capybara.string('<a href="foo">bar</a>')
    anchor = node.first('a')
    anchor[:href] #=> 'foo'
    anchor.text #=> 'bar'

Example: Multiple elements

    node = Capybara.string <<-HTML
      <ul>
        <li id="home">Home</li>
        <li id="projects">Projects</li>
      </ul>
    HTML

    node.find('#projects').text # => 'Projects'
    node.has_selector?('li#home', text: 'Home')
    node.has_selector?('#projects')
    node.find('ul').find('li:first-child').text # => 'Home'

@param [String] html              An html fragment or document @return
[Capybara::Node::Simple]   A node which has Capybara's finders and matchers


# Capybara::use_default_driver

(from gem capybara-2.14.4)
---
    use_default_driver()

---

Use the default driver as the current driver


# Capybara::using_driver

(from gem capybara-2.14.4)
---
    using_driver(driver) { || ... }

---

Yield a block using a specific driver


# Capybara::using_session

(from gem capybara-2.14.4)
---
    using_session(name) { || ... }

---

Yield a block using a specific session name.


# Capybara::using_wait_time

(from gem capybara-2.14.4)
---
    using_wait_time(seconds) { || ... }

---

Yield a block using a specific wait time


# Capybara::config

(from gem capybara-2.14.4)
---
    config()

---


# Capybara::session_pool

(from gem capybara-2.14.4)
---
    session_pool()

---


