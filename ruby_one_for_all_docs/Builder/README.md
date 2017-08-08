# Builder

(from gem builder-3.2.3)
---
BlankSlate has been promoted to a top level name and is now available as a
standalone gem.  We make the name available in the Builder namespace for
compatibility.





---
# Constants:

BlankSlate
:   BlankSlate provides an abstract base class with no predefined methods
    (except for `_\*send_`* and `_\*id_`*). BlankSlate is useful as a base
    class when writing classes that depend upon `method_missing` (e.g. dynamic
    proxies).
VERSION
:   [not documented]
VERSION_NUMBERS
:   [not documented]


# Class methods:

    check_for_name_collision

# Builder::check_for_name_collision

(from gem builder-3.2.3)
---
    check_for_name_collision(klass, method_name, defined_constant=nil)

---


