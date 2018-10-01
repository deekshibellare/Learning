# setNeedsLayout and layoutIfNeeded


The method setNeedsLayout for a UIView tells the system that you want it to layout and redraw that view and all of its subviews, when it is time for the update cycle. This is an asynchronous activity, because the method completes and returns immediately, but it isn’t until some later time that the layout and redraw actually happens, and you don’t know when that update cycle will be.

In contrast, the method layoutIfNeeded is a synchronous call that tells the system you want a layout and redraw of a view and its subviews, and you want it done immediately without waiting for the update cycle. When the call to this method is complete, the layout has already been adjusted and drawn based on all changes that had been noted prior to the method call.

So, stated succinctly, layoutIfNeeded says update immediately please, whereas setNeedsLayout says please update but you can wait until the next update cycle.

Demo:

Update a view constraint and call setNeedsLayout inside animation block. Observe animation does not occur immediately

Now change it layoutIfNeeded and observe updataion occurs immeidately

