# Rack

(from gem rack-2.0.3)
---
The Rack main module, serving as a namespace for all core Rack modules and
classes.

All modules meant for use in your application are `autoload`ed here, so it
should be enough just to `require 'rack'` in your code.





























































---
# Constants:

CACHE_CONTROL
:   [not documented]
CONTENT_LENGTH
:   [not documented]
CONTENT_TYPE
:   [not documented]
DELETE
:   [not documented]
ETAG
:   [not documented]
GET
:   HTTP method verbs
HEAD
:   [not documented]
HTTPS
:   [not documented]
HTTP_COOKIE
:   [not documented]
HTTP_HOST
:   [not documented]
HTTP_VERSION
:   [not documented]
LINK
:   [not documented]
OPTIONS
:   [not documented]
PATCH
:   [not documented]
PATH_INFO
:   [not documented]
POST
:   [not documented]
PUT
:   [not documented]
QUERY_STRING
:   [not documented]
RACK_ERRORS
:   [not documented]
RACK_HIJACK
:   [not documented]
RACK_HIJACK_IO
:   [not documented]
RACK_INPUT
:   [not documented]
RACK_IS_HIJACK
:   [not documented]
RACK_LOGGER
:   [not documented]
RACK_METHODOVERRIDE_ORIGINAL_METHOD
:   [not documented]
RACK_MULTIPART_BUFFER_SIZE
:   [not documented]
RACK_MULTIPART_TEMPFILE_FACTORY
:   [not documented]
RACK_MULTIPROCESS
:   [not documented]
RACK_MULTITHREAD
:   [not documented]
RACK_RECURSIVE_INCLUDE
:   [not documented]
RACK_REQUEST_COOKIE_HASH
:   [not documented]
RACK_REQUEST_COOKIE_STRING
:   [not documented]
RACK_REQUEST_FORM_HASH
:   [not documented]
RACK_REQUEST_FORM_INPUT
:   [not documented]
RACK_REQUEST_FORM_VARS
:   [not documented]
RACK_REQUEST_QUERY_HASH
:   [not documented]
RACK_REQUEST_QUERY_STRING
:   [not documented]
RACK_RUNONCE
:   [not documented]
RACK_SESSION
:   [not documented]
RACK_SESSION_OPTIONS
:   [not documented]
RACK_SESSION_UNPACKED_COOKIE_DATA
:   [not documented]
RACK_SHOWSTATUS_DETAIL
:   [not documented]
RACK_TEMPFILES
:   [not documented]
RACK_URL_SCHEME
:   [not documented]
RACK_VERSION
:   Rack environment variables
RELEASE
:   [not documented]
REQUEST_METHOD
:   [not documented]
REQUEST_PATH
:   [not documented]
SCRIPT_NAME
:   [not documented]
SERVER_ADDR
:   [not documented]
SERVER_NAME
:   [not documented]
SERVER_PORT
:   [not documented]
SERVER_PROTOCOL
:   [not documented]
SET_COOKIE
:   [not documented]
TRACE
:   [not documented]
TRANSFER_ENCODING
:   [not documented]
UNLINK
:   [not documented]
VERSION
:   The Rack protocol version number implemented.


# Class methods:

    release
    version

# Rack::release

(from gem rack-2.0.3)
---
    release()

---

Return the Rack release as a dotted string.


# Rack::version

(from gem rack-2.0.3)
---
    version()

---

Return the Rack protocol version as a dotted string.


(from gem rack-protection-1.5.3)
---














---
(from gem rack-test-0.6.3)
---






---
---
Also found in:
    gem actionpack-5.1.2
    gem capybara-2.14.4
    gem puma-3.9.1
    gem sinatra-1.4.8
    gem yard-0.9.9

