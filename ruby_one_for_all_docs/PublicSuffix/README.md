# PublicSuffix

(from gem public_suffix-2.0.5)
---
PublicSuffix is a Ruby domain name parser based on the Public Suffix List.

The [Public Suffix List](https://publicsuffix.org) is a cross-vendor
initiative to provide an accurate list of domain name suffixes.

The Public Suffix List is an initiative of the Mozilla Project, but is
maintained as a community resource. It is available for use in any software,
but was originally created to meet the needs of browser manufacturers.

# Public Suffix

Domain name parser based on the Public Suffix List.

Copyright (c) 2009-2017 Simone Carletti <weppos@weppos.net>

# Public Suffix

Domain name parser based on the Public Suffix List.

Copyright (c) 2009-2017 Simone Carletti <weppos@weppos.net>

# Public Suffix

Domain name parser based on the Public Suffix List.

Copyright (c) 2009-2017 Simone Carletti <weppos@weppos.net>

# Public Suffix

Domain name parser based on the Public Suffix List.

Copyright (c) 2009-2017 Simone Carletti <weppos@weppos.net>

# Public Suffix

Domain name parser based on the Public Suffix List.

Copyright (c) 2009-2017 Simone Carletti <weppos@weppos.net>
---
# Constants:

BANG
:   [not documented]
DOT
:   [not documented]
STAR
:   [not documented]
VERSION
:   The current library version.


# Class methods:

    decompose
    domain
    normalize
    parse
    valid?

# PublicSuffix::decompose

(from gem public_suffix-2.0.5)
---
    decompose(name, rule)

---

private


# PublicSuffix::domain

(from gem public_suffix-2.0.5)
---
    domain(name, **options)

---

Attempt to parse the name and returns the domain, if valid.

This method doesn't raise. Instead, it returns nil if the domain is not valid
for whatever reason.

@param  [String, #to_s] name The domain name or fully qualified domain name to
parse. @param  [PublicSuffix::List] list The rule list to search, defaults to
the default {PublicSuffix::List} @param  [Boolean] ignore_private @return
[String]


# PublicSuffix::normalize

(from gem public_suffix-2.0.5)
---
    normalize(name)

---

Pretend we know how to deal with user input.


# PublicSuffix::parse

(from gem public_suffix-2.0.5)
---
    parse(name, list: List.default, default_rule: list.default_rule, ignore_private: false)

---

Parses `name` and returns the {PublicSuffix::Domain} instance.

@example Parse a valid domain
    PublicSuffix.parse("google.com")
    # => #<PublicSuffix::Domain ...>

@example Parse a valid subdomain
    PublicSuffix.parse("www.google.com")
    # => #<PublicSuffix::Domain ...>

@example Parse a fully qualified domain
    PublicSuffix.parse("google.com.")
    # => #<PublicSuffix::Domain ...>

@example Parse a fully qualified domain (subdomain)
    PublicSuffix.parse("www.google.com.")
    # => #<PublicSuffix::Domain ...>

@example Parse an invalid domain
    PublicSuffix.parse("x.yz")
    # => PublicSuffix::DomainInvalid

@example Parse an URL (not supported, only domains)
    PublicSuffix.parse("http://www.google.com")
    # => PublicSuffix::DomainInvalid

@param  [String, #to_s] name The domain name or fully qualified domain name to
parse. @param  [PublicSuffix::List] list The rule list to search, defaults to
the default {PublicSuffix::List} @param  [Boolean] ignore_private @return
[PublicSuffix::Domain]

@raise [PublicSuffix::DomainInvalid]
    If domain is not a valid domain.

@raise [PublicSuffix::DomainNotAllowed]
    If a rule for +domain+ is found, but the rule doesn't allow +domain+.


# PublicSuffix::valid?

(from gem public_suffix-2.0.5)
---
    valid?(name, list: List.default, default_rule: list.default_rule, ignore_private: false)

---

Checks whether `domain` is assigned and allowed, without actually parsing it.

This method doesn't care whether domain is a domain or subdomain. The
validation is performed using the default {PublicSuffix::List}.

@example Validate a valid domain
    PublicSuffix.valid?("example.com")
    # => true

@example Validate a valid subdomain
    PublicSuffix.valid?("www.example.com")
    # => true

@example Validate a not-listed domain
    PublicSuffix.valid?("example.tldnotlisted")
    # => true

@example Validate a not-allowed domain
    PublicSuffix.valid?("example.do")
    # => false
    PublicSuffix.valid?("www.example.do")
    # => true

@example Validate a fully qualified domain
    PublicSuffix.valid?("google.com.")
    # => true
    PublicSuffix.valid?("www.google.com.")
    # => true

@example Check an URL (which is not a valid domain)
    PublicSuffix.valid?("http://www.example.com")
    # => false

@param  [String, #to_s] name The domain name or fully qualified domain name to
validate. @param  [Boolean] ignore_private @return [Boolean]


