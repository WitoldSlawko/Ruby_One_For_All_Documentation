# MethodSource

---
# Extended by:
MethodSource::CodeHelpers (from gem method_source-0.8.2)

(from gem method_source-0.8.2)
---



---
# Constants:

VERSION
:   [not documented]


# Class methods:

    comment_helper
    extract_code
    lines_for
    source_helper
    valid_expression?

# MethodSource::comment_helper

(from gem method_source-0.8.2)
---
    comment_helper(source_location, name=nil)

---

Helper method responsible for opening source file and buffering up the
comments for a specified method. Defined here to avoid polluting `Method`
class. @param [Array] source_location The array returned by
Method#source_location @param [String]  method_name @return [String] The
comments up to the point of the method.


# MethodSource::extract_code

(from gem method_source-0.8.2)
---
    extract_code(source_location)

---

@deprecated — use MethodSource::CodeHelpers#expression_at


# MethodSource::lines_for

(from gem method_source-0.8.2)
---
    lines_for(file_name, name=nil)

---

Load a memoized copy of the lines in a file.

@param [String]  file_name @param [String]  method_name @return
[Array<String>]  the contents of the file @raise [SourceNotFoundError]


# MethodSource::source_helper

(from gem method_source-0.8.2)
---
    source_helper(source_location, name=nil)

---

Helper method responsible for extracting method body. Defined here to avoid
polluting `Method` class. @param [Array] source_location The array returned by
Method#source_location @param [String]  method_name @return [String] The
method body


# MethodSource::valid_expression?

(from gem method_source-0.8.2)
---
    valid_expression?(str)

---

@deprecated — use MethodSource::CodeHelpers#complete_expression?


