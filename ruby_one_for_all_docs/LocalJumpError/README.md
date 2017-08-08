# LocalJumpError < StandardError

(from ruby core)
---
Raised when Ruby can't yield as requested.

A typical scenario is attempting to yield when no block is given:

    def call_block
      yield 42
    end
    call_block

*raises the exception:*

    LocalJumpError: no block given (yield)

A more subtle example:

    def get_me_a_return
      Proc.new { return 42 }
    end
    get_me_a_return.call

*raises the exception:*

    LocalJumpError: unexpected return
---
# Instance methods:

    exit_value
    reason

# LocalJumpError#exit_value

(from ruby core)
---
    local_jump_error.exit_value  -> obj

---

Returns the exit value associated with this `LocalJumpError`.


# LocalJumpError#reason

(from ruby core)
---
    local_jump_error.reason   -> symbol

---

The reason this block was terminated: :break, :redo, :retry, :next, :return,
or :noreason.


