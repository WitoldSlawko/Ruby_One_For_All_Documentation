# ArgumentError < StandardError

(from ruby core)
---
Raised when the arguments are wrong and there isn't a more specific Exception
class.

Ex: passing the wrong number of arguments

    [1, 2, 3].first(4, 5)

*raises the exception:*

    ArgumentError: wrong number of arguments (given 2, expected 1)

Ex: passing an argument that is not acceptable:

    [1, 2, 3].first(-4)

*raises the exception:*

    ArgumentError: negative array size
---
