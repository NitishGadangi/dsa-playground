import Foundation

//https://leetcode.com/problems/diameter-of-binary-tree/

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
    var res: Int = 0
    func diameterOfBinaryTree(_ root: TreeNode?) -> Int {
        calculateDepth(root)
        return res
    }

    func calculateDepth(_ root: TreeNode?) -> Int {
        guard let root else { return 0 }
        let left = calculateDepth(root.left)
        let right = calculateDepth(root.right)
        res = max(res, left + right)
        return 1 + max(left, right)
    }
}
