# PG

---
# Includes:
PG::Constants (from gem pg-0.21.0)

(from gem pg-0.21.0)
---

The top-level PG namespace.




---
# Constants:

REVISION
:   VCS revision
VERSION
:   Library version


# Class methods:

    connect
    init_openssl
    init_ssl
    isthreadsafe
    library_version
    version_string

# PG::connect

(from gem pg-0.21.0)
---
    connect( *args )

---

Convenience alias for PG::Connection.new.


# PG::init_openssl

(from gem pg-0.21.0)
---
    PG.init_openssl(do_ssl, do_crypto)  -> nil

---

Allows applications to select which security libraries to initialize.

If your application initializes libssl and/or libcrypto libraries and libpq is
built with SSL support, you should call PG.init_openssl() to tell libpq that
the libssl and/or libcrypto libraries have been initialized by your
application, so that libpq will not also initialize those libraries. See
http://h71000.www7.hp.com/doc/83final/BA554_90007/ch04.html for details on the
SSL API.

When do_ssl is `true`, libpq will initialize the OpenSSL library before first
opening a database connection. When do_crypto is `true`, the libcrypto library
will be initialized. By default (if PG.init_openssl() is not called), both
libraries are initialized. When SSL support is not compiled in, this function
is present but does nothing.

If your application uses and initializes either OpenSSL or its underlying
libcrypto library, you must call this function with `false` for the
appropriate parameter(s) before first opening a database connection. Also be
sure that you have done that initialization before opening a database
connection.


# PG::init_ssl

(from gem pg-0.21.0)
---
    PG.init_ssl(do_ssl)  -> nil

---

Allows applications to select which security libraries to initialize.

This function is equivalent to `PG.init_openssl(do_ssl, do_ssl)` . It is
sufficient for applications that initialize both or neither of OpenSSL and
libcrypto.


# PG::isthreadsafe

(from gem pg-0.21.0)
---
    PG.isthreadsafe            -> Boolean
    PG.is_threadsafe?          -> Boolean
    PG.threadsafe?             -> Boolean

---

Returns `true` if libpq is thread-safe, `false` otherwise.


# PG::library_version

(from gem pg-0.21.0)
---
    PG.library_version -> Integer

---

Get the version of the libpq library in use. The number is formed by
converting the major, minor, and revision numbers into two-decimal- digit
numbers and appending them together. For example, version 7.4.2 will be
returned as 70402, and version 8.1 will be returned as 80100 (leading zeroes
are not shown). Zero is returned if the connection is bad.


# PG::version_string

(from gem pg-0.21.0)
---
    version_string( include_buildnum=false )

---

Get the PG library version. If `include_buildnum` is `true`, include the build
ID.


