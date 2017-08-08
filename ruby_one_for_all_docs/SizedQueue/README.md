# SizedQueue < Object

(from ruby core)
---
This class represents queues of specified size capacity.  The push operation
may be blocked if the capacity is full.

See Queue for an example of how a SizedQueue works.
---
# Class methods:

    new

# Instance methods:

    <<
    clear
    close
    deq
    enq
    max
    max=
    num_waiting
    pop
    push
    shift

# SizedQueue::new

(from ruby core)
---
    new(max)

---

Creates a fixed-length queue with a maximum size of `max`.


# SizedQueue#<<

(from ruby core)
---
    <<(*args)

---


# SizedQueue#clear

(from ruby core)
---
    clear()

---

Removes all objects from the queue.


# SizedQueue#close

(from ruby core)
---
    close

---

Similar to Queue#close.

The difference is behavior with waiting enqueuing threads.

If there are waiting enqueuing threads, they are interrupted by raising
ClosedQueueError('queue closed').


# SizedQueue#deq

(from ruby core)
---
    deq(*args)

---


# SizedQueue#enq

(from ruby core)
---
    enq(*args)

---


# SizedQueue#max

(from ruby core)
---
    max()

---

Returns the maximum size of the queue.


# SizedQueue#max=

(from ruby core)
---
    max=(number)

---

Sets the maximum size of the queue to the given `number`.


# SizedQueue#num_waiting

(from ruby core)
---
    num_waiting()

---

Returns the number of threads waiting on the queue.


# SizedQueue#pop

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


# SizedQueue#push

(from ruby core)
---
    push(object, non_block=false)
    enq(object, non_block=false)
    <<(object)

---

Pushes `object` to the queue.

If there is no space left in the queue, waits until space becomes available,
unless `non_block` is true.  If `non_block` is true, the thread isn't
suspended, and `ThreadError` is raised.


# SizedQueue#shift

(from ruby core)
---
    shift(*args)

---


