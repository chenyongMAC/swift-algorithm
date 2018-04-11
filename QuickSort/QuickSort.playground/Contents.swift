//: Playground - noun: a place where people can play

import UIKit

//a easy implementation in swift that should be easy to understand
func quicksort_filter<T: Comparable>(_ a: [T]) -> [T] {
    guard a.count > 1 else {
        return a
    }

    let pivot = a[a.count/2]
    let less = a.filter { $0 < pivot }
    let equal = a.filter { $0 == pivot }
    let greater = a.filter { $0 > pivot }

    return quicksort_filter(less) + equal + quicksort_filter(greater)
}

let list = [ 10, 0, 3, 9, 2, 14, 8, 27, 1, 5, 8, -1, 26 ]
print(quicksort_filter(list))



// partition by the last element of the array
// pivot could use a random value between low to high
func partitionLast<T: Comparable>(_ a: inout [T], low: Int, high: Int) -> Int {
    let pivot = a[high]

    var i = low
    for j in low..<high {
        if a[j] <= pivot {
            (a[i], a[j]) = (a[j], a[i])
            i += 1
        }
    }

    (a[i], a[high]) = (a[high], a[i])
    return i
}

func quicksortLast<T: Comparable>(_ a: inout [T], low: Int, high: Int) {
    if low < high {
        let p = partitionLast(&a, low: low, high: high)
        quicksortLast(&a, low: low, high: p - 1)
        quicksortLast(&a, low: p + 1, high: high)
    }
}

var list2 = [ 10, 0, 3, 9, 2, 14, 26, 27, 1, 5, 8, -1, 8 ]
quicksortLast(&list2, low: 0, high: list2.count - 1)
print(list2)










