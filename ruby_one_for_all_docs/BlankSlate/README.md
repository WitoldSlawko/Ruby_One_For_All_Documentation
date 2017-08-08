# BlankSlate < Object

(from gem builder-3.2.3)
---
BlankSlate provides an abstract base class with no predefined methods (except
for `_\*send_`* and `_\*id_`*). BlankSlate is useful as a base class when
writing classes that depend upon `method_missing` (e.g. dynamic proxies).
---
# Class methods:

    find_hidden_method
    hide
    reveal

# BlankSlate::find_hidden_method

(from gem builder-3.2.3)
---
    find_hidden_method(name)

---


# BlankSlate::hide

(from gem builder-3.2.3)
---
    hide(name)

---

Hide the method named `name` in the BlankSlate class.  Don't hide
`instance_eval` or any method beginning with "__".


# BlankSlate::reveal

(from gem builder-3.2.3)
---
    reveal(name)

---

Redefine a previously hidden method so that it may be called on a blank slate
object.


