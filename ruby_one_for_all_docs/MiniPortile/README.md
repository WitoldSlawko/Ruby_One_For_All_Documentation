# MiniPortile < Object

(from gem mini_portile2-2.2.0)
---

---
# Constants:

KEYRING_NAME
:   [not documented]
VERSION
:   [not documented]


# Class methods:

    new
    windows?

# Instance methods:

    activate
    apply_patch
    archives_path
    compile
    computed_options
    configure
    configure_defaults
    configure_options
    configure_prefix
    configured?
    cook
    detect_host
    download
    download_file
    download_file_file
    download_file_ftp
    download_file_http
    downloaded?
    execute
    extract
    extract_file
    files
    files_hashs
    gcc_cmd
    host
    install
    installed?
    log_file
    logger
    make_cmd
    message
    name
    newer?
    original_host
    output
    patch
    patch_files
    path
    port_path
    tar_compression_switch
    tar_exe
    target
    tmp_path
    verify_file
    version
    which
    with_tempfile
    work_path

# Attributes:

    attr_accessor files
    attr_accessor host
    attr_accessor logger
    attr_accessor patch_files
    attr_accessor target
    attr_reader name
    attr_reader original_host
    attr_reader version
    attr_writer configure_options

# MiniPortile::new

(from gem mini_portile2-2.2.0)
---
    new(name, version)

---


# MiniPortile::windows?

(from gem mini_portile2-2.2.0)
---
    windows?()

---


# MiniPortile#activate

(from gem mini_portile2-2.2.0)
---
    activate()

---


# MiniPortile#apply_patch

(from gem mini_portile2-2.2.0)
---
    apply_patch(patch_file)

---


# MiniPortile#compile

(from gem mini_portile2-2.2.0)
---
    compile()

---


# MiniPortile#configure

(from gem mini_portile2-2.2.0)
---
    configure()

---


# MiniPortile#configure_options

(from gem mini_portile2-2.2.0)
---


# MiniPortile#configured?

(from gem mini_portile2-2.2.0)
---
    configured?()

---


# MiniPortile#cook

(from gem mini_portile2-2.2.0)
---
    cook()

---


# MiniPortile#download

(from gem mini_portile2-2.2.0)
---
    download()

---


# MiniPortile#downloaded?

(from gem mini_portile2-2.2.0)
---
    downloaded?()

---


# MiniPortile#extract

(from gem mini_portile2-2.2.0)
---
    extract()

---


# MiniPortile#install

(from gem mini_portile2-2.2.0)
---
    install()

---


# MiniPortile#installed?

(from gem mini_portile2-2.2.0)
---
    installed?()

---


# MiniPortile#patch

(from gem mini_portile2-2.2.0)
---
    patch()

---


# MiniPortile#path

(from gem mini_portile2-2.2.0)
---
    path()

---


# MiniPortile#archives_path

(from gem mini_portile2-2.2.0)
---
    archives_path()

---


# MiniPortile#computed_options

(from gem mini_portile2-2.2.0)
---
    computed_options()

---


# MiniPortile#configure_defaults

(from gem mini_portile2-2.2.0)
---
    configure_defaults()

---


# MiniPortile#configure_prefix

(from gem mini_portile2-2.2.0)
---
    configure_prefix()

---


# MiniPortile#detect_host

(from gem mini_portile2-2.2.0)
---
    detect_host()

---


# MiniPortile#download_file

(from gem mini_portile2-2.2.0)
---
    download_file(url, full_path, count = 3)

---

Slighly modified from RubyInstaller uri_ext, Rubinius configure and
adaptations of Wayne's RailsInstaller


# MiniPortile#download_file_file

(from gem mini_portile2-2.2.0)
---
    download_file_file(uri, full_path)

---


# MiniPortile#download_file_ftp

(from gem mini_portile2-2.2.0)
---
    download_file_ftp(uri, full_path)

---


# MiniPortile#download_file_http

(from gem mini_portile2-2.2.0)
---
    download_file_http(url, full_path, count = 3)

---


# MiniPortile#execute

(from gem mini_portile2-2.2.0)
---
    execute(action, command, options={})

---


# MiniPortile#extract_file

(from gem mini_portile2-2.2.0)
---
    extract_file(file, target)

---


# MiniPortile#files_hashs

(from gem mini_portile2-2.2.0)
---
    files_hashs()

---


# MiniPortile#gcc_cmd

(from gem mini_portile2-2.2.0)
---
    gcc_cmd()

---


# MiniPortile#log_file

(from gem mini_portile2-2.2.0)
---
    log_file(action)

---


# MiniPortile#make_cmd

(from gem mini_portile2-2.2.0)
---
    make_cmd()

---


# MiniPortile#message

(from gem mini_portile2-2.2.0)
---
    message(text)

---

print out a message with the logger


# MiniPortile#newer?

(from gem mini_portile2-2.2.0)
---
    newer?(target, checkpoint)

---


# MiniPortile#output

(from gem mini_portile2-2.2.0)
---
    output(text = "")

---

print out a message using the logger but return to a new line


# MiniPortile#port_path

(from gem mini_portile2-2.2.0)
---
    port_path()

---


# MiniPortile#tar_compression_switch

(from gem mini_portile2-2.2.0)
---
    tar_compression_switch(filename)

---


# MiniPortile#tar_exe

(from gem mini_portile2-2.2.0)
---
    tar_exe()

---


# MiniPortile#tmp_path

(from gem mini_portile2-2.2.0)
---
    tmp_path()

---


# MiniPortile#verify_file

(from gem mini_portile2-2.2.0)
---
    verify_file(file)

---


# MiniPortile#which

(from gem mini_portile2-2.2.0)
---
    which(cmd)

---

From: http://stackoverflow.com/a/5471032/7672 Thanks, Mislav!

Cross-platform way of finding an executable in the $PATH.

    which('ruby') #=> /usr/bin/ruby


# MiniPortile#with_tempfile

(from gem mini_portile2-2.2.0)
---
    with_tempfile(filename, full_path) { |temp_file| ... }

---


# MiniPortile#work_path

(from gem mini_portile2-2.2.0)
---
    work_path()

---


