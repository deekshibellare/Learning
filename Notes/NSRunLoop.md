#NSRunLoop

An event processing loop, where your thread enters, where it runs event handlers for incoming events.

They listen to input sources like mouse, keyboard and observe objects  like NSPort and NSConnection

The job of a run loop is to wait for things to happen. Those things can be external events, caused by the user or the system (e.g. a network request.) or internal app messages, like inter-thread notifications, asynchronous code execution, timers… Once an event (or a “message”) is received, the run loop finds a relevant listener and pass it the message.

* Every thread has only one RunLoop
* RunLoop is not thread safe

