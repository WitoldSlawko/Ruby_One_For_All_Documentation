# Zlib

(from ruby core)
---
This module provides access to the [zlib library](http://zlib.net). Zlib is
designed to be a portable, free, general-purpose, legally unencumbered -- that
is, not covered by any patents -- lossless data-compression library for use on
virtually any computer hardware and operating system.

The zlib compression library provides in-memory compression and decompression
functions, including integrity checks of the uncompressed data.

The zlib compressed data format is described in RFC 1950, which is a wrapper
around a deflate stream which is described in RFC 1951.

The library also supports reading and writing files in gzip (.gz) format with
an interface similar to that of IO. The gzip format is described in RFC 1952
which is also a wrapper around a deflate stream.

The zlib format was designed to be compact and fast for use in memory and on
communications channels. The gzip format was designed for single-file
compression on file systems, has a larger header than zlib to maintain
directory information, and uses a different, slower check method than zlib.

See your system's zlib.h for further information about zlib

## Sample usage

Using the wrapper to compress strings with default parameters is quite simple:

    require "zlib"

    data_to_compress = File.read("don_quixote.txt")

    puts "Input size: #{data_to_compress.size}"
    #=> Input size: 2347740

    data_compressed = Zlib::Deflate.deflate(data_to_compress)

    puts "Compressed size: #{data_compressed.size}"
    #=> Compressed size: 887238

    uncompressed_data = Zlib::Inflate.inflate(data_compressed)

    puts "Uncompressed data is: #{uncompressed_data}"
    #=> Uncompressed data is: The Project Gutenberg EBook of Don Quixote...

## Class tree

*   Zlib::Deflate
*   Zlib::Inflate
*   Zlib::ZStream
*   Zlib::Error
    *   Zlib::StreamEnd
    *   Zlib::NeedDict
    *   Zlib::DataError
    *   Zlib::StreamError
    *   Zlib::MemError
    *   Zlib::BufError
    *   Zlib::VersionError



(if you have GZIP_SUPPORT)
*   Zlib::GzipReader
*   Zlib::GzipWriter
*   Zlib::GzipFile
*   Zlib::GzipFile::Error
    *   Zlib::GzipFile::LengthError
    *   Zlib::GzipFile::CRCError
    *   Zlib::GzipFile::NoFooter


---
# Constants:

ASCII
:   Represents text data as guessed by deflate.

    NOTE: The underlying constant Z_ASCII was deprecated in favor of Z_TEXT in
    zlib 1.2.2.  New applications should not use this constant.

    See Zlib::Deflate#data_type.

BEST_COMPRESSION
:   Slowest compression level, but with the best space savings.

BEST_SPEED
:   Fastest compression level, but with the lowest space savings.

BINARY
:   Represents binary data as guessed by deflate.

    See Zlib::Deflate#data_type.

DEFAULT_COMPRESSION
:   Default compression level which is a good trade-off between space and time
DEFAULT_STRATEGY
:   Default deflate strategy which is used for normal data.

DEF_MEM_LEVEL
:   The default memory level for allocating zlib deflate compression state.
FILTERED
:   Deflate strategy for data produced by a filter (or predictor). The effect
    of FILTERED is to force more Huffman codes and less string matching; it is
    somewhat intermediate between DEFAULT_STRATEGY and HUFFMAN_ONLY. Filtered
    data consists mostly of small values with a somewhat random distribution.
FINISH
:   Processes all pending input and flushes pending output.

FIXED
:   Deflate strategy which prevents the use of dynamic Huffman codes, allowing
    for a simpler decoder for specialized applications.
FULL_FLUSH
:   Flushes all output as with SYNC_FLUSH, and the compression state is reset
    so that decompression can restart from this point if previous compressed
    data has been damaged or if random access is desired. Like SYNC_FLUSH,
    using FULL_FLUSH too often can seriously degrade compression.
HUFFMAN_ONLY
:   Deflate strategy which uses Huffman codes only (no string matching).

MAX_MEM_LEVEL
:   The maximum memory level for allocating zlib deflate compression state.
MAX_WBITS
:   The maximum size of the zlib history buffer.  Note that zlib allows larger
    values to enable different inflate modes.  See Zlib::Inflate.new for
    details.
NO_COMPRESSION
:   No compression, passes through data untouched.  Use this for appending
    pre-compressed data to a deflate stream.
NO_FLUSH
:   NO_FLUSH is the default flush method and allows deflate to decide how much
    data to accumulate before producing output in order to maximize
    compression.
OS_AMIGA
:   OS code for Amiga hosts

OS_ATARI
:   OS code for Atari hosts

OS_CODE
:   The OS code of current host

OS_CPM
:   OS code for CP/M hosts

OS_MACOS
:   OS code for Mac OS hosts

OS_MSDOS
:   OS code for MSDOS hosts

OS_OS2
:   OS code for OS2 hosts

OS_QDOS
:   OS code for QDOS hosts

OS_RISCOS
:   OS code for RISC OS hosts

OS_TOPS20
:   OS code for TOPS-20 hosts

OS_UNIX
:   OS code for UNIX hosts

OS_UNKNOWN
:   OS code for unknown hosts

OS_VMCMS
:   OS code for VM OS hosts

OS_VMS
:   OS code for VMS hosts

OS_WIN32
:   OS code for Win32 hosts

OS_ZSYSTEM
:   OS code for Z-System hosts

RLE
:   Deflate compression strategy designed to be almost as fast as
    HUFFMAN_ONLY, but give better compression for PNG image data.
SYNC_FLUSH
:   The SYNC_FLUSH method flushes all pending output to the output buffer and
    the output is aligned on a byte boundary. Flushing may degrade compression
    so it should be used only when necessary, such as at a request or response
    boundary for a network stream.
TEXT
:   Represents text data as guessed by deflate.

    See Zlib::Deflate#data_type.

UNKNOWN
:   Represents an unknown data type as guessed by deflate.

    See Zlib::Deflate#data_type.

VERSION
:   The Ruby/zlib version string.

ZLIB_VERSION
:   The string which represents the version of zlib.h



# Class methods:

    adler32
    adler32_combine
    crc32
    crc32_combine
    crc_table
    deflate
    gunzip
    gzip
    inflate
    zlib_version

# Zlib::adler32

(from ruby core)
---
    Zlib.adler32(string, adler)

---

Calculates Adler-32 checksum for `string`, and returns updated value of
`adler`. If `string` is omitted, it returns the Adler-32 initial value. If
`adler` is omitted, it assumes that the initial value is given to `adler`.

Example usage:

    require "zlib"

    data = "foo"
    puts "Adler32 checksum: #{Zlib.adler32(data).to_s(16)}"
    #=> Adler32 checksum: 2820145


# Zlib::adler32_combine

(from ruby core)
---
    Zlib.adler32_combine(adler1, adler2, len2)

---

Combine two Adler-32 check values in to one.  `alder1` is the first Adler-32
value, `adler2` is the second Adler-32 value.  `len2` is the length of the
string used to generate `adler2`.


# Zlib::crc32

(from ruby core)
---
    Zlib.crc32(string, crc)

---

Calculates CRC checksum for `string`, and returns updated value of `crc`. If
`string` is omitted, it returns the CRC initial value. If `crc` is omitted, it
assumes that the initial value is given to `crc`.

FIXME: expression.


# Zlib::crc32_combine

(from ruby core)
---
    Zlib.crc32_combine(crc1, crc2, len2)

---

Combine two CRC-32 check values in to one.  `crc1` is the first CRC-32 value,
`crc2` is the second CRC-32 value.  `len2` is the length of the string used to
generate `crc2`.


# Zlib::crc_table

(from ruby core)
---
    crc_table()

---

Returns the table for calculating CRC checksum as an array.


# Zlib::deflate

(from ruby core)
---
    Zlib.deflate(string[, level])
    Zlib::Deflate.deflate(string[, level])

---

Compresses the given `string`. Valid values of level are Zlib::NO_COMPRESSION,
Zlib::BEST_SPEED, Zlib::BEST_COMPRESSION, Zlib::DEFAULT_COMPRESSION, or an
integer from 0 to 9.

This method is almost equivalent to the following code:

    def deflate(string, level)
      z = Zlib::Deflate.new(level)
      dst = z.deflate(string, Zlib::FINISH)
      z.close
      dst
    end

See also Zlib.inflate


# Zlib::gunzip

(from ruby core)
---
    Zlib.gunzip(src) -> String

---

Decode the given gzipped `string`.

This method is almost equivalent to the following code:

    def gunzip(string)
      sio = StringIO.new(string)
      gz = Zlib::GzipReader.new(sio, encoding: Encoding::ASCII_8BIT)
      gz.read
    ensure
      gz&.close
    end

See also Zlib.gzip


# Zlib::gzip

(from ruby core)
---
    Zlib.gzip(src, level: nil, strategy: nil) -> String

---

Gzip the given `string`. Valid values of level are Zlib::NO_COMPRESSION,
Zlib::BEST_SPEED, Zlib::BEST_COMPRESSION, Zlib::DEFAULT_COMPRESSION (default),
or an integer from 0 to 9.

This method is almost equivalent to the following code:

    def gzip(string, level: nil, strategy: nil)
      sio = StringIO.new
      sio.binmode
      gz = Zlib::GzipWriter.new(sio, level, strategy)
      gz.write(string)
      gz.close
      sio.string
    end

See also Zlib.gunzip


# Zlib::inflate

(from ruby core)
---
    Zlib.inflate(string)
    Zlib::Inflate.inflate(string)

---

Decompresses `string`. Raises a Zlib::NeedDict exception if a preset
dictionary is needed for decompression.

This method is almost equivalent to the following code:

    def inflate(string)
      zstream = Zlib::Inflate.new
      buf = zstream.inflate(string)
      zstream.finish
      zstream.close
      buf
    end

See also Zlib.deflate


# Zlib::zlib_version

(from ruby core)
---
    zlib_version()

---

Returns the string which represents the version of zlib library.


---
Also found in:
    gem solargraph-0.9.2

