# Find

(from ruby core)
---
The `Find` module supports the top-down traversal of a set of file paths.

For example, to total the size of all files under your home directory,
ignoring anything in a "dot" directory (e.g. $HOME/.ssh):

    require 'find'

    total_size = 0

    Find.find(ENV["HOME"]) do |path|
      if FileTest.directory?(path)
        if File.basename(path)[0] == ?.
          Find.prune       # Don't look any further into this directory.
        else
          next
        end
      else
        total_size += FileTest.size(path)
      end
    end
---
# Class methods:

    find
    prune

# Instance methods:

    find
    prune

# Find::find

(from ruby core)
---
    find(*paths, ignore_error: true) { |path| ... }

---

Calls the associated block with the name of every file and directory listed as
arguments, then recursively on their subdirectories, and so on.

Returns an enumerator if no block is given.

See the `Find` module documentation for an example.


# Find::prune

(from ruby core)
---
    prune()

---

Skips the current file or directory, restarting the loop with the next entry.
If the current file is a directory, that directory will not be recursively
entered. Meaningful only within the block associated with Find::find.

See the `Find` module documentation for an example.


# Find#find

(from ruby core)
---
    find(*paths, ignore_error: true) { |path| ... }

---

Calls the associated block with the name of every file and directory listed as
arguments, then recursively on their subdirectories, and so on.

Returns an enumerator if no block is given.

See the `Find` module documentation for an example.


# Find#prune

(from ruby core)
---
    prune()

---

Skips the current file or directory, restarting the loop with the next entry.
If the current file is a directory, that directory will not be recursively
entered. Meaningful only within the block associated with Find::find.

See the `Find` module documentation for an example.


