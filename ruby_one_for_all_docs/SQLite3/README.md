# SQLite3

(from gem sqlite3-1.3.13)
---


SQLite3 is a wrapper around the popular database [sqlite](http://sqlite.org).

For an example of usage, see SQLite3::Database.










---
# Constants:

SQLITE_VERSION
:   [not documented]
SQLITE_VERSION_NUMBER
:   [not documented]
VERSION
:   [not documented]


# Class methods:

    const_missing
    libversion
    new
    threadsafe
    threadsafe?

# Instance methods:

    commit
    create_aggregate_handler
    finalize
    instance
    ordered_map_for
    readonly?
    rollback
    step
    transaction

# SQLite3::const_missing

(from gem sqlite3-1.3.13)
---
    const_missing(name)

---


# SQLite3::libversion

(from gem sqlite3-1.3.13)
---
    libversion()

---


# SQLite3::new

(from gem sqlite3-1.3.13)
---
    new(klass)

---


# SQLite3::threadsafe

(from gem sqlite3-1.3.13)
---
    threadsafe()

---

Returns the compile time setting of the SQLITE_THREADSAFE flag. See:
https://www.sqlite.org/c3ref/threadsafe.html


# SQLite3::threadsafe?

(from gem sqlite3-1.3.13)
---
    threadsafe?()

---

Was sqlite3 compiled with thread safety on?


# SQLite3#commit

(from gem sqlite3-1.3.13)
---
    commit()

---

Commits the current transaction. If there is no current transaction, this will
cause an error to be raised. This returns `true`, in order to allow it to be
used in idioms like `abort? and rollback or commit`.


# SQLite3#create_aggregate_handler

(from gem sqlite3-1.3.13)
---
    create_aggregate_handler( handler )

---

This is another approach to creating an aggregate function (see
#create_aggregate). Instead of explicitly specifying the name, callbacks,
arity, and type, you specify a factory object (the "handler") that knows how
to obtain all of that information. The handler should respond to the following
messages:

`arity`
:   corresponds to the `arity` parameter of #create_aggregate. This message is
    optional, and if the handler does not respond to it, the function will
    have an arity of -1.
`name`
:   this is the name of the function. The handler *must* implement this
    message.
`new`
:   this must be implemented by the handler. It should return a new instance
    of the object that will handle a specific invocation of the function.


The handler instance (the object returned by the `new` message, described
above), must respond to the following messages:

`step`
:   this is the method that will be called for each step of the aggregate
    function's evaluation. It should implement the same signature as the
    `step` callback for #create_aggregate.
`finalize`
:   this is the method that will be called to finalize the aggregate
    function's evaluation. It should implement the same signature as the
    `finalize` callback for #create_aggregate.


Example:

    class LengthsAggregateHandler
      def self.arity; 1; end
      def self.name; 'lengths'; end

      def initialize
        @total = 0
      end

      def step( ctx, name )
        @total += ( name ? name.length : 0 )
      end

      def finalize( ctx )
        ctx.result = @total
      end
    end

    db.create_aggregate_handler( LengthsAggregateHandler )
    puts db.get_first_value( "select lengths(name) from A" )


# SQLite3#finalize

(from gem sqlite3-1.3.13)
---
    finalize()

---


# SQLite3#instance

(from gem sqlite3-1.3.13)
---
    instance()

---


# SQLite3#readonly?

(from gem sqlite3-1.3.13)
---
    readonly?()

---

Returns `true` if the database has been open in readonly mode A helper to
check before performing any operation


# SQLite3#rollback

(from gem sqlite3-1.3.13)
---
    rollback()

---

Rolls the current transaction back. If there is no current transaction, this
will cause an error to be raised. This returns `true`, in order to allow it to
be used in idioms like `abort? and rollback or commit`.


# SQLite3#step

(from gem sqlite3-1.3.13)
---
    step( *args )

---


# SQLite3#transaction

(from gem sqlite3-1.3.13)
---
    transaction( mode = :deferred ) { |self| ... }

---

Begins a new transaction. Note that nested transactions are not allowed by
SQLite, so attempting to nest a transaction will result in a runtime
exception.

The `mode` parameter may be either `:deferred` (the default), `:immediate`, or
`:exclusive`.

If a block is given, the database instance is yielded to it, and the
transaction is committed when the block terminates. If the block raises an
exception, a rollback will be performed instead. Note that if a block is
given, #commit and #rollback should never be called explicitly or you'll get
an error when the block terminates.

If a block is not given, it is the caller's responsibility to end the
transaction explicitly, either by calling #commit, or by calling #rollback.


# SQLite3#ordered_map_for

(from gem sqlite3-1.3.13)
---
    ordered_map_for(columns, row)

---


