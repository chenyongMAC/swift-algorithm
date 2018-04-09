//: Playground - noun: a place where people can play

import UIKit

// recursive
func binarySearch<T: Comparable>(_ a: [T], key: T, range: Range<Int>) -> Int? {
    if range.lowerBound >= range.upperBound {
        return nil
    } else {
        let midIndex = range.lowerBound + (range.upperBound - range.lowerBound)/2

        if a[midIndex] > key {
            return binarySearch(a, key: key, range: 0..<midIndex)
        } else if a[midIndex] < key {
            return binarySearch(a, key: key, range: (midIndex+1)..<range.upperBound)
        } else {
            return midIndex
        }
    }
}

// interative
func binarySearch<T: Comparable>(_ a: [T], key: T) -> Int? {
    var lowerBound = 0
    var upperBound = a.count
    while lowerBound < upperBound {
        let midIndex = lowerBound + (upperBound - lowerBound) / 2
        if a[midIndex] < key {
            lowerBound = midIndex + 1
        } else if a[midIndex] > key {
            upperBound = midIndex
        } else {
            return midIndex
        }
    }
    return nil
}

let numbers = [2, 3, 5, 7, 11, 13, 17, 19, 23, 29, 31, 37, 41, 43, 47, 53, 59, 61, 67]

binarySearch(numbers, key: 43, range: 0..<numbers.count)
binarySearch(numbers, key: 43)
