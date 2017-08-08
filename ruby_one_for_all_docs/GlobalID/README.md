# GlobalID < Object

(from gem globalid-0.4.0)
---





---
# Class methods:

    app
    app=
    create
    find
    new
    parse
    parse_encoded_gid
    repad_gid

# Instance methods:

    ==
    find
    model_class
    to_param
    uri

# Attributes:

    attr_reader app
    attr_reader uri

# GlobalID::app=

(from gem globalid-0.4.0)
---
    app=(app)

---


# GlobalID::create

(from gem globalid-0.4.0)
---
    create(model, options = {})

---


# GlobalID::find

(from gem globalid-0.4.0)
---
    find(gid, options = {})

---


# GlobalID::new

(from gem globalid-0.4.0)
---
    new(gid, options = {})

---


# GlobalID::parse

(from gem globalid-0.4.0)
---
    parse(gid, options = {})

---


# GlobalID::parse_encoded_gid

(from gem globalid-0.4.0)
---
    parse_encoded_gid(gid, options)

---


# GlobalID::repad_gid

(from gem globalid-0.4.0)
---
    repad_gid(gid)

---

We removed the base64 padding character = during #to_param, now we're adding
it back so decoding will work


# GlobalID#==

(from gem globalid-0.4.0)
---
    ==(other)

---


# GlobalID#find

(from gem globalid-0.4.0)
---
    find(options = {})

---


# GlobalID#model_class

(from gem globalid-0.4.0)
---
    model_class()

---


# GlobalID#to_param

(from gem globalid-0.4.0)
---
    to_param()

---


