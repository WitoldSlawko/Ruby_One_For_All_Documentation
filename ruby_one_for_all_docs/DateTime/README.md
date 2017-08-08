# DateTime < Date

---
# Includes:
DateAndTime::Compatibility (from gem activesupport-5.1.2)

(from ruby core)
---
## DateTime

A subclass of Date that easily handles date, hour, minute, second and offset.

DateTime does not consider any leap seconds, does not track any summer time
rules.

DateTime object is created with DateTime::new, DateTime::jd,
DateTime::ordinal, DateTime::commercial, DateTime::parse, DateTime::strptime,
DateTime::now, Time#to_datetime or etc.

    require 'date'

    DateTime.new(2001,2,3,4,5,6)
                        #=> #<DateTime: 2001-02-03T04:05:06+00:00 ...>

The last element of day, hour, minute or second can be fractional number. The
fractional number's precision is assumed at most nanosecond.

    DateTime.new(2001,2,3.5)
                        #=> #<DateTime: 2001-02-03T12:00:00+00:00 ...>

An optional argument the offset indicates the difference between the local
time and UTC. For example, `Rational(3,24)` represents ahead of 3 hours of
UTC, `Rational(-5,24)` represents behind of 5 hours of UTC. The offset should
be -1 to +1, and its precision is assumed at most second. The default value is
zero(equals to UTC).

    DateTime.new(2001,2,3,4,5,6,Rational(3,24))
                        #=> #<DateTime: 2001-02-03T04:05:06+03:00 ...>

also accepts string form.

    DateTime.new(2001,2,3,4,5,6,'+03:00')
                        #=> #<DateTime: 2001-02-03T04:05:06+03:00 ...>

An optional argument the day of calendar reform (start) denotes a Julian day
number, which should be 2298874 to 2426355 or -/+oo.  The default value is
`Date::ITALY` (2299161=1582-10-15).

DateTime object has various methods. See each reference.

    d = DateTime.parse('3rd Feb 2001 04:05:06+03:30')
                        #=> #<DateTime: 2001-02-03T04:05:06+03:30 ...>
    d.hour              #=> 4
    d.min               #=> 5
    d.sec               #=> 6
    d.offset            #=> (7/48)
    d.zone              #=> "+03:30"
    d += Rational('1.5')
                        #=> #<DateTime: 2001-02-04%16:05:06+03:30 ...>
    d = d.new_offset('+09:00')
                        #=> #<DateTime: 2001-02-04%21:35:06+09:00 ...>
    d.strftime('%I:%M:%S %p')
                        #=> "09:35:06 PM"
    d > DateTime.new(1999)
                        #=> true

### When should you use DateTime and when should you use Time?

It's a common misconception that [William
Shakespeare](http://en.wikipedia.org/wiki/William_Shakespeare) and [Miguel de
Cervantes](http://en.wikipedia.org/wiki/Miguel_de_Cervantes) died on the same
day in history - so much so that UNESCO named April 23 as [World Book Day
because of this fact](http://en.wikipedia.org/wiki/World_Book_Day). However
because England hadn't yet adopted [Gregorian Calendar
Reform](http://en.wikipedia.org/wiki/Gregorian_calendar#Gregorian_reform) (and
wouldn't until
[1752](http://en.wikipedia.org/wiki/Calendar_(New_Style)_Act_1750)) their
deaths are actually 10 days apart. Since Ruby's Time class implements a
[proleptic Gregorian
calendar](http://en.wikipedia.org/wiki/Proleptic_Gregorian_calendar) and has
no concept of calendar reform then there's no way to express this. This is
where DateTime steps in:

    shakespeare = DateTime.iso8601('1616-04-23', Date::ENGLAND)
     #=> Tue, 23 Apr 1616 00:00:00 +0000
    cervantes = DateTime.iso8601('1616-04-23', Date::ITALY)
     #=> Sat, 23 Apr 1616 00:00:00 +0000

Already you can see something's weird - the days of the week are different,
taking this further:

    cervantes == shakespeare
     #=> false
    (shakespeare - cervantes).to_i
     #=> 10

This shows that in fact they died 10 days apart (in reality 11 days since
Cervantes died a day earlier but was buried on the 23rd). We can see the
actual date of Shakespeare's death by using the #gregorian method to convert
it:

    shakespeare.gregorian
     #=> Tue, 03 May 1616 00:00:00 +0000

So there's an argument that all the celebrations that take place on the 23rd
April in Stratford-upon-Avon are actually the wrong date since England is now
using the Gregorian calendar. You can see why when we transition across the
reform date boundary:

    # start off with the anniversary of Shakespeare's birth in 1751
    shakespeare = DateTime.iso8601('1751-04-23', Date::ENGLAND)
     #=> Tue, 23 Apr 1751 00:00:00 +0000

    # add 366 days since 1752 is a leap year and April 23 is after February 29
    shakespeare + 366
     #=> Thu, 23 Apr 1752 00:00:00 +0000

    # add another 365 days to take us to the anniversary in 1753
    shakespeare + 366 + 365
     #=> Fri, 04 May 1753 00:00:00 +0000

As you can see, if we're accurately tracking the number of [solar
years](http://en.wikipedia.org/wiki/Tropical_year) since Shakespeare's
birthday then the correct anniversary date would be the 4th May and not the
23rd April.

So when should you use DateTime in Ruby and when should you use Time? Almost
certainly you'll want to use Time since your app is probably dealing with
current dates and times. However, if you need to deal with dates and times in
a historical context you'll want to use DateTime to avoid making the same
mistakes as UNESCO. If you also have to deal with timezones then best of luck
- just bear in mind that you'll probably be dealing with [local solar
times](http://en.wikipedia.org/wiki/Solar_time), since it wasn't until the
19th century that the introduction of the railways necessitated the need for
[Standard Time](http://en.wikipedia.org/wiki/Standard_time#Great_Britain) and
eventually timezones.

---
# Class methods:

    _strptime
    civil
    commercial
    httpdate
    iso8601
    jd
    jisx0301
    json_create
    new
    now
    ordinal
    parse
    rfc2822
    rfc3339
    rfc822
    strptime
    xmlschema

# Instance methods:

    as_json
    iso8601
    jisx0301
    rfc3339
    strftime
    to_date
    to_datetime
    to_json
    to_s
    to_time
    xmlschema

# DateTime::_strptime

(from ruby core)
---
    DateTime._strptime(string[, format='%FT%T%z'])  ->  hash

---

Parses the given representation of date and time with the given template, and
returns a hash of parsed elements.  _strptime does not support specification
of flags and width unlike strftime.

    See also strptime(3) and strftime.


# DateTime::civil

(from ruby core)
---
    DateTime.civil([year=-4712[, month=1[, mday=1[, hour=0[, minute=0[, second=0[, offset=0[, start=Date::ITALY]]]]]]]])  ->  datetime

---

Creates a date-time object denoting the given calendar date.

    DateTime.new(2001,2,3)    #=> #<DateTime: 2001-02-03T00:00:00+00:00 ...>
    DateTime.new(2001,2,3,4,5,6,'+7')
                              #=> #<DateTime: 2001-02-03T04:05:06+07:00 ...>
    DateTime.new(2001,-11,-26,-20,-55,-54,'+7')
                              #=> #<DateTime: 2001-02-03T04:05:06+07:00 ...>


# DateTime::commercial

(from ruby core)
---
    DateTime.commercial([cwyear=-4712[, cweek=1[, cwday=1[, hour=0[, minute=0[, second=0[, offset=0[, start=Date::ITALY]]]]]]]])  ->  datetime

---

Creates a date-time object denoting the given week date.

    DateTime.commercial(2001) #=> #<DateTime: 2001-01-01T00:00:00+00:00 ...>
    DateTime.commercial(2002) #=> #<DateTime: 2001-12-31T00:00:00+00:00 ...>
    DateTime.commercial(2001,5,6,4,5,6,'+7')
                              #=> #<DateTime: 2001-02-03T04:05:06+07:00 ...>


# DateTime::httpdate

(from ruby core)
---
    DateTime.httpdate(string='Mon, 01 Jan -4712 00:00:00 GMT'[, start=ITALY])  ->  datetime

---

Creates a new Date object by parsing from a string according to some RFC 2616
format.

    DateTime.httpdate('Sat, 03 Feb 2001 04:05:06 GMT')
                              #=> #<DateTime: 2001-02-03T04:05:06+00:00 ...>


# DateTime::iso8601

(from ruby core)
---
    DateTime.iso8601(string='-4712-01-01T00:00:00+00:00'[, start=ITALY])  ->  datetime

---

Creates a new Date object by parsing from a string according to some typical
ISO 8601 formats.

    DateTime.iso8601('2001-02-03T04:05:06+07:00')
                              #=> #<DateTime: 2001-02-03T04:05:06+07:00 ...>
    DateTime.iso8601('20010203T040506+0700')
                              #=> #<DateTime: 2001-02-03T04:05:06+07:00 ...>
    DateTime.iso8601('2001-W05-6T04:05:06+07:00')
                              #=> #<DateTime: 2001-02-03T04:05:06+07:00 ...>


# DateTime::jd

(from ruby core)
---
    DateTime.jd([jd=0[, hour=0[, minute=0[, second=0[, offset=0[, start=Date::ITALY]]]]]])  ->  datetime

---

Creates a datetime object denoting the given chronological Julian day number.

    DateTime.jd(2451944)      #=> #<DateTime: 2001-02-03T00:00:00+00:00 ...>
    DateTime.jd(2451945)      #=> #<DateTime: 2001-02-04T00:00:00+00:00 ...>
    DateTime.jd(Rational('0.5'))
                              #=> #<DateTime: -4712-01-01T12:00:00+00:00 ...>


# DateTime::jisx0301

(from ruby core)
---
    DateTime.jisx0301(string='-4712-01-01T00:00:00+00:00'[, start=ITALY])  ->  datetime

---

Creates a new Date object by parsing from a string according to some typical
JIS X 0301 formats.

    DateTime.jisx0301('H13.02.03T04:05:06+07:00')
                              #=> #<DateTime: 2001-02-03T04:05:06+07:00 ...>


# DateTime::json_create

(from ruby core)
---
    json_create(object)

---

Deserializes JSON string by converting year `y`, month `m`, day `d`, hour `H`,
minute `M`, second `S`, offset `of` and Day of Calendar Reform `sg` to
DateTime.


# DateTime::new

(from ruby core)
---
    DateTime.new([year=-4712[, month=1[, mday=1[, hour=0[, minute=0[, second=0[, offset=0[, start=Date::ITALY]]]]]]]])    ->  datetime

---

Creates a date-time object denoting the given calendar date.

    DateTime.new(2001,2,3)    #=> #<DateTime: 2001-02-03T00:00:00+00:00 ...>
    DateTime.new(2001,2,3,4,5,6,'+7')
                              #=> #<DateTime: 2001-02-03T04:05:06+07:00 ...>
    DateTime.new(2001,-11,-26,-20,-55,-54,'+7')
                              #=> #<DateTime: 2001-02-03T04:05:06+07:00 ...>


# DateTime::now

(from ruby core)
---
    DateTime.now([start=Date::ITALY])  ->  datetime

---

Creates a date-time object denoting the present time.

    DateTime.now              #=> #<DateTime: 2011-06-11T21:20:44+09:00 ...>


# DateTime::ordinal

(from ruby core)
---
    DateTime.ordinal([year=-4712[, yday=1[, hour=0[, minute=0[, second=0[, offset=0[, start=Date::ITALY]]]]]]])  ->  datetime

---

Creates a date-time object denoting the given ordinal date.

    DateTime.ordinal(2001,34) #=> #<DateTime: 2001-02-03T00:00:00+00:00 ...>
    DateTime.ordinal(2001,34,4,5,6,'+7')
                              #=> #<DateTime: 2001-02-03T04:05:06+07:00 ...>
    DateTime.ordinal(2001,-332,-20,-55,-54,'+7')
                              #=> #<DateTime: 2001-02-03T04:05:06+07:00 ...>


# DateTime::parse

(from ruby core)
---
    DateTime.parse(string='-4712-01-01T00:00:00+00:00'[, comp=true[, start=ITALY]])  ->  datetime

---

Parses the given representation of date and time, and creates a date object. 
This method does not function as a validator.

If the optional second argument is true and the detected year is in the range
"00" to "99", makes it full.

    DateTime.parse('2001-02-03T04:05:06+07:00')
                              #=> #<DateTime: 2001-02-03T04:05:06+07:00 ...>
    DateTime.parse('20010203T040506+0700')
                              #=> #<DateTime: 2001-02-03T04:05:06+07:00 ...>
    DateTime.parse('3rd Feb 2001 04:05:06 PM')
                              #=> #<DateTime: 2001-02-03T16:05:06+00:00 ...>


# DateTime::rfc2822

(from ruby core)
---
    DateTime.rfc2822(string='Mon, 1 Jan -4712 00:00:00 +0000'[, start=ITALY])  ->  datetime

---

Creates a new Date object by parsing from a string according to some typical
RFC 2822 formats.

    DateTime.rfc2822('Sat, 3 Feb 2001 04:05:06 +0700')
                             #=> #<DateTime: 2001-02-03T04:05:06+07:00 ...>


# DateTime::rfc3339

(from ruby core)
---
    DateTime.rfc3339(string='-4712-01-01T00:00:00+00:00'[, start=ITALY])  ->  datetime

---

Creates a new Date object by parsing from a string according to some typical
RFC 3339 formats.

    DateTime.rfc3339('2001-02-03T04:05:06+07:00')
                              #=> #<DateTime: 2001-02-03T04:05:06+07:00 ...>


# DateTime::rfc822

(from ruby core)
---
    DateTime.rfc822(string='Mon, 1 Jan -4712 00:00:00 +0000'[, start=ITALY])   ->  datetime

---

Creates a new Date object by parsing from a string according to some typical
RFC 2822 formats.

    DateTime.rfc2822('Sat, 3 Feb 2001 04:05:06 +0700')
                             #=> #<DateTime: 2001-02-03T04:05:06+07:00 ...>


# DateTime::strptime

(from ruby core)
---
    DateTime.strptime([string='-4712-01-01T00:00:00+00:00'[, format='%FT%T%z'[ ,start=ITALY]]])  ->  datetime

---

Parses the given representation of date and time with the given template, and
creates a date object.  strptime does not support specification of flags and
width unlike strftime.

    DateTime.strptime('2001-02-03T04:05:06+07:00', '%Y-%m-%dT%H:%M:%S%z')
                              #=> #<DateTime: 2001-02-03T04:05:06+07:00 ...>
    DateTime.strptime('03-02-2001 04:05:06 PM', '%d-%m-%Y %I:%M:%S %p')
                              #=> #<DateTime: 2001-02-03T16:05:06+00:00 ...>
    DateTime.strptime('2001-W05-6T04:05:06+07:00', '%G-W%V-%uT%H:%M:%S%z')
                              #=> #<DateTime: 2001-02-03T04:05:06+07:00 ...>
    DateTime.strptime('2001 04 6 04 05 06 +7', '%Y %U %w %H %M %S %z')
                              #=> #<DateTime: 2001-02-03T04:05:06+07:00 ...>
    DateTime.strptime('2001 05 6 04 05 06 +7', '%Y %W %u %H %M %S %z')
                              #=> #<DateTime: 2001-02-03T04:05:06+07:00 ...>
    DateTime.strptime('-1', '%s')
                              #=> #<DateTime: 1969-12-31T23:59:59+00:00 ...>
    DateTime.strptime('-1000', '%Q')
                              #=> #<DateTime: 1969-12-31T23:59:59+00:00 ...>
    DateTime.strptime('sat3feb014pm+7', '%a%d%b%y%H%p%z')
                              #=> #<DateTime: 2001-02-03T16:00:00+07:00 ...>

See also strptime(3) and strftime.


# DateTime::xmlschema

(from ruby core)
---
    DateTime.xmlschema(string='-4712-01-01T00:00:00+00:00'[, start=ITALY])  ->  datetime

---

Creates a new Date object by parsing from a string according to some typical
XML Schema formats.

    DateTime.xmlschema('2001-02-03T04:05:06+07:00')
                              #=> #<DateTime: 2001-02-03T04:05:06+07:00 ...>


# DateTime#as_json

(from ruby core)
---
    as_json(*)

---

Returns a hash, that will be turned into a JSON object and represent this
object.


# DateTime#iso8601

(from ruby core)
---
    dt.iso8601([n=0])    ->  string
    dt.xmlschema([n=0])  ->  string

---

This method is equivalent to strftime('%FT%T').  The optional argument n is
length of fractional seconds.

    DateTime.parse('2001-02-03T04:05:06.123456789+07:00').iso8601(9)
                              #=> "2001-02-03T04:05:06.123456789+07:00"


# DateTime#jisx0301

(from ruby core)
---
    dt.jisx0301([n=0])  ->  string

---

Returns a string in a JIS X 0301 format.  The optional argument n is length of
fractional seconds.

    DateTime.parse('2001-02-03T04:05:06.123456789+07:00').jisx0301(9)
                              #=> "H13.02.03T04:05:06.123456789+07:00"


# DateTime#rfc3339

(from ruby core)
---
    dt.rfc3339([n=0])  ->  string

---

This method is equivalent to strftime('%FT%T').  The optional argument n is
length of fractional seconds.

    DateTime.parse('2001-02-03T04:05:06.123456789+07:00').rfc3339(9)
                              #=> "2001-02-03T04:05:06.123456789+07:00"


# DateTime#strftime

(from ruby core)
---
    dt.strftime([format='%FT%T%:z'])  ->  string

---

Formats date according to the directives in the given format string. The
directives begins with a percent (%) character. Any text not listed as a
directive will be passed through to the output string.

The directive consists of a percent (%) character, zero or more flags,
optional minimum field width, optional modifier and a conversion specifier as
follows.

    %<flags><width><modifier><conversion>

Flags:
    -  don't pad a numerical output.
    _  use spaces for padding.
    0  use zeros for padding.
    ^  upcase the result string.
    #  change case.
    :  use colons for %z.

The minimum field width specifies the minimum width.

The modifier is "E" and "O". They are ignored.

Format directives:

    Date (Year, Month, Day):
      %Y - Year with century (can be negative, 4 digits at least)
              -0001, 0000, 1995, 2009, 14292, etc.
      %C - year / 100 (round down.  20 in 2009)
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

      %S - Second of the minute (00..59)

      %L - Millisecond of the second (000..999)
      %N - Fractional seconds digits, default is 9 digits (nanosecond)
              %3N  millisecond (3 digits)   %15N femtosecond (15 digits)
              %6N  microsecond (6 digits)   %18N attosecond  (18 digits)
              %9N  nanosecond  (9 digits)   %21N zeptosecond (21 digits)
              %12N picosecond (12 digits)   %24N yoctosecond (24 digits)

    Time zone:
      %z - Time zone as hour and minute offset from UTC (e.g. +0900)
              %:z - hour and minute offset from UTC with a colon (e.g. +09:00)
              %::z - hour, minute and second offset from UTC (e.g. +09:00:00)
              %:::z - hour, minute and second offset from UTC
                                                (e.g. +09, +09:30, +09:30:30)
      %Z - Time zone abbreviation name or something similar information.

    Weekday:
      %A - The full weekday name (``Sunday'')
              %^A  uppercased (``SUNDAY'')
      %a - The abbreviated name (``Sun'')
              %^a  uppercased (``SUN'')
      %u - Day of the week (Monday is 1, 1..7)
      %w - Day of the week (Sunday is 0, 0..6)

    ISO 8601 week-based year and week number:
    The week 1 of YYYY starts with a Monday and includes YYYY-01-04.
    The days in the year before the first week are in the last week of
    the previous year.
      %G - The week-based year
      %g - The last 2 digits of the week-based year (00..99)
      %V - Week number of the week-based year (01..53)

    Week number:
    The week 1 of YYYY starts with a Sunday or Monday (according to %U
    or %W).  The days in the year before the first week are in week 0.
      %U - Week number of the year.  The week starts with Sunday.  (00..53)
      %W - Week number of the year.  The week starts with Monday.  (00..53)

    Seconds since the Unix Epoch:
      %s - Number of seconds since 1970-01-01 00:00:00 UTC.
      %Q - Number of milliseconds since 1970-01-01 00:00:00 UTC.

    Literal string:
      %n - Newline character (\n)
      %t - Tab character (\t)
      %% - Literal ``%'' character

    Combination:
      %c - date and time (%a %b %e %T %Y)
      %D - Date (%m/%d/%y)
      %F - The ISO 8601 date format (%Y-%m-%d)
      %v - VMS date (%e-%b-%Y)
      %x - Same as %D
      %X - Same as %T
      %r - 12-hour time (%I:%M:%S %p)
      %R - 24-hour time (%H:%M)
      %T - 24-hour time (%H:%M:%S)
      %+ - date(1) (%a %b %e %H:%M:%S %Z %Y)

This method is similar to strftime() function defined in ISO C and POSIX.
Several directives (%a, %A, %b, %B, %c, %p, %r, %x, %X, %E*, %O* and %Z) are
locale dependent in the function. However this method is locale independent.
So, the result may differ even if a same format string is used in other
systems such as C. It is good practice to avoid %x and %X because there are
corresponding locale independent representations, %D and %T.

Examples:

    d = DateTime.new(2007,11,19,8,37,48,"-06:00")
                              #=> #<DateTime: 2007-11-19T08:37:48-0600 ...>
    d.strftime("Printed on %m/%d/%Y")   #=> "Printed on 11/19/2007"
    d.strftime("at %I:%M%p")            #=> "at 08:37AM"

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

See also strftime(3) and strptime.


# DateTime#to_date

(from ruby core)
---
    dt.to_date  ->  date

---

Returns a Date object which denotes self.


# DateTime#to_datetime

(from ruby core)
---
    dt.to_datetime  ->  self

---

Returns self.


# DateTime#to_json

(from ruby core)
---
    to_json(*args)

---

Stores class name (DateTime) with Julian year `y`, month `m`, day `d`, hour
`H`, minute `M`, second `S`, offset `of` and Day of Calendar Reform `sg` as
JSON string


# DateTime#to_s

(from ruby core)
---
    dt.to_s  ->  string

---

Returns a string in an ISO 8601 format (This method doesn't use the expanded
representations).

    DateTime.new(2001,2,3,4,5,6,'-7').to_s
                             #=> "2001-02-03T04:05:06-07:00"


(from gem activesupport-5.1.2)
---
    to_s(format = :default)

---


# DateTime#to_time

(from ruby core)
---
    dt.to_time  ->  time

---

Returns a Time object which denotes self.


(from gem activesupport-5.1.2)
---
    to_time()

---

Either return an instance of `Time` with the same UTC offset as `self` or an
instance of `Time` representing the same time in the the local system timezone
depending on the setting of on the setting of
`ActiveSupport.to_time_preserves_timezone`.


# DateTime#xmlschema

(from ruby core)
---
    dt.iso8601([n=0])    ->  string
    dt.xmlschema([n=0])  ->  string

---

This method is equivalent to strftime('%FT%T').  The optional argument n is
length of fractional seconds.

    DateTime.parse('2001-02-03T04:05:06.123456789+07:00').iso8601(9)
                              #=> "2001-02-03T04:05:06.123456789+07:00"


(from gem activesupport-5.1.2)
---




---
# Class methods:

    civil_from_format
    current

# Instance methods:

    <=>
    acts_like_date?
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
    default_inspect
    end_of_day
    end_of_hour
    end_of_minute
    formatted_offset
    getgm
    getlocal
    getutc
    gmtime
    in
    inspect
    localtime
    midday
    middle_of_day
    midnight
    noon
    nsec
    offset_in_seconds
    readable_inspect
    seconds_since_midnight
    seconds_since_unix_epoch
    seconds_until_end_of_day
    since
    subsec
    to_default_s
    to_f
    to_formatted_s
    to_i
    to_s
    to_time
    usec
    utc
    utc?
    utc_offset

# DateTime::civil_from_format

(from gem activesupport-5.1.2)
---
    civil_from_format(utc_or_local, year, month = 1, day = 1, hour = 0, min = 0, sec = 0)

---

Returns DateTime with local offset for given year if format is local else
offset is zero.

    DateTime.civil_from_format :local, 2012
    # => Sun, 01 Jan 2012 00:00:00 +0300
    DateTime.civil_from_format :local, 2012, 12, 17
    # => Mon, 17 Dec 2012 00:00:00 +0000


# DateTime::current

(from gem activesupport-5.1.2)
---
    current()

---

Returns `Time.zone.now.to_datetime` when `Time.zone` or `config.time_zone` are
set, otherwise returns `Time.now.to_datetime`.


# DateTime#<=>

(from gem activesupport-5.1.2)
---
    <=>(other)

---

Layers additional behavior on DateTime#<=> so that Time and
ActiveSupport::TimeWithZone instances can be compared with a DateTime.


# DateTime#acts_like_date?

(from gem activesupport-5.1.2)
---
    acts_like_date?()

---

Duck-types as a Date-like class. See Object#acts_like?.


# DateTime#acts_like_time?

(from gem activesupport-5.1.2)
---
    acts_like_time?()

---

Duck-types as a Time-like class. See Object#acts_like?.


# DateTime#advance

(from gem activesupport-5.1.2)
---
    advance(options)

---

Uses Date to provide precise Time calculations for years, months, and days.
The `options` parameter takes a hash with any of these keys: `:years`,
`:months`, `:weeks`, `:days`, `:hours`, `:minutes`, `:seconds`.


# DateTime#ago

(from gem activesupport-5.1.2)
---
    ago(seconds)

---

Returns a new DateTime representing the time a number of seconds ago. Do not
use this method in combination with x.months, use months_ago instead!


# DateTime#at_beginning_of_day

(from gem activesupport-5.1.2)
---
    at_beginning_of_day()

---


# DateTime#at_beginning_of_hour

(from gem activesupport-5.1.2)
---
    at_beginning_of_hour()

---


# DateTime#at_beginning_of_minute

(from gem activesupport-5.1.2)
---
    at_beginning_of_minute()

---


# DateTime#at_end_of_day

(from gem activesupport-5.1.2)
---
    at_end_of_day()

---


# DateTime#at_end_of_hour

(from gem activesupport-5.1.2)
---
    at_end_of_hour()

---


# DateTime#at_end_of_minute

(from gem activesupport-5.1.2)
---
    at_end_of_minute()

---


# DateTime#at_midday

(from gem activesupport-5.1.2)
---
    at_midday()

---


# DateTime#at_middle_of_day

(from gem activesupport-5.1.2)
---
    at_middle_of_day()

---


# DateTime#at_midnight

(from gem activesupport-5.1.2)
---
    at_midnight()

---


# DateTime#at_noon

(from gem activesupport-5.1.2)
---
    at_noon()

---


# DateTime#beginning_of_day

(from gem activesupport-5.1.2)
---
    beginning_of_day()

---

Returns a new DateTime representing the start of the day (0:00).


# DateTime#beginning_of_hour

(from gem activesupport-5.1.2)
---
    beginning_of_hour()

---

Returns a new DateTime representing the start of the hour (hh:00:00).


# DateTime#beginning_of_minute

(from gem activesupport-5.1.2)
---
    beginning_of_minute()

---

Returns a new DateTime representing the start of the minute (hh:mm:00).


# DateTime#change

(from gem activesupport-5.1.2)
---
    change(options)

---

Returns a new DateTime where one or more of the elements have been changed
according to the `options` parameter. The time options (`:hour`, `:min`,
`:sec`) reset cascadingly, so if only the hour is passed, then minute and sec
is set to 0. If the hour and minute is passed, then sec is set to 0. The
`options` parameter takes a hash with any of these keys: `:year`, `:month`,
`:day`, `:hour`, `:min`, `:sec`, `:offset`, `:start`.

    DateTime.new(2012, 8, 29, 22, 35, 0).change(day: 1)              # => DateTime.new(2012, 8, 1, 22, 35, 0)
    DateTime.new(2012, 8, 29, 22, 35, 0).change(year: 1981, day: 1)  # => DateTime.new(1981, 8, 1, 22, 35, 0)
    DateTime.new(2012, 8, 29, 22, 35, 0).change(year: 1981, hour: 0) # => DateTime.new(1981, 8, 29, 0, 0, 0)


# DateTime#default_inspect

(from gem activesupport-5.1.2)
---
    default_inspect()

---


# DateTime#end_of_day

(from gem activesupport-5.1.2)
---
    end_of_day()

---

Returns a new DateTime representing the end of the day (23:59:59).


# DateTime#end_of_hour

(from gem activesupport-5.1.2)
---
    end_of_hour()

---

Returns a new DateTime representing the end of the hour (hh:59:59).


# DateTime#end_of_minute

(from gem activesupport-5.1.2)
---
    end_of_minute()

---

Returns a new DateTime representing the end of the minute (hh:mm:59).


# DateTime#formatted_offset

(from gem activesupport-5.1.2)
---
    formatted_offset(colon = true, alternate_utc_string = nil)

---

Returns a formatted string of the offset from UTC, or an alternative string if
the time zone is already UTC.

    datetime = DateTime.civil(2000, 1, 1, 0, 0, 0, Rational(-6, 24))
    datetime.formatted_offset         # => "-06:00"
    datetime.formatted_offset(false)  # => "-0600"


# DateTime#getgm

(from gem activesupport-5.1.2)
---
    getgm()

---


# DateTime#getlocal

(from gem activesupport-5.1.2)
---
    getlocal(utc_offset = nil)

---


# DateTime#getutc

(from gem activesupport-5.1.2)
---
    getutc()

---


# DateTime#gmtime

(from gem activesupport-5.1.2)
---
    gmtime()

---


# DateTime#in

(from gem activesupport-5.1.2)
---
    in(seconds)

---


# DateTime#inspect

(from gem activesupport-5.1.2)
---
    inspect()

---


# DateTime#localtime

(from gem activesupport-5.1.2)
---
    localtime(utc_offset = nil)

---

Returns a `Time` instance of the simultaneous time in the system timezone.


# DateTime#midday

(from gem activesupport-5.1.2)
---
    midday()

---


# DateTime#middle_of_day

(from gem activesupport-5.1.2)
---
    middle_of_day()

---

Returns a new DateTime representing the middle of the day (12:00)


# DateTime#midnight

(from gem activesupport-5.1.2)
---
    midnight()

---


# DateTime#noon

(from gem activesupport-5.1.2)
---
    noon()

---


# DateTime#nsec

(from gem activesupport-5.1.2)
---
    nsec()

---

Returns the fraction of a second as nanoseconds


# DateTime#readable_inspect

(from gem activesupport-5.1.2)
---
    readable_inspect()

---

Overrides the default inspect method with a human readable one, e.g., "Mon, 21
Feb 2005 14:30:00 +0000".


# DateTime#seconds_since_midnight

(from gem activesupport-5.1.2)
---
    seconds_since_midnight()

---

Returns the number of seconds since 00:00:00.

    DateTime.new(2012, 8, 29,  0,  0,  0).seconds_since_midnight # => 0
    DateTime.new(2012, 8, 29, 12, 34, 56).seconds_since_midnight # => 45296
    DateTime.new(2012, 8, 29, 23, 59, 59).seconds_since_midnight # => 86399


# DateTime#seconds_until_end_of_day

(from gem activesupport-5.1.2)
---
    seconds_until_end_of_day()

---

Returns the number of seconds until 23:59:59.

    DateTime.new(2012, 8, 29,  0,  0,  0).seconds_until_end_of_day # => 86399
    DateTime.new(2012, 8, 29, 12, 34, 56).seconds_until_end_of_day # => 41103
    DateTime.new(2012, 8, 29, 23, 59, 59).seconds_until_end_of_day # => 0


# DateTime#since

(from gem activesupport-5.1.2)
---
    since(seconds)

---

Returns a new DateTime representing the time a number of seconds since the
instance time. Do not use this method in combination with x.months, use
months_since instead!


# DateTime#subsec

(from gem activesupport-5.1.2)
---
    subsec()

---

Returns the fraction of a second as a `Rational`

    DateTime.new(2012, 8, 29, 0, 0, 0.5).subsec # => (1/2)


# DateTime#to_default_s

(from gem activesupport-5.1.2)
---
    to_default_s(format = :default)

---


# DateTime#to_f

(from gem activesupport-5.1.2)
---
    to_f()

---

Converts `self` to a floating-point number of seconds, including fractional
microseconds, since the Unix epoch.


# DateTime#to_formatted_s

(from gem activesupport-5.1.2)
---
    to_formatted_s(format = :default)

---

Convert to a formatted string. See Time::DATE_FORMATS for predefined formats.

This method is aliased to `to_s`.

### Examples
    datetime = DateTime.civil(2007, 12, 4, 0, 0, 0, 0)   # => Tue, 04 Dec 2007 00:00:00 +0000

    datetime.to_formatted_s(:db)            # => "2007-12-04 00:00:00"
    datetime.to_s(:db)                      # => "2007-12-04 00:00:00"
    datetime.to_s(:number)                  # => "20071204000000"
    datetime.to_formatted_s(:short)         # => "04 Dec 00:00"
    datetime.to_formatted_s(:long)          # => "December 04, 2007 00:00"
    datetime.to_formatted_s(:long_ordinal)  # => "December 4th, 2007 00:00"
    datetime.to_formatted_s(:rfc822)        # => "Tue, 04 Dec 2007 00:00:00 +0000"
    datetime.to_formatted_s(:iso8601)       # => "2007-12-04T00:00:00+00:00"

## Adding your own datetime formats to to_formatted_s
DateTime formats are shared with Time. You can add your own to the
Time::DATE_FORMATS hash. Use the format name as the hash key and either a
strftime string or Proc instance that takes a time or datetime argument as the
value.

    # config/initializers/time_formats.rb
    Time::DATE_FORMATS[:month_and_year] = '%B %Y'
    Time::DATE_FORMATS[:short_ordinal] = lambda { |time| time.strftime("%B #{time.day.ordinalize}") }


# DateTime#to_i

(from gem activesupport-5.1.2)
---
    to_i()

---

Converts `self` to an integer number of seconds since the Unix epoch.


# DateTime#to_s

(from ruby core)
---
    dt.to_s  ->  string

---

Returns a string in an ISO 8601 format (This method doesn't use the expanded
representations).

    DateTime.new(2001,2,3,4,5,6,'-7').to_s
                             #=> "2001-02-03T04:05:06-07:00"


(from gem activesupport-5.1.2)
---
    to_s(format = :default)

---


# DateTime#to_time

(from ruby core)
---
    dt.to_time  ->  time

---

Returns a Time object which denotes self.


(from gem activesupport-5.1.2)
---
    to_time()

---

Either return an instance of `Time` with the same UTC offset as `self` or an
instance of `Time` representing the same time in the the local system timezone
depending on the setting of on the setting of
`ActiveSupport.to_time_preserves_timezone`.


# DateTime#usec

(from gem activesupport-5.1.2)
---
    usec()

---

Returns the fraction of a second as microseconds


# DateTime#utc

(from gem activesupport-5.1.2)
---
    utc()

---

Returns a `Time` instance of the simultaneous time in the UTC timezone.

    DateTime.civil(2005, 2, 21, 10, 11, 12, Rational(-6, 24))     # => Mon, 21 Feb 2005 10:11:12 -0600
    DateTime.civil(2005, 2, 21, 10, 11, 12, Rational(-6, 24)).utc # => Mon, 21 Feb 2005 16:11:12 UTC


# DateTime#utc?

(from gem activesupport-5.1.2)
---
    utc?()

---

Returns `true` if `offset == 0`.


# DateTime#utc_offset

(from gem activesupport-5.1.2)
---
    utc_offset()

---

Returns the offset value in seconds.


# DateTime#offset_in_seconds

(from gem activesupport-5.1.2)
---
    offset_in_seconds()

---


# DateTime#seconds_since_unix_epoch

(from gem activesupport-5.1.2)
---
    seconds_since_unix_epoch()

---


