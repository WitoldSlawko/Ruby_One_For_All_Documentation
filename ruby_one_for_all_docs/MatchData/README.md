# MatchData < Object

(from ruby core)
---
`MatchData` is the type of the special variable `$~`, and is the type of the
object returned by `Regexp#match` and `Regexp.last_match`. It encapsulates all
the results of a pattern match, results normally accessed through the special
variables `$&`, `$'`, `$``, `$1`, `$2`, and so on.
---
# Instance methods:

    ==
    []
    begin
    captures
    end
    eql?
    hash
    inspect
    length
    named_captures
    names
    offset
    post_match
    pre_match
    regexp
    size
    string
    to_a
    to_s
    values_at

# MatchData#==

(from ruby core)
---
    mtch == mtch2   -> true or false

---

Equality---Two matchdata are equal if their target strings, patterns, and
matched positions are identical.


# MatchData#[]

(from ruby core)
---
    mtch[i]               -> str or nil
    mtch[start, length]   -> array
    mtch[range]           -> array
    mtch[name]            -> str or nil

---

Match Reference -- `MatchData` acts as an array, and may be accessed using the
normal array indexing techniques.  `mtch[0]` is equivalent to the special
variable `$&`, and returns the entire matched string.  `mtch[1]`, `mtch[2]`,
and so on return the values of the matched backreferences (portions of the
pattern between parentheses).

    m = /(.)(.)(\d+)(\d)/.match("THX1138.")
    m          #=> #<MatchData "HX1138" 1:"H" 2:"X" 3:"113" 4:"8">
    m[0]       #=> "HX1138"
    m[1, 2]    #=> ["H", "X"]
    m[1..3]    #=> ["H", "X", "113"]
    m[-3, 2]   #=> ["X", "113"]

    m = /(?<foo>a+)b/.match("ccaaab")
    m          #=> #<MatchData "aaab" foo:"aaa">
    m["foo"]   #=> "aaa"
    m[:foo]    #=> "aaa"


# MatchData#begin

(from ruby core)
---
    mtch.begin(n)   -> integer

---

Returns the offset of the start of the *n*th element of the match array in the
string. *n* can be a string or symbol to reference a named capture.

    m = /(.)(.)(\d+)(\d)/.match("THX1138.")
    m.begin(0)       #=> 1
    m.begin(2)       #=> 2

    m = /(?<foo>.)(.)(?<bar>.)/.match("hoge")
    p m.begin(:foo)  #=> 0
    p m.begin(:bar)  #=> 2


# MatchData#captures

(from ruby core)
---
    mtch.captures   -> array

---

Returns the array of captures; equivalent to `mtch.to_a[1..-1]`.

    f1,f2,f3,f4 = /(.)(.)(\d+)(\d)/.match("THX1138.").captures
    f1    #=> "H"
    f2    #=> "X"
    f3    #=> "113"
    f4    #=> "8"


# MatchData#end

(from ruby core)
---
    mtch.end(n)   -> integer

---

Returns the offset of the character immediately following the end of the *n*th
element of the match array in the string. *n* can be a string or symbol to
reference a named capture.

    m = /(.)(.)(\d+)(\d)/.match("THX1138.")
    m.end(0)         #=> 7
    m.end(2)         #=> 3

    m = /(?<foo>.)(.)(?<bar>.)/.match("hoge")
    p m.end(:foo)    #=> 1
    p m.end(:bar)    #=> 3


# MatchData#eql?

(from ruby core)
---
    mtch.eql?(mtch2)   -> true or false

---

Equality---Two matchdata are equal if their target strings, patterns, and
matched positions are identical.


# MatchData#hash

(from ruby core)
---
    mtch.hash   -> integer

---

Produce a hash based on the target string, regexp and matched positions of
this matchdata.

See also Object#hash.


# MatchData#inspect

(from ruby core)
---
    mtch.inspect   -> str

---

Returns a printable version of *mtch*.

    puts /.$/.match("foo").inspect
    #=> #<MatchData "o">

    puts /(.)(.)(.)/.match("foo").inspect
    #=> #<MatchData "foo" 1:"f" 2:"o" 3:"o">

    puts /(.)(.)?(.)/.match("fo").inspect
    #=> #<MatchData "fo" 1:"f" 2:nil 3:"o">

    puts /(?<foo>.)(?<bar>.)(?<baz>.)/.match("hoge").inspect
    #=> #<MatchData "hog" foo:"h" bar:"o" baz:"g">


# MatchData#length

(from ruby core)
---
    mtch.length   -> integer

---

Returns the number of elements in the match array.

    m = /(.)(.)(\d+)(\d)/.match("THX1138.")
    m.length   #=> 5
    m.size     #=> 5


# MatchData#named_captures

(from ruby core)
---
    mtch.named_captures -> hash

---

Returns a Hash using named capture.

A key of the hash is a name of the named captures. A value of the hash is a
string of last successful capture of corresponding group.

    m = /(?<a>.)(?<b>.)/.match("01")
    m.named_captures #=> {"a" => "0", "b" => "1"}

    m = /(?<a>.)(?<b>.)?/.match("0")
    m.named_captures #=> {"a" => "0", "b" => nil}

    m = /(?<a>.)(?<a>.)/.match("01")
    m.named_captures #=> {"a" => "1"}

    m = /(?<a>x)|(?<a>y)/.match("x")
    m.named_captures #=> {"a" => "x"}


# MatchData#names

(from ruby core)
---
    mtch.names   -> [name1, name2, ...]

---

Returns a list of names of captures as an array of strings. It is same as
mtch.regexp.names.

    /(?<foo>.)(?<bar>.)(?<baz>.)/.match("hoge").names
    #=> ["foo", "bar", "baz"]

    m = /(?<x>.)(?<y>.)?/.match("a") #=> #<MatchData "a" x:"a" y:nil>
    m.names                          #=> ["x", "y"]


# MatchData#offset

(from ruby core)
---
    mtch.offset(n)   -> array

---

Returns a two-element array containing the beginning and ending offsets of the
*n*th match. *n* can be a string or symbol to reference a named capture.

    m = /(.)(.)(\d+)(\d)/.match("THX1138.")
    m.offset(0)      #=> [1, 7]
    m.offset(4)      #=> [6, 7]

    m = /(?<foo>.)(.)(?<bar>.)/.match("hoge")
    p m.offset(:foo) #=> [0, 1]
    p m.offset(:bar) #=> [2, 3]


# MatchData#post_match

(from ruby core)
---
    mtch.post_match   -> str

---

Returns the portion of the original string after the current match. Equivalent
to the special variable `$'`.

    m = /(.)(.)(\d+)(\d)/.match("THX1138: The Movie")
    m.post_match   #=> ": The Movie"


# MatchData#pre_match

(from ruby core)
---
    mtch.pre_match   -> str

---

Returns the portion of the original string before the current match.
Equivalent to the special variable `$``.

    m = /(.)(.)(\d+)(\d)/.match("THX1138.")
    m.pre_match   #=> "T"


# MatchData#regexp

(from ruby core)
---
    mtch.regexp   -> regexp

---

Returns the regexp.

    m = /a.*b/.match("abc")
    m.regexp #=> /a.*b/


# MatchData#size

(from ruby core)
---
    mtch.size     -> integer

---

Returns the number of elements in the match array.

    m = /(.)(.)(\d+)(\d)/.match("THX1138.")
    m.length   #=> 5
    m.size     #=> 5


# MatchData#string

(from ruby core)
---
    mtch.string   -> str

---

Returns a frozen copy of the string passed in to `match`.

    m = /(.)(.)(\d+)(\d)/.match("THX1138.")
    m.string   #=> "THX1138."


# MatchData#to_a

(from ruby core)
---
    mtch.to_a   -> anArray

---

Returns the array of matches.

    m = /(.)(.)(\d+)(\d)/.match("THX1138.")
    m.to_a   #=> ["HX1138", "H", "X", "113", "8"]

Because `to_a` is called when expanding `*`*variable*, there's a useful
assignment shortcut for extracting matched fields. This is slightly slower
than accessing the fields directly (as an intermediate array is generated).

    all,f1,f2,f3 = * /(.)(.)(\d+)(\d)/.match("THX1138.")
    all   #=> "HX1138"
    f1    #=> "H"
    f2    #=> "X"
    f3    #=> "113"


# MatchData#to_s

(from ruby core)
---
    mtch.to_s   -> str

---

Returns the entire matched string.

    m = /(.)(.)(\d+)(\d)/.match("THX1138.")
    m.to_s   #=> "HX1138"


# MatchData#values_at

(from ruby core)
---
    mtch.values_at([index]*)   -> array

---

Uses each *index* to access the matching values, returning an array of the
corresponding matches.

    m = /(.)(.)(\d+)(\d)/.match("THX1138: The Movie")
    m.to_a               #=> ["HX1138", "H", "X", "113", "8"]
    m.values_at(0, 2, -2)   #=> ["HX1138", "X", "113"]

    m = /(?<a>\d+) *(?<op>[+\-*\/]) *(?<b>\d+)/.match("1 + 2")
    m.to_a               #=> ["1 + 2", "1", "+", "2"]
    m.values_at(:a, :b, :op) #=> ["1", "2", "+"]


