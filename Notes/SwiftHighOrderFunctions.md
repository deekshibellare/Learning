#Swift high order functions

###Filter 
```
let array = [1,2,3,4,5]
let evenNumbers = array.filter{$0 % 2 == 0}
```

###Reduce 
```
let array = [1,2,3,4,5]
let sumOfNumbers = array.reduce(0, +)
```

###Map

```
let array = [1,2,3,4,5]
let squares = array.map {$0*$0}
```

###CompactMap
```
let array = [1,2,nil,3,4,5,nil]
let compactArray = array.compactMap{$0}
```

### FlatMap

```
let multiDimensionalArray = [[1,2], [3,4],[5,6]]
let oneDimensionalArray = multiDimensionalArray.flatMap{$0}
```






