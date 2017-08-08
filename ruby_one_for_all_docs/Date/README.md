# Date < Object

---
# Includes:
Comparable (from ruby core)

(from gem activesupport-5.1.2)
    DateAndTime::Calculations
    DateAndTime::Zones

(from ruby core)
---
date and datetime class - Tadayoshi Funaba 1998-2011

'date' provides two classes Date and DateTime.

## Terms and definitions

Some terms and definitions are based on ISO 8601 and JIS X 0301.

### calendar date

The calendar date is a particular day of a calendar year, identified by its
ordinal number within a calendar month within that year.

In those classes, this is so-called "civil".

### ordinal date

The ordinal date is a particular day of a calendar year identified by its
ordinal number within the year.

In those classes, this is so-called "ordinal".

### week date

The week date is a date identified by calendar week and day numbers.

The calendar week is a seven day period within a calendar year, starting on a
Monday and identified by its ordinal number within the year; the first
calendar week of the year is the one that includes the first Thursday of that
year. In the Gregorian calendar, this is equivalent to the week which includes
January 4.

In those classes, this so-called "commercial".

### julian day number

The Julian day number is in elapsed days since noon (Greenwich mean time) on
January 1, 4713 BCE (in the Julian calendar).

In this document, the astronomical Julian day number is same as the original
Julian day number. And the chronological Julian day number is a variation of
the Julian day number. Its days begin at midnight on local time.

In this document, when the term "Julian day number" simply appears, it just
refers to "chronological Julian day number", not the original.

In those classes, those are so-called "ajd" and "jd".

### modified julian day number

The modified Julian day number is in elapsed days since midnight (Coordinated
universal time) on November 17, 1858 CE (in the Gregorian calendar).

In this document, the astronomical modified Julian day number is same as the
original modified Julian day number. And the chronological modified Julian day
number is a variation of the modified Julian day number. Its days begin at
midnight on local time.

In this document, when the term "modified Julian day number" simply appears,
it just refers to "chronological modified Julian day number", not the
original.

In those classes, this is so-called "mjd".

## Date

A subclass of Object that includes Comparable module and easily handles date.

Date object is created with Date::new, Date::jd, Date::ordinal,
Date::commercial, Date::parse, Date::strptime, Date::today, Time#to_date or
etc.

    require 'date'

    Date.new(2001,2,3)
     #=> #<Date: 2001-02-03 ...>
    Date.jd(2451944)
     #=> #<Date: 2001-02-03 ...>
    Date.ordinal(2001,34)
     #=> #<Date: 2001-02-03 ...>
    Date.commercial(2001,5,6)
     #=> #<Date: 2001-02-03 ...>
    Date.parse('2001-02-03')
     #=> #<Date: 2001-02-03 ...>
    Date.strptime('03-02-2001', '%d-%m-%Y')
     #=> #<Date: 2001-02-03 ...>
    Time.new(2001,2,3).to_date
     #=> #<Date: 2001-02-03 ...>

All date objects are immutable; hence cannot modify themselves.

The concept of this date object can be represented as a tuple of the day
count, the offset and the day of calendar reform.

The day count denotes the absolute position of a temporal dimension. The
offset is relative adjustment, which determines decoded local time with the
day count. The day of calendar reform denotes the start day of the new style.
The old style of the West is the Julian calendar which was adopted by Caesar.
The new style is the Gregorian calendar, which is the current civil calendar
of many countries.

The day count is virtually the astronomical Julian day number. The offset in
this class is usually zero, and cannot be specified directly.

An optional argument the day of calendar reform (start) as a Julian day
number, which should be 2298874 to 2426355 or -/+oo. The default value is
Date::ITALY (2299161=1582-10-15).  See also sample/cal.rb.

    $ ruby sample/cal.rb -c it 10 1582
        October 1582
     S  M Tu  W Th  F  S
        1  2  3  4 15 16
    17 18 19 20 21 22 23
    24 25 26 27 28 29 30
    31

    $ ruby sample/cal.rb -c gb  9 1752
       September 1752
     S  M Tu  W Th  F  S
           1  2 14 15 16
    17 18 19 20 21 22 23
    24 25 26 27 28 29 30

Date object has various methods. See each reference.

    d = Date.parse('3rd Feb 2001')
                                 #=> #<Date: 2001-02-03 ...>
    d.year                       #=> 2001
    d.mon                        #=> 2
    d.mday                       #=> 3
    d.wday                       #=> 6
    d += 1                       #=> #<Date: 2001-02-04 ...>
    d.strftime('%a %d %b %Y')    #=> "Sun 04 Feb 2001"

---
# Constants:

ABBR_DAYNAMES
:   An array of strings of abbreviated day names in English.  The first is
    "Sun".
ABBR_MONTHNAMES
:   An array of strings of abbreviated month names in English.  The first
    element is nil.
DAYNAMES
:   An array of strings of the full names of days of the week in English. The
    first is "Sunday".
ENGLAND
:   The Julian day number of the day of calendar reform for England and her
    colonies.
GREGORIAN
:   The Julian day number of the day of calendar reform for the proleptic
    Gregorian calendar
ITALY
:   The Julian day number of the day of calendar reform for Italy and some
    catholic countries.
JULIAN
:   The Julian day number of the day of calendar reform for the proleptic
    Julian calendar
MONTHNAMES
:   An array of strings of full month names in English.  The first element is
    nil.


# Class methods:

    _httpdate
    _iso8601
    _jisx0301
    _parse
    _rfc2822
    _rfc3339
    _rfc822
    _strptime
    _xmlschema
    civil
    commercial
    gregorian_leap?
    httpdate
    iso8601
    jd
    jisx0301
    json_create
    julian_leap?
    leap?
    new
    ordinal
    parse
    rfc2822
    rfc3339
    rfc822
    strptime
    today
    valid_civil?
    valid_commercial?
    valid_date?
    valid_jd?
    valid_ordinal?
    xmlschema

# Instance methods:

    +
    -
    <<
    <=>
    ===
    >>
    ajd
    amjd
    as_json
    asctime
    ctime
    cwday
    cweek
    cwyear
    day
    day_fraction
    downto
    england
    friday?
    gregorian
    gregorian?
    hour
    httpdate
    inspect
    iso8601
    italy
    jd
    jisx0301
    julian
    julian?
    ld
    leap?
    mday
    min
    minute
    mjd
    mon
    monday?
    month
    new_offset
    new_start
    next
    next_day
    next_month
    next_year
    offset
    prev_day
    prev_month
    prev_year
    rfc2822
    rfc3339
    rfc822
    saturday?
    sec
    sec_fraction
    second
    second_fraction
    start
    step
    strftime
    succ
    sunday?
    thursday?
    to_date
    to_datetime
    to_json
    to_s
    to_time
    tuesday?
    upto
    wday
    wednesday?
    xmlschema
    yday
    year
    zone

# Date::_httpdate

(from ruby core)
---
    Date._httpdate(string)  ->  hash

---

Returns a hash of parsed elements.


# Date::_iso8601

(from ruby core)
---
    Date._iso8601(string)  ->  hash

---

Returns a hash of parsed elements.


# Date::_jisx0301

(from ruby core)
---
    Date._jisx0301(string)  ->  hash

---

Returns a hash of parsed elements.


# Date::_parse

(from ruby core)
---
    Date._parse(string[, comp=true])  ->  hash

---

Parses the given representation of date and time, and returns a hash of parsed
elements.  This method does not function as a validator.

If the optional second argument is true and the detected year is in the range
"00" to "99", considers the year a 2-digit form and makes it full.

    Date._parse('2001-02-03') #=> {:year=>2001, :mon=>2, :mday=>3}


# Date::_rfc2822

(from ruby core)
---
    Date._rfc2822(string)  ->  hash

---

Returns a hash of parsed elements.


# Date::_rfc3339

(from ruby core)
---
    Date._rfc3339(string)  ->  hash

---

Returns a hash of parsed elements.


# Date::_rfc822

(from ruby core)
---
    Date._rfc822(string)   ->  hash

---

Returns a hash of parsed elements.


# Date::_strptime

(from ruby core)
---
    Date._strptime(string[, format='%F'])  ->  hash

---

Parses the given representation of date and time with the given template, and
returns a hash of parsed elements.  _strptime does not support specification
of flags and width unlike strftime.

      Date._strptime('2001-02-03', '%Y-%m-%d')
                                #=> {:year=>2001, :mon=>2, :mday=>3}

    See also strptime(3) and strftime.


# Date::_xmlschema

(from ruby core)
---
    Date._xmlschema(string)  ->  hash

---

Returns a hash of parsed elements.


# Date::civil

(from ruby core)
---
    Date.civil([year=-4712[, month=1[, mday=1[, start=Date::ITALY]]]])  ->  date

---

Creates a date object denoting the given calendar date.

In this class, BCE years are counted astronomically.  Thus, the year before
the year 1 is the year zero, and the year preceding the year zero is the year
-1.  The month and the day of month should be a negative or a positive number
(as a relative month/day from the end of year/month when negative).  They
should not be zero.

The last argument should be a Julian day number which denotes the day of
calendar reform.  Date::ITALY (2299161=1582-10-15), Date::ENGLAND
(2361222=1752-09-14), Date::GREGORIAN (the proleptic Gregorian calendar) and
Date::JULIAN (the proleptic Julian calendar) can be specified as a day of
calendar reform.

    Date.new(2001)            #=> #<Date: 2001-01-01 ...>
    Date.new(2001,2,3)        #=> #<Date: 2001-02-03 ...>
    Date.new(2001,2,-1)       #=> #<Date: 2001-02-28 ...>

See also jd.


# Date::commercial

(from ruby core)
---
    Date.commercial([cwyear=-4712[, cweek=1[, cwday=1[, start=Date::ITALY]]]])  ->  date

---

Creates a date object denoting the given week date.

The week and the day of week should be a negative or a positive number (as a
relative week/day from the end of year/week when negative).  They should not
be zero.

    Date.commercial(2001)     #=> #<Date: 2001-01-01 ...>
    Date.commercial(2002)     #=> #<Date: 2001-12-31 ...>
    Date.commercial(2001,5,6) #=> #<Date: 2001-02-03 ...>

See also jd and new.


# Date::gregorian_leap?

(from ruby core)
---
    Date.gregorian_leap?(year)  ->  bool

---

Returns true if the given year is a leap year of the proleptic Gregorian
calendar.

    Date.gregorian_leap?(1900)        #=> false
    Date.gregorian_leap?(2000)        #=> true


# Date::httpdate

(from ruby core)
---
    Date.httpdate(string='Mon, 01 Jan -4712 00:00:00 GMT'[, start=ITALY])  ->  date

---

Creates a new Date object by parsing from a string according to some RFC 2616
format.

    Date.httpdate('Sat, 03 Feb 2001 00:00:00 GMT')
                                              #=> #<Date: 2001-02-03 ...>


# Date::iso8601

(from ruby core)
---
    Date.iso8601(string='-4712-01-01'[, start=ITALY])  ->  date

---

Creates a new Date object by parsing from a string according to some typical
ISO 8601 formats.

    Date.iso8601('2001-02-03')        #=> #<Date: 2001-02-03 ...>
    Date.iso8601('20010203')          #=> #<Date: 2001-02-03 ...>
    Date.iso8601('2001-W05-6')        #=> #<Date: 2001-02-03 ...>


# Date::jd

(from ruby core)
---
    Date.jd([jd=0[, start=Date::ITALY]])  ->  date

---

Creates a date object denoting the given chronological Julian day number.

    Date.jd(2451944)          #=> #<Date: 2001-02-03 ...>
    Date.jd(2451945)          #=> #<Date: 2001-02-04 ...>
    Date.jd(0)                #=> #<Date: -4712-01-01 ...>

See also new.


# Date::jisx0301

(from ruby core)
---
    Date.jisx0301(string='-4712-01-01'[, start=ITALY])  ->  date

---

Creates a new Date object by parsing from a string according to some typical
JIS X 0301 formats.

    Date.jisx0301('H13.02.03')                #=> #<Date: 2001-02-03 ...>


# Date::json_create

(from ruby core)
---
    json_create(object)

---

Deserializes JSON string by converting Julian year `y`, month `m`, day `d` and
Day of Calendar Reform `sg` to Date.


# Date::julian_leap?

(from ruby core)
---
    Date.julian_leap?(year)  ->  bool

---

Returns true if the given year is a leap year of the proleptic Julian
calendar.

    Date.julian_leap?(1900)           #=> true
    Date.julian_leap?(1901)           #=> false


# Date::leap?

(from ruby core)
---
    Date.leap?(year)            ->  bool

---

Returns true if the given year is a leap year of the proleptic Gregorian
calendar.

    Date.gregorian_leap?(1900)        #=> false
    Date.gregorian_leap?(2000)        #=> true


# Date::new

(from ruby core)
---
    Date.new([year=-4712[, month=1[, mday=1[, start=Date::ITALY]]]])    ->  date

---

Creates a date object denoting the given calendar date.

In this class, BCE years are counted astronomically.  Thus, the year before
the year 1 is the year zero, and the year preceding the year zero is the year
-1.  The month and the day of month should be a negative or a positive number
(as a relative month/day from the end of year/month when negative).  They
should not be zero.

The last argument should be a Julian day number which denotes the day of
calendar reform.  Date::ITALY (2299161=1582-10-15), Date::ENGLAND
(2361222=1752-09-14), Date::GREGORIAN (the proleptic Gregorian calendar) and
Date::JULIAN (the proleptic Julian calendar) can be specified as a day of
calendar reform.

    Date.new(2001)            #=> #<Date: 2001-01-01 ...>
    Date.new(2001,2,3)        #=> #<Date: 2001-02-03 ...>
    Date.new(2001,2,-1)       #=> #<Date: 2001-02-28 ...>

See also jd.


# Date::ordinal

(from ruby core)
---
    Date.ordinal([year=-4712[, yday=1[, start=Date::ITALY]]])  ->  date

---

Creates a date object denoting the given ordinal date.

The day of year should be a negative or a positive number (as a relative day
from the end of year when negative).  It should not be zero.

    Date.ordinal(2001)        #=> #<Date: 2001-01-01 ...>
    Date.ordinal(2001,34)     #=> #<Date: 2001-02-03 ...>
    Date.ordinal(2001,-1)     #=> #<Date: 2001-12-31 ...>

See also jd and new.


# Date::parse

(from ruby core)
---
    Date.parse(string='-4712-01-01'[, comp=true[, start=ITALY]])  ->  date

---

Parses the given representation of date and time, and creates a date object. 
This method does not function as a validator.

If the optional second argument is true and the detected year is in the range
"00" to "99", considers the year a 2-digit form and makes it full.

    Date.parse('2001-02-03')          #=> #<Date: 2001-02-03 ...>
    Date.parse('20010203')            #=> #<Date: 2001-02-03 ...>
    Date.parse('3rd Feb 2001')        #=> #<Date: 2001-02-03 ...>


# Date::rfc2822

(from ruby core)
---
    Date.rfc2822(string='Mon, 1 Jan -4712 00:00:00 +0000'[, start=ITALY])  ->  date

---

Creates a new Date object by parsing from a string according to some typical
RFC 2822 formats.

    Date.rfc2822('Sat, 3 Feb 2001 00:00:00 +0000')
                                              #=> #<Date: 2001-02-03 ...>


# Date::rfc3339

(from ruby core)
---
    Date.rfc3339(string='-4712-01-01T00:00:00+00:00'[, start=ITALY])  ->  date

---

Creates a new Date object by parsing from a string according to some typical
RFC 3339 formats.

    Date.rfc3339('2001-02-03T04:05:06+07:00') #=> #<Date: 2001-02-03 ...>


# Date::rfc822

(from ruby core)
---
    Date.rfc822(string='Mon, 1 Jan -4712 00:00:00 +0000'[, start=ITALY])   ->  date

---

Creates a new Date object by parsing from a string according to some typical
RFC 2822 formats.

    Date.rfc2822('Sat, 3 Feb 2001 00:00:00 +0000')
                                              #=> #<Date: 2001-02-03 ...>


# Date::strptime

(from ruby core)
---
    Date.strptime([string='-4712-01-01'[, format='%F'[, start=ITALY]]])  ->  date

---

Parses the given representation of date and time with the given template, and
creates a date object.  strptime does not support specification of flags and
width unlike strftime.

    Date.strptime('2001-02-03', '%Y-%m-%d')   #=> #<Date: 2001-02-03 ...>
    Date.strptime('03-02-2001', '%d-%m-%Y')   #=> #<Date: 2001-02-03 ...>
    Date.strptime('2001-034', '%Y-%j')        #=> #<Date: 2001-02-03 ...>
    Date.strptime('2001-W05-6', '%G-W%V-%u')  #=> #<Date: 2001-02-03 ...>
    Date.strptime('2001 04 6', '%Y %U %w')    #=> #<Date: 2001-02-03 ...>
    Date.strptime('2001 05 6', '%Y %W %u')    #=> #<Date: 2001-02-03 ...>
    Date.strptime('sat3feb01', '%a%d%b%y')    #=> #<Date: 2001-02-03 ...>

See also strptime(3) and strftime.


# Date::today

(from ruby core)
---
    Date.today([start=Date::ITALY])  ->  date
    Date.today                #=> #<Date: 2011-06-11 ..>

---

Creates a date object denoting the present day.


# Date::valid_civil?

(from ruby core)
---
    Date.valid_civil?(year, month, mday[, start=Date::ITALY])  ->  bool

---

Returns true if the given calendar date is valid, and false if not.

    Date.valid_date?(2001,2,3)        #=> true
    Date.valid_date?(2001,2,29)       #=> false

See also jd and civil.


# Date::valid_commercial?

(from ruby core)
---
    Date.valid_commercial?(cwyear, cweek, cwday[, start=Date::ITALY])  ->  bool

---

Returns true if the given week date is valid, and false if not.

    Date.valid_commercial?(2001,5,6)  #=> true
    Date.valid_commercial?(2001,5,8)  #=> false

See also jd and commercial.


# Date::valid_date?

(from ruby core)
---
    Date.valid_date?(year, month, mday[, start=Date::ITALY])   ->  bool

---

Returns true if the given calendar date is valid, and false if not.

    Date.valid_date?(2001,2,3)        #=> true
    Date.valid_date?(2001,2,29)       #=> false

See also jd and civil.


# Date::valid_jd?

(from ruby core)
---
    Date.valid_jd?(jd[, start=Date::ITALY])  ->  bool

---

Just returns true.  It's nonsense, but is for symmetry.

    Date.valid_jd?(2451944)           #=> true

See also jd.


# Date::valid_ordinal?

(from ruby core)
---
    Date.valid_ordinal?(year, yday[, start=Date::ITALY])  ->  bool

---

Returns true if the given ordinal date is valid, and false if not.

    Date.valid_ordinal?(2001,34)      #=> true
    Date.valid_ordinal?(2001,366)     #=> false

See also jd and ordinal.


# Date::xmlschema

(from ruby core)
---
    Date.xmlschema(string='-4712-01-01'[, start=ITALY])  ->  date

---

Creates a new Date object by parsing from a string according to some typical
XML Schema formats.

    Date.xmlschema('2001-02-03')      #=> #<Date: 2001-02-03 ...>


# Date#+

(from ruby core)
---
    d + other  ->  date

---

Returns a date object pointing other days after self.  The other should be a
numeric value.  If the other is flonum, assumes its precision is at most
nanosecond.

    Date.new(2001,2,3) + 1    #=> #<Date: 2001-02-04 ...>
    DateTime.new(2001,2,3) + Rational(1,2)
                              #=> #<DateTime: 2001-02-03T12:00:00+00:00 ...>
    DateTime.new(2001,2,3) + Rational(-1,2)
                              #=> #<DateTime: 2001-02-02T12:00:00+00:00 ...>
    DateTime.jd(0,12) + DateTime.new(2001,2,3).ajd
                              #=> #<DateTime: 2001-02-03T00:00:00+00:00 ...>


# Date#-

(from ruby core)
---
    d - other  ->  date or rational

---

Returns the difference between the two dates if the other is a date object. 
If the other is a numeric value, returns a date object pointing other days
before self.  If the other is flonum, assumes its precision is at most
nanosecond.

    Date.new(2001,2,3) - 1   #=> #<Date: 2001-02-02 ...>
    DateTime.new(2001,2,3) - Rational(1,2)
                             #=> #<DateTime: 2001-02-02T12:00:00+00:00 ...>
    Date.new(2001,2,3) - Date.new(2001)
                             #=> (33/1)
    DateTime.new(2001,2,3) - DateTime.new(2001,2,2,12)
                             #=> (1/2)


# Date#<<

(from ruby core)
---
    d << n  ->  date

---

Returns a date object pointing n months before self.  The n should be a
numeric value.

    Date.new(2001,2,3) << 1   #=> #<Date: 2001-01-03 ...>
    Date.new(2001,1,31) << 11 #=> #<Date: 2000-02-29 ...>
    Date.new(2001,2,3) << -1  #=> #<Date: 2001-03-03 ...>


# Date#<=>

(from ruby core)
---
    d <=> other  -> -1, 0, +1 or nil

---

Compares the two dates and returns -1, zero, 1 or nil.  The other should be a
date object or a numeric value as an astronomical Julian day number.

    Date.new(2001,2,3) <=> Date.new(2001,2,4) #=> -1
    Date.new(2001,2,3) <=> Date.new(2001,2,3) #=> 0
    Date.new(2001,2,3) <=> Date.new(2001,2,2) #=> 1
    Date.new(2001,2,3) <=> Object.new         #=> nil
    Date.new(2001,2,3) <=> Rational(4903887,2)#=> 0

See also Comparable.


(from gem activesupport-5.1.2)
---
    <=>(other)

---


# Date#===

(from ruby core)
---
    d === other  ->  bool

---

Returns true if they are the same day.

    Date.new(2001,2,3) === Date.new(2001,2,3)
                                      #=> true
    Date.new(2001,2,3) === Date.new(2001,2,4)
                                      #=> false
    DateTime.new(2001,2,3) === DateTime.new(2001,2,3,12)
                                      #=> true
    DateTime.new(2001,2,3) === DateTime.new(2001,2,3,0,0,0,'+24:00')
                                      #=> true
    DateTime.new(2001,2,3) === DateTime.new(2001,2,4,0,0,0,'+24:00')
                                      #=> false


# Date#>>

(from ruby core)
---
    d >> n  ->  date

---

Returns a date object pointing n months after self.  The n should be a numeric
value.

    Date.new(2001,2,3) >> 1   #=> #<Date: 2001-03-03 ...>
    Date.new(2001,1,31) >> 1  #=> #<Date: 2001-02-28 ...>
    Date.new(2001,2,3) >> -2  #=> #<Date: 2000-12-03 ...>


# Date#ajd

(from ruby core)
---
    d.ajd  ->  rational

---

Returns the astronomical Julian day number.  This is a fractional number,
which is not adjusted by the offset.

    DateTime.new(2001,2,3,4,5,6,'+7').ajd     #=> (11769328217/4800)
    DateTime.new(2001,2,2,14,5,6,'-7').ajd    #=> (11769328217/4800)


# Date#amjd

(from ruby core)
---
    d.amjd  ->  rational

---

Returns the astronomical modified Julian day number.  This is a fractional
number, which is not adjusted by the offset.

    DateTime.new(2001,2,3,4,5,6,'+7').amjd    #=> (249325817/4800)
    DateTime.new(2001,2,2,14,5,6,'-7').amjd   #=> (249325817/4800)


# Date#as_json

(from ruby core)
---
    as_json(*)

---

Returns a hash, that will be turned into a JSON object and represent this
object.


# Date#asctime

(from ruby core)
---
    d.asctime  ->  string

---

Returns a string in asctime(3) format (but without "n\0" at the end).  This
method is equivalent to strftime('%c').

See also asctime(3) or ctime(3).


# Date#ctime

(from ruby core)
---
    d.ctime    ->  string

---

Returns a string in asctime(3) format (but without "n\0" at the end).  This
method is equivalent to strftime('%c').

See also asctime(3) or ctime(3).


# Date#cwday

(from ruby core)
---
    d.cwday  ->  fixnum

---

Returns the day of calendar week (1-7, Monday is 1).

    Date.new(2001,2,3).cwday          #=> 6


# Date#cweek

(from ruby core)
---
    d.cweek  ->  fixnum

---

Returns the calendar week number (1-53).

    Date.new(2001,2,3).cweek          #=> 5


# Date#cwyear

(from ruby core)
---
    d.cwyear  ->  integer

---

Returns the calendar week based year.

    Date.new(2001,2,3).cwyear         #=> 2001
    Date.new(2000,1,1).cwyear         #=> 1999


# Date#day

(from ruby core)
---
    d.day   ->  fixnum

---

Returns the day of the month (1-31).

    Date.new(2001,2,3).mday           #=> 3


# Date#day_fraction

(from ruby core)
---
    d.day_fraction  ->  rational

---

Returns the fractional part of the day.

    DateTime.new(2001,2,3,12).day_fraction    #=> (1/2)


# Date#downto

(from ruby core)
---
    d.downto(min)              ->  enumerator
    d.downto(min){|date| ...}  ->  self

---

This method is equivalent to step(min, -1){|date| ...}.


# Date#england

(from ruby core)
---
    d.england  ->  date

---

This method is equivalent to new_start(Date::ENGLAND).


# Date#friday?

(from ruby core)
---
    d.friday?  ->  bool

---

Returns true if the date is Friday.


# Date#gregorian

(from ruby core)
---
    d.gregorian  ->  date

---

This method is equivalent to new_start(Date::GREGORIAN).


# Date#gregorian?

(from ruby core)
---
    d.gregorian?  ->  bool

---

Returns true if the date is on or after the day of calendar reform.

    Date.new(1582,10,15).gregorian?          #=> true
    (Date.new(1582,10,15) - 1).gregorian?    #=> false


# Date#httpdate

(from ruby core)
---
    d.httpdate  ->  string

---

This method is equivalent to strftime('%a, %d %b %Y %T GMT'). See also RFC
2616.


# Date#inspect

(from ruby core)
---
    d.inspect  ->  string

---

Returns the value as a string for inspection.

    Date.new(2001,2,3).inspect
              #=> "#<Date: 2001-02-03 ((2451944j,0s,0n),+0s,2299161j)>"
    DateTime.new(2001,2,3,4,5,6,'-7').inspect
              #=> "#<DateTime: 2001-02-03T04:05:06-07:00 ((2451944j,39906s,0n),-25200s,2299161j)>"


(from gem activesupport-5.1.2)
---
    inspect()

---


# Date#iso8601

(from ruby core)
---
    d.iso8601    ->  string
    d.xmlschema  ->  string

---

This method is equivalent to strftime('%F').


# Date#italy

(from ruby core)
---
    d.italy  ->  date

---

This method is equivalent to new_start(Date::ITALY).


# Date#jd

(from ruby core)
---
    d.jd  ->  integer

---

Returns the Julian day number.  This is a whole number, which is adjusted by
the offset as the local time.

    DateTime.new(2001,2,3,4,5,6,'+7').jd      #=> 2451944
    DateTime.new(2001,2,3,4,5,6,'-7').jd      #=> 2451944


# Date#jisx0301

(from ruby core)
---
    d.jisx0301  ->  string

---

Returns a string in a JIS X 0301 format.

    Date.new(2001,2,3).jisx0301       #=> "H13.02.03"


# Date#julian

(from ruby core)
---
    d.julian  ->  date

---

This method is equivalent to new_start(Date::JULIAN).


# Date#julian?

(from ruby core)
---
    d.julian?  ->  bool

---

Returns true if the date is before the day of calendar reform.

    Date.new(1582,10,15).julian?             #=> false
    (Date.new(1582,10,15) - 1).julian?       #=> true


# Date#ld

(from ruby core)
---
    d.ld  ->  integer

---

Returns the Lilian day number.  This is a whole number, which is adjusted by
the offset as the local time.

    Date.new(2001,2,3).ld            #=> 152784


# Date#leap?

(from ruby core)
---
    d.leap?  ->  bool

---

Returns true if the year is a leap year.

    Date.new(2000).leap?      #=> true
    Date.new(2001).leap?      #=> false


# Date#mday

(from ruby core)
---
    d.mday  ->  fixnum

---

Returns the day of the month (1-31).

    Date.new(2001,2,3).mday           #=> 3


# Date#mjd

(from ruby core)
---
    d.mjd  ->  integer

---

Returns the modified Julian day number.  This is a whole number, which is
adjusted by the offset as the local time.

    DateTime.new(2001,2,3,4,5,6,'+7').mjd     #=> 51943
    DateTime.new(2001,2,3,4,5,6,'-7').mjd     #=> 51943


# Date#mon

(from ruby core)
---
    d.mon    ->  fixnum
    d.month  ->  fixnum

---

Returns the month (1-12).

    Date.new(2001,2,3).mon            #=> 2


# Date#monday?

(from ruby core)
---
    d.monday?  ->  bool

---

Returns true if the date is Monday.


# Date#month

(from ruby core)
---
    d.month  ->  fixnum

---

Returns the month (1-12).

    Date.new(2001,2,3).mon            #=> 2


# Date#new_start

(from ruby core)
---
    d.new_start([start=Date::ITALY])  ->  date

---

Duplicates self and resets its the day of calendar reform.

    d = Date.new(1582,10,15)
    d.new_start(Date::JULIAN)         #=> #<Date: 1582-10-05 ...>


# Date#next

(from ruby core)
---
    d.next  ->  date

---

Returns a date object denoting the following day.


# Date#next_day

(from ruby core)
---
    d.next_day([n=1])  ->  date

---

This method is equivalent to d + n.


# Date#next_month

(from ruby core)
---
    d.next_month([n=1])  ->  date

---

This method is equivalent to d >> n


# Date#next_year

(from ruby core)
---
    d.next_year([n=1])  ->  date

---

This method is equivalent to d >> (n * 12)


# Date#prev_day

(from ruby core)
---
    d.prev_day([n=1])  ->  date

---

This method is equivalent to d - n.


# Date#prev_month

(from ruby core)
---
    d.prev_month([n=1])  ->  date

---

This method is equivalent to d << n


# Date#prev_year

(from ruby core)
---
    d.prev_year([n=1])  ->  date

---

This method is equivalent to d << (n * 12)


# Date#rfc2822

(from ruby core)
---
    d.rfc2822  ->  string
    d.rfc822   ->  string

---

This method is equivalent to strftime('%a, %-d %b %Y %T %z').


# Date#rfc3339

(from ruby core)
---
    d.rfc3339  ->  string

---

This method is equivalent to strftime('%FT%T%:z').


# Date#rfc822

(from ruby core)
---
    d.rfc2822  ->  string
    d.rfc822   ->  string

---

This method is equivalent to strftime('%a, %-d %b %Y %T %z').


# Date#saturday?

(from ruby core)
---
    d.saturday?  ->  bool

---

Returns true if the date is Saturday.


# Date#start

(from ruby core)
---
    d.start  ->  float

---

Returns the Julian day number denoting the day of calendar reform.

    Date.new(2001,2,3).start                  #=> 2299161.0
    Date.new(2001,2,3,Date::GREGORIAN).start  #=> -Infinity


# Date#step

(from ruby core)
---
    d.step(limit[, step=1])              ->  enumerator
    d.step(limit[, step=1]){|date| ...}  ->  self

---

Iterates evaluation of the given block, which takes a date object. The limit
should be a date object.

    Date.new(2001).step(Date.new(2001,-1,-1)).select{|d| d.sunday?}.size
                              #=> 52


# Date#strftime

(from ruby core)
---
    d.strftime([format='%F'])  ->  string

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

The minimum field width specifies the minimum width.

The modifiers are "E", "O", ":", "::" and ":::". "E" and "O" are ignored.  No
effect to result currently.

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


# Date#succ

(from ruby core)
---
    d.succ  ->  date

---

Returns a date object denoting the following day.


# Date#sunday?

(from ruby core)
---
    d.sunday?  ->  bool

---

Returns true if the date is Sunday.


# Date#thursday?

(from ruby core)
---
    d.thursday?  ->  bool

---

Returns true if the date is Thursday.


# Date#to_date

(from ruby core)
---
    d.to_date  ->  self

---

Returns self.


# Date#to_datetime

(from ruby core)
---
    d.to_datetime  -> datetime

---

Returns a DateTime object which denotes self.


# Date#to_json

(from ruby core)
---
    to_json(*args)

---

Stores class name (Date) with Julian year `y`, month `m`, day `d` and Day of
Calendar Reform `sg` as JSON string


# Date#to_s

(from ruby core)
---
    d.to_s  ->  string

---

Returns a string in an ISO 8601 format (This method doesn't use the expanded
representations).

    Date.new(2001,2,3).to_s  #=> "2001-02-03"


(from gem activesupport-5.1.2)
---
    to_s(format = :default)

---


# Date#to_time

(from ruby core)
---
    d.to_time  ->  time

---

Returns a Time object which denotes self.


(from gem activesupport-5.1.2)
---
    to_time(form = :local)

---

Converts a Date instance to a Time, where the time is set to the beginning of
the day. The timezone can be either :local or :utc (default :local).

    date = Date.new(2007, 11, 10)  # => Sat, 10 Nov 2007

    date.to_time                   # => 2007-11-10 00:00:00 0800
    date.to_time(:local)           # => 2007-11-10 00:00:00 0800

    date.to_time(:utc)             # => 2007-11-10 00:00:00 UTC


# Date#tuesday?

(from ruby core)
---
    d.tuesday?  ->  bool

---

Returns true if the date is Tuesday.


# Date#upto

(from ruby core)
---
    d.upto(max)              ->  enumerator
    d.upto(max){|date| ...}  ->  self

---

This method is equivalent to step(max, 1){|date| ...}.


# Date#wday

(from ruby core)
---
    d.wday  ->  fixnum

---

Returns the day of week (0-6, Sunday is zero).

    Date.new(2001,2,3).wday           #=> 6


# Date#wednesday?

(from ruby core)
---
    d.wednesday?  ->  bool

---

Returns true if the date is Wednesday.


# Date#xmlschema

(from ruby core)
---
    d.iso8601    ->  string
    d.xmlschema  ->  string

---

This method is equivalent to strftime('%F').


(from gem activesupport-5.1.2)
---
    xmlschema()

---

Returns a string which represents the time in used time zone as DateTime
defined by XML Schema:

    date = Date.new(2015, 05, 23)  # => Sat, 23 May 2015
    date.xmlschema                 # => "2015-05-23T00:00:00+04:00"


# Date#yday

(from ruby core)
---
    d.yday  ->  fixnum

---

Returns the day of the year (1-366).

    Date.new(2001,2,3).yday           #=> 34


# Date#year

(from ruby core)
---
    d.year  ->  integer

---

Returns the year.

    Date.new(2001,2,3).year           #=> 2001
    (Date.new(1,1,1) - 1).year        #=> 0


# Date#hour

(from ruby core)
---
    d.hour  ->  fixnum

---

Returns the hour (0-23).

    DateTime.new(2001,2,3,4,5,6).hour         #=> 4


# Date#min

(from ruby core)
---
    d.min     ->  fixnum
    d.minute  ->  fixnum

---

Returns the minute (0-59).

    DateTime.new(2001,2,3,4,5,6).min          #=> 5


# Date#minute

(from ruby core)
---
    d.minute  ->  fixnum

---

Returns the minute (0-59).

    DateTime.new(2001,2,3,4,5,6).min          #=> 5


# Date#new_offset

(from ruby core)
---
    d.new_offset([offset=0])  ->  date

---

Duplicates self and resets its offset.

    d = DateTime.new(2001,2,3,4,5,6,'-02:00')
                              #=> #<DateTime: 2001-02-03T04:05:06-02:00 ...>
    d.new_offset('+09:00')    #=> #<DateTime: 2001-02-03T15:05:06+09:00 ...>


# Date#offset

(from ruby core)
---
    d.offset  ->  rational

---

Returns the offset.

    DateTime.parse('04pm+0730').offset        #=> (5/16)


# Date#sec

(from ruby core)
---
    d.sec     ->  fixnum
    d.second  ->  fixnum

---

Returns the second (0-59).

    DateTime.new(2001,2,3,4,5,6).sec          #=> 6


# Date#sec_fraction

(from ruby core)
---
    d.sec_fraction     ->  rational

---

Returns the fractional part of the second.

    DateTime.new(2001,2,3,4,5,6.5).sec_fraction       #=> (1/2)


# Date#second

(from ruby core)
---
    d.second  ->  fixnum

---

Returns the second (0-59).

    DateTime.new(2001,2,3,4,5,6).sec          #=> 6


# Date#second_fraction

(from ruby core)
---
    d.second_fraction  ->  rational

---

Returns the fractional part of the second.

    DateTime.new(2001,2,3,4,5,6.5).sec_fraction       #=> (1/2)


# Date#zone

(from ruby core)
---
    d.zone  ->  string

---

Returns the timezone.

    DateTime.parse('04pm+0730').zone          #=> "+07:30"


(from gem activesupport-5.1.2)
---




---
# Constants:

DATE_FORMATS
:   [not documented]


# Class methods:

    beginning_of_week
    beginning_of_week=
    beginning_of_week_default
    current
    find_beginning_of_week!
    tomorrow
    yesterday

# Instance methods:

    <=>
    acts_like_date?
    advance
    ago
    at_beginning_of_day
    at_end_of_day
    at_midday
    at_middle_of_day
    at_midnight
    at_noon
    beginning_of_day
    change
    compare_with_coercion
    compare_without_coercion
    default_inspect
    end_of_day
    in
    inspect
    midday
    middle_of_day
    midnight
    noon
    readable_inspect
    since
    to_default_s
    to_formatted_s
    to_s
    to_time
    xmlschema

# Attributes:

    attr_accessor beginning_of_week_default

# Date::beginning_of_week

(from gem activesupport-5.1.2)
---
    beginning_of_week()

---

Returns the week start (e.g. :monday) for the current request, if this has
been set (via Date.beginning_of_week=). If `Date.beginning_of_week` has not
been set for the current request, returns the week start specified in
`config.beginning_of_week`. If no config.beginning_of_week was specified,
returns :monday.


# Date::beginning_of_week=

(from gem activesupport-5.1.2)
---
    beginning_of_week=(week_start)

---

Sets `Date.beginning_of_week` to a week start (e.g. :monday) for current
request/thread.

This method accepts any of the following day symbols: :monday, :tuesday,
:wednesday, :thursday, :friday, :saturday, :sunday


# Date::current

(from gem activesupport-5.1.2)
---
    current()

---

Returns Time.zone.today when `Time.zone` or `config.time_zone` are set,
otherwise just returns Date.today.


# Date::find_beginning_of_week!

(from gem activesupport-5.1.2)
---
    find_beginning_of_week!(week_start)

---

Returns week start day symbol (e.g. :monday), or raises an `ArgumentError` for
invalid day symbol.


# Date::tomorrow

(from gem activesupport-5.1.2)
---
    tomorrow()

---

Returns a new Date representing the date 1 day after today (i.e. tomorrow's
date).


# Date::yesterday

(from gem activesupport-5.1.2)
---
    yesterday()

---

Returns a new Date representing the date 1 day ago (i.e. yesterday's date).


# Date#<=>

(from ruby core)
---
    d <=> other  -> -1, 0, +1 or nil

---

Compares the two dates and returns -1, zero, 1 or nil.  The other should be a
date object or a numeric value as an astronomical Julian day number.

    Date.new(2001,2,3) <=> Date.new(2001,2,4) #=> -1
    Date.new(2001,2,3) <=> Date.new(2001,2,3) #=> 0
    Date.new(2001,2,3) <=> Date.new(2001,2,2) #=> 1
    Date.new(2001,2,3) <=> Object.new         #=> nil
    Date.new(2001,2,3) <=> Rational(4903887,2)#=> 0

See also Comparable.


(from gem activesupport-5.1.2)
---
    <=>(other)

---


# Date#acts_like_date?

(from gem activesupport-5.1.2)
---
    acts_like_date?()

---

Duck-types as a Date-like class. See Object#acts_like?.


# Date#advance

(from gem activesupport-5.1.2)
---
    advance(options)

---

Provides precise Date calculations for years, months, and days. The `options`
parameter takes a hash with any of these keys: `:years`, `:months`, `:weeks`,
`:days`.


# Date#ago

(from gem activesupport-5.1.2)
---
    ago(seconds)

---

Converts Date to a Time (or DateTime if necessary) with the time portion set
to the beginning of the day (0:00) and then subtracts the specified number of
seconds.


# Date#at_beginning_of_day

(from gem activesupport-5.1.2)
---
    at_beginning_of_day()

---


# Date#at_end_of_day

(from gem activesupport-5.1.2)
---
    at_end_of_day()

---


# Date#at_midday

(from gem activesupport-5.1.2)
---
    at_midday()

---


# Date#at_middle_of_day

(from gem activesupport-5.1.2)
---
    at_middle_of_day()

---


# Date#at_midnight

(from gem activesupport-5.1.2)
---
    at_midnight()

---


# Date#at_noon

(from gem activesupport-5.1.2)
---
    at_noon()

---


# Date#beginning_of_day

(from gem activesupport-5.1.2)
---
    beginning_of_day()

---

Converts Date to a Time (or DateTime if necessary) with the time portion set
to the beginning of the day (0:00)


# Date#change

(from gem activesupport-5.1.2)
---
    change(options)

---

Returns a new Date where one or more of the elements have been changed
according to the `options` parameter. The `options` parameter is a hash with a
combination of these keys: `:year`, `:month`, `:day`.

    Date.new(2007, 5, 12).change(day: 1)               # => Date.new(2007, 5, 1)
    Date.new(2007, 5, 12).change(year: 2005, month: 1) # => Date.new(2005, 1, 12)


# Date#compare_with_coercion

(from gem activesupport-5.1.2)
---
    compare_with_coercion(other)

---

Allow Date to be compared with Time by converting to DateTime and relying on
the <=> from there.


# Date#compare_without_coercion

(from gem activesupport-5.1.2)
---
    compare_without_coercion(other)

---


# Date#default_inspect

(from gem activesupport-5.1.2)
---
    default_inspect()

---


# Date#end_of_day

(from gem activesupport-5.1.2)
---
    end_of_day()

---

Converts Date to a Time (or DateTime if necessary) with the time portion set
to the end of the day (23:59:59)


# Date#in

(from gem activesupport-5.1.2)
---
    in(seconds)

---


# Date#inspect

(from ruby core)
---
    d.inspect  ->  string

---

Returns the value as a string for inspection.

    Date.new(2001,2,3).inspect
              #=> "#<Date: 2001-02-03 ((2451944j,0s,0n),+0s,2299161j)>"
    DateTime.new(2001,2,3,4,5,6,'-7').inspect
              #=> "#<DateTime: 2001-02-03T04:05:06-07:00 ((2451944j,39906s,0n),-25200s,2299161j)>"


(from gem activesupport-5.1.2)
---
    inspect()

---


# Date#midday

(from gem activesupport-5.1.2)
---
    midday()

---


# Date#middle_of_day

(from gem activesupport-5.1.2)
---
    middle_of_day()

---

Converts Date to a Time (or DateTime if necessary) with the time portion set
to the middle of the day (12:00)


# Date#midnight

(from gem activesupport-5.1.2)
---
    midnight()

---


# Date#noon

(from gem activesupport-5.1.2)
---
    noon()

---


# Date#readable_inspect

(from gem activesupport-5.1.2)
---
    readable_inspect()

---

Overrides the default inspect method with a human readable one, e.g., "Mon, 21
Feb 2005"


# Date#since

(from gem activesupport-5.1.2)
---
    since(seconds)

---

Converts Date to a Time (or DateTime if necessary) with the time portion set
to the beginning of the day (0:00) and then adds the specified number of
seconds


# Date#to_default_s

(from gem activesupport-5.1.2)
---
    to_default_s(format = :default)

---


# Date#to_formatted_s

(from gem activesupport-5.1.2)
---
    to_formatted_s(format = :default)

---

Convert to a formatted string. See DATE_FORMATS for predefined formats.

This method is aliased to `to_s`.

    date = Date.new(2007, 11, 10)       # => Sat, 10 Nov 2007

    date.to_formatted_s(:db)            # => "2007-11-10"
    date.to_s(:db)                      # => "2007-11-10"

    date.to_formatted_s(:short)         # => "10 Nov"
    date.to_formatted_s(:number)        # => "20071110"
    date.to_formatted_s(:long)          # => "November 10, 2007"
    date.to_formatted_s(:long_ordinal)  # => "November 10th, 2007"
    date.to_formatted_s(:rfc822)        # => "10 Nov 2007"
    date.to_formatted_s(:iso8601)       # => "2007-11-10"

## Adding your own date formats to to_formatted_s
You can add your own formats to the Date::DATE_FORMATS hash. Use the format
name as the hash key and either a strftime string or Proc instance that takes
a date argument as the value.

    # config/initializers/date_formats.rb
    Date::DATE_FORMATS[:month_and_year] = '%B %Y'
    Date::DATE_FORMATS[:short_ordinal] = ->(date) { date.strftime("%B #{date.day.ordinalize}") }


# Date#to_s

(from ruby core)
---
    d.to_s  ->  string

---

Returns a string in an ISO 8601 format (This method doesn't use the expanded
representations).

    Date.new(2001,2,3).to_s  #=> "2001-02-03"


(from gem activesupport-5.1.2)
---
    to_s(format = :default)

---


# Date#to_time

(from ruby core)
---
    d.to_time  ->  time

---

Returns a Time object which denotes self.


(from gem activesupport-5.1.2)
---
    to_time(form = :local)

---

Converts a Date instance to a Time, where the time is set to the beginning of
the day. The timezone can be either :local or :utc (default :local).

    date = Date.new(2007, 11, 10)  # => Sat, 10 Nov 2007

    date.to_time                   # => 2007-11-10 00:00:00 0800
    date.to_time(:local)           # => 2007-11-10 00:00:00 0800

    date.to_time(:utc)             # => 2007-11-10 00:00:00 UTC


# Date#xmlschema

(from ruby core)
---
    d.iso8601    ->  string
    d.xmlschema  ->  string

---

This method is equivalent to strftime('%F').


(from gem activesupport-5.1.2)
---
    xmlschema()

---

Returns a string which represents the time in used time zone as DateTime
defined by XML Schema:

    date = Date.new(2015, 05, 23)  # => Sat, 23 May 2015
    date.xmlschema                 # => "2015-05-23T00:00:00+04:00"


