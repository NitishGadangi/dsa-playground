import Foundation

//https://leetcode.com/problems/binary-tree-right-side-view/?envType=study-plan-v2&envId=top-interview-150

public class TreeNode {
    public var val: Int
    public var left: TreeNode?
    public var right: TreeNode?
    public init() { self.val = 0; self.left = nil; self.right = nil; }
    public init(_ val: Int) { self.val = val; self.left = nil; self.right = nil; }
    public init(_ val: Int, _ left: TreeNode?, _ right: TreeNode?) {
        self.val = val
        self.left = left
        self.right = right
    }
}

class Solution {
    func rightSideView(_ root: TreeNode?) -> [Int] {
        guard let root else { return [] }
        var res: [Int] = []
        var queue: [TreeNode] = []
        queue.add(root)
        while queue.isNotEmpty {
            let levelSize = queue.count
            var curNode: TreeNode?
            for idx in 0..<levelSize {
                curNode = queue.pop()
                if let leftNode = curNode?.left {
                    queue.add(leftNode)
                }
                if let rightNode = curNode?.right {
                    queue.add(rightNode)
                }
            }
            if let curNode {
                res.add(curNode.val)
            }
        }
        return res
    }
}

// Queue on Array
extension Array {
    var isNotEmpty: Bool {
        get {
            return isEmpty == false
        }
    }

    mutating func add(_ newElement: Element) {
        append(newElement)
    }

    mutating func pop() -> Element {
        return remove(at: 0)
    }
}
