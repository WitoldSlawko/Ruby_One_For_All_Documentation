# IPAddr < Object

---
# Includes:
Comparable (from ruby core)

(from ruby core)
---
IPAddr provides a set of methods to manipulate an IP address.  Both IPv4 and
IPv6 are supported.

## Example

    require 'ipaddr'

    ipaddr1 = IPAddr.new "3ffe:505:2::1"

    p ipaddr1                   #=> #<IPAddr: IPv6:3ffe:0505:0002:0000:0000:0000:0000:0001/ffff:ffff:ffff:ffff:ffff:ffff:ffff:ffff>

    p ipaddr1.to_s              #=> "3ffe:505:2::1"

    ipaddr2 = ipaddr1.mask(48)  #=> #<IPAddr: IPv6:3ffe:0505:0002:0000:0000:0000:0000:0000/ffff:ffff:ffff:0000:0000:0000:0000:0000>

    p ipaddr2.to_s              #=> "3ffe:505:2::"

    ipaddr3 = IPAddr.new "192.168.2.0/24"

    p ipaddr3                   #=> #<IPAddr: IPv4:192.168.2.0/255.255.255.0>
---
# Constants:

IN4MASK
:   32 bit mask for IPv4
IN6FORMAT
:   Format string for IPv6
IN6MASK
:   128 bit mask for IPv6
RE_IPV4ADDRLIKE
:   Regexp *internally* used for parsing IPv4 address.
RE_IPV6ADDRLIKE_COMPRESSED
:   Regexp *internally* used for parsing IPv6 address.
RE_IPV6ADDRLIKE_FULL
:   Regexp *internally* used for parsing IPv6 address.


# Class methods:

    new
    new_ntoh
    ntop

# Instance methods:

    &
    <<
    <=>
    ==
    ===
    >>
    _reverse
    _to_string
    addr_mask
    coerce_other
    eql?
    family
    hash
    hton
    in6_addr
    in_addr
    include?
    inspect
    ip6_arpa
    ip6_int
    ipv4?
    ipv4_compat
    ipv4_compat?
    ipv4_mapped
    ipv4_mapped?
    ipv6?
    mask
    mask!
    native
    reverse
    set
    succ
    to_i
    to_range
    to_s
    to_string
    |
    ~

# Attributes:

    attr_reader family

# IPAddr::new

(from ruby core)
---
    new(addr = '::', family = Socket::AF_UNSPEC)

---

Creates a new ipaddr object either from a human readable IP address
representation in string, or from a packed in_addr value followed by an
address family.

In the former case, the following are the valid formats that will be
recognized: "address", "address/prefixlen" and "address/mask", where IPv6
address may be enclosed in square brackets (`[' and `]').  If a prefixlen or a
mask is specified, it returns a masked IP address.  Although the address
family is determined automatically from a specified string, you can specify
one explicitly by the optional second argument.

Otherwise an IP address is generated from a packed in_addr value and an
address family.

The IPAddr class defines many methods and operators, and some of those, such
as &, |, include? and ==, accept a string, or a packed in_addr value instead
of an IPAddr object.


# IPAddr::new_ntoh

(from ruby core)
---
    new_ntoh(addr)

---

Creates a new ipaddr containing the given network byte ordered string form of
an IP address.


# IPAddr::ntop

(from ruby core)
---
    ntop(addr)

---

Convert a network byte ordered string form of an IP address into human
readable form.


# IPAddr#&

(from ruby core)
---
    &(other)

---

Returns a new ipaddr built by bitwise AND.


# IPAddr#<<

(from ruby core)
---
    <<(num)

---

Returns a new ipaddr built by bitwise left shift.


# IPAddr#<=>

(from ruby core)
---
    <=>(other)

---

Compares the ipaddr with another.


# IPAddr#==

(from ruby core)
---
    ==(other)

---

Returns true if two ipaddrs are equal.


# IPAddr#===

(from ruby core)
---
    ===(other)

---


# IPAddr#>>

(from ruby core)
---
    >>(num)

---

Returns a new ipaddr built by bitwise right-shift.


# IPAddr#eql?

(from ruby core)
---
    eql?(other)

---

Checks equality used by Hash.


# IPAddr#hash

(from ruby core)
---
    hash()

---

Returns a hash value used by Hash, Set, and Array classes


# IPAddr#hton

(from ruby core)
---
    hton()

---

Returns a network byte ordered string form of the IP address.


# IPAddr#include?

(from ruby core)
---
    include?(other)

---

Returns true if the given ipaddr is in the range.

e.g.:
    require 'ipaddr'
    net1 = IPAddr.new("192.168.2.0/24")
    net2 = IPAddr.new("192.168.2.100")
    net3 = IPAddr.new("192.168.3.0")
    p net1.include?(net2)     #=> true
    p net1.include?(net3)     #=> false


# IPAddr#inspect

(from ruby core)
---
    inspect()

---

Returns a string containing a human-readable representation of the ipaddr.
("#<IPAddr: family:address/mask>")


# IPAddr#ip6_arpa

(from ruby core)
---
    ip6_arpa()

---

Returns a string for DNS reverse lookup compatible with RFC3172.


# IPAddr#ip6_int

(from ruby core)
---
    ip6_int()

---

Returns a string for DNS reverse lookup compatible with RFC1886.


# IPAddr#ipv4?

(from ruby core)
---
    ipv4?()

---

Returns true if the ipaddr is an IPv4 address.


# IPAddr#ipv4_compat

(from ruby core)
---
    ipv4_compat()

---

Returns a new ipaddr built by converting the native IPv4 address into an
IPv4-compatible IPv6 address.


# IPAddr#ipv4_compat?

(from ruby core)
---
    ipv4_compat?()

---

Returns true if the ipaddr is an IPv4-compatible IPv6 address.


# IPAddr#ipv4_mapped

(from ruby core)
---
    ipv4_mapped()

---

Returns a new ipaddr built by converting the native IPv4 address into an
IPv4-mapped IPv6 address.


# IPAddr#ipv4_mapped?

(from ruby core)
---
    ipv4_mapped?()

---

Returns true if the ipaddr is an IPv4-mapped IPv6 address.


# IPAddr#ipv6?

(from ruby core)
---
    ipv6?()

---

Returns true if the ipaddr is an IPv6 address.


# IPAddr#mask

(from ruby core)
---
    mask(prefixlen)

---

Returns a new ipaddr built by masking IP address with the given
prefixlen/netmask. (e.g. 8, 64, "255.255.255.0", etc.)


# IPAddr#native

(from ruby core)
---
    native()

---

Returns a new ipaddr built by converting the IPv6 address into a native IPv4
address.  If the IP address is not an IPv4-mapped or IPv4-compatible IPv6
address, returns self.


# IPAddr#reverse

(from ruby core)
---
    reverse()

---

Returns a string for DNS reverse lookup.  It returns a string in RFC3172 form
for an IPv6 address.


# IPAddr#succ

(from ruby core)
---
    succ()

---

Returns the successor to the ipaddr.


# IPAddr#to_i

(from ruby core)
---
    to_i()

---

Returns the integer representation of the ipaddr.


# IPAddr#to_range

(from ruby core)
---
    to_range()

---

Creates a Range object for the network address.


# IPAddr#to_s

(from ruby core)
---
    to_s()

---

Returns a string containing the IP address representation.


# IPAddr#to_string

(from ruby core)
---
    to_string()

---

Returns a string containing the IP address representation in canonical form.


# IPAddr#|

(from ruby core)
---
    |(other)

---

Returns a new ipaddr built by bitwise OR.


# IPAddr#~

(from ruby core)
---
    ~()

---

Returns a new ipaddr built by bitwise negation.


# IPAddr#mask!

(from ruby core)
---
    mask!(mask)

---

Set current netmask to given mask.


# IPAddr#set

(from ruby core)
---
    set(addr, *family)

---

Set +@addr+, the internal stored ip address, to given `addr`. The parameter
`addr` is validated using the first `family` member, which is
`Socket::AF_INET` or `Socket::AF_INET6`.


# IPAddr#_reverse

(from ruby core)
---
    _reverse()

---


# IPAddr#_to_string

(from ruby core)
---
    _to_string(addr)

---


# IPAddr#addr_mask

(from ruby core)
---
    addr_mask(addr)

---


# IPAddr#coerce_other

(from ruby core)
---
    coerce_other(other)

---


# IPAddr#in6_addr

(from ruby core)
---
    in6_addr(left)

---


# IPAddr#in_addr

(from ruby core)
---
    in_addr(addr)

---


