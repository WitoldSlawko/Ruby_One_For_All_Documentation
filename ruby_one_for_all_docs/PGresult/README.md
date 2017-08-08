# PGresult < Object

---
# Includes:
(from gem postgres-pr-0.7.0)
    Enumerable
    Enumerable

(from gem postgres-pr-0.7.0)
---

---
# Constants:

BAD_RESPONSE
:   [not documented]
COMMAND_OK
:   [not documented]
COPY_IN
:   [not documented]
COPY_OUT
:   [not documented]
EMPTY_QUERY
:   [not documented]
FATAL_ERROR
:   [not documented]
NONFATAL_ERROR
:   [not documented]
TUPLES_OK
:   [not documented]


# Class methods:

    new

# Instance methods:

    []
    clear
    cmd_tuples
    cmdstatus
    cmdtuples
    each
    fieldname
    fieldnum
    fields
    ftype
    getvalue
    nfields
    ntuples
    num_fields
    num_tuples
    result
    size
    status
    type

# Attributes:

    attr_reader fields
    attr_reader result

# PGresult::new

(from gem postgres-pr-0.7.0)
---
    new(res)

---


# PGresult#[]

(from gem postgres-pr-0.7.0)
---
    [](index)

---


# PGresult#clear

(from gem postgres-pr-0.7.0)
---
    clear()

---

free the result set


# PGresult#cmd_tuples

(from gem postgres-pr-0.7.0)
---
    cmd_tuples()

---


# PGresult#cmdstatus

(from gem postgres-pr-0.7.0)
---
    cmdstatus()

---


# PGresult#cmdtuples

(from gem postgres-pr-0.7.0)
---
    cmdtuples()

---

Returns the number of rows affected by the SQL command


# PGresult#each

(from gem postgres-pr-0.7.0)
---
    each(&block)

---


# PGresult#fieldname

(from gem postgres-pr-0.7.0)
---
    fieldname(index)

---


# PGresult#fieldnum

(from gem postgres-pr-0.7.0)
---
    fieldnum(name)

---


# PGresult#ftype

(from gem postgres-pr-0.7.0)
---
    ftype(index)

---


# PGresult#getvalue

(from gem postgres-pr-0.7.0)
---
    getvalue(tup_num, field_num)

---


# PGresult#nfields

(from gem postgres-pr-0.7.0)
---
    nfields()

---


# PGresult#ntuples

(from gem postgres-pr-0.7.0)
---
    ntuples()

---


# PGresult#num_fields

(from gem postgres-pr-0.7.0)
---
    num_fields()

---


# PGresult#num_tuples

(from gem postgres-pr-0.7.0)
---
    num_tuples()

---


# PGresult#size

(from gem postgres-pr-0.7.0)
---
    size(index)

---


# PGresult#status

(from gem postgres-pr-0.7.0)
---
    status()

---


# PGresult#type

(from gem postgres-pr-0.7.0)
---
    type(index)

---


