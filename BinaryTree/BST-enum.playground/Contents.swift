//: Playground - noun: a place where people can play

import UIKit

public enum BinarySearchTree<T: Comparable> {
    case Empty
    case Leaf(T)
    indirect case Node(BinarySearchTree, T, BinarySearchTree)

    public var count: Int {
        switch self {
        case .Empty:
            return 0
        case .Leaf:
            return 1
        case let .Node(left, _, right):
            return left.count + 1 + right.count
        }
    }

    public var height: Int {
        switch self {
        case .Empty:
            return 0
        case .Leaf:
            return 1
        case let .Node(left, _, right):
            return max(left.height, right.height) + 1
        }
    }

    public func insert(newValue: T) -> BinarySearchTree {
        switch self {
        case .Empty:
            return .Leaf(newValue)
        case .Leaf(let value):
            if newValue < value {
                return .Node(.Leaf(newValue), value, .Empty)
            } else {
                return .Node(.Empty, value, .Leaf(newValue))
            }
        case let .Node(left, value, right):
            if newValue < value {
                return .Node(left.insert(newValue: newValue), value, right)
            } else {
                return .Node(left, value, right.insert(newValue: newValue))
            }
        }
    }

    public func search(_ x: T) -> BinarySearchTree? {
        switch self {
        case .Empty:
            return nil
        case .Leaf(let y):
            return (x == y) ? self : nil
        case let .Node(left, value, right):
            if x < value {
                return left.search(x)
            } else if x > value {
                return right.search(x)
            } else {
                return self
            }
        }
    }
}

extension BinarySearchTree: CustomDebugStringConvertible {
    public var debugDescription: String {
        switch self {
        case .Empty: return "."
        case .Leaf(let value): return "\(value)"
        case .Node(let left, let value, let right):
            return "(\(left.debugDescription) <- \(value) -> \(right.debugDescription))"
        }
    }
}

var tree = BinarySearchTree.Leaf(7)
tree = tree.insert(newValue: 2)
tree = tree.insert(newValue: 5)
tree = tree.insert(newValue: 10)
tree = tree.insert(newValue: 9)
tree = tree.insert(newValue: 1)

tree.search(10)
tree.search(1)
tree.search(11)


