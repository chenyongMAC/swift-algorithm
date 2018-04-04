//: Playground - noun: a place where people can play

import UIKit

public struct Queue<T> {
    fileprivate var array = [T]()

    public var isEmpty: Bool {
        return array.isEmpty
    }

    public var count: Int {
        return array.count
    }

    public var front: T? {
        return array.first
    }

    public mutating func enqueue(_ element: T) {
        array.append(element)
    }

    public mutating func dequeue() -> T? {
        if isEmpty {
            return nil
        } else {
            return array.removeFirst()
        }
    }
}

var queue = Queue<String>()
queue.isEmpty
queue.enqueue("a")
queue.enqueue("b")
queue.count
queue.front
queue.dequeue()
queue.dequeue()
