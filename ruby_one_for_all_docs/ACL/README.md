# ACL < Object

(from ruby core)
---
Simple Access Control Lists.

Access control lists are composed of "allow" and "deny" halves to control
access.  Use "all" or "*" to match any address.  To match a specific address
use any address or address mask that IPAddr can understand.

Example:

    list = %w[
      deny all
      allow 192.168.1.1
      allow ::ffff:192.168.1.2
      allow 192.168.1.3
    ]

    # From Socket#peeraddr, see also ACL#allow_socket?
    addr = ["AF_INET", 10, "lc630", "192.168.1.3"]

    acl = ACL.new
    p acl.allow_addr?(addr) # => true

    acl = ACL.new(list, ACL::DENY_ALLOW)
    p acl.allow_addr?(addr) # => true
---
# Constants:

ALLOW_DENY
:   Default to allow
DENY_ALLOW
:   Default to deny
VERSION
:   The current version of ACL


# Class methods:

    new

# Instance methods:

    allow_addr?
    allow_socket?
    install_list

# ACL::new

(from ruby core)
---
    new(list=nil, order = DENY_ALLOW)

---

Creates a new ACL from `list` with an evaluation `order` of DENY_ALLOW or
ALLOW_DENY.

An ACL `list` is an Array of "allow" or "deny" and an address or address mask
or "all" or "*" to match any address:

    %w[
      deny all
      allow 192.0.2.2
      allow 192.0.2.128/26
    ]


# ACL#allow_addr?

(from ruby core)
---
    allow_addr?(addr)

---

Allow connections from addrinfo `addr`?  It must be formatted like
Socket#peeraddr:

    ["AF_INET", 10, "lc630", "192.0.2.1"]


# ACL#allow_socket?

(from ruby core)
---
    allow_socket?(soc)

---

Allow connections from Socket `soc`?


# ACL#install_list

(from ruby core)
---
    install_list(list)

---

Adds `list` of ACL entries to this ACL.


