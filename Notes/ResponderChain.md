#Responders

Apps recive touch events using responder objects. Any event queued by the application is sent to the most appopriate object. If first responder handles the event, it is exectuted. Otherwise event is propgated across the responder chain


UITextField -> UIView -> UIViewController -> UIWindowController -> UIApplication -> UIAppDelegate

UIKit uses view-based hit testing to determine where the touch events has occured. Specifically touch location to the bounds of view object in the view heirachy. 
The top most of view in view heirachy is assigned the event

You can alter the responder chain by overriding the next property of your responder objects. When you do this, the next responder is the object that you return.

Many UIKit classes already override this property and return specific objects, including:

UIView objects. If the view is the root view of a view controller, the next responder is the view controller; otherwise, the next responder is the view’s superview.

UIViewController objects.

If the view controller’s view is the root view of a window, the next responder is the window object.

If the view controller was presented by another view controller, the next responder is the presenting view controller.

