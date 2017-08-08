# RSS

(from ruby core)
---
# RSS reading and writing

Really Simple Syndication (RSS) is a family of formats that describe 'feeds,'
specially constructed XML documents that allow an interested person to
subscribe and receive updates from a particular web service. This portion of
the standard library provides tooling to read and create these feeds.

The standard library supports RSS 0.91, 1.0, 2.0, and Atom, a related format.
Here are some links to the standards documents for these formats:

*   RSS
    *   [0.9.1](http://www.rssboard.org/rss-0-9-1-netscape)
    *   [1.0](http://web.resource.org/rss/1.0/)
    *   [2.0](http://www.rssboard.org/rss-specification)

*   [Atom](http://tools.ietf.org/html/rfc4287)


## Consuming RSS

If you'd like to read someone's RSS feed with your Ruby code, you've come to
the right place. It's really easy to do this, but we'll need the help of
open-uri:

    require 'rss'
    require 'open-uri'

    url = 'http://www.ruby-lang.org/en/feeds/news.rss'
    open(url) do |rss|
      feed = RSS::Parser.parse(rss)
      puts "Title: #{feed.channel.title}"
      feed.items.each do |item|
        puts "Item: #{item.title}"
      end
    end

As you can see, the workhorse is RSS::Parser#parse, which takes the source of
the feed and a parameter that performs validation on the feed. We get back an
object that has all of the data from our feed, accessible through methods.
This example shows getting the title out of the channel element, and looping
through the list of items.

## Producing RSS

Producing our own RSS feeds is easy as well. Let's make a very basic feed:

    require "rss"

    rss = RSS::Maker.make("atom") do |maker|
      maker.channel.author = "matz"
      maker.channel.updated = Time.now.to_s
      maker.channel.about = "http://www.ruby-lang.org/en/feeds/news.rss"
      maker.channel.title = "Example Feed"

      maker.items.new_item do |item|
        item.link = "http://www.ruby-lang.org/en/news/2010/12/25/ruby-1-9-2-p136-is-released/"
        item.title = "Ruby 1.9.2-p136 is released"
        item.updated = Time.now.to_s
      end
    end

    puts rss

As you can see, this is a very Builder-like DSL. This code will spit out an
Atom feed with one item. If we needed a second item, we'd make another block
with maker.items.new_item and build a second one.

## Copyright

Copyright (c) 2003-2007 Kouhei Sutou <kou@cozmixng.org>

You can redistribute it and/or modify it under the same terms as Ruby.

There is an additional tutorial by the author of RSS at:
http://www.cozmixng.org/~rwiki/?cmd=view;name=RSS+Parser%3A%3ATutorial.en









































---
# Constants:

AVAILABLE_PARSERS
:   The list of all available parsers, in constant form.
AVAILABLE_PARSER_LIBRARIES
:   The list of all available libraries for parsing.
CONTENT_PREFIX
:   The prefix for the Content XML namespace.
CONTENT_URI
:   The URI of the Content specification.
DC_PREFIX
:   The prefix for the Dublin Core XML namespace.
DC_URI
:   The URI of the Dublin Core specification.
DublincoreModel
:   For backward compatibility
IMAGE_ELEMENTS
:   This constant holds strings which contain the names of image elements,
    with the appropriate prefix.
IMAGE_PREFIX
:   The prefix for the Image XML namespace.
IMAGE_URI
:   The URI for the Image specification.
ITUNES_PREFIX
:   The prefix for the iTunes XML namespace.
ITUNES_URI
:   The URI of the iTunes specification.
SLASH_PREFIX
:   The prefix for the Slash XML namespace.
SLASH_URI
:   The URI of the Slash specification.
SY_PREFIX
:   The prefix for the Syndication XML namespace.
SY_URI
:   The URI of the Syndication specification.
TAXO_ELEMENTS
:   The listing of all the taxonomy elements, with the appropriate namespace.
TAXO_PREFIX
:   The prefix for the Taxonomy XML namespace.
TAXO_URI
:   The URI for the specification of the Taxonomy XML namespace.
URI
:   The URI of the RSS 1.0 specification
VERSION
:   The current version of RSS


