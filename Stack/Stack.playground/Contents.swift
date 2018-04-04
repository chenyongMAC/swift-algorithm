//: Playground - noun: a place where people can play

import UIKit

public struct Stack<T> {
    fileprivate var array = [T]()

    public var isEmpty: Bool {
        return array.isEmpty
    }

    public var count: Int {
        return array.count
    }

    public var top: T? {
        return array.last
    }

    public mutating func push(_ element: T) {
        array.append(element)
    }

    public mutating func pop() -> T? {
        return array.popLast()
    }
}

var stack = Stack<String>()
stack.push("a")
stack.push("b")
stack.top
stack.count
stack.isEmpty
stack.pop()
stack.pop()
