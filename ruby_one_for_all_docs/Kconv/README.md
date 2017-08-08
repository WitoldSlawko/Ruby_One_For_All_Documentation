# Kconv

(from ruby core)
---
Kanji Converter for Ruby.
---
# Constants:

ASCII
:   ASCII
AUTO
:   Auto-Detect
BINARY
:   BINARY
EUC
:   EUC-JP
JIS
:   ISO-2022-JP
NOCONV
:   NOCONV
SJIS
:   Shift_JIS
UNKNOWN
:   UNKNOWN
UTF16
:   UTF-16
UTF32
:   UTF-32
UTF8
:   UTF-8


# Class methods:

    guess
    iseuc
    isjis
    issjis
    isutf8
    kconv
    toeuc
    tojis
    tolocale
    tosjis
    toutf16
    toutf32
    toutf8

# Instance methods:

    guess
    iseuc
    isjis
    issjis
    isutf8
    kconv
    toeuc
    tojis
    tolocale
    tosjis
    toutf16
    toutf32
    toutf8

# Kconv::guess

(from ruby core)
---
    Kconv.guess(str)   => encoding

---

Guess input encoding by NKF.guess


# Kconv::iseuc

(from ruby core)
---
    Kconv.iseuc(str)   => true or false

---

Returns whether input encoding is EUC-JP or not.

**Note** don't expect this return value is MatchData.


# Kconv::isjis

(from ruby core)
---
    Kconv.isjis(str)   => true or false

---

Returns whether input encoding is ISO-2022-JP or not.


# Kconv::issjis

(from ruby core)
---
    Kconv.issjis(str)   => true or false

---

Returns whether input encoding is Shift_JIS or not.


# Kconv::isutf8

(from ruby core)
---
    Kconv.isutf8(str)   => true or false

---

Returns whether input encoding is UTF-8 or not.


# Kconv::kconv

(from ruby core)
---
    Kconv.kconv(str, to_enc, from_enc=nil)

---

Convert `str` to `to_enc`. `to_enc` and `from_enc` are given as constants of
Kconv or Encoding objects.


# Kconv::toeuc

(from ruby core)
---
    Kconv.toeuc(str)   => string

---

Convert `str` to EUC-JP


# Kconv::tojis

(from ruby core)
---
    Kconv.tojis(str)   => string

---

Convert `str` to ISO-2022-JP


# Kconv::tolocale

(from ruby core)
---
    Kconv.tolocale   => string

---

Convert `self` to locale encoding


# Kconv::tosjis

(from ruby core)
---
    Kconv.tosjis(str)   => string

---

Convert `str` to Shift_JIS


# Kconv::toutf16

(from ruby core)
---
    Kconv.toutf16(str)   => string

---

Convert `str` to UTF-16


# Kconv::toutf32

(from ruby core)
---
    Kconv.toutf32(str)   => string

---

Convert `str` to UTF-32


# Kconv::toutf8

(from ruby core)
---
    Kconv.toutf8(str)   => string

---

Convert `str` to UTF-8


# Kconv#guess

(from ruby core)
---
    Kconv.guess(str)   => encoding

---

Guess input encoding by NKF.guess


# Kconv#iseuc

(from ruby core)
---
    Kconv.iseuc(str)   => true or false

---

Returns whether input encoding is EUC-JP or not.

**Note** don't expect this return value is MatchData.


# Kconv#isjis

(from ruby core)
---
    Kconv.isjis(str)   => true or false

---

Returns whether input encoding is ISO-2022-JP or not.


# Kconv#issjis

(from ruby core)
---
    Kconv.issjis(str)   => true or false

---

Returns whether input encoding is Shift_JIS or not.


# Kconv#isutf8

(from ruby core)
---
    Kconv.isutf8(str)   => true or false

---

Returns whether input encoding is UTF-8 or not.


# Kconv#kconv

(from ruby core)
---
    Kconv.kconv(str, to_enc, from_enc=nil)

---

Convert `str` to `to_enc`. `to_enc` and `from_enc` are given as constants of
Kconv or Encoding objects.


# Kconv#toeuc

(from ruby core)
---
    Kconv.toeuc(str)   => string

---

Convert `str` to EUC-JP


# Kconv#tojis

(from ruby core)
---
    Kconv.tojis(str)   => string

---

Convert `str` to ISO-2022-JP


# Kconv#tolocale

(from ruby core)
---
    Kconv.tolocale   => string

---

Convert `self` to locale encoding


# Kconv#tosjis

(from ruby core)
---
    Kconv.tosjis(str)   => string

---

Convert `str` to Shift_JIS


# Kconv#toutf16

(from ruby core)
---
    Kconv.toutf16(str)   => string

---

Convert `str` to UTF-16


# Kconv#toutf32

(from ruby core)
---
    Kconv.toutf32(str)   => string

---

Convert `str` to UTF-32


# Kconv#toutf8

(from ruby core)
---
    Kconv.toutf8(str)   => string

---

Convert `str` to UTF-8


