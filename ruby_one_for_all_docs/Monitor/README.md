# Monitor < Object

---
# Includes:
MonitorMixin (from ruby core)

(from ruby core)
---
Use the Monitor class when you want to have a lock object for blocks with
mutual exclusion.

    require 'monitor'

    lock = Monitor.new
    lock.synchronize do
      # exclusive access
    end
---
