# PGconn < rb_cObject 

---
# Includes:
rb_mPGconstants (from gem pg-0.21.0)

(from gem pg-0.21.0)
---

The PostgreSQL connection class. The interface for this class is based on
[libpq](http://www.postgresql.org/docs/9.2/interactive/libpq.html), the C
application programmer's interface to PostgreSQL. Some familiarity with libpq
is recommended, but not necessary.

For example, to send query to the database on the localhost:

    require 'pg'
    conn = PG::Connection.open(:dbname => 'test')
    res = conn.exec_params('SELECT $1 AS a, $2 AS b, $3 AS c', [1, 2, nil])
    # Equivalent to:
    #  res  = conn.exec('SELECT 1 AS a, 2 AS b, NULL AS c')

See the PG::Result class for information on working with the results of a
query.
---
# Constants:

CONNECT_ARGUMENT_ORDER
:   The order the options are passed to the ::connect method.


# Class methods:

    conndefaults
    conndefaults_hash
    connect_start
    encrypt_password
    escape_bytea
    escape_string
    new
    parse_connect_args
    ping
    quote_connstr
    quote_ident
    unescape_bytea

# Instance methods:

    async_exec
    async_query
    backend_pid
    block
    cancel
    client_encoding=
    close
    conndefaults
    conndefaults_hash
    connect_poll
    connection_needs_password
    connection_used_password
    conninfo
    conninfo_hash
    consume_input
    copy_data
    db
    decoder_for_get_copy_data
    decoder_for_get_copy_data=
    describe_portal
    describe_prepared
    encoder_for_put_copy_data
    encoder_for_put_copy_data=
    error_message
    escape
    escape_bytea
    escape_identifier
    escape_literal
    escape_string
    exec
    exec_params
    exec_prepared
    external_encoding
    finish
    finished?
    flush
    get_client_encoding
    get_copy_data
    get_last_result
    get_result
    host
    internal_encoding
    internal_encoding=
    is_busy
    isnonblocking
    lo_close
    lo_creat
    lo_create
    lo_export
    lo_import
    lo_lseek
    lo_open
    lo_read
    lo_seek
    lo_tell
    lo_truncate
    lo_unlink
    lo_write
    loclose
    locreat
    locreate
    loexport
    loimport
    lolseek
    loopen
    loread
    loseek
    lotell
    lotruncate
    lounlink
    lowrite
    make_empty_pgresult
    nonblocking?
    notifies
    notifies_wait
    options
    parameter_status
    pass
    port
    prepare
    protocol_version
    put_copy_data
    put_copy_end
    query
    quote_ident
    reset
    reset_poll
    reset_start
    send_describe_portal
    send_describe_prepared
    send_prepare
    send_query
    send_query_prepared
    server_version
    set_client_encoding
    set_default_encoding
    set_error_verbosity
    set_notice_processor
    set_notice_receiver
    set_single_row_mode
    setnonblocking
    socket
    socket_io
    ssl_attribute
    ssl_attribute_names
    ssl_attributes
    ssl_in_use?
    status
    trace
    transaction
    transaction_status
    tty
    type_map_for_queries
    type_map_for_queries=
    type_map_for_results
    type_map_for_results=
    unescape_bytea
    untrace
    user
    wait_for_notify

# PGconn::conndefaults

(from gem pg-0.21.0)
### Implementation from Connection
---
    PG::Connection.conndefaults() -> Array

---

Returns an array of hashes. Each hash has the keys:
`:keyword`
:   the name of the option
`:envvar`
:   the environment variable to fall back to
`:compiled`
:   the compiled in option as a secondary fallback
`:val`
:   the option's current value, or `nil` if not known
`:label`
:   the label for the field
`:dispchar`
:   "" for normal, "D" for debug, and "*" for password
`:dispsize`
:   field size



# PGconn::conndefaults_hash

(from gem pg-0.21.0)
### Implementation from Connection
---
    conndefaults_hash()

---

Return the Postgres connection defaults structure as a Hash keyed by option
keyword (as a Symbol).

See also #conndefaults


# PGconn::connect_start

(from gem pg-0.21.0)
### Implementation from Connection
---
    PG::Connection.connect_start(connection_hash)       -> conn
    PG::Connection.connect_start(connection_string)     -> conn
    PG::Connection.connect_start(host, port, options, tty, dbname, login, password) ->  conn

---

This is an asynchronous version of PG::Connection.connect().

Use #connect_poll to poll the status of the connection.

NOTE: this does **not** set the connection's `client_encoding` for you if
Encoding.default_internal is set. To set it after the connection is
established, call #internal_encoding=. You can also set it automatically by
setting [ENV]('PGCLIENTENCODING'), or include the 'options' connection
parameter.


# PGconn::encrypt_password

(from gem pg-0.21.0)
### Implementation from Connection
---
    PG::Connection.encrypt_password( password, username ) -> String

---

This function is intended to be used by client applications that send commands
like: +ALTER USER joe PASSWORD 'pwd'+. The arguments are the cleartext
password, and the SQL name of the user it is for.

Return value is the encrypted password.


# PGconn::escape_bytea

(from gem pg-0.21.0)
### Implementation from Connection
---
    conn.escape_bytea( string ) -> String

---

Escapes binary data for use within an SQL command with the type `bytea`.

Certain byte values must be escaped (but all byte values may be escaped) when
used as part of a `bytea` literal in an SQL statement. In general, to escape a
byte, it is converted into the three digit octal number equal to the octet
value, and preceded by two backslashes. The single quote (') and backslash ()
characters have special alternative escape sequences. #escape_bytea performs
this operation, escaping only the minimally required bytes.

Consider using exec_params, which avoids the need for passing values inside of
SQL commands.

NOTE: This class version of this method can only be used safely in client
programs that use a single PostgreSQL connection at a time (in this case it
can find out what it needs to know "behind the scenes"). It might give the
wrong results if used in programs that use multiple database connections; use
the same method on the connection object in such cases.


# PGconn::escape_string

(from gem pg-0.21.0)
### Implementation from Connection
---
    conn.escape_string( str ) -> String

---

Returns a SQL-safe version of the String *str*. This is the preferred way to
make strings safe for inclusion in SQL queries.

Consider using exec_params, which avoids the need for passing values inside of
SQL commands.

Encoding of escaped string will be equal to client encoding of connection.

NOTE: This class version of this method can only be used safely in client
programs that use a single PostgreSQL connection at a time (in this case it
can find out what it needs to know "behind the scenes"). It might give the
wrong results if used in programs that use multiple database connections; use
the same method on the connection object in such cases.


# PGconn::new

(from gem postgres-pr-0.7.0)
---
    new(host, port, options, tty, database, user, auth)

---


# PGconn::parse_connect_args

(from gem pg-0.21.0)
### Implementation from Connection
---
    parse_connect_args( *args )

---

Parse the connection `args` into a connection-parameter string. See
PG::Connection.new for valid arguments.


# PGconn::ping

(from gem pg-0.21.0)
### Implementation from Connection
---
    PG::Connection.ping(connection_hash)       -> Integer
    PG::Connection.ping(connection_string)     -> Integer
    PG::Connection.ping(host, port, options, tty, dbname, login, password) ->  Integer

---

Check server status.

Returns one of:
`PQPING_OK`
:   server is accepting connections
`PQPING_REJECT`
:   server is alive but rejecting connections
`PQPING_NO_RESPONSE`
:   could not establish connection
`PQPING_NO_ATTEMPT`
:   connection not attempted (bad params)



# PGconn::quote_connstr

(from gem pg-0.21.0)
### Implementation from Connection
---
    quote_connstr( value )

---

Quote the given `value` for use in a connection-parameter string.


# PGconn::quote_ident

(from gem postgres-pr-0.7.0)
---
    quote_ident(name)

---


# PGconn::unescape_bytea

(from gem pg-0.21.0)
### Implementation from Connection
---
    PG::Connection.unescape_bytea( string )

---

Converts an escaped string representation of binary data into binary data ---
the reverse of #escape_bytea. This is needed when retrieving `bytea` data in
text format, but not when retrieving it in binary format.


# PGconn#async_exec

(from gem pg-0.21.0)
### Implementation from Connection
---
    conn.async_exec(sql [, params, result_format ] ) -> PG::Result
    conn.async_exec(sql [, params, result_format ] ) {|pg_result| block }

---

This function has the same behavior as #exec, but is implemented using the
asynchronous command processing API of libpq.


# PGconn#async_query

(from gem pg-0.21.0)
### Implementation from Connection
---
    async_query(*args)

---


# PGconn#backend_pid

(from gem pg-0.21.0)
### Implementation from Connection
---
    conn.backend_pid() -> Integer

---

Returns the process ID of the backend server process for this connection. Note
that this is a PID on database server host.


# PGconn#block

(from gem pg-0.21.0)
### Implementation from Connection
---
    conn.block( [ timeout ] ) -> Boolean

---

Blocks until the server is no longer busy, or until the optional *timeout* is
reached, whichever comes first. *timeout* is measured in seconds and can be
fractional.

Returns `false` if *timeout* is reached, `true` otherwise.

If `true` is returned, `conn.is_busy` will return `false` and
`conn.get_result` will not block.


# PGconn#cancel

(from gem pg-0.21.0)
### Implementation from Connection
---
    conn.cancel() -> String

---

Requests cancellation of the command currently being processed. (Only
implemented in PostgreSQL >= 8.0)

Returns `nil` on success, or a string containing the error message if a
failure occurs.


# PGconn#client_encoding=

(from gem pg-0.21.0)
### Implementation from Connection
---
    client_encoding=(p1)

---


# PGconn#close

(from gem postgres-pr-0.7.0)
---
    close()

---


# PGconn#conndefaults

(from gem pg-0.21.0)
### Implementation from Connection
---
    conndefaults()

---

Returns an array of Hashes with connection defaults. See ::conndefaults for
details.


# PGconn#conndefaults_hash

(from gem pg-0.21.0)
### Implementation from Connection
---
    conndefaults_hash()

---

Returns a Hash with connection defaults. See ::conndefaults_hash for details.


# PGconn#connect_poll

(from gem pg-0.21.0)
### Implementation from Connection
---
    conn.connect_poll() -> Integer

---

Returns one of:
`PGRES_POLLING_READING`
:   wait until the socket is ready to read
`PGRES_POLLING_WRITING`
:   wait until the socket is ready to write
`PGRES_POLLING_FAILED`
:   the asynchronous connection has failed
`PGRES_POLLING_OK`
:   the asynchronous connection is ready


Example:
    conn = PG::Connection.connect_start("dbname=mydatabase")
    socket = conn.socket_io
    status = conn.connect_poll
    while(status != PG::PGRES_POLLING_OK) do
      # do some work while waiting for the connection to complete
      if(status == PG::PGRES_POLLING_READING)
        if(not select([socket], [], [], 10.0))
          raise "Asynchronous connection timed out!"
        end
      elsif(status == PG::PGRES_POLLING_WRITING)
        if(not select([], [socket], [], 10.0))
          raise "Asynchronous connection timed out!"
        end
      end
      status = conn.connect_poll
    end
    # now conn.status == CONNECTION_OK, and connection
    # is ready.


# PGconn#connection_needs_password

(from gem pg-0.21.0)
### Implementation from Connection
---
    conn.connection_needs_password() -> Boolean

---

Returns `true` if the authentication method required a password, but none was
available. `false` otherwise.


# PGconn#connection_used_password

(from gem pg-0.21.0)
### Implementation from Connection
---
    conn.connection_used_password() -> Boolean

---

Returns `true` if the authentication method used a caller-supplied password,
`false` otherwise.


# PGconn#conninfo

(from gem pg-0.21.0)
### Implementation from Connection
---
    conn.conninfo   -> hash

---

Returns the connection options used by a live connection.


# PGconn#conninfo_hash

(from gem pg-0.21.0)
### Implementation from Connection
---
    conninfo_hash()

---

Return the Postgres connection info structure as a Hash keyed by option
keyword (as a Symbol).

See also #conninfo


# PGconn#consume_input

(from gem pg-0.21.0)
### Implementation from Connection
---
    conn.consume_input()

---

If input is available from the server, consume it. After calling
`consume_input`, you can check `is_busy` or **notifies** to see if the state
has changed.


# PGconn#copy_data

(from gem pg-0.21.0)
### Implementation from Connection
---
    conn.copy_data( sql ) {|sql_result| ... } -> PG::Result

---

Execute a copy process for transfering data to or from the server.

This issues the SQL COPY command via #exec. The response to this (if there is
no error in the command) is a PG::Result object that is passed to the block,
bearing a status code of PGRES_COPY_OUT or PGRES_COPY_IN (depending on the
specified copy direction). The application should then use #put_copy_data or
#get_copy_data to receive or transmit data rows and should return from the
block when finished.

#copy_data returns another PG::Result object when the data transfer is
complete. An exception is raised if some problem was encountered, so it isn't
required to make use of any of them. At this point further SQL commands can be
issued via #exec. (It is not possible to execute other SQL commands using the
same connection while the COPY operation is in progress.)

This method ensures, that the copy process is properly terminated in case of
client side or server side failures. Therefore, in case of blocking mode of
operation, #copy_data is preferred to raw calls of #put_copy_data,
#get_copy_data and #put_copy_end.

Example with CSV input format:
    conn.exec "create table my_table (a text,b text,c text,d text)"
    conn.copy_data "COPY my_table FROM STDIN CSV" do
      conn.put_copy_data "some,data,to,copy\n"
      conn.put_copy_data "more,data,to,copy\n"
    end

This creates `my_table` and inserts two CSV rows.

The same with text format encoder PG::TextEncoder::CopyRow and Array input:
    enco = PG::TextEncoder::CopyRow.new
    conn.copy_data "COPY my_table FROM STDIN", enco do
      conn.put_copy_data ['some', 'data', 'to', 'copy']
      conn.put_copy_data ['more', 'data', 'to', 'copy']
    end

Example with CSV output format:
    conn.copy_data "COPY my_table TO STDOUT CSV" do
      while row=conn.get_copy_data
        p row
      end
    end

This prints all rows of `my_table` to stdout:
    "some,data,to,copy\n"
    "more,data,to,copy\n"

The same with text format decoder PG::TextDecoder::CopyRow and Array output:
    deco = PG::TextDecoder::CopyRow.new
    conn.copy_data "COPY my_table TO STDOUT", deco do
      while row=conn.get_copy_data
        p row
      end
    end

This receives all rows of `my_table` as ruby array:
    ["some", "data", "to", "copy"]
    ["more", "data", "to", "copy"]


# PGconn#db

(from gem postgres-pr-0.7.0)
---


# PGconn#decoder_for_get_copy_data

(from gem pg-0.21.0)
### Implementation from Connection
---
    res.decoder_for_get_copy_data -> PG::Coder

---

Returns the default coder object that is currently set for type casting of
received data by #get_copy_data .

Returns either:
*   a kind of PG::Coder
*   `nil` - type encoding is disabled, returned data will be a String.



# PGconn#decoder_for_get_copy_data=

(from gem pg-0.21.0)
### Implementation from Connection
---
    res.decoder_for_get_copy_data = decoder

---

Set the default coder that is used for type casting of received data by
#get_copy_data .

`decoder` can be:
*   a kind of PG::Coder
*   `nil` - disable type decoding, returned data will be a String.



# PGconn#describe_portal

(from gem pg-0.21.0)
### Implementation from Connection
---
    conn.describe_portal( portal_name ) -> PG::Result

---

Retrieve information about the portal *portal_name*.


# PGconn#describe_prepared

(from gem pg-0.21.0)
### Implementation from Connection
---
    conn.describe_prepared( statement_name ) -> PG::Result

---

Retrieve information about the prepared statement *statement_name*.


# PGconn#encoder_for_put_copy_data

(from gem pg-0.21.0)
### Implementation from Connection
---
    res.encoder_for_put_copy_data -> PG::Coder

---

Returns the default coder object that is currently set for type casting of
parameters to #put_copy_data .

Returns either:
*   a kind of PG::Coder
*   `nil` - type encoding is disabled, data must be a String.



# PGconn#encoder_for_put_copy_data=

(from gem pg-0.21.0)
### Implementation from Connection
---
    res.encoder_for_put_copy_data = encoder

---

Set the default coder that is used for type casting of parameters to
#put_copy_data .

`encoder` can be:
*   a kind of PG::Coder
*   `nil` - disable type encoding, data must be a String.



# PGconn#error_message

(from gem pg-0.21.0)
### Implementation from Connection
---
    conn.error_message -> String

---

Returns the error message about connection.


# PGconn#escape

(from gem postgres-pr-0.7.0)
---
    escape(str)

---


# PGconn#escape_bytea

(from gem pg-0.21.0)
### Implementation from Connection
---
    conn.escape_bytea( string ) -> String

---

Escapes binary data for use within an SQL command with the type `bytea`.

Certain byte values must be escaped (but all byte values may be escaped) when
used as part of a `bytea` literal in an SQL statement. In general, to escape a
byte, it is converted into the three digit octal number equal to the octet
value, and preceded by two backslashes. The single quote (') and backslash ()
characters have special alternative escape sequences. #escape_bytea performs
this operation, escaping only the minimally required bytes.

Consider using exec_params, which avoids the need for passing values inside of
SQL commands.

NOTE: This class version of this method can only be used safely in client
programs that use a single PostgreSQL connection at a time (in this case it
can find out what it needs to know "behind the scenes"). It might give the
wrong results if used in programs that use multiple database connections; use
the same method on the connection object in such cases.


# PGconn#escape_identifier

(from gem pg-0.21.0)
### Implementation from Connection
---
    conn.escape_identifier( str ) -> String

---

Escape an arbitrary String `str` as an identifier.

This method does the same as #quote_ident with a String argument, but it
doesn't support an Array argument and it makes use of libpq to process the
string.


# PGconn#escape_literal

(from gem pg-0.21.0)
### Implementation from Connection
---
    conn.escape_literal( str ) -> String

---

Escape an arbitrary String `str` as a literal.


# PGconn#escape_string

(from gem pg-0.21.0)
### Implementation from Connection
---
    conn.escape_string( str ) -> String

---

Returns a SQL-safe version of the String *str*. This is the preferred way to
make strings safe for inclusion in SQL queries.

Consider using exec_params, which avoids the need for passing values inside of
SQL commands.

Encoding of escaped string will be equal to client encoding of connection.

NOTE: This class version of this method can only be used safely in client
programs that use a single PostgreSQL connection at a time (in this case it
can find out what it needs to know "behind the scenes"). It might give the
wrong results if used in programs that use multiple database connections; use
the same method on the connection object in such cases.


# PGconn#exec

(from gem postgres-pr-0.7.0)
---
    exec(sql)

---


# PGconn#exec_params

(from gem pg-0.21.0)
### Implementation from Connection
---
    conn.exec_params(sql, params[, result_format[, type_map]] ) -> PG::Result
    conn.exec_params(sql, params[, result_format[, type_map]] ) {|pg_result| block }

---

Sends SQL query request specified by `sql` to PostgreSQL using placeholders
for parameters.

Returns a PG::Result instance on success. On failure, it raises a PG::Error.

`params` is an array of the bind parameters for the SQL query. Each element of
the `params` array may be either:
    a hash of the form:
      {:value  => String (value of bind parameter)
       :type   => Integer (oid of type of bind parameter)
       :format => Integer (0 for text, 1 for binary)
      }
    or, it may be a String. If it is a string, that is equivalent to the hash:
      { :value => <string value>, :type => 0, :format => 0 }

PostgreSQL bind parameters are represented as $1, $1, $2, etc., inside the SQL
query. The 0th element of the `params` array is bound to $1, the 1st element
is bound to $2, etc. `nil` is treated as `NULL`.

If the types are not specified, they will be inferred by PostgreSQL. Instead
of specifying type oids, it's recommended to simply add explicit casts in the
query to ensure that the right type is used.

For example: "SELECT $1::int"

The optional `result_format` should be 0 for text results, 1 for binary.

type_map can be a PG::TypeMap derivation (such as PG::BasicTypeMapForQueries).
This will type cast the params form various Ruby types before transmission
based on the encoders defined by the type map. When a type encoder is used the
format and oid of a given bind parameter are retrieved from the encoder
instead out of the hash form described above.

If the optional code block is given, it will be passed *result* as an
argument, and the PG::Result object will  automatically be cleared when the
block terminates. In this instance, `conn.exec` returns the value of the
block.


# PGconn#exec_prepared

(from gem pg-0.21.0)
### Implementation from Connection
---
    conn.exec_prepared(statement_name [, params, result_format[, type_map]] ) -> PG::Result
    conn.exec_prepared(statement_name [, params, result_format[, type_map]] ) {|pg_result| block }

---

Execute prepared named statement specified by *statement_name*. Returns a
PG::Result instance on success. On failure, it raises a PG::Error.

`params` is an array of the optional bind parameters for the SQL query. Each
element of the `params` array may be either:
    a hash of the form:
      {:value  => String (value of bind parameter)
       :format => Integer (0 for text, 1 for binary)
      }
    or, it may be a String. If it is a string, that is equivalent to the hash:
      { :value => <string value>, :format => 0 }

PostgreSQL bind parameters are represented as $1, $1, $2, etc., inside the SQL
query. The 0th element of the `params` array is bound to $1, the 1st element
is bound to $2, etc. `nil` is treated as `NULL`.

The optional `result_format` should be 0 for text results, 1 for binary.

type_map can be a PG::TypeMap derivation (such as PG::BasicTypeMapForQueries).
This will type cast the params form various Ruby types before transmission
based on the encoders defined by the type map. When a type encoder is used the
format and oid of a given bind parameter are retrieved from the encoder
instead out of the hash form described above.

If the optional code block is given, it will be passed *result* as an
argument, and the PG::Result object will  automatically be cleared when the
block terminates. In this instance, `conn.exec_prepared` returns the value of
the block.


# PGconn#external_encoding

(from gem pg-0.21.0)
### Implementation from Connection
---
    conn.external_encoding() -> Encoding

---

Return the `server_encoding` of the connected database as a Ruby Encoding
object. The `SQL_ASCII` encoding is mapped to to `ASCII_8BIT`.


# PGconn#finish

(from gem pg-0.21.0)
### Implementation from Connection
---
    conn.finish

---

Closes the backend connection.


# PGconn#finished?

(from gem pg-0.21.0)
### Implementation from Connection
---
    conn.finished?      -> boolean

---

Returns `true` if the backend connection has been closed.


# PGconn#flush

(from gem pg-0.21.0)
### Implementation from Connection
---
    conn.flush() -> Boolean

---

Attempts to flush any queued output data to the server. Returns `true` if data
is successfully flushed, `false` if not (can only return `false` if connection
is nonblocking. Raises PG::Error if some other failure occurred.


# PGconn#get_client_encoding

(from gem pg-0.21.0)
### Implementation from Connection
---
    conn.get_client_encoding() -> String

---

Returns the client encoding as a String.


# PGconn#get_copy_data

(from gem pg-0.21.0)
### Implementation from Connection
---
    conn.get_copy_data( [ async = false [, decoder = nil ]] ) -> String

---

Return a string containing one row of data, `nil` if the copy is done, or
`false` if the call would block (only possible if *async* is true).

decoder can be a PG::Coder derivation (typically PG::TextDecoder::CopyRow).
This decodes the received data fields as Array of Strings. Optionally the
decoder can type cast the fields to various Ruby types in one step, if
PG::TextDecoder::CopyRow#type_map is set accordingly.

See also #copy_data.


# PGconn#get_last_result

(from gem pg-0.21.0)
### Implementation from Connection
---
    conn.get_last_result( ) -> PG::Result

---

This function retrieves all available results on the current connection (from
previously issued asynchronous commands like +send_query()+) and returns the
last non-NULL result, or `nil` if no results are available.

This function is similar to #get_result except that it is designed to get one
and only one result.


# PGconn#get_result

(from gem pg-0.21.0)
### Implementation from Connection
---
    conn.get_result() -> PG::Result
    conn.get_result() {|pg_result| block }

---

Blocks waiting for the next result from a call to #send_query (or another
asynchronous command), and returns it. Returns `nil` if no more results are
available.

Note: call this function repeatedly until it returns `nil`, or else you will
not be able to issue further commands.

If the optional code block is given, it will be passed *result* as an
argument, and the PG::Result object will  automatically be cleared when the
block terminates. In this instance, `conn.exec` returns the value of the
block.


# PGconn#host

(from gem postgres-pr-0.7.0)
---


# PGconn#internal_encoding

(from gem pg-0.21.0)
### Implementation from Connection
---
    conn.internal_encoding -> Encoding

---

defined in Ruby 1.9 or later.

Returns:
*   an Encoding - client_encoding of the connection as a Ruby Encoding object.
*   nil - the client_encoding is 'SQL_ASCII'



# PGconn#internal_encoding=

(from gem pg-0.21.0)
### Implementation from Connection
---
    conn.internal_encoding = value

---

A wrapper of #set_client_encoding. defined in Ruby 1.9 or later.

`value` can be one of:
*   an Encoding
*   a String - a name of Encoding
*   `nil` - sets the client_encoding to SQL_ASCII.



# PGconn#is_busy

(from gem pg-0.21.0)
### Implementation from Connection
---
    conn.is_busy() -> Boolean

---

Returns `true` if a command is busy, that is, if PQgetResult would block.
Otherwise returns `false`.


# PGconn#isnonblocking

(from gem pg-0.21.0)
### Implementation from Connection
---
    conn.isnonblocking() -> Boolean

---

Returns `true` if a command is busy, that is, if PQgetResult would block.
Otherwise returns `false`.


# PGconn#lo_close

(from gem pg-0.21.0)
### Implementation from Connection
---
    conn.lo_close( lo_desc ) -> nil

---

Closes the postgres large object of *lo_desc*.


# PGconn#lo_creat

(from gem pg-0.21.0)
### Implementation from Connection
---
    conn.lo_creat( [mode] ) -> Integer

---

Creates a large object with mode *mode*. Returns a large object Oid. On
failure, it raises PG::Error.


# PGconn#lo_create

(from gem pg-0.21.0)
### Implementation from Connection
---
    conn.lo_create( oid ) -> Integer

---

Creates a large object with oid *oid*. Returns the large object Oid. On
failure, it raises PG::Error.


# PGconn#lo_export

(from gem pg-0.21.0)
### Implementation from Connection
---
    conn.lo_export( oid, file ) -> nil

---

Saves a large object of *oid* to a *file*.


# PGconn#lo_import

(from gem pg-0.21.0)
### Implementation from Connection
---
    conn.lo_import(file) -> Integer

---

Import a file to a large object. Returns a large object Oid.

On failure, it raises a PG::Error.


# PGconn#lo_lseek

(from gem pg-0.21.0)
### Implementation from Connection
---
    conn.lo_lseek( lo_desc, offset, whence ) -> Integer

---

Move the large object pointer *lo_desc* to offset *offset*. Valid values for
*whence* are `SEEK_SET`, `SEEK_CUR`, and `SEEK_END`. (Or 0, 1, or 2.)


# PGconn#lo_open

(from gem pg-0.21.0)
### Implementation from Connection
---
    conn.lo_open( oid, [mode] ) -> Integer

---

Open a large object of *oid*. Returns a large object descriptor instance on
success. The *mode* argument specifies the mode for the opened large
object,which is either `INV_READ`, or `INV_WRITE`.

If *mode* is omitted, the default is `INV_READ`.


# PGconn#lo_read

(from gem pg-0.21.0)
### Implementation from Connection
---
    conn.lo_read( lo_desc, len ) -> String

---

Attempts to read *len* bytes from large object *lo_desc*, returns resulting
data.


# PGconn#lo_seek

(from gem pg-0.21.0)
### Implementation from Connection
---
    lo_seek(p1, p2, p3)

---


# PGconn#lo_tell

(from gem pg-0.21.0)
### Implementation from Connection
---
    conn.lo_tell( lo_desc ) -> Integer

---

Returns the current position of the large object *lo_desc*.


# PGconn#lo_truncate

(from gem pg-0.21.0)
### Implementation from Connection
---
    conn.lo_truncate( lo_desc, len ) -> nil

---

Truncates the large object *lo_desc* to size *len*.


# PGconn#lo_unlink

(from gem pg-0.21.0)
### Implementation from Connection
---
    conn.lo_unlink( oid ) -> nil

---

Unlinks (deletes) the postgres large object of *oid*.


# PGconn#lo_write

(from gem pg-0.21.0)
### Implementation from Connection
---
    conn.lo_write( lo_desc, buffer ) -> Integer

---

Writes the string *buffer* to the large object *lo_desc*. Returns the number
of bytes written.


# PGconn#loclose

(from gem pg-0.21.0)
### Implementation from Connection
---
    loclose(p1)

---


# PGconn#locreat

(from gem pg-0.21.0)
### Implementation from Connection
---
    locreat(p1 = v1)

---


# PGconn#locreate

(from gem pg-0.21.0)
### Implementation from Connection
---
    locreate(p1)

---


# PGconn#loexport

(from gem pg-0.21.0)
### Implementation from Connection
---
    loexport(p1, p2)

---


# PGconn#loimport

(from gem pg-0.21.0)
### Implementation from Connection
---
    loimport(p1)

---


# PGconn#lolseek

(from gem pg-0.21.0)
### Implementation from Connection
---
    lolseek(p1, p2, p3)

---


# PGconn#loopen

(from gem pg-0.21.0)
### Implementation from Connection
---
    loopen(p1, p2 = v2)

---


# PGconn#loread

(from gem pg-0.21.0)
### Implementation from Connection
---
    loread(p1, p2)

---


# PGconn#loseek

(from gem pg-0.21.0)
### Implementation from Connection
---
    loseek(p1, p2, p3)

---


# PGconn#lotell

(from gem pg-0.21.0)
### Implementation from Connection
---
    lotell(p1)

---


# PGconn#lotruncate

(from gem pg-0.21.0)
### Implementation from Connection
---
    lotruncate(p1, p2)

---


# PGconn#lounlink

(from gem pg-0.21.0)
### Implementation from Connection
---
    lounlink(p1)

---


# PGconn#lowrite

(from gem pg-0.21.0)
### Implementation from Connection
---
    lowrite(p1, p2)

---


# PGconn#make_empty_pgresult

(from gem pg-0.21.0)
### Implementation from Connection
---
    conn.make_empty_pgresult( status ) -> PG::Result

---

Constructs and empty PG::Result with status *status*. *status* may be one of:
*   `PGRES_EMPTY_QUERY`
*   `PGRES_COMMAND_OK`
*   `PGRES_TUPLES_OK`
*   `PGRES_COPY_OUT`
*   `PGRES_COPY_IN`
*   `PGRES_BAD_RESPONSE`
*   `PGRES_NONFATAL_ERROR`
*   `PGRES_FATAL_ERROR`
*   `PGRES_COPY_BOTH`



# PGconn#nonblocking?

(from gem pg-0.21.0)
### Implementation from Connection
---
    nonblocking?()

---


# PGconn#notifies

(from gem pg-0.21.0)
### Implementation from Connection
---
    conn.notifies()

---

Returns a hash of the unprocessed notifications. If there is no unprocessed
notifier, it returns `nil`.


# PGconn#notifies_wait

(from gem pg-0.21.0)
### Implementation from Connection
---
    notifies_wait(p1 = v1)

---


# PGconn#options

(from gem pg-0.21.0)
### Implementation from Connection
---
    conn.options()

---

Returns backend option string.


# PGconn#parameter_status

(from gem pg-0.21.0)
### Implementation from Connection
---
    conn.parameter_status( param_name ) -> String

---

Returns the setting of parameter *param_name*, where *param_name* is one of
*   `server_version`
*   `server_encoding`
*   `client_encoding`
*   `is_superuser`
*   `session_authorization`
*   `DateStyle`
*   `TimeZone`
*   `integer_datetimes`
*   `standard_conforming_strings`


Returns nil if the value of the parameter is not known.


# PGconn#pass

(from gem pg-0.21.0)
### Implementation from Connection
---
    conn.pass()

---

Returns the authenticated user name.


# PGconn#port

(from gem pg-0.21.0)
### Implementation from Connection
---
    conn.port()

---

Returns the connected server port number.


# PGconn#prepare

(from gem pg-0.21.0)
### Implementation from Connection
---
    conn.prepare(stmt_name, sql [, param_types ] ) -> PG::Result

---

Prepares statement *sql* with name *name* to be executed later. Returns a
PG::Result instance on success. On failure, it raises a PG::Error.

`param_types` is an optional parameter to specify the Oids of the types of the
parameters.

If the types are not specified, they will be inferred by PostgreSQL. Instead
of specifying type oids, it's recommended to simply add explicit casts in the
query to ensure that the right type is used.

For example: "SELECT $1::int"

PostgreSQL bind parameters are represented as $1, $1, $2, etc., inside the SQL
query.


# PGconn#protocol_version

(from gem pg-0.21.0)
### Implementation from Connection
---
    conn.protocol_version -> Integer

---

The 3.0 protocol will normally be used when communicating with PostgreSQL 7.4
or later servers; pre-7.4 servers support only protocol 2.0. (Protocol 1.0 is
obsolete and not supported by libpq.)


# PGconn#put_copy_data

(from gem pg-0.21.0)
### Implementation from Connection
---
    conn.put_copy_data( buffer [, encoder] ) -> Boolean

---

Transmits *buffer* as copy data to the server. Returns true if the data was
sent, false if it was not sent (false is only possible if the connection is in
nonblocking mode, and this command would block).

encoder can be a PG::Coder derivation (typically PG::TextEncoder::CopyRow).
This encodes the received data fields from an Array of Strings. Optionally the
encoder can type cast the fields form various Ruby types in one step, if
PG::TextEncoder::CopyRow#type_map is set accordingly.

Raises an exception if an error occurs.

See also #copy_data.


# PGconn#put_copy_end

(from gem pg-0.21.0)
### Implementation from Connection
---
    conn.put_copy_end( [ error_message ] ) -> Boolean

---

Sends end-of-data indication to the server.

*error_message* is an optional parameter, and if set, forces the COPY command
to fail with the string *error_message*.

Returns true if the end-of-data was sent, false if it was not sent (false is
only possible if the connection is in nonblocking mode, and this command would
block).


# PGconn#query

(from gem postgres-pr-0.7.0)
---
    query(sql)

---


# PGconn#quote_ident

(from gem pg-0.21.0)
### Implementation from Connection
---
    conn.quote_ident( str ) -> String
    conn.quote_ident( array ) -> String
    PG::Connection.quote_ident( str ) -> String
    PG::Connection.quote_ident( array ) -> String

---

Returns a string that is safe for inclusion in a SQL query as an identifier.
Note: this is not a quote function for values, but for identifiers.

For example, in a typical SQL query: `SELECT FOO FROM MYTABLE` The identifier
`FOO` is folded to lower case, so it actually means `foo`. If you really want
to access the case-sensitive field name `FOO`, use this function like
`conn.quote_ident('FOO')`, which will return `"FOO"` (with double-quotes).
PostgreSQL will see the double-quotes, and it will not fold to lower case.

Similarly, this function also protects against special characters, and other
things that might allow SQL injection if the identifier comes from an
untrusted source.

If the parameter is an Array, then all it's values are separately quoted and
then joined by a "." character. This can be used for identifiers in the form
"schema"."table"."column" .

This method is functional identical to the encoder PG::TextEncoder::Identifier
.

If the instance method form is used and the input string character encoding is
different to the connection encoding, then the string is converted to this
encoding, so that the returned string is always encoded as
PG::Connection#internal_encoding .

In the singleton form (PG::Connection.quote_ident) the character encoding of
the result string is set to the character encoding of the input string.


# PGconn#reset

(from gem pg-0.21.0)
### Implementation from Connection
---
    conn.reset()

---

Resets the backend connection. This method closes the backend connection and
tries to re-connect.


# PGconn#reset_poll

(from gem pg-0.21.0)
### Implementation from Connection
---
    conn.reset_poll -> Integer

---

Checks the status of a connection reset operation. See #connect_start and
#connect_poll for usage information and return values.


# PGconn#reset_start

(from gem pg-0.21.0)
### Implementation from Connection
---
    conn.reset_start() -> nil

---

Initiate a connection reset in a nonblocking manner. This will close the
current connection and attempt to reconnect using the same connection
parameters. Use #reset_poll to check the status of the connection reset.


# PGconn#send_describe_portal

(from gem pg-0.21.0)
### Implementation from Connection
---
    conn.send_describe_portal( portal_name ) -> nil

---

Asynchronously send *command* to the server. Does not block. Use in
combination with `conn.get_result`.


# PGconn#send_describe_prepared

(from gem pg-0.21.0)
### Implementation from Connection
---
    conn.send_describe_prepared( statement_name ) -> nil

---

Asynchronously send *command* to the server. Does not block. Use in
combination with `conn.get_result`.


# PGconn#send_prepare

(from gem pg-0.21.0)
### Implementation from Connection
---
    conn.send_prepare( stmt_name, sql [, param_types ] ) -> nil

---

Prepares statement *sql* with name *name* to be executed later. Sends prepare
command asynchronously, and returns immediately. On failure, it raises a
PG::Error.

`param_types` is an optional parameter to specify the Oids of the types of the
parameters.

If the types are not specified, they will be inferred by PostgreSQL. Instead
of specifying type oids, it's recommended to simply add explicit casts in the
query to ensure that the right type is used.

For example: "SELECT $1::int"

PostgreSQL bind parameters are represented as $1, $1, $2, etc., inside the SQL
query.


# PGconn#send_query

(from gem pg-0.21.0)
### Implementation from Connection
---
    conn.send_query(sql [, params, result_format[, type_map ]] ) -> nil

---

Sends SQL query request specified by *sql* to PostgreSQL for asynchronous
processing, and immediately returns. On failure, it raises a PG::Error.

`params` is an optional array of the bind parameters for the SQL query. Each
element of the `params` array may be either:
    a hash of the form:
      {:value  => String (value of bind parameter)
       :type   => Integer (oid of type of bind parameter)
       :format => Integer (0 for text, 1 for binary)
      }
    or, it may be a String. If it is a string, that is equivalent to the hash:
      { :value => <string value>, :type => 0, :format => 0 }

PostgreSQL bind parameters are represented as $1, $1, $2, etc., inside the SQL
query. The 0th element of the `params` array is bound to $1, the 1st element
is bound to $2, etc. `nil` is treated as `NULL`.

If the types are not specified, they will be inferred by PostgreSQL. Instead
of specifying type oids, it's recommended to simply add explicit casts in the
query to ensure that the right type is used.

For example: "SELECT $1::int"

The optional `result_format` should be 0 for text results, 1 for binary.

type_map can be a PG::TypeMap derivation (such as PG::BasicTypeMapForQueries).
This will type cast the params form various Ruby types before transmission
based on the encoders defined by the type map. When a type encoder is used the
format and oid of a given bind parameter are retrieved from the encoder
instead out of the hash form described above.


# PGconn#send_query_prepared

(from gem pg-0.21.0)
### Implementation from Connection
---
    conn.send_query_prepared( statement_name [, params, result_format[, type_map ]] )
    -> nil

---

Execute prepared named statement specified by *statement_name* asynchronously,
and returns immediately. On failure, it raises a PG::Error.

`params` is an array of the optional bind parameters for the SQL query. Each
element of the `params` array may be either:
    a hash of the form:
      {:value  => String (value of bind parameter)
       :format => Integer (0 for text, 1 for binary)
      }
    or, it may be a String. If it is a string, that is equivalent to the hash:
      { :value => <string value>, :format => 0 }

PostgreSQL bind parameters are represented as $1, $1, $2, etc., inside the SQL
query. The 0th element of the `params` array is bound to $1, the 1st element
is bound to $2, etc. `nil` is treated as `NULL`.

The optional `result_format` should be 0 for text results, 1 for binary.

type_map can be a PG::TypeMap derivation (such as PG::BasicTypeMapForQueries).
This will type cast the params form various Ruby types before transmission
based on the encoders defined by the type map. When a type encoder is used the
format and oid of a given bind parameter are retrieved from the encoder
instead out of the hash form described above.


# PGconn#server_version

(from gem pg-0.21.0)
### Implementation from Connection
---
    conn.server_version -> Integer

---

The number is formed by converting the major, minor, and revision numbers into
two-decimal-digit numbers and appending them together. For example, version
7.4.2 will be returned as 70402, and version 8.1 will be returned as 80100
(leading zeroes are not shown). Zero is returned if the connection is bad.


# PGconn#set_client_encoding

(from gem pg-0.21.0)
### Implementation from Connection
---
    conn.set_client_encoding( encoding )

---

Sets the client encoding to the *encoding* String.


# PGconn#set_default_encoding

(from gem pg-0.21.0)
### Implementation from Connection
---
    conn.set_default_encoding() -> Encoding

---

If Ruby has its Encoding.default_internal set, set PostgreSQL's
client_encoding to match. Returns the new Encoding, or `nil` if the default
internal encoding wasn't set.


# PGconn#set_error_verbosity

(from gem pg-0.21.0)
### Implementation from Connection
---
    conn.set_error_verbosity( verbosity ) -> Integer

---

Sets connection's verbosity to *verbosity* and returns the previous setting.
Available settings are:
*   PQERRORS_TERSE
*   PQERRORS_DEFAULT
*   PQERRORS_VERBOSE



# PGconn#set_notice_processor

(from gem pg-0.21.0)
### Implementation from Connection
---
    conn.set_notice_processor {|message| ... } -> Proc

---

See #set_notice_receiver for the desription of what this and the
notice_processor methods do.

This function takes a new block to act as the notice processor and returns the
Proc object previously set, or `nil` if it was previously the default. The
block should accept a single String object.

If you pass no arguments, it will reset the handler to the default.


# PGconn#set_notice_receiver

(from gem pg-0.21.0)
### Implementation from Connection
---
    conn.set_notice_receiver {|result| ... } -> Proc

---

Notice and warning messages generated by the server are not returned by the
query execution functions, since they do not imply failure of the query.
Instead they are passed to a notice handling function, and execution continues
normally after the handler returns. The default notice handling function
prints the message on `stderr`, but the application can override this behavior
by supplying its own handling function.

For historical reasons, there are two levels of notice handling, called the
notice receiver and notice processor. The default behavior is for the notice
receiver to format the notice and pass a string to the notice processor for
printing. However, an application that chooses to provide its own notice
receiver will typically ignore the notice processor layer and just do all the
work in the notice receiver.

This function takes a new block to act as the handler, which should accept a
single parameter that will be a PG::Result object, and returns the Proc object
previously set, or `nil` if it was previously the default.

If you pass no arguments, it will reset the handler to the default.

**Note:** The `result` passed to the block should not be used outside of the
block, since the corresponding C object could be freed after the block
finishes.


# PGconn#set_single_row_mode

(from gem pg-0.21.0)
### Implementation from Connection
---
    conn.set_single_row_mode -> self

---

To enter single-row mode, call this method immediately after a successful call
of send_query (or a sibling function). This mode selection is effective only
for the currently executing query. Then call Connection#get_result repeatedly,
until it returns nil.

Each (but the last) received Result has exactly one row and a
Result#result_status of PGRES_SINGLE_TUPLE. The last Result has zero rows and
is used to indicate a successful execution of the query. All of these Result
objects will contain the same row description data (column names, types, etc)
that an ordinary Result object for the query would have.

**Caution:** While processing a query, the server may return some rows and
then encounter an error, causing the query to be aborted. Ordinarily, pg
discards any such rows and reports only the error. But in single-row mode,
those rows will have already been returned to the application. Hence, the
application will see some Result objects followed by an Error raised in
get_result. For proper transactional behavior, the application must be
designed to discard or undo whatever has been done with the
previously-processed rows, if the query ultimately fails.

Example:
    conn.send_query( "your SQL command" )
    conn.set_single_row_mode
    loop do
      res = conn.get_result or break
      res.check
      res.each do |row|
        # do something with the received row
      end
    end


# PGconn#setnonblocking

(from gem pg-0.21.0)
### Implementation from Connection
---
    conn.setnonblocking(Boolean) -> nil

---

Sets the nonblocking status of the connection. In the blocking state, calls to
#send_query will block until the message is sent to the server, but will not
wait for the query results. In the nonblocking state, calls to #send_query
will return an error if the socket is not ready for writing. Note: This
function does not affect #exec, because that function doesn't return until the
server has processed the query and returned the results. Returns `nil`.


# PGconn#socket

(from gem pg-0.21.0)
### Implementation from Connection
---
    conn.socket() -> Integer

---

Returns the socket's file descriptor for this connection. `IO.for_fd()` can be
used to build a proper IO object to the socket. If you do so, you will likely
also want to set `autoclose=false` on it to prevent Ruby from closing the
socket to PostgreSQL if it goes out of scope. Alternatively, you can use
#socket_io, which creates an IO that's associated with the connection object
itself, and so won't go out of scope until the connection does.

**Note:** On Windows the file descriptor is not really usable, since it can
not be used to build a Ruby IO object.


# PGconn#socket_io

(from gem pg-0.21.0)
### Implementation from Connection
---
    conn.socket_io() -> IO

---

Fetch a memoized IO object created from the Connection's underlying socket.
This object can be used for IO.select to wait for events while running
asynchronous API calls.

Using this instead of #socket avoids the problem of the underlying connection
being closed by Ruby when an IO created using `IO.for_fd(conn.socket)` goes
out of scope.

This method can also be used on Windows but requires Ruby-2.0+.


# PGconn#ssl_attribute

(from gem pg-0.21.0)
### Implementation from Connection
---
    conn.ssl_attribute(attribute_name) -> String

---

Returns SSL-related information about the connection.

The list of available attributes varies depending on the SSL library being
used, and the type of connection. If an attribute is not available, returns
nil.

The following attributes are commonly available:

`library`
:   Name of the SSL implementation in use. (Currently, only "OpenSSL" is
    implemented)
`protocol`
:   SSL/TLS version in use. Common values are "SSLv2", "SSLv3", "TLSv1",
    "TLSv1.1" and "TLSv1.2", but an implementation may return other strings if
    some other protocol is used.
`key_bits`
:   Number of key bits used by the encryption algorithm.
`cipher`
:   A short name of the ciphersuite used, e.g. "DHE-RSA-DES-CBC3-SHA". The
    names are specific to each SSL implementation.
`compression`
:   If SSL compression is in use, returns the name of the compression
    algorithm, or "on" if compression is used but the algorithm is not known.
    If compression is not in use, returns "off".


See also #ssl_attribute_names and
http://www.postgresql.org/docs/current/interactive/libpq-status.html#LIBPQ-PQS
SLATTRIBUTE


# PGconn#ssl_attribute_names

(from gem pg-0.21.0)
### Implementation from Connection
---
    conn.ssl_attribute_names -> Array<String>

---

Return an array of SSL attribute names available.

See also #ssl_attribute


# PGconn#ssl_attributes

(from gem pg-0.21.0)
### Implementation from Connection
---
    conn.ssl_attributes -> Hash<String,String>

---

Returns SSL-related information about the connection as key/value pairs

The available attributes varies depending on the SSL library being used, and
the type of connection.

See also #ssl_attribute


# PGconn#ssl_in_use?

(from gem pg-0.21.0)
### Implementation from Connection
---
    conn.ssl_in_use? -> Boolean

---

Returns `true` if the connection uses SSL, `false` if not.


# PGconn#status

(from gem pg-0.21.0)
### Implementation from Connection
---
    conn.status()

---

Returns status of connection : CONNECTION_OK or CONNECTION_BAD


# PGconn#trace

(from gem pg-0.21.0)
### Implementation from Connection
---
    conn.trace( stream ) -> nil

---

Enables tracing message passing between backend. The trace message will be
written to the stream *stream*, which must implement a method `fileno` that
returns a writable file descriptor.


# PGconn#transaction

(from gem pg-0.21.0)
### Implementation from Connection
---
    conn.transaction { |conn| ... } -> result of the block

---

Executes a `BEGIN` at the start of the block, and a `COMMIT` at the end of the
block, or `ROLLBACK` if any exception occurs.


# PGconn#transaction_status

(from gem postgres-pr-0.7.0)
---
    transaction_status()

---


# PGconn#tty

(from gem pg-0.21.0)
### Implementation from Connection
---
    conn.tty()

---

Returns the connected pgtty. (Obsolete)


# PGconn#type_map_for_queries

(from gem pg-0.21.0)
### Implementation from Connection
---
    res.type_map_for_queries -> TypeMap

---

Returns the default TypeMap that is currently set for type casts of query bind
parameters.


# PGconn#type_map_for_queries=

(from gem pg-0.21.0)
### Implementation from Connection
---
    res.type_map_for_queries = typemap

---

Set the default TypeMap that is used for type casts of query bind parameters.

`typemap` must be a kind of PG::TypeMap .


# PGconn#type_map_for_results

(from gem pg-0.21.0)
### Implementation from Connection
---
    res.type_map_for_results -> TypeMap

---

Returns the default TypeMap that is currently set for type casts of result
values.


# PGconn#type_map_for_results=

(from gem pg-0.21.0)
### Implementation from Connection
---
    res.type_map_for_results = typemap

---

Set the default TypeMap that is used for type casts of result values.

`typemap` must be a kind of PG::TypeMap .


# PGconn#unescape_bytea

(from gem pg-0.21.0)
### Implementation from Connection
---
    PG::Connection.unescape_bytea( string )

---

Converts an escaped string representation of binary data into binary data ---
the reverse of #escape_bytea. This is needed when retrieving `bytea` data in
text format, but not when retrieving it in binary format.


# PGconn#untrace

(from gem pg-0.21.0)
### Implementation from Connection
---
    conn.untrace() -> nil

---

Disables the message tracing.


# PGconn#user

(from gem postgres-pr-0.7.0)
---


# PGconn#wait_for_notify

(from gem pg-0.21.0)
### Implementation from Connection
---
    conn.wait_for_notify( [ timeout ] ) -> String
    conn.wait_for_notify( [ timeout ] ) { |event, pid| block }
    conn.wait_for_notify( [ timeout ] ) { |event, pid, payload| block } # PostgreSQL 9.0

---

Blocks while waiting for notification(s), or until the optional *timeout* is
reached, whichever comes first.  *timeout* is measured in seconds and can be
fractional.

Returns `nil` if *timeout* is reached, the name of the NOTIFY event otherwise.
 If used in block form, passes the name of the NOTIFY `event` and the
generating `pid` into the block.

Under PostgreSQL 9.0 and later, if the notification is sent with the optional
`payload` string, it will be given to the block as the third argument.


(from gem postgres-pr-0.7.0)
---

---
# Constants:

PQTRANS_IDLE
:   [not documented]
PQTRANS_INERROR
:   [not documented]
PQTRANS_INTRANS
:   [not documented]
PQTRANS_UNKNOWN
:   [not documented]


# Class methods:

    connect
    escape
    new
    quote_ident

# Instance methods:

    close
    db
    escape
    exec
    host
    notice_processor
    notice_processor=
    query
    transaction_status
    user

# Attributes:

    attr_reader db
    attr_reader host
    attr_reader user

# PGconn::connect

(from gem postgres-pr-0.7.0)
---
    connect(host, port, options, tty, database, user, auth)

---


# PGconn::escape

(from gem postgres-pr-0.7.0)
---
    escape(str)

---


# PGconn::new

(from gem postgres-pr-0.7.0)
---
    new(host, port, options, tty, database, user, auth)

---


# PGconn::quote_ident

(from gem postgres-pr-0.7.0)
---
    quote_ident(name)

---


# PGconn#close

(from gem postgres-pr-0.7.0)
---
    close()

---


# PGconn#escape

(from gem postgres-pr-0.7.0)
---
    escape(str)

---


# PGconn#exec

(from gem postgres-pr-0.7.0)
---
    exec(sql)

---


# PGconn#notice_processor

(from gem postgres-pr-0.7.0)
---
    notice_processor()

---


# PGconn#notice_processor=

(from gem postgres-pr-0.7.0)
---
    notice_processor=(np)

---


# PGconn#query

(from gem postgres-pr-0.7.0)
---
    query(sql)

---


# PGconn#transaction_status

(from gem postgres-pr-0.7.0)
---
    transaction_status()

---


