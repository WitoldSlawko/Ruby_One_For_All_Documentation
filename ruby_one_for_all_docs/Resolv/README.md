# Resolv < Object

(from ruby core)
---
Resolv is a thread-aware DNS resolver library written in Ruby.  Resolv can
handle multiple DNS requests concurrently without blocking the entire Ruby
interpreter.

See also resolv-replace.rb to replace the libc resolver with Resolv.

Resolv can look up various DNS resources using the DNS module directly.

Examples:

    p Resolv.getaddress "www.ruby-lang.org"
    p Resolv.getname "210.251.121.214"

    Resolv::DNS.open do |dns|
      ress = dns.getresources "www.ruby-lang.org", Resolv::DNS::Resource::IN::A
      p ress.map(&:address)
      ress = dns.getresources "ruby-lang.org", Resolv::DNS::Resource::IN::MX
      p ress.map { |r| [r.exchange.to_s, r.preference] }
    end

## Bugs

*   NIS is not supported.
*   /etc/nsswitch.conf is not supported.

---
# Constants:

AddressRegex
:   Address Regexp to use for matching IP addresses.
DefaultResolver
:   Default resolver to use for Resolv class methods.


# Class methods:

    each_address
    each_name
    getaddress
    getaddresses
    getname
    getnames
    new

# Instance methods:

    each_address
    each_name
    getaddress
    getaddresses
    getname
    getnames

# Resolv::each_address

(from ruby core)
---
    each_address(name, &block)

---

Iterates over all IP addresses for `name`.


# Resolv::each_name

(from ruby core)
---
    each_name(address, &proc)

---

Iterates over all hostnames for `address`.


# Resolv::getaddress

(from ruby core)
---
    getaddress(name)

---

Looks up the first IP address for `name`.


# Resolv::getaddresses

(from ruby core)
---
    getaddresses(name)

---

Looks up all IP address for `name`.


# Resolv::getname

(from ruby core)
---
    getname(address)

---

Looks up the hostname of `address`.


# Resolv::getnames

(from ruby core)
---
    getnames(address)

---

Looks up all hostnames for `address`.


# Resolv::new

(from ruby core)
---
    new(resolvers=[Hosts.new, DNS.new])

---

Creates a new Resolv using `resolvers`.


# Resolv#each_address

(from ruby core)
---
    each_address(name) { |name| ... }

---

Iterates over all IP addresses for `name`.


# Resolv#each_name

(from ruby core)
---
    each_name(address) { |name| ... }

---

Iterates over all hostnames for `address`.


# Resolv#getaddress

(from ruby core)
---
    getaddress(name)

---

Looks up the first IP address for `name`.


# Resolv#getaddresses

(from ruby core)
---
    getaddresses(name)

---

Looks up all IP address for `name`.


# Resolv#getname

(from ruby core)
---
    getname(address)

---

Looks up the hostname of `address`.


# Resolv#getnames

(from ruby core)
---
    getnames(address)

---

Looks up all hostnames for `address`.


