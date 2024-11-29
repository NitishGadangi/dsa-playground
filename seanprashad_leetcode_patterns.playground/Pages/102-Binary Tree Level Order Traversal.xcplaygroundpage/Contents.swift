import Foundation

//https://leetcode.com/problems/binary-tree-level-order-traversal/

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
            let levelSize = queue.count
            var levelRes: [Int] = []
            for _ in 0..<levelSize {
                let curNode = queue.removeFirst()
                levelRes.append(curNode.val)
                if let leftNode = curNode.left {
                    queue.append(leftNode)
                }
                if let rightNode = curNode.right {
                    queue.append(rightNode)
                }
            }
            res.append(levelRes)
        }
        return res
    }
}
