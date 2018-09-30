#Optional protocol in Swift


1. Mutliple protocols 

Have multiple protocols and confirm to them when needed

```protocol SingleSelectionProtocol {
    func selectedItem(at Index:Int)
}

protocol MultipleSelectionProtocol {
     func selectedItems(at indexes:[Int])
}

class MultipleSelectionClass {
      
}

extension MultipleSelectionClass:MultipleSelectionProtocol {
 func selectedItems(at indexes:[Int]) {

       }
    
}

extension MultipleSelectionClass:SingleSelectionProtocol {
    func selectedItem(at Index:Int) {

    }
    
}
```


2. Use @objc to aquire objective protocol behaviour where a protocol can be optional

```
@objc protocol MultipleSelectionProtocol {
    @objc optional func selectedItem(at Index:Int)
     func selectedItems(at indexes:[Int])
}

class MultipleSelectionClass {
    
}

extension MultipleSelectionProtocol {
    func selectedItems(at indexes:[Int]) {
        
    }
}
```


3. Use protocol extension to create emppty implementeions for optional protocols

```

protocol SingleSelectionProtocol {
    func selectedItem(at Index:Int)
}

protocol MultipleSelectionProtocol {
     func selectedItem(at Index:Int)
     func selectedItems(at indexes:[Int])
}
```


