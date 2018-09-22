# Difference between Garbage Collection and Automatic Reference Counting

Garbage Collection(GC) and Automatic Reference Counting (ARC) are two automatic memory management methods.

GC is used in Java, GO, C#
ARC is used in Swift and Objective-C

When an object is no longer needed, both systems reclaim the underlying memory and use it for further allocation

## Garbage Collection

GC detects the unused object and object graphs in the background and frees them. It uses mark and sweep algorithm where every object is marked to be alive if it has a root object referencing to it. Any object or object graph that is unmarked is reclaimed.

* Additional memory to run the algorithm and may stall the program execution.
* GC kicks in randomly and unused memory is not reclaimed immediately.
* Handles retain cycles

## Automatic Reference Counting

Reference counting works by counting the active references for each object. At compile time ARC inserts retain, release messages at appropriate places to increase or decrease the retain count of the object at runtime.

* Works asynchronously and no extra memory is needed to reclaim memory
* It has deterministic reclamation of objects
* ARC does not handle retain cycles automatically










