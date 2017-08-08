# URI

---
# Includes:
REGEXP (from ruby core)

---
# Extended by:
Escape (from ruby core)

(from ruby core)
---

URI is a module providing classes to handle Uniform Resource Identifiers
([RFC2396](http://tools.ietf.org/html/rfc2396))

## Features

*   Uniform handling of handling URIs
*   Flexibility to introduce custom URI schemes
*   Flexibility to have an alternate URI::Parser (or just different patterns
    and regexp's)


## Basic example

    require 'uri'

    uri = URI("http://foo.com/posts?id=30&limit=5#time=1305298413")
    #=> #<URI::HTTP:0x00000000b14880
          URL:http://foo.com/posts?id=30&limit=5#time=1305298413>
    uri.scheme
    #=> "http"
    uri.host
    #=> "foo.com"
    uri.path
    #=> "/posts"
    uri.query
    #=> "id=30&limit=5"
    uri.fragment
    #=> "time=1305298413"

    uri.to_s
    #=> "http://foo.com/posts?id=30&limit=5#time=1305298413"

## Adding custom URIs

    module URI
      class RSYNC < Generic
        DEFAULT_PORT = 873
      end
      @@schemes['RSYNC'] = RSYNC
    end
    #=> URI::RSYNC

    URI.scheme_list
    #=> {"FTP"=>URI::FTP, "HTTP"=>URI::HTTP, "HTTPS"=>URI::HTTPS,
         "LDAP"=>URI::LDAP, "LDAPS"=>URI::LDAPS, "MAILTO"=>URI::MailTo,
         "RSYNC"=>URI::RSYNC}

    uri = URI("rsync://rsync.foo.com")
    #=> #<URI::RSYNC:0x00000000f648c8 URL:rsync://rsync.foo.com>

## RFC References

A good place to view an RFC spec is http://www.ietf.org/rfc.html

Here is a list of all related RFC's.
*   [RFC822](http://tools.ietf.org/html/rfc822)
*   [RFC1738](http://tools.ietf.org/html/rfc1738)
*   [RFC2255](http://tools.ietf.org/html/rfc2255)
*   [RFC2368](http://tools.ietf.org/html/rfc2368)
*   [RFC2373](http://tools.ietf.org/html/rfc2373)
*   [RFC2396](http://tools.ietf.org/html/rfc2396)
*   [RFC2732](http://tools.ietf.org/html/rfc2732)
*   [RFC3986](http://tools.ietf.org/html/rfc3986)


## Class tree

*   URI::Generic (in uri/generic.rb)
    *   URI::FTP - (in uri/ftp.rb)
    *   URI::HTTP - (in uri/http.rb)
        *   URI::HTTPS - (in uri/https.rb)

    *   URI::LDAP - (in uri/ldap.rb)
        *   URI::LDAPS - (in uri/ldaps.rb)

    *   URI::MailTo - (in uri/mailto.rb)

*   URI::Parser - (in uri/common.rb)
*   URI::REGEXP - (in uri/common.rb)
    *   URI::REGEXP::PATTERN - (in uri/common.rb)

*   URI::Util - (in uri/common.rb)
*   URI::Escape - (in uri/common.rb)
*   URI::Error - (in uri/common.rb)
    *   URI::InvalidURIError - (in uri/common.rb)
    *   URI::InvalidComponentError - (in uri/common.rb)
    *   URI::BadURIError - (in uri/common.rb)



## Copyright Info

Author
:   Akira Yamada <akira@ruby-lang.org>
Documentation
:   Akira Yamada <akira@ruby-lang.org> Dmitry V. Sabanin <sdmitry@lrn.ru>
    Vincent Batts <vbatts@hashbangbash.com>
License
:   Copyright (c) 2001 akira yamada <akira@ruby-lang.org> You can redistribute
    it and/or modify it under the same term as Ruby.
Revision
:   $Id: uri.rb 53141 2015-12-16 05:07:31Z naruse $











---
# Constants:

DEFAULT_PARSER
:   URI::Parser.new
Parser
:   [not documented]
REGEXP
:   [not documented]
RFC3986_PARSER
:   [not documented]


# Class methods:

    decode_www_form
    decode_www_form_component
    encode_www_form
    encode_www_form_component
    extract
    join
    parse
    regexp
    scheme_list
    split

# URI::decode_www_form

(from ruby core)
---
    decode_www_form(str, enc=Encoding::UTF_8, separator: '&', use__charset_: false, isindex: false)

---

Decode URL-encoded form data from given `str`.

This decodes application/x-www-form-urlencoded data and returns array of
key-value array.

This refers http://url.spec.whatwg.org/#concept-urlencoded-parser , so this
supports only &-separator, don't support ;-separator.

    ary = URI.decode_www_form("a=1&a=2&b=3")
    p ary                  #=> [['a', '1'], ['a', '2'], ['b', '3']]
    p ary.assoc('a').last  #=> '1'
    p ary.assoc('b').last  #=> '3'
    p ary.rassoc('a').last #=> '2'
    p Hash[ary]            # => {"a"=>"2", "b"=>"3"}

See URI.decode_www_form_component, URI.encode_www_form


# URI::decode_www_form_component

(from ruby core)
---
    decode_www_form_component(str, enc=Encoding::UTF_8)

---

Decode given `str` of URL-encoded form data.

This decodes + to SP.

See URI.encode_www_form_component, URI.decode_www_form


# URI::encode_www_form

(from ruby core)
---
    encode_www_form(enum, enc=nil)

---

Generate URL-encoded form data from given `enum`.

This generates application/x-www-form-urlencoded data defined in HTML5 from
given an Enumerable object.

This internally uses URI.encode_www_form_component(str).

This method doesn't convert the encoding of given items, so convert them
before call this method if you want to send data as other than original
encoding or mixed encoding data. (Strings which are encoded in an HTML5 ASCII
incompatible encoding are converted to UTF-8.)

This method doesn't handle files.  When you send a file, use
multipart/form-data.

This refers http://url.spec.whatwg.org/#concept-urlencoded-serializer

    URI.encode_www_form([["q", "ruby"], ["lang", "en"]])
    #=> "q=ruby&lang=en"
    URI.encode_www_form("q" => "ruby", "lang" => "en")
    #=> "q=ruby&lang=en"
    URI.encode_www_form("q" => ["ruby", "perl"], "lang" => "en")
    #=> "q=ruby&q=perl&lang=en"
    URI.encode_www_form([["q", "ruby"], ["q", "perl"], ["lang", "en"]])
    #=> "q=ruby&q=perl&lang=en"

See URI.encode_www_form_component, URI.decode_www_form


# URI::encode_www_form_component

(from ruby core)
---
    encode_www_form_component(str, enc=nil)

---

Encode given `str` to URL-encoded form data.

This method doesn't convert *, -, ., 0-9, A-Z, _, a-z, but does convert SP
(ASCII space) to + and converts others to %XX.

If `enc` is given, convert `str` to the encoding before percent encoding.

This is an implementation of
http://www.w3.org/TR/2013/CR-html5-20130806/forms.html#url-encoded-form-data

See URI.decode_www_form_component, URI.encode_www_form


# URI::extract

(from ruby core)
---
    extract(str, schemes = nil, &block)

---

## Synopsis

    URI::extract(str[, schemes][,&blk])

## Args

`str`
:   String to extract URIs from.
`schemes`
:   Limit URI matching to a specific schemes.


## Description

Extracts URIs from a string. If block given, iterates through all matched
URIs. Returns nil if block given or array with matches.

## Usage

    require "uri"

    URI.extract("text here http://foo.example.org/bla and here mailto:test@example.com and here also.")
    # => ["http://foo.example.com/bla", "mailto:test@example.com"]


# URI::join

(from ruby core)
---
    join(*str)

---

## Synopsis

    URI::join(str[, str, ...])

## Args

`str`
:   String(s) to work with, will be converted to RFC3986 URIs before merging.


## Description

Joins URIs.

## Usage

    require 'uri'

    p URI.join("http://example.com/","main.rbx")
    # => #<URI::HTTP:0x2022ac02 URL:http://example.com/main.rbx>

    p URI.join('http://example.com', 'foo')
    # => #<URI::HTTP:0x01ab80a0 URL:http://example.com/foo>

    p URI.join('http://example.com', '/foo', '/bar')
    # => #<URI::HTTP:0x01aaf0b0 URL:http://example.com/bar>

    p URI.join('http://example.com', '/foo', 'bar')
    # => #<URI::HTTP:0x801a92af0 URL:http://example.com/bar>

    p URI.join('http://example.com', '/foo/', 'bar')
    # => #<URI::HTTP:0x80135a3a0 URL:http://example.com/foo/bar>


# URI::parse

(from ruby core)
---
    parse(uri)

---

## Synopsis

    URI::parse(uri_str)

## Args

`uri_str`
:   String with URI.


## Description

Creates one of the URI's subclasses instance from the string.

## Raises

URI::InvalidURIError
    Raised if URI given is not a correct one.

## Usage

    require 'uri'

    uri = URI.parse("http://www.ruby-lang.org/")
    p uri
    # => #<URI::HTTP:0x202281be URL:http://www.ruby-lang.org/>
    p uri.scheme
    # => "http"
    p uri.host
    # => "www.ruby-lang.org"

It's recommended to first ::escape the provided `uri_str` if there are any
invalid URI characters.


# URI::regexp

(from ruby core)
---
    regexp(schemes = nil)

---

## Synopsis

    URI::regexp([match_schemes])

## Args

`match_schemes`
:   Array of schemes. If given, resulting regexp matches to URIs whose scheme
    is one of the match_schemes.


## Description
Returns a Regexp object which matches to URI-like strings. The Regexp object
returned by this method includes arbitrary number of capture group
(parentheses).  Never rely on it's number.

## Usage

    require 'uri'

    # extract first URI from html_string
    html_string.slice(URI.regexp)

    # remove ftp URIs
    html_string.sub(URI.regexp(['ftp'])

    # You should not rely on the number of parentheses
    html_string.scan(URI.regexp) do |*matches|
      p $&
    end


# URI::scheme_list

(from ruby core)
---
    scheme_list()

---

Returns a Hash of the defined schemes


# URI::split

(from ruby core)
---
    split(uri)

---

## Synopsis

    URI::split(uri)

## Args

`uri`
:   String with URI.


## Description

Splits the string on following parts and returns array with result:

    * Scheme
    * Userinfo
    * Host
    * Port
    * Registry
    * Path
    * Opaque
    * Query
    * Fragment

## Usage

    require 'uri'

    p URI.split("http://www.ruby-lang.org/")
    # => ["http", nil, "www.ruby-lang.org", nil, nil, "/", nil, nil, nil]


(from gem activesupport-5.1.2)
---
# Class methods:

    parser

# URI::parser

(from gem activesupport-5.1.2)
---
    parser()

---


---
Also found in:
    gem globalid-0.4.0
    gem puma-3.9.1

