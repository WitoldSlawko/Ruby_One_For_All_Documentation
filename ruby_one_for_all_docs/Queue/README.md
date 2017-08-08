# Queue < Object

(from ruby core)
---
The Queue class implements multi-producer, multi-consumer queues. It is
especially useful in threaded programming when information must be exchanged
safely between multiple threads. The Queue class implements all the required
locking semantics.

The class implements FIFO type of queue. In a FIFO queue, the first tasks
added are the first retrieved.

Example:

    require 'thread'
    queue = Queue.new

    producer = Thread.new do
      5.times do |i|
         sleep rand(i) # simulate expense
         queue << i
         puts "#{i} produced"
      end
    end

    consumer = Thread.new do
      5.times do |i|
         value = queue.pop
         sleep rand(i/2) # simulate expense
         puts "consumed #{value}"
      end
    end
---
# Class methods:

    new

# Instance methods:

    <<
    clear
    close
    closed?
    deq
    empty?
    enq
    length
    num_waiting
    pop
    push
    shift
    size

# Queue::new

(from ruby core)
---
    new()

---

Creates a new queue instance.


# Queue#<<

(from ruby core)
---
    <<(p1)

---


# Queue#clear

(from ruby core)
---
    clear()

---

Removes all objects from the queue.


# Queue#close

(from ruby core)
---
    close

---

Closes the queue. A closed queue cannot be re-opened.

After the call to close completes, the following are true:

*   `closed?` will return true

*   `close` will be ignored.

*   calling enq/push/<< will return nil.

*   when `empty?` is false, calling deq/pop/shift will return an object from
    the queue as usual.


ClosedQueueError is inherited from StopIteration, so that you can break loop
block.

    Example:

        q = Queue.new
        Thread.new{
          while e = q.deq # wait for nil to break loop
            # ...
          end
        }
        q.close


# Queue#closed?

(from ruby core)
---
    closed?

---

Returns `true` if the queue is closed.


# Queue#deq

(from ruby core)
---
    deq(*args)

---


# Queue#empty?

(from ruby core)
---
    empty?

---

Returns `true` if the queue is empty.


# Queue#enq

(from ruby core)
---
    enq(p1)

---


# Queue#length

(from ruby core)
---
    length
    size

---

Returns the length of the queue.


# Queue#num_waiting

(from ruby core)
---
    num_waiting()

---

Returns the number of threads waiting on the queue.


# Queue#pop

(from ruby core)
---
    pop(non_block=false)
    deq(non_block=false)
    shift(non_block=false)

---

Retrieves data from the queue.

If the queue is empty, the calling thread is suspended until data is pushed
onto the queue. If `non_block` is true, the thread isn't suspended, and
`ThreadError` is raised.


# Queue#push

(from ruby core)
---
    push(object)
    enq(object)
    <<(object)

---

Pushes the given `object` to the queue.


# Queue#shift

(from ruby core)
---
    shift(*args)

---


# Queue#size

(from ruby core)
---
    size()

---


