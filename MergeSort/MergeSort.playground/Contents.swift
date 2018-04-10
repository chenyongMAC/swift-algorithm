//: Playground - noun: a place where people can play

import UIKit

//advantage: the time complexity for the best, worst, and average case will always be O(n log n)
//disadvantage: it needs a temporary "working" array equal in size to the array being sorted.

func mergeSort(_ array: [Int]) -> [Int] {
    guard array.count > 1 else {
        return array
    }

    let midIndex = array.count / 2

    let leftArray = mergeSort(Array(array[0..<midIndex]))
    let rightArray = mergeSort(Array(array[midIndex..<array.count]))
    return merge(leftArray: leftArray, rightArray: rightArray)
}

func merge(leftArray: [Int], rightArray: [Int]) -> [Int] {
    var leftIndex = 0
    var rightIndex = 0

    var temp = [Int]()

    while (leftIndex < leftArray.count) && (rightIndex < rightArray.count) {
        if leftArray[leftIndex] < rightArray[rightIndex] {
            temp.append(leftArray[leftIndex])
            leftIndex += 1
        } else if leftArray[leftIndex] > rightArray[rightIndex] {
            temp.append(rightArray[rightIndex])
            rightIndex += 1
        } else {
            temp.append(leftArray[leftIndex])
            leftIndex += 1
            temp.append(rightArray[rightIndex])
            rightIndex += 1
        }
    }

    while leftIndex < leftArray.count {
        temp.append(leftArray[leftIndex])
        leftIndex += 1
    }

    while rightIndex < rightArray.count {
        temp.append(rightArray[rightIndex])
        rightIndex += 1
    }

    return temp;
}

let array = [2, 1, 5, 4, 9]
print(mergeSort(array))
