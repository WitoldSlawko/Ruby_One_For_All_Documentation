# Nokogiri

(from gem nokogiri-1.8.0)
---
































Nokogiri parses and searches XML/HTML very quickly, and also has correctly
implemented CSS3 selector support as well as XPath 1.0 support.

Parsing a document returns either a Nokogiri::XML::Document, or a
Nokogiri::HTML::Document depending on the kind of document you parse.

Here is an example:

    require 'nokogiri'
    require 'open-uri'

    # Get a Nokogiri::HTML:Document for the page we’re interested in...

    doc = Nokogiri::HTML(open('http://www.google.com/search?q=tenderlove'))

    # Do funky things with it using Nokogiri::XML::Node methods...

    ####
    # Search for nodes by css
    doc.css('h3.r a.l').each do |link|
      puts link.content
    end

See Nokogiri::XML::Searchable#css for more information about CSS searching.
See Nokogiri::XML::Searchable#xpath for more information about XPath
searching.
























































---
# Constants:

VERSION
:   The version of Nokogiri you are using
VERSION_INFO
:   More complete version information about libxml


# Class methods:

    HTML
    Slop
    XML
    XSLT
    install_default_aliases
    make
    parse

# Nokogiri::install_default_aliases

(from gem nokogiri-1.8.0)
---
    install_default_aliases()

---


# Nokogiri::make

(from gem nokogiri-1.8.0)
---
    make(input = nil, opts = {})

---

Create a new Nokogiri::XML::DocumentFragment


# Nokogiri::parse

(from gem nokogiri-1.8.0)
---
    parse(string, url = nil, encoding = nil, options = nil) { |doc| ... }

---

Parse an HTML or XML document.  `string` contains the document.


