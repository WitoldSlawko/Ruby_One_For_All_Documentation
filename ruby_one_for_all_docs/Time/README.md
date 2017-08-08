# Time < Object

---
# Includes:
Comparable (from ruby core)

(from gem activesupport-5.1.2)
    DateAndTime::Calculations
    DateAndTime::Compatibility
    DateAndTime::Zones

(from ruby core)
---


# time.rb

When 'time' is required, Time is extended with additional methods for parsing
and converting Times.

## Features

This library extends the Time class with the following conversions between
date strings and Time objects:

*   date-time defined by [RFC 2822](http://www.ietf.org/rfc/rfc2822.txt)
*   HTTP-date defined by [RFC 2616](http://www.ietf.org/rfc/rfc2616.txt)
*   dateTime defined by XML Schema Part 2: Datatypes ([ISO
    8601](http://www.iso.org/iso/date_and_time_format))
*   various formats handled by Date._parse
*   custom formats handled by Date._strptime


## Examples

All examples assume you have loaded Time with:

    require 'time'

All of these examples were done using the EST timezone which is GMT-5.

### Converting to a String

    t = Time.now
    t.iso8601  # => "2011-10-05T22:26:12-04:00"
    t.rfc2822  # => "Wed, 05 Oct 2011 22:26:12 -0400"
    t.httpdate # => "Thu, 06 Oct 2011 02:26:12 GMT"

### Time.parse

#parse takes a string representation of a Time and attempts to parse it using
a heuristic.

    Time.parse("2010-10-31") #=> 2010-10-31 00:00:00 -0500

Any missing pieces of the date are inferred based on the current date.

    # assuming the current date is "2011-10-31"
    Time.parse("12:00") #=> 2011-10-31 12:00:00 -0500

We can change the date used to infer our missing elements by passing a second
object that responds to #mon, #day and #year, such as Date, Time or DateTime.
We can also use our own object.

    class MyDate
      attr_reader :mon, :day, :year

      def initialize(mon, day, year)
        @mon, @day, @year = mon, day, year
      end
    end

    d  = Date.parse("2010-10-28")
    t  = Time.parse("2010-10-29")
    dt = DateTime.parse("2010-10-30")
    md = MyDate.new(10,31,2010)

    Time.parse("12:00", d)  #=> 2010-10-28 12:00:00 -0500
    Time.parse("12:00", t)  #=> 2010-10-29 12:00:00 -0500
    Time.parse("12:00", dt) #=> 2010-10-30 12:00:00 -0500
    Time.parse("12:00", md) #=> 2010-10-31 12:00:00 -0500

#parse also accepts an optional block. You can use this block to specify how
to handle the year component of the date. This is specifically designed for
handling two digit years. For example, if you wanted to treat all two digit
years prior to 70 as the year 2000+ you could write this:

    Time.parse("01-10-31") {|year| year + (year < 70 ? 2000 : 1900)}
    #=> 2001-10-31 00:00:00 -0500
    Time.parse("70-10-31") {|year| year + (year < 70 ? 2000 : 1900)}
    #=> 1970-10-31 00:00:00 -0500

### Time.strptime

#strptime works similar to `parse` except that instead of using a heuristic to
detect the format of the input string, you provide a second argument that
describes the format of the string. For example:

    Time.strptime("2000-10-31", "%Y-%m-%d") #=> 2000-10-31 00:00:00 -0500

Time is an abstraction of dates and times. Time is stored internally as the
number of seconds with fraction since the *Epoch*, January 1, 1970 00:00 UTC.
Also see the library module Date. The Time class treats GMT (Greenwich Mean
Time) and UTC (Coordinated Universal Time) as equivalent. GMT is the older way
of referring to these baseline times but persists in the names of calls on
POSIX systems.

All times may have fraction. Be aware of this fact when comparing times with
each other -- times that are apparently equal when displayed may be different
when compared.

Since Ruby 1.9.2, Time implementation uses a signed 63 bit integer, Bignum or
Rational. The integer is a number of nanoseconds since the *Epoch* which can
represent 1823-11-12 to 2116-02-20. When Bignum or Rational is used (before
1823, after 2116, under nanosecond), Time works slower as when integer is
used.

# Examples

All of these examples were done using the EST timezone which is GMT-5.

## Creating a new Time instance

You can create a new instance of Time with Time::new. This will use the
current system time. Time::now is an alias for this. You can also pass parts
of the time to Time::new such as year, month, minute, etc. When you want to
construct a time this way you must pass at least a year. If you pass the year
with nothing else time will default to January 1 of that year at 00:00:00 with
the current system timezone. Here are some examples:

    Time.new(2002)         #=> 2002-01-01 00:00:00 -0500
    Time.new(2002, 10)     #=> 2002-10-01 00:00:00 -0500
    Time.new(2002, 10, 31) #=> 2002-10-31 00:00:00 -0500
    Time.new(2002, 10, 31, 2, 2, 2, "+02:00") #=> 2002-10-31 02:02:02 +0200

You can also use #gm, #local and #utc to infer GMT, local and UTC timezones
instead of using the current system setting.

You can also create a new time using Time::at which takes the number of
seconds (or fraction of seconds) since the [Unix
Epoch](http://en.wikipedia.org/wiki/Unix_time).

    Time.at(628232400) #=> 1989-11-28 00:00:00 -0500

## Working with an instance of Time

Once you have an instance of Time there is a multitude of things you can do
with it. Below are some examples. For all of the following examples, we will
work on the assumption that you have done the following:

    t = Time.new(1993, 02, 24, 12, 0, 0, "+09:00")

Was that a monday?

    t.monday? #=> false

What year was that again?

    t.year #=> 1993

Was it daylight savings at the time?

    t.dst? #=> false

What's the day a year later?

    t + (60*60*24*365) #=> 1994-02-24 12:00:00 +0900

How many seconds was that since the Unix Epoch?

    t.to_i #=> 730522800

You can also do standard functions like compare two times.

    t1 = Time.new(2010)
    t2 = Time.new(2011)

    t1 == t2 #=> false
    t1 == t1 #=> true
    t1 <  t2 #=> true
    t1 >  t2 #=> false

    Time.new(2010,10,31).between?(t1, t2) #=> true
---
# Class methods:

    apply_offset
    at
    force_zone!
    gm
    httpdate
    iso8601
    json_create
    local
    make_time
    mktime
    month_days
    new
    now
    parse
    rfc2822
    rfc822
    strptime
    utc
    w3cdtf
    xmlschema
    zone_offset
    zone_utc?

# Instance methods:

    +
    -
    <=>
    as_json
    asctime
    ctime
    day
    dst?
    eql?
    friday?
    getgm
    getlocal
    getutc
    gmt?
    gmt_offset
    gmtime
    gmtoff
    hash
    hour
    httpdate
    inspect
    isdst
    iso8601
    localtime
    mday
    min
    mon
    monday?
    month
    nsec
    rfc2822
    rfc822
    round
    saturday?
    sec
    strftime
    subsec
    succ
    sunday?
    thursday?
    to_a
    to_date
    to_datetime
    to_f
    to_i
    to_json
    to_r
    to_s
    to_time
    tuesday?
    tv_nsec
    tv_sec
    tv_usec
    usec
    utc
    utc?
    utc_offset
    w3cdtf
    wday
    wednesday?
    xmlschema
    yday
    year
    zone

# Time::at

(from ruby core)
---
    Time.at(time) -> time
    Time.at(seconds_with_frac) -> time
    Time.at(seconds, microseconds_with_frac) -> time

---

Creates a new Time object with the value given by `time`, the given number of
`seconds_with_frac`, or `seconds` and `microseconds_with_frac` since the
Epoch. `seconds_with_frac` and `microseconds_with_frac` can be an Integer,
Float, Rational, or other Numeric. non-portable feature allows the offset to
be negative on some systems.

If a numeric argument is given, the result is in local time.

    Time.at(0)                           #=> 1969-12-31 18:00:00 -0600
    Time.at(Time.at(0))                  #=> 1969-12-31 18:00:00 -0600
    Time.at(946702800)                   #=> 1999-12-31 23:00:00 -0600
    Time.at(-284061600)                  #=> 1960-12-31 00:00:00 -0600
    Time.at(946684800.2).usec            #=> 200000
    Time.at(946684800, 123456.789).nsec  #=> 123456789


(from gem activesupport-5.1.2)
---
    at(*args)

---


# Time::gm

(from ruby core)
---
    Time.gm(year) -> time
    Time.gm(year, month) -> time
    Time.gm(year, month, day) -> time
    Time.gm(year, month, day, hour) -> time
    Time.gm(year, month, day, hour, min) -> time
    Time.gm(year, month, day, hour, min, sec_with_frac) -> time
    Time.gm(year, month, day, hour, min, sec, usec_with_frac) -> time
    Time.gm(sec, min, hour, day, month, year, dummy, dummy, dummy, dummy) -> time

---

Creates a Time object based on given values, interpreted as UTC (GMT). The
year must be specified. Other values default to the minimum value for that
field (and may be `nil` or omitted). Months may be specified by numbers from 1
to 12, or by the three-letter English month names. Hours are specified on a
24-hour clock (0..23). Raises an ArgumentError if any values are out of range.
Will also accept ten arguments in the order output by Time#to_a.

`sec_with_frac` and `usec_with_frac` can have a fractional part.

    Time.utc(2000,"jan",1,20,15,1)  #=> 2000-01-01 20:15:01 UTC
    Time.gm(2000,"jan",1,20,15,1)   #=> 2000-01-01 20:15:01 UTC


# Time::httpdate

(from ruby core)
---
    httpdate(date)

---

Parses `date` as an HTTP-date defined by RFC 2616 and converts it to a Time
object.

ArgumentError is raised if `date` is not compliant with RFC 2616 or if the
Time class cannot represent specified date.

See #httpdate for more information on this format.

You must require 'time' to use this method.


# Time::iso8601

(from ruby core)
---
    iso8601(date)

---


# Time::json_create

(from ruby core)
---
    json_create(object)

---

Deserializes JSON string by converting time since epoch to Time


# Time::local

(from ruby core)
---
    Time.local(year) -> time
    Time.local(year, month) -> time
    Time.local(year, month, day) -> time
    Time.local(year, month, day, hour) -> time
    Time.local(year, month, day, hour, min) -> time
    Time.local(year, month, day, hour, min, sec_with_frac) -> time
    Time.local(year, month, day, hour, min, sec, usec_with_frac) -> time
    Time.local(sec, min, hour, day, month, year, dummy, dummy, isdst, dummy) -> time

---

Same as Time::gm, but interprets the values in the local time zone.

    Time.local(2000,"jan",1,20,15,1)   #=> 2000-01-01 20:15:01 -0600


# Time::mktime

(from ruby core)
---
    Time.mktime(year) -> time
    Time.mktime(year, month) -> time
    Time.mktime(year, month, day) -> time
    Time.mktime(year, month, day, hour) -> time
    Time.mktime(year, month, day, hour, min) -> time
    Time.mktime(year, month, day, hour, min, sec_with_frac) -> time
    Time.mktime(year, month, day, hour, min, sec, usec_with_frac) -> time
    Time.mktime(sec, min, hour, day, month, year, dummy, dummy, isdst, dummy) -> time

---

Same as Time::gm, but interprets the values in the local time zone.

    Time.local(2000,"jan",1,20,15,1)   #=> 2000-01-01 20:15:01 -0600


# Time::new

(from ruby core)
---
    Time.new -> time
    Time.new(year, month=nil, day=nil, hour=nil, min=nil, sec=nil, utc_offset=nil) -> time

---

Returns a Time object.

It is initialized to the current system time if no argument is given.

**Note:** The new object will use the resolution available on your system
clock, and may include fractional seconds.

If one or more arguments specified, the time is initialized to the specified
time.

`sec` may have fraction if it is a rational.

`utc_offset` is the offset from UTC. It can be a string such as "+09:00" or a
number of seconds such as 32400.

    a = Time.new      #=> 2007-11-19 07:50:02 -0600
    b = Time.new      #=> 2007-11-19 07:50:02 -0600
    a == b            #=> false
    "%.6f" % a.to_f   #=> "1195480202.282373"
    "%.6f" % b.to_f   #=> "1195480202.283415"

    Time.new(2008,6,21, 13,30,0, "+09:00") #=> 2008-06-21 13:30:00 +0900

    # A trip for RubyConf 2007
    t1 = Time.new(2007,11,1,15,25,0, "+09:00") # JST (Narita)
    t2 = Time.new(2007,11,1,12, 5,0, "-05:00") # CDT (Minneapolis)
    t3 = Time.new(2007,11,1,13,25,0, "-05:00") # CDT (Minneapolis)
    t4 = Time.new(2007,11,1,16,53,0, "-04:00") # EDT (Charlotte)
    t5 = Time.new(2007,11,5, 9,24,0, "-05:00") # EST (Charlotte)
    t6 = Time.new(2007,11,5,11,21,0, "-05:00") # EST (Detroit)
    t7 = Time.new(2007,11,5,13,45,0, "-05:00") # EST (Detroit)
    t8 = Time.new(2007,11,6,17,10,0, "+09:00") # JST (Narita)
    p((t2-t1)/3600.0)                          #=> 10.666666666666666
    p((t4-t3)/3600.0)                          #=> 2.466666666666667
    p((t6-t5)/3600.0)                          #=> 1.95
    p((t8-t7)/3600.0)                          #=> 13.416666666666666


# Time::now

(from ruby core)
---
    Time.now -> time

---

Creates a new Time object for the current time. This is same as Time.new
without arguments.

    Time.now            #=> 2009-06-24 12:39:54 +0900


# Time::parse

(from ruby core)
---
    parse(date, now=self.now) { |year| ... }

---

Parses `date` using Date._parse and converts it to a Time object.

If a block is given, the year described in `date` is converted by the block. 
For example:

    Time.parse(...) {|y| 0 <= y && y < 100 ? (y >= 69 ? y + 1900 : y + 2000) : y}

If the upper components of the given time are broken or missing, they are
supplied with those of `now`.  For the lower components, the minimum values (1
or 0) are assumed if broken or missing.  For example:

    # Suppose it is "Thu Nov 29 14:33:20 2001" now and
    # your time zone is EST which is GMT-5.
    now = Time.parse("Thu Nov 29 14:33:20 2001")
    Time.parse("16:30", now)     #=> 2001-11-29 16:30:00 -0500
    Time.parse("7/23", now)      #=> 2001-07-23 00:00:00 -0500
    Time.parse("Aug 31", now)    #=> 2001-08-31 00:00:00 -0500
    Time.parse("Aug 2000", now)  #=> 2000-08-01 00:00:00 -0500

Since there are numerous conflicts among locally defined time zone
abbreviations all over the world, this method is not intended to understand
all of them.  For example, the abbreviation "CST" is used variously as:

    -06:00 in America/Chicago,
    -05:00 in America/Havana,
    +08:00 in Asia/Harbin,
    +09:30 in Australia/Darwin,
    +10:30 in Australia/Adelaide,
    etc.

Based on this fact, this method only understands the time zone abbreviations
described in RFC 822 and the system time zone, in the order named. (i.e. a
definition in RFC 822 overrides the system time zone definition.)  The system
time zone is taken from `Time.local(year, 1, 1).zone` and `Time.local(year, 7,
1).zone`. If the extracted time zone abbreviation does not match any of them,
it is ignored and the given time is regarded as a local time.

ArgumentError is raised if Date._parse cannot extract information from `date`
or if the Time class cannot represent specified date.

This method can be used as a fail-safe for other parsing methods as:

    Time.rfc2822(date) rescue Time.parse(date)
    Time.httpdate(date) rescue Time.parse(date)
    Time.xmlschema(date) rescue Time.parse(date)

A failure of Time.parse should be checked, though.

You must require 'time' to use this method.


# Time::rfc2822

(from ruby core)
---
    rfc2822(date)

---

Parses `date` as date-time defined by RFC 2822 and converts it to a Time
object.  The format is identical to the date format defined by RFC 822 and
updated by RFC 1123.

ArgumentError is raised if `date` is not compliant with RFC 2822 or if the
Time class cannot represent specified date.

See #rfc2822 for more information on this format.

You must require 'time' to use this method.


# Time::rfc822

(from ruby core)
---
    rfc822(date)

---


# Time::strptime

(from ruby core)
---
    strptime(date, format, now=self.now) { |year| ... }

---

Parses `date` using Date._strptime and converts it to a Time object.

If a block is given, the year described in `date` is converted by the block. 
For example:

    Time.strptime(...) {|y| y < 100 ? (y >= 69 ? y + 1900 : y + 2000) : y}

Below is a list of the formatting options:

%a
:   The abbreviated weekday name ("Sun")
%A
:   The  full  weekday  name ("Sunday")
%b
:   The abbreviated month name ("Jan")
%B
:   The  full  month  name ("January")
%c
:   The preferred local date and time representation
%C
:   Century (20 in 2009)
%d
:   Day of the month (01..31)
%D
:   Date (%m/%d/%y)
%e
:   Day of the month, blank-padded ( 1..31)
%F
:   Equivalent to %Y-%m-%d (the ISO 8601 date format)
%h
:   Equivalent to %b
%H
:   Hour of the day, 24-hour clock (00..23)
%I
:   Hour of the day, 12-hour clock (01..12)
%j
:   Day of the year (001..366)
%k
:   hour, 24-hour clock, blank-padded ( 0..23)
%l
:   hour, 12-hour clock, blank-padded ( 0..12)
%L
:   Millisecond of the second (000..999)
%m
:   Month of the year (01..12)
%M
:   Minute of the hour (00..59)
%n
:   Newline (n)
%N
:   Fractional seconds digits, default is 9 digits (nanosecond)
    %3N
:       millisecond (3 digits)
    %6N
:       microsecond (6 digits)
    %9N
:       nanosecond (9 digits)

%p
:   Meridian indicator ("AM" or "PM")
%P
:   Meridian indicator ("am" or "pm")
%r
:   time, 12-hour (same as %I:%M:%S %p)
%R
:   time, 24-hour (%H:%M)
%s
:   Number of seconds since 1970-01-01 00:00:00 UTC.
%S
:   Second of the minute (00..60)
%t
:   Tab character (t)
%T
:   time, 24-hour (%H:%M:%S)
%u
:   Day of the week as a decimal, Monday being 1. (1..7)
%U
:   Week number of the current year, starting with the first Sunday as the
    first day of the first week (00..53)
%v
:   VMS date (%e-%b-%Y)
%V
:   Week number of year according to ISO 8601 (01..53)
%W
:   Week  number  of the current year, starting with the first Monday as the
    first day of the first week (00..53)
%w
:   Day of the week (Sunday is 0, 0..6)
%x
:   Preferred representation for the date alone, no time
%X
:   Preferred representation for the time alone, no date
%y
:   Year without a century (00..99)
%Y
:   Year which may include century, if provided
%z
:   Time zone as  hour offset from UTC (e.g. +0900)
%Z
:   Time zone name
%%
:   Literal "%" character



# Time::utc

(from ruby core)
---
    Time.utc(year) -> time
    Time.utc(year, month) -> time
    Time.utc(year, month, day) -> time
    Time.utc(year, month, day, hour) -> time
    Time.utc(year, month, day, hour, min) -> time
    Time.utc(year, month, day, hour, min, sec_with_frac) -> time
    Time.utc(year, month, day, hour, min, sec, usec_with_frac) -> time
    Time.utc(sec, min, hour, day, month, year, dummy, dummy, dummy, dummy) -> time

---

Creates a Time object based on given values, interpreted as UTC (GMT). The
year must be specified. Other values default to the minimum value for that
field (and may be `nil` or omitted). Months may be specified by numbers from 1
to 12, or by the three-letter English month names. Hours are specified on a
24-hour clock (0..23). Raises an ArgumentError if any values are out of range.
Will also accept ten arguments in the order output by Time#to_a.

`sec_with_frac` and `usec_with_frac` can have a fractional part.

    Time.utc(2000,"jan",1,20,15,1)  #=> 2000-01-01 20:15:01 UTC
    Time.gm(2000,"jan",1,20,15,1)   #=> 2000-01-01 20:15:01 UTC


# Time::w3cdtf

(from ruby core)
---
    w3cdtf(date)

---

This method converts a W3CDTF string date/time format to Time object.

The W3CDTF format is defined here: http://www.w3.org/TR/NOTE-datetime

    Time.w3cdtf('2003-02-15T13:50:05-05:00')
    # => 2003-02-15 10:50:05 -0800
    Time.w3cdtf('2003-02-15T13:50:05-05:00').class
    # => Time


# Time::xmlschema

(from ruby core)
---
    xmlschema(date)

---

Parses `date` as a dateTime defined by the XML Schema and converts it to a
Time object.  The format is a restricted version of the format defined by ISO
8601.

ArgumentError is raised if `date` is not compliant with the format or if the
Time class cannot represent specified date.

See #xmlschema for more information on this format.

You must require 'time' to use this method.


# Time::zone_offset

(from ruby core)
---
    zone_offset(zone, year=self.now.year)

---

Return the number of seconds the specified time zone differs from UTC.

Numeric time zones that include minutes, such as `-10:00` or `+1330` will
work, as will simpler hour-only time zones like `-10` or `+13`.

Textual time zones listed in ZoneOffset are also supported.

If the time zone does not match any of the above, `zone_offset` will check if
the local time zone (both with and without potential Daylight Saving Time
changes being in effect) matches `zone`. Specifying a value for `year` will
change the year used to find the local time zone.

If `zone_offset` is unable to determine the offset, nil will be returned.


# Time::apply_offset

(from ruby core)
---
    apply_offset(year, mon, day, hour, min, sec, off)

---


# Time::force_zone!

(from ruby core)
---
    force_zone!(t, zone, offset=nil)

---


# Time::make_time

(from ruby core)
---
    make_time(date, year, mon, day, hour, min, sec, sec_fraction, zone, now)

---


# Time::month_days

(from ruby core)
---
    month_days(y, m)

---


# Time::zone_utc?

(from ruby core)
---
    zone_utc?(zone)

---


# Time#+

(from ruby core)
---
    time + numeric -> time

---

Addition --- Adds some number of seconds (possibly fractional) to *time* and
returns that value as a new Time object.

    t = Time.now         #=> 2007-11-19 08:22:21 -0600
    t + (60 * 60 * 24)   #=> 2007-11-20 08:22:21 -0600


# Time#-

(from ruby core)
---
    time - other_time -> float
    time - numeric    -> time

---

Difference --- Returns a new Time object that represents the difference
between *time* and `other_time`, or subtracts the given number of seconds in
`numeric` from *time*.

    t = Time.now       #=> 2007-11-19 08:23:10 -0600
    t2 = t + 2592000   #=> 2007-12-19 08:23:10 -0600
    t2 - t             #=> 2592000.0
    t2 - 2592000       #=> 2007-11-19 08:23:10 -0600


(from gem activesupport-5.1.2)
---
    -(other)

---


# Time#<=>

(from ruby core)
---
    time <=> other_time -> -1, 0, +1 or nil

---

Comparison---Compares `time` with `other_time`.

-1, 0, +1 or nil depending on whether `time` is less  than, equal to, or
greater than `other_time`.

`nil` is returned if the two values are incomparable.

    t = Time.now       #=> 2007-11-19 08:12:12 -0600
    t2 = t + 2592000   #=> 2007-12-19 08:12:12 -0600
    t <=> t2           #=> -1
    t2 <=> t           #=> 1

    t = Time.now       #=> 2007-11-19 08:13:38 -0600
    t2 = t + 0.1       #=> 2007-11-19 08:13:38 -0600
    t.nsec             #=> 98222999
    t2.nsec            #=> 198222999
    t <=> t2           #=> -1
    t2 <=> t           #=> 1
    t <=> t            #=> 0


(from gem activesupport-5.1.2)
---
    <=>(other)

---


# Time#as_json

(from ruby core)
---
    as_json(*)

---

Returns a hash, that will be turned into a JSON object and represent this
object.


# Time#asctime

(from ruby core)
---
    time.asctime -> string

---

Returns a canonical string representation of *time*.

    Time.now.asctime   #=> "Wed Apr  9 08:56:03 2003"
    Time.now.ctime     #=> "Wed Apr  9 08:56:03 2003"


# Time#ctime

(from ruby core)
---
    time.ctime   -> string

---

Returns a canonical string representation of *time*.

    Time.now.asctime   #=> "Wed Apr  9 08:56:03 2003"
    Time.now.ctime     #=> "Wed Apr  9 08:56:03 2003"


# Time#day

(from ruby core)
---
    time.day  -> integer

---

Returns the day of the month (1..n) for *time*.

    t = Time.now   #=> 2007-11-19 08:27:03 -0600
    t.day          #=> 19
    t.mday         #=> 19


# Time#dst?

(from ruby core)
---
    time.dst?  -> true or false

---

Returns `true` if *time* occurs during Daylight Saving Time in its time zone.

    # CST6CDT:
      Time.local(2000, 1, 1).zone    #=> "CST"
      Time.local(2000, 1, 1).isdst   #=> false
      Time.local(2000, 1, 1).dst?    #=> false
      Time.local(2000, 7, 1).zone    #=> "CDT"
      Time.local(2000, 7, 1).isdst   #=> true
      Time.local(2000, 7, 1).dst?    #=> true

    # Asia/Tokyo:
      Time.local(2000, 1, 1).zone    #=> "JST"
      Time.local(2000, 1, 1).isdst   #=> false
      Time.local(2000, 1, 1).dst?    #=> false
      Time.local(2000, 7, 1).zone    #=> "JST"
      Time.local(2000, 7, 1).isdst   #=> false
      Time.local(2000, 7, 1).dst?    #=> false


# Time#eql?

(from ruby core)
---
    time.eql?(other_time)

---

Returns `true` if *time* and `other_time` are both Time objects with the same
seconds and fractional seconds.


(from gem activesupport-5.1.2)
---
    eql?(other)

---


# Time#friday?

(from ruby core)
---
    time.friday? -> true or false

---

Returns `true` if *time* represents Friday.

    t = Time.local(1987, 12, 18)     #=> 1987-12-18 00:00:00 -0600
    t.friday?                        #=> true


# Time#getgm

(from ruby core)
---
    time.getgm  -> new_time

---

Returns a new Time object representing *time* in UTC.

    t = Time.local(2000,1,1,20,15,1)   #=> 2000-01-01 20:15:01 -0600
    t.gmt?                             #=> false
    y = t.getgm                        #=> 2000-01-02 02:15:01 UTC
    y.gmt?                             #=> true
    t == y                             #=> true


# Time#getlocal

(from ruby core)
---
    time.getlocal -> new_time
    time.getlocal(utc_offset) -> new_time

---

Returns a new Time object representing *time* in local time (using the local
time zone in effect for this process).

If `utc_offset` is given, it is used instead of the local time. `utc_offset`
can be given as a human-readable string (eg. `"+09:00"`) or as a number of
seconds (eg. `32400`).

    t = Time.utc(2000,1,1,20,15,1)  #=> 2000-01-01 20:15:01 UTC
    t.utc?                          #=> true

    l = t.getlocal                  #=> 2000-01-01 14:15:01 -0600
    l.utc?                          #=> false
    t == l                          #=> true

    j = t.getlocal("+09:00")        #=> 2000-01-02 05:15:01 +0900
    j.utc?                          #=> false
    t == j                          #=> true

    k = t.getlocal(9*60*60)         #=> 2000-01-02 05:15:01 +0900
    k.utc?                          #=> false
    t == k                          #=> true


# Time#getutc

(from ruby core)
---
    time.getutc -> new_time

---

Returns a new Time object representing *time* in UTC.

    t = Time.local(2000,1,1,20,15,1)   #=> 2000-01-01 20:15:01 -0600
    t.gmt?                             #=> false
    y = t.getgm                        #=> 2000-01-02 02:15:01 UTC
    y.gmt?                             #=> true
    t == y                             #=> true


# Time#gmt?

(from ruby core)
---
    time.gmt? -> true or false

---

Returns `true` if *time* represents a time in UTC (GMT).

    t = Time.now                        #=> 2007-11-19 08:15:23 -0600
    t.utc?                              #=> false
    t = Time.gm(2000,"jan",1,20,15,1)   #=> 2000-01-01 20:15:01 UTC
    t.utc?                              #=> true

    t = Time.now                        #=> 2007-11-19 08:16:03 -0600
    t.gmt?                              #=> false
    t = Time.gm(2000,1,1,20,15,1)       #=> 2000-01-01 20:15:01 UTC
    t.gmt?                              #=> true


# Time#gmt_offset

(from ruby core)
---
    time.gmt_offset -> integer

---

Returns the offset in seconds between the timezone of *time* and UTC.

    t = Time.gm(2000,1,1,20,15,1)   #=> 2000-01-01 20:15:01 UTC
    t.gmt_offset                    #=> 0
    l = t.getlocal                  #=> 2000-01-01 14:15:01 -0600
    l.gmt_offset                    #=> -21600


# Time#gmtime

(from ruby core)
---
    time.gmtime    -> time

---

Converts *time* to UTC (GMT), modifying the receiver.

    t = Time.now   #=> 2007-11-19 08:18:31 -0600
    t.gmt?         #=> false
    t.gmtime       #=> 2007-11-19 14:18:31 UTC
    t.gmt?         #=> true

    t = Time.now   #=> 2007-11-19 08:18:51 -0600
    t.utc?         #=> false
    t.utc          #=> 2007-11-19 14:18:51 UTC
    t.utc?         #=> true


# Time#gmtoff

(from ruby core)
---
    time.gmtoff     -> integer

---

Returns the offset in seconds between the timezone of *time* and UTC.

    t = Time.gm(2000,1,1,20,15,1)   #=> 2000-01-01 20:15:01 UTC
    t.gmt_offset                    #=> 0
    l = t.getlocal                  #=> 2000-01-01 14:15:01 -0600
    l.gmt_offset                    #=> -21600


# Time#hash

(from ruby core)
---
    time.hash   -> integer

---

Returns a hash code for this Time object.

See also Object#hash.


# Time#hour

(from ruby core)
---
    time.hour -> integer

---

Returns the hour of the day (0..23) for *time*.

    t = Time.now   #=> 2007-11-19 08:26:20 -0600
    t.hour         #=> 8


# Time#httpdate

(from ruby core)
---
    httpdate()

---

Returns a string which represents the time as RFC 1123 date of HTTP-date
defined by RFC 2616:

    day-of-week, DD month-name CCYY hh:mm:ss GMT

Note that the result is always UTC (GMT).

You must require 'time' to use this method.


# Time#inspect

(from ruby core)
---
    time.inspect -> string

---

Returns a string representing *time*. Equivalent to calling #strftime with the
appropriate format string.

    t = Time.now
    t.to_s                              => "2012-11-10 18:16:12 +0100"
    t.strftime "%Y-%m-%d %H:%M:%S %z"   => "2012-11-10 18:16:12 +0100"

    t.utc.to_s                          => "2012-11-10 17:16:12 UTC"
    t.strftime "%Y-%m-%d %H:%M:%S UTC"  => "2012-11-10 17:16:12 UTC"


# Time#isdst

(from ruby core)
---
    time.isdst -> true or false

---

Returns `true` if *time* occurs during Daylight Saving Time in its time zone.

    # CST6CDT:
      Time.local(2000, 1, 1).zone    #=> "CST"
      Time.local(2000, 1, 1).isdst   #=> false
      Time.local(2000, 1, 1).dst?    #=> false
      Time.local(2000, 7, 1).zone    #=> "CDT"
      Time.local(2000, 7, 1).isdst   #=> true
      Time.local(2000, 7, 1).dst?    #=> true

    # Asia/Tokyo:
      Time.local(2000, 1, 1).zone    #=> "JST"
      Time.local(2000, 1, 1).isdst   #=> false
      Time.local(2000, 1, 1).dst?    #=> false
      Time.local(2000, 7, 1).zone    #=> "JST"
      Time.local(2000, 7, 1).isdst   #=> false
      Time.local(2000, 7, 1).dst?    #=> false


# Time#iso8601

(from ruby core)
---
    iso8601(fraction_digits=0)

---


# Time#localtime

(from ruby core)
---
    time.localtime -> time
    time.localtime(utc_offset) -> time

---

Converts *time* to local time (using the local time zone in effect for this
process) modifying the receiver.

If `utc_offset` is given, it is used instead of the local time.

    t = Time.utc(2000, "jan", 1, 20, 15, 1) #=> 2000-01-01 20:15:01 UTC
    t.utc?                                  #=> true

    t.localtime                             #=> 2000-01-01 14:15:01 -0600
    t.utc?                                  #=> false

    t.localtime("+09:00")                   #=> 2000-01-02 05:15:01 +0900
    t.utc?                                  #=> false


# Time#mday

(from ruby core)
---
    time.mday -> integer

---

Returns the day of the month (1..n) for *time*.

    t = Time.now   #=> 2007-11-19 08:27:03 -0600
    t.day          #=> 19
    t.mday         #=> 19


# Time#min

(from ruby core)
---
    time.min -> integer

---

Returns the minute of the hour (0..59) for *time*.

    t = Time.now   #=> 2007-11-19 08:25:51 -0600
    t.min          #=> 25


# Time#mon

(from ruby core)
---
    time.mon   -> integer
    time.month -> integer

---

Returns the month of the year (1..12) for *time*.

    t = Time.now   #=> 2007-11-19 08:27:30 -0600
    t.mon          #=> 11
    t.month        #=> 11


# Time#monday?

(from ruby core)
---
    time.monday? -> true or false

---

Returns `true` if *time* represents Monday.

    t = Time.local(2003, 8, 4)       #=> 2003-08-04 00:00:00 -0500
    p t.monday?                      #=> true


# Time#month

(from ruby core)
---
    time.month -> integer

---

Returns the month of the year (1..12) for *time*.

    t = Time.now   #=> 2007-11-19 08:27:30 -0600
    t.mon          #=> 11
    t.month        #=> 11


# Time#nsec

(from ruby core)
---
    time.nsec    -> int

---

Returns the number of nanoseconds for *time*.

    t = Time.now        #=> 2007-11-17 15:18:03 +0900
    "%10.9f" % t.to_f   #=> "1195280283.536151409"
    t.nsec              #=> 536151406

The lowest digits of #to_f and #nsec are different because IEEE 754 double is
not accurate enough to represent the exact number of nanoseconds since the
Epoch.

The more accurate value is returned by #nsec.


# Time#rfc2822

(from ruby core)
---
    rfc2822()

---

Returns a string which represents the time as date-time defined by RFC 2822:

    day-of-week, DD month-name CCYY hh:mm:ss zone

where zone is [+-]hhmm.

If `self` is a UTC time, -0000 is used as zone.

You must require 'time' to use this method.


# Time#rfc822

(from ruby core)
---
    rfc822()

---


# Time#round

(from ruby core)
---
    time.round([ndigits])   -> new_time

---

Rounds sub seconds to a given precision in decimal digits (0 digits by
default). It returns a new Time object. `ndigits` should be zero or positive
integer.

    require 'time'

    t = Time.utc(2010,3,30, 5,43,"25.123456789".to_r)
    p t.iso8601(10)           #=> "2010-03-30T05:43:25.1234567890Z"
    p t.round.iso8601(10)     #=> "2010-03-30T05:43:25.0000000000Z"
    p t.round(0).iso8601(10)  #=> "2010-03-30T05:43:25.0000000000Z"
    p t.round(1).iso8601(10)  #=> "2010-03-30T05:43:25.1000000000Z"
    p t.round(2).iso8601(10)  #=> "2010-03-30T05:43:25.1200000000Z"
    p t.round(3).iso8601(10)  #=> "2010-03-30T05:43:25.1230000000Z"
    p t.round(4).iso8601(10)  #=> "2010-03-30T05:43:25.1235000000Z"
    p t.round(5).iso8601(10)  #=> "2010-03-30T05:43:25.1234600000Z"
    p t.round(6).iso8601(10)  #=> "2010-03-30T05:43:25.1234570000Z"
    p t.round(7).iso8601(10)  #=> "2010-03-30T05:43:25.1234568000Z"
    p t.round(8).iso8601(10)  #=> "2010-03-30T05:43:25.1234567900Z"
    p t.round(9).iso8601(10)  #=> "2010-03-30T05:43:25.1234567890Z"
    p t.round(10).iso8601(10) #=> "2010-03-30T05:43:25.1234567890Z"

    t = Time.utc(1999,12,31, 23,59,59)
    p((t + 0.4).round.iso8601(3))    #=> "1999-12-31T23:59:59.000Z"
    p((t + 0.49).round.iso8601(3))   #=> "1999-12-31T23:59:59.000Z"
    p((t + 0.5).round.iso8601(3))    #=> "2000-01-01T00:00:00.000Z"
    p((t + 1.4).round.iso8601(3))    #=> "2000-01-01T00:00:00.000Z"
    p((t + 1.49).round.iso8601(3))   #=> "2000-01-01T00:00:00.000Z"
    p((t + 1.5).round.iso8601(3))    #=> "2000-01-01T00:00:01.000Z"

    t = Time.utc(1999,12,31, 23,59,59)
    p (t + 0.123456789).round(4).iso8601(6)  #=> "1999-12-31T23:59:59.123500Z"


# Time#saturday?

(from ruby core)
---
    time.saturday? -> true or false

---

Returns `true` if *time* represents Saturday.

    t = Time.local(2006, 6, 10)      #=> 2006-06-10 00:00:00 -0500
    t.saturday?                      #=> true


# Time#sec

(from ruby core)
---
    time.sec -> integer

---

Returns the second of the minute (0..60) for *time*.

**Note:** Seconds range from zero to 60 to allow the system to inject leap
seconds. See http://en.wikipedia.org/wiki/Leap_second for further details.

    t = Time.now   #=> 2007-11-19 08:25:02 -0600
    t.sec          #=> 2


# Time#strftime

(from ruby core)
---
    time.strftime( string ) -> string

---

Formats *time* according to the directives in the given format string.

The directives begin with a percent (%) character. Any text not listed as a
directive will be passed through to the output string.

The directive consists of a percent (%) character, zero or more flags,
optional minimum field width, optional modifier and a conversion specifier as
follows:

    %<flags><width><modifier><conversion>

Flags:
    -  don't pad a numerical output
    _  use spaces for padding
    0  use zeros for padding
    ^  upcase the result string
    #  change case
    :  use colons for %z

The minimum field width specifies the minimum width.

The modifiers are "E" and "O". They are ignored.

Format directives:

    Date (Year, Month, Day):
      %Y - Year with century if provided, will pad result at least 4 digits.
              -0001, 0000, 1995, 2009, 14292, etc.
      %C - year / 100 (rounded down such as 20 in 2009)
      %y - year % 100 (00..99)

      %m - Month of the year, zero-padded (01..12)
              %_m  blank-padded ( 1..12)
              %-m  no-padded (1..12)
      %B - The full month name (``January'')
              %^B  uppercased (``JANUARY'')
      %b - The abbreviated month name (``Jan'')
              %^b  uppercased (``JAN'')
      %h - Equivalent to %b

      %d - Day of the month, zero-padded (01..31)
              %-d  no-padded (1..31)
      %e - Day of the month, blank-padded ( 1..31)

      %j - Day of the year (001..366)

    Time (Hour, Minute, Second, Subsecond):
      %H - Hour of the day, 24-hour clock, zero-padded (00..23)
      %k - Hour of the day, 24-hour clock, blank-padded ( 0..23)
      %I - Hour of the day, 12-hour clock, zero-padded (01..12)
      %l - Hour of the day, 12-hour clock, blank-padded ( 1..12)
      %P - Meridian indicator, lowercase (``am'' or ``pm'')
      %p - Meridian indicator, uppercase (``AM'' or ``PM'')

      %M - Minute of the hour (00..59)

      %S - Second of the minute (00..60)

      %L - Millisecond of the second (000..999)
           The digits under millisecond are truncated to not produce 1000.
      %N - Fractional seconds digits, default is 9 digits (nanosecond)
              %3N  millisecond (3 digits)
              %6N  microsecond (6 digits)
              %9N  nanosecond (9 digits)
              %12N picosecond (12 digits)
              %15N femtosecond (15 digits)
              %18N attosecond (18 digits)
              %21N zeptosecond (21 digits)
              %24N yoctosecond (24 digits)
           The digits under the specified length are truncated to avoid
           carry up.

    Time zone:
      %z - Time zone as hour and minute offset from UTC (e.g. +0900)
              %:z - hour and minute offset from UTC with a colon (e.g. +09:00)
              %::z - hour, minute and second offset from UTC (e.g. +09:00:00)
      %Z - Abbreviated time zone name or similar information.  (OS dependent)

    Weekday:
      %A - The full weekday name (``Sunday'')
              %^A  uppercased (``SUNDAY'')
      %a - The abbreviated name (``Sun'')
              %^a  uppercased (``SUN'')
      %u - Day of the week (Monday is 1, 1..7)
      %w - Day of the week (Sunday is 0, 0..6)

    ISO 8601 week-based year and week number:
    The first week of YYYY starts with a Monday and includes YYYY-01-04.
    The days in the year before the first week are in the last week of
    the previous year.
      %G - The week-based year
      %g - The last 2 digits of the week-based year (00..99)
      %V - Week number of the week-based year (01..53)

    Week number:
    The first week of YYYY that starts with a Sunday or Monday (according to %U
    or %W). The days in the year before the first week are in week 0.
      %U - Week number of the year. The week starts with Sunday. (00..53)
      %W - Week number of the year. The week starts with Monday. (00..53)

    Seconds since the Epoch:
      %s - Number of seconds since 1970-01-01 00:00:00 UTC.

    Literal string:
      %n - Newline character (\n)
      %t - Tab character (\t)
      %% - Literal ``%'' character

    Combination:
      %c - date and time (%a %b %e %T %Y)
      %D - Date (%m/%d/%y)
      %F - The ISO 8601 date format (%Y-%m-%d)
      %v - VMS date (%e-%^b-%4Y)
      %x - Same as %D
      %X - Same as %T
      %r - 12-hour time (%I:%M:%S %p)
      %R - 24-hour time (%H:%M)
      %T - 24-hour time (%H:%M:%S)

This method is similar to strftime() function defined in ISO C and POSIX.

While all directives are locale independent since Ruby 1.9, %Z is platform
dependent. So, the result may differ even if the same format string is used in
other systems such as C.

%z is recommended over %Z. %Z doesn't identify the timezone. For example,
"CST" is used at America/Chicago (-06:00), America/Havana (-05:00),
Asia/Harbin (+08:00), Australia/Darwin (+09:30) and Australia/Adelaide
(+10:30). Also, %Z is highly dependent on the operating system. For example,
it may generate a non ASCII string on Japanese Windows. i.e. the result can be
different to "JST". So the numeric time zone offset, %z, is recommended.

Examples:

    t = Time.new(2007,11,19,8,37,48,"-06:00") #=> 2007-11-19 08:37:48 -0600
    t.strftime("Printed on %m/%d/%Y")   #=> "Printed on 11/19/2007"
    t.strftime("at %I:%M%p")            #=> "at 08:37AM"

Various ISO 8601 formats:
    %Y%m%d           => 20071119                  Calendar date (basic)
    %F               => 2007-11-19                Calendar date (extended)
    %Y-%m            => 2007-11                   Calendar date, reduced accuracy, specific month
    %Y               => 2007                      Calendar date, reduced accuracy, specific year
    %C               => 20                        Calendar date, reduced accuracy, specific century
    %Y%j             => 2007323                   Ordinal date (basic)
    %Y-%j            => 2007-323                  Ordinal date (extended)
    %GW%V%u          => 2007W471                  Week date (basic)
    %G-W%V-%u        => 2007-W47-1                Week date (extended)
    %GW%V            => 2007W47                   Week date, reduced accuracy, specific week (basic)
    %G-W%V           => 2007-W47                  Week date, reduced accuracy, specific week (extended)
    %H%M%S           => 083748                    Local time (basic)
    %T               => 08:37:48                  Local time (extended)
    %H%M             => 0837                      Local time, reduced accuracy, specific minute (basic)
    %H:%M            => 08:37                     Local time, reduced accuracy, specific minute (extended)
    %H               => 08                        Local time, reduced accuracy, specific hour
    %H%M%S,%L        => 083748,000                Local time with decimal fraction, comma as decimal sign (basic)
    %T,%L            => 08:37:48,000              Local time with decimal fraction, comma as decimal sign (extended)
    %H%M%S.%L        => 083748.000                Local time with decimal fraction, full stop as decimal sign (basic)
    %T.%L            => 08:37:48.000              Local time with decimal fraction, full stop as decimal sign (extended)
    %H%M%S%z         => 083748-0600               Local time and the difference from UTC (basic)
    %T%:z            => 08:37:48-06:00            Local time and the difference from UTC (extended)
    %Y%m%dT%H%M%S%z  => 20071119T083748-0600      Date and time of day for calendar date (basic)
    %FT%T%:z         => 2007-11-19T08:37:48-06:00 Date and time of day for calendar date (extended)
    %Y%jT%H%M%S%z    => 2007323T083748-0600       Date and time of day for ordinal date (basic)
    %Y-%jT%T%:z      => 2007-323T08:37:48-06:00   Date and time of day for ordinal date (extended)
    %GW%V%uT%H%M%S%z => 2007W471T083748-0600      Date and time of day for week date (basic)
    %G-W%V-%uT%T%:z  => 2007-W47-1T08:37:48-06:00 Date and time of day for week date (extended)
    %Y%m%dT%H%M      => 20071119T0837             Calendar date and local time (basic)
    %FT%R            => 2007-11-19T08:37          Calendar date and local time (extended)
    %Y%jT%H%MZ       => 2007323T0837Z             Ordinal date and UTC of day (basic)
    %Y-%jT%RZ        => 2007-323T08:37Z           Ordinal date and UTC of day (extended)
    %GW%V%uT%H%M%z   => 2007W471T0837-0600        Week date and local time and difference from UTC (basic)
    %G-W%V-%uT%R%:z  => 2007-W47-1T08:37-06:00    Week date and local time and difference from UTC (extended)


# Time#subsec

(from ruby core)
---
    time.subsec    -> number

---

Returns the fraction for *time*.

The return value can be a rational number.

    t = Time.now        #=> 2009-03-26 22:33:12 +0900
    "%10.9f" % t.to_f   #=> "1238074392.940563917"
    t.subsec            #=> (94056401/100000000)

The lowest digits of #to_f and #subsec are different because IEEE 754 double
is not accurate enough to represent the rational number.

The more accurate value is returned by #subsec.


# Time#succ

(from ruby core)
---
    time.succ   -> new_time

---

Returns a new Time object, one second later than *time*. Time#succ is obsolete
since 1.9.2 for time is not a discrete value.

    t = Time.now       #=> 2007-11-19 08:23:57 -0600
    t.succ             #=> 2007-11-19 08:23:58 -0600

Use instead `time + 1`

    t + 1              #=> 2007-11-19 08:23:58 -0600


# Time#sunday?

(from ruby core)
---
    time.sunday? -> true or false

---

Returns `true` if *time* represents Sunday.

    t = Time.local(1990, 4, 1)       #=> 1990-04-01 00:00:00 -0600
    t.sunday?                        #=> true


# Time#thursday?

(from ruby core)
---
    time.thursday? -> true or false

---

Returns `true` if *time* represents Thursday.

    t = Time.local(1995, 12, 21)     #=> 1995-12-21 00:00:00 -0600
    p t.thursday?                    #=> true


# Time#to_a

(from ruby core)
---
    time.to_a -> array

---

Returns a ten-element *array* of values for *time*:

    [sec, min, hour, day, month, year, wday, yday, isdst, zone]

See the individual methods for an explanation of the valid ranges of each
value. The ten elements can be passed directly to Time::utc or Time::local to
create a new Time object.

    t = Time.now     #=> 2007-11-19 08:36:01 -0600
    now = t.to_a     #=> [1, 36, 8, 19, 11, 2007, 1, 323, false, "CST"]


# Time#to_date

(from ruby core)
---
    t.to_date  ->  date

---

Returns a Date object which denotes self.


# Time#to_datetime

(from ruby core)
---
    t.to_datetime  ->  datetime

---

Returns a DateTime object which denotes self.


# Time#to_f

(from ruby core)
---
    time.to_f -> float

---

Returns the value of *time* as a floating point number of seconds since the
Epoch.

    t = Time.now
    "%10.5f" % t.to_f   #=> "1270968744.77658"
    t.to_i              #=> 1270968744

Note that IEEE 754 double is not accurate enough to represent the number of
nanoseconds since the Epoch.


# Time#to_i

(from ruby core)
---
    time.to_i   -> int

---

Returns the value of *time* as an integer number of seconds since the Epoch.

    t = Time.now
    "%10.5f" % t.to_f   #=> "1270968656.89607"
    t.to_i              #=> 1270968656


# Time#to_json

(from ruby core)
---
    to_json(*args)

---

Stores class name (Time) with number of seconds since epoch and number of
microseconds for Time as JSON string


# Time#to_r

(from ruby core)
---
    time.to_r -> a_rational

---

Returns the value of *time* as a rational number of seconds since the Epoch.

    t = Time.now
    p t.to_r            #=> (1270968792716287611/1000000000)

This methods is intended to be used to get an accurate value representing the
nanoseconds since the Epoch. You can use this method to convert *time* to
another Epoch.


# Time#to_s

(from ruby core)
---
    time.to_s    -> string

---

Returns a string representing *time*. Equivalent to calling #strftime with the
appropriate format string.

    t = Time.now
    t.to_s                              => "2012-11-10 18:16:12 +0100"
    t.strftime "%Y-%m-%d %H:%M:%S %z"   => "2012-11-10 18:16:12 +0100"

    t.utc.to_s                          => "2012-11-10 17:16:12 UTC"
    t.strftime "%Y-%m-%d %H:%M:%S UTC"  => "2012-11-10 17:16:12 UTC"


(from gem activesupport-5.1.2)
---
    to_s(format = :default)

---


# Time#to_time

(from ruby core)
---
    t.to_time  ->  time

---

Returns self.


(from gem activesupport-5.1.2)
---
    to_time()

---

Either return `self` or the time in the local system timezone depending on the
setting of `ActiveSupport.to_time_preserves_timezone`.


# Time#tuesday?

(from ruby core)
---
    time.tuesday? -> true or false

---

Returns `true` if *time* represents Tuesday.

    t = Time.local(1991, 2, 19)      #=> 1991-02-19 00:00:00 -0600
    p t.tuesday?                     #=> true


# Time#tv_nsec

(from ruby core)
---
    time.tv_nsec -> int

---

Returns the number of nanoseconds for *time*.

    t = Time.now        #=> 2007-11-17 15:18:03 +0900
    "%10.9f" % t.to_f   #=> "1195280283.536151409"
    t.nsec              #=> 536151406

The lowest digits of #to_f and #nsec are different because IEEE 754 double is
not accurate enough to represent the exact number of nanoseconds since the
Epoch.

The more accurate value is returned by #nsec.


# Time#tv_sec

(from ruby core)
---
    time.tv_sec -> int

---

Returns the value of *time* as an integer number of seconds since the Epoch.

    t = Time.now
    "%10.5f" % t.to_f   #=> "1270968656.89607"
    t.to_i              #=> 1270968656


# Time#tv_usec

(from ruby core)
---
    time.tv_usec -> int

---

Returns the number of microseconds for *time*.

    t = Time.now        #=> 2007-11-19 08:03:26 -0600
    "%10.6f" % t.to_f   #=> "1195481006.775195"
    t.usec              #=> 775195


# Time#usec

(from ruby core)
---
    time.usec    -> int

---

Returns the number of microseconds for *time*.

    t = Time.now        #=> 2007-11-19 08:03:26 -0600
    "%10.6f" % t.to_f   #=> "1195481006.775195"
    t.usec              #=> 775195


# Time#utc

(from ruby core)
---
    time.gmtime    -> time
    time.utc       -> time

---

Converts *time* to UTC (GMT), modifying the receiver.

    t = Time.now   #=> 2007-11-19 08:18:31 -0600
    t.gmt?         #=> false
    t.gmtime       #=> 2007-11-19 14:18:31 UTC
    t.gmt?         #=> true

    t = Time.now   #=> 2007-11-19 08:18:51 -0600
    t.utc?         #=> false
    t.utc          #=> 2007-11-19 14:18:51 UTC
    t.utc?         #=> true


# Time#utc?

(from ruby core)
---
    time.utc? -> true or false

---

Returns `true` if *time* represents a time in UTC (GMT).

    t = Time.now                        #=> 2007-11-19 08:15:23 -0600
    t.utc?                              #=> false
    t = Time.gm(2000,"jan",1,20,15,1)   #=> 2000-01-01 20:15:01 UTC
    t.utc?                              #=> true

    t = Time.now                        #=> 2007-11-19 08:16:03 -0600
    t.gmt?                              #=> false
    t = Time.gm(2000,1,1,20,15,1)       #=> 2000-01-01 20:15:01 UTC
    t.gmt?                              #=> true


# Time#utc_offset

(from ruby core)
---
    time.utc_offset -> integer

---

Returns the offset in seconds between the timezone of *time* and UTC.

    t = Time.gm(2000,1,1,20,15,1)   #=> 2000-01-01 20:15:01 UTC
    t.gmt_offset                    #=> 0
    l = t.getlocal                  #=> 2000-01-01 14:15:01 -0600
    l.gmt_offset                    #=> -21600


# Time#w3cdtf

(from ruby core)
---
    w3cdtf()

---

This method converts a Time object to a String. The String contains the time
in W3CDTF date/time format.

The W3CDTF format is defined here: http://www.w3.org/TR/NOTE-datetime

    Time.now.w3cdtf
    # => "2013-08-26T14:12:10.817124-07:00"


# Time#wday

(from ruby core)
---
    time.wday -> integer

---

Returns an integer representing the day of the week, 0..6, with Sunday == 0.

    t = Time.now   #=> 2007-11-20 02:35:35 -0600
    t.wday         #=> 2
    t.sunday?      #=> false
    t.monday?      #=> false
    t.tuesday?     #=> true
    t.wednesday?   #=> false
    t.thursday?    #=> false
    t.friday?      #=> false
    t.saturday?    #=> false


# Time#wednesday?

(from ruby core)
---
    time.wednesday? -> true or false

---

Returns `true` if *time* represents Wednesday.

    t = Time.local(1993, 2, 24)      #=> 1993-02-24 00:00:00 -0600
    p t.wednesday?                   #=> true


# Time#xmlschema

(from ruby core)
---
    xmlschema(fraction_digits=0)

---

Returns a string which represents the time as a dateTime defined by XML
Schema:

    CCYY-MM-DDThh:mm:ssTZD
    CCYY-MM-DDThh:mm:ss.sssTZD

where TZD is Z or [+-]hh:mm.

If self is a UTC time, Z is used as TZD.  [+-]hh:mm is used otherwise.

`fractional_digits` specifies a number of digits to use for fractional
seconds.  Its default value is 0.

You must require 'time' to use this method.


# Time#yday

(from ruby core)
---
    time.yday -> integer

---

Returns an integer representing the day of the year, 1..366.

    t = Time.now   #=> 2007-11-19 08:32:31 -0600
    t.yday         #=> 323


# Time#year

(from ruby core)
---
    time.year -> integer

---

Returns the year for *time* (including the century).

    t = Time.now   #=> 2007-11-19 08:27:51 -0600
    t.year         #=> 2007


# Time#zone

(from ruby core)
---
    time.zone -> string

---

Returns the name of the time zone used for *time*. As of Ruby 1.8, returns
``UTC'' rather than ``GMT'' for UTC times.

    t = Time.gm(2000, "jan", 1, 20, 15, 1)
    t.zone   #=> "UTC"
    t = Time.local(2000, "jan", 1, 20, 15, 1)
    t.zone   #=> "CST"


(from gem activesupport-5.1.2)
---





---
# Constants:

COMMON_YEAR_DAYS_IN_MONTH
:   [not documented]
DATE_FORMATS
:   [not documented]


# Class methods:

    ===
    at
    at_with_coercion
    at_without_coercion
    current
    days_in_month
    days_in_year
    find_zone
    find_zone!
    rfc3339
    use_zone
    zone
    zone=
    zone_default

# Instance methods:

    -
    <=>
    acts_like_time?
    advance
    ago
    at_beginning_of_day
    at_beginning_of_hour
    at_beginning_of_minute
    at_end_of_day
    at_end_of_hour
    at_end_of_minute
    at_midday
    at_middle_of_day
    at_midnight
    at_noon
    beginning_of_day
    beginning_of_hour
    beginning_of_minute
    change
    compare_with_coercion
    compare_without_coercion
    end_of_day
    end_of_hour
    end_of_minute
    eql?
    eql_with_coercion
    eql_without_coercion
    formatted_offset
    in
    midday
    middle_of_day
    midnight
    minus_with_coercion
    minus_without_coercion
    minus_without_duration
    noon
    sec_fraction
    seconds_since_midnight
    seconds_until_end_of_day
    since
    to_default_s
    to_formatted_s
    to_s
    to_time

# Attributes:

    attr_accessor zone_default

# Time::===

(from gem activesupport-5.1.2)
---
    ===(other)

---

Overriding case equality method so that it returns true for
ActiveSupport::TimeWithZone instances


# Time::at

(from ruby core)
---
    Time.at(time) -> time
    Time.at(seconds_with_frac) -> time
    Time.at(seconds, microseconds_with_frac) -> time

---

Creates a new Time object with the value given by `time`, the given number of
`seconds_with_frac`, or `seconds` and `microseconds_with_frac` since the
Epoch. `seconds_with_frac` and `microseconds_with_frac` can be an Integer,
Float, Rational, or other Numeric. non-portable feature allows the offset to
be negative on some systems.

If a numeric argument is given, the result is in local time.

    Time.at(0)                           #=> 1969-12-31 18:00:00 -0600
    Time.at(Time.at(0))                  #=> 1969-12-31 18:00:00 -0600
    Time.at(946702800)                   #=> 1999-12-31 23:00:00 -0600
    Time.at(-284061600)                  #=> 1960-12-31 00:00:00 -0600
    Time.at(946684800.2).usec            #=> 200000
    Time.at(946684800, 123456.789).nsec  #=> 123456789


(from gem activesupport-5.1.2)
---
    at(*args)

---


# Time::at_with_coercion

(from gem activesupport-5.1.2)
---
    at_with_coercion(*args)

---

Layers additional behavior on Time.at so that ActiveSupport::TimeWithZone and
DateTime instances can be used when called with a single argument


# Time::at_without_coercion

(from gem activesupport-5.1.2)
---
    at_without_coercion(*args)

---


# Time::current

(from gem activesupport-5.1.2)
---
    current()

---

Returns `Time.zone.now` when `Time.zone` or `config.time_zone` are set,
otherwise just returns `Time.now`.


# Time::days_in_month

(from gem activesupport-5.1.2)
---
    days_in_month(month, year = current.year)

---

Returns the number of days in the given month. If no year is specified, it
will use the current year.


# Time::days_in_year

(from gem activesupport-5.1.2)
---
    days_in_year(year = current.year)

---

Returns the number of days in the given year. If no year is specified, it will
use the current year.


# Time::find_zone

(from gem activesupport-5.1.2)
---
    find_zone(time_zone)

---

Returns a TimeZone instance matching the time zone provided. Accepts the time
zone in any format supported by `Time.zone=`. Returns `nil` for invalid time
zones.

    Time.find_zone "America/New_York" # => #<ActiveSupport::TimeZone @name="America/New_York" ...>
    Time.find_zone "NOT-A-TIMEZONE"   # => nil


# Time::find_zone!

(from gem activesupport-5.1.2)
---
    find_zone!(time_zone)

---

Returns a TimeZone instance matching the time zone provided. Accepts the time
zone in any format supported by `Time.zone=`. Raises an `ArgumentError` for
invalid time zones.

    Time.find_zone! "America/New_York" # => #<ActiveSupport::TimeZone @name="America/New_York" ...>
    Time.find_zone! "EST"              # => #<ActiveSupport::TimeZone @name="EST" ...>
    Time.find_zone! -5.hours           # => #<ActiveSupport::TimeZone @name="Bogota" ...>
    Time.find_zone! nil                # => nil
    Time.find_zone! false              # => false
    Time.find_zone! "NOT-A-TIMEZONE"   # => ArgumentError: Invalid Timezone: NOT-A-TIMEZONE


# Time::rfc3339

(from gem activesupport-5.1.2)
---
    rfc3339(str)

---

Creates a `Time` instance from an RFC 3339 string.

    Time.rfc3339('1999-12-31T14:00:00-10:00') # => 2000-01-01 00:00:00 -1000

If the time or offset components are missing then an `ArgumentError` will be
raised.

    Time.rfc3339('1999-12-31') # => ArgumentError: invalid date


# Time::use_zone

(from gem activesupport-5.1.2)
---
    use_zone(time_zone) { || ... }

---

Allows override of `Time.zone` locally inside supplied block; resets
`Time.zone` to existing value when done.

     class ApplicationController < ActionController::Base
       around_action :set_time_zone

       private

       def set_time_zone
         Time.use_zone(current_user.timezone) { yield }
       end
     end

    NOTE: This won't affect any <tt>ActiveSupport::TimeWithZone</tt>
    objects that have already been created, e.g. any model timestamp
    attributes that have been read before the block will remain in
    the application's default timezone.


# Time::zone

(from gem activesupport-5.1.2)
---
    zone()

---

Returns the TimeZone for the current request, if this has been set (via
Time.zone=). If `Time.zone` has not been set for the current request, returns
the TimeZone specified in `config.time_zone`.


# Time::zone=

(from gem activesupport-5.1.2)
---
    zone=(time_zone)

---

Sets `Time.zone` to a TimeZone object for the current request/thread.

This method accepts any of the following:

*   A Rails TimeZone object.
*   An identifier for a Rails TimeZone object (e.g., "Eastern Time (US &
    Canada)", `-5.hours`).
*   A TZInfo::Timezone object.
*   An identifier for a TZInfo::Timezone object (e.g., "America/New_York").


Here's an example of how you might set `Time.zone` on a per request basis and
reset it when the request is done. `current_user.time_zone` just needs to
return a string identifying the user's preferred time zone:

    class ApplicationController < ActionController::Base
      around_action :set_time_zone

      def set_time_zone
        if logged_in?
          Time.use_zone(current_user.time_zone) { yield }
        else
          yield
        end
      end
    end


# Time#-

(from ruby core)
---
    time - other_time -> float
    time - numeric    -> time

---

Difference --- Returns a new Time object that represents the difference
between *time* and `other_time`, or subtracts the given number of seconds in
`numeric` from *time*.

    t = Time.now       #=> 2007-11-19 08:23:10 -0600
    t2 = t + 2592000   #=> 2007-12-19 08:23:10 -0600
    t2 - t             #=> 2592000.0
    t2 - 2592000       #=> 2007-11-19 08:23:10 -0600


(from gem activesupport-5.1.2)
---
    -(other)

---


# Time#<=>

(from ruby core)
---
    time <=> other_time -> -1, 0, +1 or nil

---

Comparison---Compares `time` with `other_time`.

-1, 0, +1 or nil depending on whether `time` is less  than, equal to, or
greater than `other_time`.

`nil` is returned if the two values are incomparable.

    t = Time.now       #=> 2007-11-19 08:12:12 -0600
    t2 = t + 2592000   #=> 2007-12-19 08:12:12 -0600
    t <=> t2           #=> -1
    t2 <=> t           #=> 1

    t = Time.now       #=> 2007-11-19 08:13:38 -0600
    t2 = t + 0.1       #=> 2007-11-19 08:13:38 -0600
    t.nsec             #=> 98222999
    t2.nsec            #=> 198222999
    t <=> t2           #=> -1
    t2 <=> t           #=> 1
    t <=> t            #=> 0


(from gem activesupport-5.1.2)
---
    <=>(other)

---


# Time#acts_like_time?

(from gem activesupport-5.1.2)
---
    acts_like_time?()

---

Duck-types as a Time-like class. See Object#acts_like?.


# Time#advance

(from gem activesupport-5.1.2)
---
    advance(options)

---

Uses Date to provide precise Time calculations for years, months, and days
according to the proleptic Gregorian calendar. The `options` parameter takes a
hash with any of these keys: `:years`, `:months`, `:weeks`, `:days`, `:hours`,
`:minutes`, `:seconds`.

    Time.new(2015, 8, 1, 14, 35, 0).advance(seconds: 1) # => 2015-08-01 14:35:01 -0700
    Time.new(2015, 8, 1, 14, 35, 0).advance(minutes: 1) # => 2015-08-01 14:36:00 -0700
    Time.new(2015, 8, 1, 14, 35, 0).advance(hours: 1)   # => 2015-08-01 15:35:00 -0700
    Time.new(2015, 8, 1, 14, 35, 0).advance(days: 1)    # => 2015-08-02 14:35:00 -0700
    Time.new(2015, 8, 1, 14, 35, 0).advance(weeks: 1)   # => 2015-08-08 14:35:00 -0700


# Time#ago

(from gem activesupport-5.1.2)
---
    ago(seconds)

---

Returns a new Time representing the time a number of seconds ago, this is
basically a wrapper around the Numeric extension


# Time#at_beginning_of_day

(from gem activesupport-5.1.2)
---
    at_beginning_of_day()

---


# Time#at_beginning_of_hour

(from gem activesupport-5.1.2)
---
    at_beginning_of_hour()

---


# Time#at_beginning_of_minute

(from gem activesupport-5.1.2)
---
    at_beginning_of_minute()

---


# Time#at_end_of_day

(from gem activesupport-5.1.2)
---
    at_end_of_day()

---


# Time#at_end_of_hour

(from gem activesupport-5.1.2)
---
    at_end_of_hour()

---


# Time#at_end_of_minute

(from gem activesupport-5.1.2)
---
    at_end_of_minute()

---


# Time#at_midday

(from gem activesupport-5.1.2)
---
    at_midday()

---


# Time#at_middle_of_day

(from gem activesupport-5.1.2)
---
    at_middle_of_day()

---


# Time#at_midnight

(from gem activesupport-5.1.2)
---
    at_midnight()

---


# Time#at_noon

(from gem activesupport-5.1.2)
---
    at_noon()

---


# Time#beginning_of_day

(from gem activesupport-5.1.2)
---
    beginning_of_day()

---

Returns a new Time representing the start of the day (0:00)


# Time#beginning_of_hour

(from gem activesupport-5.1.2)
---
    beginning_of_hour()

---

Returns a new Time representing the start of the hour (x:00)


# Time#beginning_of_minute

(from gem activesupport-5.1.2)
---
    beginning_of_minute()

---

Returns a new Time representing the start of the minute (x:xx:00)


# Time#change

(from gem activesupport-5.1.2)
---
    change(options)

---

Returns a new Time where one or more of the elements have been changed
according to the `options` parameter. The time options (`:hour`, `:min`,
`:sec`, `:usec`, `:nsec`) reset cascadingly, so if only the hour is passed,
then minute, sec, usec and nsec is set to 0. If the hour and minute is passed,
then sec, usec and nsec is set to 0. The `options` parameter takes a hash with
any of these keys: `:year`, `:month`, `:day`, `:hour`, `:min`, `:sec`, `:usec`
`:nsec`. Pass either `:usec` or `:nsec`, not both.

    Time.new(2012, 8, 29, 22, 35, 0).change(day: 1)              # => Time.new(2012, 8, 1, 22, 35, 0)
    Time.new(2012, 8, 29, 22, 35, 0).change(year: 1981, day: 1)  # => Time.new(1981, 8, 1, 22, 35, 0)
    Time.new(2012, 8, 29, 22, 35, 0).change(year: 1981, hour: 0) # => Time.new(1981, 8, 29, 0, 0, 0)


# Time#compare_with_coercion

(from gem activesupport-5.1.2)
---
    compare_with_coercion(other)

---

Layers additional behavior on Time#<=> so that DateTime and
ActiveSupport::TimeWithZone instances can be chronologically compared with a
Time


# Time#compare_without_coercion

(from gem activesupport-5.1.2)
---
    compare_without_coercion(other)

---


# Time#end_of_day

(from gem activesupport-5.1.2)
---
    end_of_day()

---

Returns a new Time representing the end of the day, 23:59:59.999999


# Time#end_of_hour

(from gem activesupport-5.1.2)
---
    end_of_hour()

---

Returns a new Time representing the end of the hour, x:59:59.999999


# Time#end_of_minute

(from gem activesupport-5.1.2)
---
    end_of_minute()

---

Returns a new Time representing the end of the minute, x:xx:59.999999


# Time#eql?

(from ruby core)
---
    time.eql?(other_time)

---

Returns `true` if *time* and `other_time` are both Time objects with the same
seconds and fractional seconds.


(from gem activesupport-5.1.2)
---
    eql?(other)

---


# Time#eql_with_coercion

(from gem activesupport-5.1.2)
---
    eql_with_coercion(other)

---

Layers additional behavior on Time#eql? so that ActiveSupport::TimeWithZone
instances can be eql? to an equivalent Time


# Time#eql_without_coercion

(from gem activesupport-5.1.2)
---
    eql_without_coercion(other)

---


# Time#formatted_offset

(from gem activesupport-5.1.2)
---
    formatted_offset(colon = true, alternate_utc_string = nil)

---

Returns a formatted string of the offset from UTC, or an alternative string if
the time zone is already UTC.

    Time.local(2000).formatted_offset        # => "-06:00"
    Time.local(2000).formatted_offset(false) # => "-0600"


# Time#in

(from gem activesupport-5.1.2)
---
    in(seconds)

---


# Time#midday

(from gem activesupport-5.1.2)
---
    midday()

---


# Time#middle_of_day

(from gem activesupport-5.1.2)
---
    middle_of_day()

---

Returns a new Time representing the middle of the day (12:00)


# Time#midnight

(from gem activesupport-5.1.2)
---
    midnight()

---


# Time#minus_with_coercion

(from gem activesupport-5.1.2)
---
    minus_with_coercion(other)

---

Time#- can also be used to determine the number of seconds between two Time
instances. We're layering on additional behavior so that
ActiveSupport::TimeWithZone instances are coerced into values that Time#- will
recognize


# Time#minus_without_coercion

(from gem activesupport-5.1.2)
---
    minus_without_coercion(other)

---


# Time#minus_without_duration

(from gem activesupport-5.1.2)
---
    minus_without_duration(other)

---


# Time#noon

(from gem activesupport-5.1.2)
---
    noon()

---


# Time#sec_fraction

(from gem activesupport-5.1.2)
---
    sec_fraction()

---

Returns the fraction of a second as a `Rational`

    Time.new(2012, 8, 29, 0, 0, 0.5).sec_fraction # => (1/2)


# Time#seconds_since_midnight

(from gem activesupport-5.1.2)
---
    seconds_since_midnight()

---

Returns the number of seconds since 00:00:00.

    Time.new(2012, 8, 29,  0,  0,  0).seconds_since_midnight # => 0.0
    Time.new(2012, 8, 29, 12, 34, 56).seconds_since_midnight # => 45296.0
    Time.new(2012, 8, 29, 23, 59, 59).seconds_since_midnight # => 86399.0


# Time#seconds_until_end_of_day

(from gem activesupport-5.1.2)
---
    seconds_until_end_of_day()

---

Returns the number of seconds until 23:59:59.

    Time.new(2012, 8, 29,  0,  0,  0).seconds_until_end_of_day # => 86399
    Time.new(2012, 8, 29, 12, 34, 56).seconds_until_end_of_day # => 41103
    Time.new(2012, 8, 29, 23, 59, 59).seconds_until_end_of_day # => 0


# Time#since

(from gem activesupport-5.1.2)
---
    since(seconds)

---

Returns a new Time representing the time a number of seconds since the
instance time


# Time#to_default_s

(from gem activesupport-5.1.2)
---
    to_default_s(format = :default)

---


# Time#to_formatted_s

(from gem activesupport-5.1.2)
---
    to_formatted_s(format = :default)

---

Converts to a formatted string. See DATE_FORMATS for built-in formats.

This method is aliased to `to_s`.

    time = Time.now                    # => 2007-01-18 06:10:17 -06:00

    time.to_formatted_s(:time)         # => "06:10"
    time.to_s(:time)                   # => "06:10"

    time.to_formatted_s(:db)           # => "2007-01-18 06:10:17"
    time.to_formatted_s(:number)       # => "20070118061017"
    time.to_formatted_s(:short)        # => "18 Jan 06:10"
    time.to_formatted_s(:long)         # => "January 18, 2007 06:10"
    time.to_formatted_s(:long_ordinal) # => "January 18th, 2007 06:10"
    time.to_formatted_s(:rfc822)       # => "Thu, 18 Jan 2007 06:10:17 -0600"
    time.to_formatted_s(:iso8601)      # => "2007-01-18T06:10:17-06:00"

## Adding your own time formats to `to_formatted_s`
You can add your own formats to the Time::DATE_FORMATS hash. Use the format
name as the hash key and either a strftime string or Proc instance that takes
a time argument as the value.

    # config/initializers/time_formats.rb
    Time::DATE_FORMATS[:month_and_year] = '%B %Y'
    Time::DATE_FORMATS[:short_ordinal]  = ->(time) { time.strftime("%B #{time.day.ordinalize}") }


# Time#to_s

(from ruby core)
---
    time.to_s    -> string

---

Returns a string representing *time*. Equivalent to calling #strftime with the
appropriate format string.

    t = Time.now
    t.to_s                              => "2012-11-10 18:16:12 +0100"
    t.strftime "%Y-%m-%d %H:%M:%S %z"   => "2012-11-10 18:16:12 +0100"

    t.utc.to_s                          => "2012-11-10 17:16:12 UTC"
    t.strftime "%Y-%m-%d %H:%M:%S UTC"  => "2012-11-10 17:16:12 UTC"


(from gem activesupport-5.1.2)
---
    to_s(format = :default)

---


# Time#to_time

(from ruby core)
---
    t.to_time  ->  time

---

Returns self.


(from gem activesupport-5.1.2)
---
    to_time()

---

Either return `self` or the time in the local system timezone depending on the
setting of `ActiveSupport.to_time_preserves_timezone`.


