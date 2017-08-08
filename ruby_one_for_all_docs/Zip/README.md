# Zip

(from gem rubyzip-1.2.1)
---




































---
# Constants:

CDIR_ENTRY_STATIC_HEADER_LENGTH
:   [not documented]
CENTRAL_DIRECTORY_ENTRY_SIGNATURE
:   [not documented]
FILE_TYPE_DIR
:   [not documented]
FILE_TYPE_FILE
:   [not documented]
FILE_TYPE_SYMLINK
:   [not documented]
FSTYPES
:   [not documented]
FSTYPE_ACORN
:   [not documented]
FSTYPE_AMIGA
:   [not documented]
FSTYPE_ATARI
:   [not documented]
FSTYPE_ATHEOS
:   [not documented]
FSTYPE_BEOS
:   [not documented]
FSTYPE_CPM
:   [not documented]
FSTYPE_FAT
:   [not documented]
FSTYPE_HPFS
:   [not documented]
FSTYPE_MAC
:   [not documented]
FSTYPE_MAC_OSX
:   [not documented]
FSTYPE_MVS
:   [not documented]
FSTYPE_NTFS
:   [not documented]
FSTYPE_QDOS
:   [not documented]
FSTYPE_TANDEM
:   [not documented]
FSTYPE_THEOS
:   [not documented]
FSTYPE_TOPS20
:   [not documented]
FSTYPE_UNIX
:   [not documented]
FSTYPE_VFAT
:   [not documented]
FSTYPE_VMS
:   [not documented]
FSTYPE_VM_CMS
:   [not documented]
FSTYPE_Z_SYSTEM
:   [not documented]
LOCAL_ENTRY_SIGNATURE
:   [not documented]
LOCAL_ENTRY_STATIC_HEADER_LENGTH
:   [not documented]
LOCAL_ENTRY_TRAILING_DESCRIPTOR_LENGTH
:   [not documented]
RUNNING_ON_WINDOWS
:   [not documented]
VERSION
:   [not documented]
VERSION_MADE_BY
:   [not documented]
VERSION_NEEDED_TO_EXTRACT
:   [not documented]
VERSION_NEEDED_TO_EXTRACT_ZIP64
:   [not documented]
ZipCompressionMethodError
:   [not documented]
ZipDestinationFileExistsError
:   [not documented]
ZipEntryExistsError
:   [not documented]
ZipEntryNameError
:   [not documented]
ZipError
:   Backwards compatibility with v1 (delete in v2)
ZipInternalError
:   [not documented]


# Instance methods:

    case_insensitive_match
    continue_on_exists_proc
    default_compression
    on_exists_proc
    reset!
    setup
    sort_entries
    unicode_names
    warn_invalid_date
    write_zip64_support

# Attributes:

    attr_accessor case_insensitive_match
    attr_accessor continue_on_exists_proc
    attr_accessor default_compression
    attr_accessor on_exists_proc
    attr_accessor sort_entries
    attr_accessor unicode_names
    attr_accessor warn_invalid_date
    attr_accessor write_zip64_support

# Zip#reset!

(from gem rubyzip-1.2.1)
---
    reset!()

---


# Zip#setup

(from gem rubyzip-1.2.1)
---
    setup() { |self| ... }

---


