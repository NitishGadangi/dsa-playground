import Foundation

//https://leetcode.com/problems/count-complete-tree-nodes/?envType=study-plan-v2&envId=top-interview-150

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
    func countNodes(_ root: TreeNode?) -> Int {
        guard let root else { return 0 }
        let leftCount = countNodes(root.left)
        let rightCount = countNodes(root.right)
        return leftCount + rightCount + 1
    }
}