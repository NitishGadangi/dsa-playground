import Foundation

//https://leetcode.com/problems/binary-tree-level-order-traversal/description/

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
    func levelOrder(_ root: TreeNode?) -> [[Int]] {
        guard let root else { return [] }
        var res: [[Int]] = []
        var queue: [TreeNode] = []
        queue.append(root)
        while !queue.isEmpty {
            let len = queue.count
            var tempRes: [Int] = []
            for _ in 0..<len {
                let cur = queue.removeFirst()
                tempRes.append(cur.val)
                if let left = cur.left {
                    queue.append(left)
                }
                if let right = cur.right {
                    queue.append(right)
                }
            }
            res.append(tempRes)
        }
        return res
    }
}
