import Foundation

//https://leetcode.com/problems/populating-next-right-pointers-in-each-node-ii/?envType=study-plan-v2&envId=top-interview-150

public class Node {
    public var val: Int
    public var left: Node?
    public var right: Node?
    public var next: Node?
    public init(_ val: Int) {
        self.val = val
        self.left = nil
        self.right = nil
        self.next = nil
    }
}

//level order traversal with track of levels
class Solution {
    func connect(_ root: Node?) -> Node? {
        guard let root else { return nil }
        var queue: [Node] = []
        queue.add(root)
        while !queue.isEmpty {
            let levelSize = queue.count
            var levelNodes: [Node] = []
            for idx in 0..<levelSize {
                let cur = queue.pop()
                levelNodes.append(cur)
                if let curLeft = cur.left {
                    queue.add(curLeft)
                }
                if let curRight = cur.right {
                    queue.add(curRight)
                }
            }
            guard levelNodes.count > 1 else { continue }
            for idx in stride(from: 1, to: levelNodes.count, by: 1) {
                let prevNode = levelNodes[idx - 1]
                let curNode = levelNodes[idx]
                prevNode.next = curNode
            }
        }
        return root
    }
}

extension Array {
    mutating func add(_ ele: Element) {
        append(ele)
    }

    mutating func pop() -> Element {
        return remove(at: 0)
    }
}
