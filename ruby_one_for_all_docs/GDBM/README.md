# GDBM < Object

---
# Includes:
Enumerable (from ruby core)

(from ruby core)
---
## Summary

Ruby extension for GNU dbm (gdbm) -- a simple database engine for storing
key-value pairs on disk.

## Description

GNU dbm is a library for simple databases. A database is a file that stores
key-value pairs. Gdbm allows the user to store, retrieve, and delete data by
key. It furthermore allows a non-sorted traversal of all key-value pairs. A
gdbm database thus provides the same functionality as a hash. As with objects
of the Hash class, elements can be accessed with `[]`. Furthermore, GDBM mixes
in the Enumerable module, thus providing convenient methods such as #find,
#collect, #map, etc.

A process is allowed to open several different databases at the same time. A
process can open a database as a "reader" or a "writer". Whereas a reader has
only read-access to the database, a writer has read- and write-access. A
database can be accessed either by any number of readers or by exactly one
writer at the same time.

## Examples

1.  Opening/creating a database, and filling it with some entries:

        require 'gdbm'

        gdbm = GDBM.new("fruitstore.db")
        gdbm["ananas"]    = "3"
        gdbm["banana"]    = "8"
        gdbm["cranberry"] = "4909"
        gdbm.close

2.  Reading out a database:

        require 'gdbm'

        gdbm = GDBM.new("fruitstore.db")
        gdbm.each_pair do |key, value|
          print "#{key}: #{value}\n"
        end
        gdbm.close

    produces

        banana: 8
        ananas: 3
        cranberry: 4909


## Links

*   http://www.gnu.org/software/gdbm/

---
# Constants:

FAST
:   flag for #new and #open. this flag is obsolete for gdbm >= 1.8

NEWDB
:   open database as a writer; overwrite any existing databases 

NOLOCK
:   flag for #new and #open

READER
:   open database as a reader

SYNC
:   flag for #new and #open. only for gdbm >= 1.8

VERSION
:   version of the gdbm library

WRCREAT
:   open database as a writer; if the database does not exist, create a new
    one

WRITER
:   open database as a writer



# Class methods:

    new
    open

# Instance methods:

    []
    []=
    cachesize=
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
    fastmode=
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
    reorganize
    replace
    select
    shift
    size
    store
    sync
    syncmode=
    to_a
    to_hash
    update
    value?
    values
    values_at

# GDBM::new

(from ruby core)
---
    GDBM.new(filename, mode = 0666, flags = nil)

---

Creates a new GDBM instance by opening a gdbm file named *filename*. If the
file does not exist, a new file with file mode *mode* will be created. *flags*
may be one of the following:
*   **READER**  - open as a reader
*   **WRITER**  - open as a writer
*   **WRCREAT** - open as a writer; if the database does not exist, create a
    new one
*   **NEWDB**   - open as a writer; overwrite any existing databases


The values **WRITER**, **WRCREAT** and **NEWDB** may be combined with the
following values by bitwise or:
*   **SYNC**    - cause all database operations to be synchronized to the disk
*   **NOLOCK**  - do not lock the database file


If no *flags* are specified, the GDBM object will try to open the database
file as a writer and will create it if it does not already exist (cf. flag
`WRCREAT`). If this fails (for instance, if another process has already opened
the database as a reader), it will try to open the database file as a reader
(cf. flag `READER`).


# GDBM::open

(from ruby core)
---
    GDBM.open(filename, mode = 0666, flags = nil)
    GDBM.open(filename, mode = 0666, flags = nil) { |gdbm| ... }

---

If called without a block, this is synonymous to GDBM::new. If a block is
given, the new GDBM instance will be passed to the block as a parameter, and
the corresponding database file will be closed after the execution of the
block code has been finished.

Example for an open call with a block:

    require 'gdbm'
    GDBM.open("fruitstore.db") do |gdbm|
      gdbm.each_pair do |key, value|
        print "#{key}: #{value}\n"
      end
    end


# GDBM#[]

(from ruby core)
---
    gdbm[key] -> value

---

Retrieves the *value* corresponding to *key*.


# GDBM#[]=

(from ruby core)
---
    gdbm[key]= value -> value

---

Associates the value *value* with the specified *key*.


# GDBM#cachesize=

(from ruby core)
---
    gdbm.cachesize = size -> size

---

Sets the size of the internal bucket cache to *size*.


# GDBM#clear

(from ruby core)
---
    gdbm.clear -> gdbm

---

Removes all the key-value pairs within *gdbm*.


# GDBM#close

(from ruby core)
---
    gdbm.close -> nil

---

Closes the associated database file.


# GDBM#closed?

(from ruby core)
---
    gdbm.closed?  -> true or false

---

Returns true if the associated database file has been closed.


# GDBM#delete

(from ruby core)
---
    gdbm.delete(key) -> value or nil

---

Removes the key-value-pair with the specified *key* from this database and
returns the corresponding *value*. Returns nil if the database is empty.


# GDBM#delete_if

(from ruby core)
---
    gdbm.delete_if { |key, value| block } -> gdbm

---

Deletes every key-value pair from *gdbm* for which *block* evaluates to true.


# GDBM#each

(from ruby core)
---
    gdbm.each_pair { |key, value| block } -> gdbm

---

Executes *block* for each key in the database, passing the *key* and the
corresponding *value* as a parameter.


# GDBM#each_key

(from ruby core)
---
    gdbm.each_key { |key| block } -> gdbm

---

Executes *block* for each key in the database, passing the *key* as a
parameter.


# GDBM#each_pair

(from ruby core)
---
    gdbm.each_pair { |key, value| block } -> gdbm

---

Executes *block* for each key in the database, passing the *key* and the
corresponding *value* as a parameter.


# GDBM#each_value

(from ruby core)
---
    gdbm.each_value { |value| block } -> gdbm

---

Executes *block* for each key in the database, passing the corresponding
*value* as a parameter.


# GDBM#empty?

(from ruby core)
---
    gdbm.empty? -> true or false

---

Returns true if the database is empty.


# GDBM#fastmode=

(from ruby core)
---
    gdbm.fastmode = boolean -> boolean

---

Turns the database's fast mode on or off. If fast mode is turned on, gdbm does
not wait for writes to be flushed to the disk before continuing.

This option is obsolete for gdbm >= 1.8 since fast mode is turned on by
default. See also: #syncmode=


# GDBM#fetch

(from ruby core)
---
    gdbm.fetch(key [, default]) -> value

---

Retrieves the *value* corresponding to *key*. If there is no value associated
with *key*, *default* will be returned instead.


# GDBM#has_key?

(from ruby core)
---
    gdbm.has_key?(k) -> true or false

---

Returns true if the given key *k* exists within the database. Returns false
otherwise.


# GDBM#has_value?

(from ruby core)
---
    gdbm.has_value?(v) -> true or false

---

Returns true if the given value *v* exists within the database. Returns false
otherwise.


# GDBM#include?

(from ruby core)
---
    gdbm.include?(k) -> true or false

---

Returns true if the given key *k* exists within the database. Returns false
otherwise.


# GDBM#invert

(from ruby core)
---
    gdbm.invert  -> hash

---

Returns a hash created by using *gdbm*'s values as keys, and the keys as
values.


# GDBM#key

(from ruby core)
---
    gdbm.key(value) -> key

---

Returns the *key* for a given *value*. If several keys may map to the same
value, the key that is found first will be returned.


# GDBM#key?

(from ruby core)
---
    gdbm.key?(k) -> true or false

---

Returns true if the given key *k* exists within the database. Returns false
otherwise.


# GDBM#keys

(from ruby core)
---
    gdbm.keys -> array

---

Returns an array of all keys of this database.


# GDBM#length

(from ruby core)
---
    gdbm.length -> fixnum

---

Returns the number of key-value pairs in this database.


# GDBM#member?

(from ruby core)
---
    gdbm.member?(k) -> true or false

---

Returns true if the given key *k* exists within the database. Returns false
otherwise.


# GDBM#reject

(from ruby core)
---
    gdbm.reject { |key, value| block } -> hash

---

Returns a hash copy of *gdbm* where all key-value pairs from *gdbm* for which
*block* evaluates to true are removed. See also: #delete_if


# GDBM#reject!

(from ruby core)
---
    gdbm.reject! { |key, value| block } -> gdbm

---

Deletes every key-value pair from *gdbm* for which *block* evaluates to true.


# GDBM#reorganize

(from ruby core)
---
    gdbm.reorganize -> gdbm

---

Reorganizes the database file. This operation removes reserved space of
elements that have already been deleted. It is only useful after a lot of
deletions in the database.


# GDBM#replace

(from ruby core)
---
    gdbm.replace(other) -> gdbm

---

Replaces the content of *gdbm* with the key-value pairs of *other*. *other*
must have an each_pair method.


# GDBM#select

(from ruby core)
---
    gdbm.select { |key, value| block } -> array

---

Returns a new array of all key-value pairs of the database for which *block*
evaluates to true.


# GDBM#shift

(from ruby core)
---
    gdbm.shift -> (key, value) or nil

---

Removes a key-value-pair from this database and returns it as a two-item array
[ *key*, *value* ]. Returns nil if the database is empty.


# GDBM#size

(from ruby core)
---
    gdbm.size -> fixnum

---

Returns the number of key-value pairs in this database.


# GDBM#store

(from ruby core)
---
    gdbm.store(key, value) -> value

---

Associates the value *value* with the specified *key*.


# GDBM#sync

(from ruby core)
---
    gdbm.sync -> gdbm

---

Unless the *gdbm* object has been opened with the **SYNC** flag, it is not
guaranteed that database modification operations are immediately applied to
the database file. This method ensures that all recent modifications to the
database are written to the file. Blocks until all writing operations to the
disk have been finished.


# GDBM#syncmode=

(from ruby core)
---
    gdbm.syncmode = boolean -> boolean

---

Turns the database's synchronization mode on or off. If the synchronization
mode is turned on, the database's in-memory state will be synchronized to disk
after every database modification operation. If the synchronization mode is
turned off, GDBM does not wait for writes to be flushed to the disk before
continuing.

This option is only available for gdbm >= 1.8 where syncmode is turned off by
default. See also: #fastmode=


# GDBM#to_a

(from ruby core)
---
    gdbm.to_a -> array

---

Returns an array of all key-value pairs contained in the database.


# GDBM#to_hash

(from ruby core)
---
    gdbm.to_hash -> hash

---

Returns a hash of all key-value pairs contained in the database.


# GDBM#update

(from ruby core)
---
    gdbm.update(other) -> gdbm

---

Adds the key-value pairs of *other* to *gdbm*, overwriting entries with
duplicate keys with those from *other*. *other* must have an each_pair method.


# GDBM#value?

(from ruby core)
---
    gdbm.value?(v) -> true or false

---

Returns true if the given value *v* exists within the database. Returns false
otherwise.


# GDBM#values

(from ruby core)
---
    gdbm.values -> array

---

Returns an array of all values of this database.


# GDBM#values_at

(from ruby core)
---
    gdbm.values_at(key, ...) -> array

---

Returns an array of the values associated with each specified *key*.


