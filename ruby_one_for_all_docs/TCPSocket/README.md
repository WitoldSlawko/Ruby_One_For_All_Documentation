# TCPSocket < IPSocket

(from ruby core)
---
TCPSocket represents a TCP/IP client socket.

A simple client may look like:

    require 'socket'

    s = TCPSocket.new 'localhost', 2000

    while line = s.gets # Read lines from socket
      puts line         # and print them
    end

    s.close             # close socket when done

---
# Class methods:

    gethostbyname
    new

# TCPSocket::gethostbyname

(from ruby core)
---
    TCPSocket.gethostbyname(hostname) => [official_hostname, alias_hostnames, address_family, *address_list]

---

Lookups host information by *hostname*.

    TCPSocket.gethostbyname("localhost")
    #=> ["localhost", ["hal"], 2, "127.0.0.1"]


# TCPSocket::new

(from ruby core)
---
    new(host, serv, *rest)

---


