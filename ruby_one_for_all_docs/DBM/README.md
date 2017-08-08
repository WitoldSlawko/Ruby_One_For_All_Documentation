# DBM < Object

---
# Includes:
Enumerable (from ruby core)

(from ruby core)
---
## Introduction

The DBM class provides a wrapper to a Unix-style
[dbm](http://en.wikipedia.org/wiki/Dbm) or Database Manager library.

Dbm databases do not have tables or columns; they are simple key-value data
stores, like a Ruby Hash except not resident in RAM. Keys and values must be
strings.

The exact library used depends on how Ruby was compiled. It could be any of
the following:

*   The original ndbm library is released in 4.3BSD. It is based on dbm
    library in Unix Version 7 but has different API to support multiple
    databases in a process.
*   [Berkeley DB](http://en.wikipedia.org/wiki/Berkeley_DB) versions 1 thru 5,
    also known as BDB and Sleepycat DB, now owned by Oracle Corporation.
*   Berkeley DB 1.x, still found in 4.4BSD derivatives (FreeBSD, OpenBSD,
    etc).
*   [gdbm](http://www.gnu.org/software/gdbm/), the GNU implementation of dbm.
*   [qdbm](http://fallabs.com/qdbm/index.html), another open source
    reimplementation of dbm.


All of these dbm implementations have their own Ruby interfaces available,
which provide richer (but varying) APIs.

## Cautions

Before you decide to use DBM, there are some issues you should consider:

*   Each implementation of dbm has its own file format. Generally, dbm
    libraries will not read each other's files. This makes dbm files a bad
    choice for data exchange.

*   Even running the same OS and the same dbm implementation, the database
    file format may depend on the CPU architecture. For example, files may not
    be portable between PowerPC and 386, or between 32 and 64 bit Linux.

*   Different versions of Berkeley DB use different file formats. A change to
    the OS may therefore break DBM access to existing files.

*   Data size limits vary between implementations. Original Berkeley DB was
    limited to 2GB of data. Dbm libraries also sometimes limit the total size
    of a key/value pair, and the total size of all the keys that hash to the
    same value. These limits can be as little as 512 bytes. That said, gdbm
    and recent versions of Berkeley DB do away with these limits.


Given the above cautions, DBM is not a good choice for long term storage of
important data. It is probably best used as a fast and easy alternative to a
Hash for processing large amounts of data.

## Example

    require 'dbm'
    db = DBM.open('rfcs', 0666, DBM::WRCREAT)
    db['822'] = 'Standard for the Format of ARPA Internet Text Messages'
    db['1123'] = 'Requirements for Internet Hosts - Application and Support'
    db['3068'] = 'An Anycast Prefix for 6to4 Relay Routers'
    puts db['822']
---
# Constants:

NEWDB
:   Indicates that dbm_open() should open the database in read/write mode,
    create it if it does not already exist, and delete all contents if it does
    already exist.
READER
:   Indicates that dbm_open() should open the database in read-only mode

VERSION
:   Identifies ndbm library version.

    Examples:

    *   "ndbm (4.3BSD)"
    *   "Berkeley DB 4.8.30: (April  9, 2010)"
    *   "Berkeley DB (unknown)" (4.4BSD, maybe)
    *   "GDBM version 1.8.3. 10/15/2002 (built Jul  1 2011 12:32:45)"
    *   "QDBM 1.8.78"

WRCREAT
:   Indicates that dbm_open() should open the database in read/write mode, and
    create it if it does not already exist
WRITER
:   Indicates that dbm_open() should open the database in read/write mode



# Class methods:

    new
    open

# Instance methods:

    []
    []=
    clear
    close
    closed?
    delete
    delete_if
    each
    each_key
    each_pair
    each_value
    empty?
    fetch
    has_key?
    has_value?
    include?
    invert
    key
    key?
    keys
    length
    member?
    reject
    reject!
    replace
    select
    shift
    size
    store
    to_a
    to_hash
    update
    value?
    values
    values_at

# DBM::new

(from ruby core)
---
    DBM.new(filename[, mode[, flags]]) -> dbm

---

Open a dbm database with the specified name, which can include a directory
path. Any file extensions needed will be supplied automatically by the dbm
library. For example, Berkeley DB appends '.db', and GNU gdbm uses two
physical files with extensions '.dir' and '.pag'.

The mode should be an integer, as for Unix chmod.

Flags should be one of READER, WRITER, WRCREAT or NEWDB.


# DBM::open

(from ruby core)
---
    DBM.open(filename[, mode[, flags]]) -> dbm
    DBM.open(filename[, mode[, flags]]) {|dbm| block}

---

Open a dbm database and yields it if a block is given. See also `DBM.new`.


# DBM#[]

(from ruby core)
---
    dbm[key] -> string value or nil

---

Return a value from the database by locating the key string provided.  If the
key is not found, returns nil.


# DBM#[]=

(from ruby core)
---
    dbm[key] = value

---

Stores the specified string value in the database, indexed via the string key
provided.


# DBM#clear

(from ruby core)
---
    dbm.clear

---

Deletes all data from the database.


# DBM#close

(from ruby core)
---
    dbm.close

---

Closes the database.


# DBM#closed?

(from ruby core)
---
    dbm.closed? -> true or false

---

Returns true if the database is closed, false otherwise.


# DBM#delete

(from ruby core)
---
    dbm.delete(key)

---

Deletes an entry from the database.


# DBM#delete_if

(from ruby core)
---
    dbm.delete_if {|key, value| block} -> self

---

Deletes all entries for which the code block returns true. Returns self.


# DBM#each

(from ruby core)
---
    dbm.each_pair {|key,value| block} -> self

---

Calls the block once for each [key, value] pair in the database. Returns self.


# DBM#each_key

(from ruby core)
---
    dbm.each_key {|key| block} -> self

---

Calls the block once for each key string in the database. Returns self.


# DBM#each_pair

(from ruby core)
---
    dbm.each_pair {|key,value| block} -> self

---

Calls the block once for each [key, value] pair in the database. Returns self.


# DBM#each_value

(from ruby core)
---
    dbm.each_value {|value| block} -> self

---

Calls the block once for each value string in the database. Returns self.


# DBM#empty?

(from ruby core)
---
    dbm.empty?

---

Returns true if the database is empty, false otherwise.


# DBM#fetch

(from ruby core)
---
    dbm.fetch(key[, ifnone]) -> value

---

Return a value from the database by locating the key string provided.  If the
key is not found, returns `ifnone`. If `ifnone` is not given, raises
IndexError.


# DBM#has_key?

(from ruby core)
---
    dbm.has_key?(key) -> boolean

---

Returns true if the database contains the specified key, false otherwise.


# DBM#has_value?

(from ruby core)
---
    dbm.has_value?(value) -> boolean

---

Returns true if the database contains the specified string value, false
otherwise.


# DBM#include?

(from ruby core)
---
    dbm.include?(key) -> boolean

---

Returns true if the database contains the specified key, false otherwise.


# DBM#invert

(from ruby core)
---
    dbm.invert -> hash

---

Returns a Hash (not a DBM database) created by using each value in the
database as a key, with the corresponding key as its value.


# DBM#key

(from ruby core)
---
    dbm.key(value) -> string

---

Returns the key for the specified value.


# DBM#key?

(from ruby core)
---
    dbm.key?(key) -> boolean

---

Returns true if the database contains the specified key, false otherwise.


# DBM#keys

(from ruby core)
---
    dbm.keys -> array

---

Returns an array of all the string keys in the database.


# DBM#length

(from ruby core)
---
    dbm.length -> integer

---

Returns the number of entries in the database.


# DBM#member?

(from ruby core)
---
    dbm.member?(key) -> boolean

---

Returns true if the database contains the specified key, false otherwise.


# DBM#reject

(from ruby core)
---
    dbm.reject {|key,value| block} -> Hash

---

Converts the contents of the database to an in-memory Hash, then calls
Hash#reject with the specified code block, returning a new Hash.


# DBM#reject!

(from ruby core)
---
    dbm.reject! {|key, value| block} -> self

---

Deletes all entries for which the code block returns true. Returns self.


# DBM#replace

(from ruby core)
---
    dbm.replace(obj)

---

Replaces the contents of the database with the contents of the specified
object. Takes any object which implements the each_pair method, including Hash
and DBM objects.


# DBM#select

(from ruby core)
---
    dbm.select {|key, value| block} -> array

---

Returns a new array consisting of the [key, value] pairs for which the code
block returns true.


# DBM#shift

(from ruby core)
---
    dbm.shift() -> [key, value]

---

Removes a [key, value] pair from the database, and returns it. If the database
is empty, returns nil. The order in which values are removed/returned is not
guaranteed.


# DBM#size

(from ruby core)
---
    dbm.size -> integer

---

Returns the number of entries in the database.


# DBM#store

(from ruby core)
---
    dbm.store(key, value) -> value

---

Stores the specified string value in the database, indexed via the string key
provided.


# DBM#to_a

(from ruby core)
---
    dbm.to_a -> array

---

Converts the contents of the database to an array of [key, value] arrays, and
returns it.


# DBM#to_hash

(from ruby core)
---
    dbm.to_hash -> hash

---

Converts the contents of the database to an in-memory Hash object, and returns
it.


# DBM#update

(from ruby core)
---
    dbm.update(obj)

---

Updates the database with multiple values from the specified object. Takes any
object which implements the each_pair method, including Hash and DBM objects.


# DBM#value?

(from ruby core)
---
    dbm.value?(value) -> boolean

---

Returns true if the database contains the specified string value, false
otherwise.


# DBM#values

(from ruby core)
---
    dbm.values -> array

---

Returns an array of all the string values in the database.


# DBM#values_at

(from ruby core)
---
    dbm.values_at(key, ...) -> Array

---

Returns an array containing the values associated with the given keys.


