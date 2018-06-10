import UIKit

var str = "Hello, playground"
extension Collection
{
    func mapClone<TransformedElement>(transform:(Element)->TransformedElement) -> [TransformedElement] {
        var result:[TransformedElement] = []
        result.reserveCapacity(self.count)
        for element in self {
            result.append(transform(element))
        }
        return result
    }
}

let integers = [1,2,3,4,5]
let squareOfIntegers = integers.mapClone { element in
    return element*element
}

print(squareOfIntegers)
