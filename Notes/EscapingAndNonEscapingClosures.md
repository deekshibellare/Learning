# Escaping and Non-Escaping Closures

Closures are self-contained blocks of functionality that cab be passed arond and used in our code. Closures can capture and store refrences to any constants and variables from the context in which they are defined.

```
let sum = { (value1:Int,value2:Int) -> (Int) in
    return value1 + value2
}
sum(5, 6)
```


#Non-Escaping closure

These are the type of closures that execute with the function body and returns to the compiler. As soon as the execution ends, the passed closure goes out of scope and have no more existence.

```
let array = [1,2,3].sorted(by:>)
```


#Escaping closure

These are closures that outlive the calling function. These closures are held back or stored for execution at a later stage. Generally closure `escapes` the execution when it is used in an asynchronous function or when it is stored in a variable for future use
Example 1:

```
func fetchData(for userID:Int,
               completionHandler:@escaping ((_ response:Data?,_ error:Error?) -> (Void))) {
    
    DispatchQueue.global().async {
        //Fetch data and pass
        completionHandler(nil, nil)
    }
}
```

Example 2

```class Calculate
{
    var completionHandler:((Int) -> (Void))?
    
    func add(array:Int,handler:@escaping (Int) -> (Void)) {
        self.completionHandler = handler
    }
}
```
