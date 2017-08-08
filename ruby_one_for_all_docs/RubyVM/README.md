# RubyVM < Object

(from ruby core)
---

::RubyVM

---
# Constants:

DEFAULT_PARAMS
:   DEFAULT_PARAMS This constant variable shows VM's default parameters. Note
    that changing these values does not affect VM execution. Specification is
    not stable and you should not depend on this value. Of course, this
    constant is MRI specific.
INSTRUCTION_NAMES
:   INSTRUCTION_NAMES

OPTS
:   OPTS, which shows vm build options



# Class methods:

    stat

# RubyVM::stat

(from ruby core)
---
    RubyVM.stat -> Hash
    RubyVM.stat(hsh) -> hsh
    RubyVM.stat(Symbol) -> Numeric

---

Returns a Hash containing implementation-dependent counters inside the VM.

This hash includes information about method/constant cache serials:

    {
      :global_method_state=>251,
      :global_constant_state=>481,
      :class_serial=>9029
    }

The contents of the hash are implementation specific and may be changed in the
future.

This method is only expected to work on C Ruby.


---
Also found in:
    gem power_assert-0.4.1

