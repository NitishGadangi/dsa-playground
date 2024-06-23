//: [Previous](@previous)

import Foundation

//https://leetcode.com/problems/copy-list-with-random-pointer/?envType=study-plan-v2&envId=top-interview-150

public class Node: Hashable {
    public static func == (lhs: Node, rhs: Node) -> Bool {
        ObjectIdentifier(lhs) == ObjectIdentifier(rhs)
    }

    public func hash(into hasher: inout Hasher) {
        hasher.combine(ObjectIdentifier(self))
    }

    public var val: Int
    public var next: Node?
    public var random: Node?
    public init(_ val: Int) {
        self.val = val
        self.next = nil
        self.random = nil
    }
}

class Solution {
    var map: [Node: Node] = [:]
    func copyRandomList(_ head: Node?) -> Node? {
        guard let head else { return nil }
        if let mapNode = map[head] {
            return mapNode
        }

        let newNode = Node(head.val)
        map[newNode] = newNode

        newNode.next = copyRandomList(head.next)
        newNode.random = copyRandomList(head.random)

        return newNode
    }
}

class AlternateSolution {
    func copyRandomList(_ head: Node?) -> Node? {
        var map: [Int: Node] = [:]
        var curNode = head
        while curNode != nil {
            guard let curval = curNode?.val else { break }
            map[curval] = Node(curval)
            curNode = curNode?.next
        }

        curNode = head
        while curNode != nil {
            guard let curval = curNode?.val,
                  let copyNode = map[curval]
            else { break }

            if let nextVal = curNode?.next?.val {
                copyNode.next = map[nextVal]
            }

            if let randomVal = curNode?.random?.val {
                copyNode.random = map[randomVal]
            }

            curNode = curNode?.next
        }

        if let headVal = head?.val {
            return map[headVal]
        }
        return nil
    }
}
