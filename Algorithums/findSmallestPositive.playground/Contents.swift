import UIKit

var str = "Hello, playground"
func findSmallestMissingPositive(in array:[Int]) -> Int
{
    var sortedArray = array.sorted()
 
    var index = sortedArray.startIndex
    let endIndex = sortedArray.endIndex

    //Ignore non positive numbers
    while index <= endIndex && sortedArray[index] < 1 {
        index = sortedArray.index(after: index)
    }
    //if array contains only non positive return 1
    guard index <=  endIndex else {
        return 1
    }

    //get the first positive number
    var previousInteger = sortedArray[index]
    //get the index of next element
    index = sortedArray.index(after: index)
    //Iterate from next to end
    for currentIndex in index ..< endIndex {
        let currentInteger = sortedArray[currentIndex]
    
        //Check if current integer is one greater or equal to the previous else return by adding one to the previous 
        if previousInteger + 1 == currentInteger || previousInteger ==  currentInteger {
            previousInteger = currentInteger
            print(previousInteger)
        } else {
            return previousInteger + 1
        }
    }
    
    //if no match is found add one to last element and return as the result
    return sortedArray[endIndex] + 1
}

var array = [-1,1,3,6, 4, 1, 2,-8,-9,9]
findSmallestMissingPositive(in: array)





