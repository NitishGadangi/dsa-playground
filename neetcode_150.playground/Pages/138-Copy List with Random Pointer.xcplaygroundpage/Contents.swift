import Foundation

//https://leetcode.com/problems/copy-list-with-random-pointer/description/

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
        if let newNode = map[head] {
            return newNode
        }

        let newNode = Node(head.val)
        map[head] = newNode
        newNode.next = copyRandomList(head.next)
        newNode.random = copyRandomList(head.random)
        return newNode
    }
}
