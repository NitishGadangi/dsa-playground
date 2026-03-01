import Foundation

//https://leetcode.com/problems/binary-tree-maximum-path-sum/description/

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
    var res: Int = Int.min
    func maxPathSum(_ root: TreeNode?) -> Int {
        helper(root)
        return res
    }

    func helper(_ root: TreeNode?) -> Int {
        guard let root else { return 0 }
        let left = helper(root.left)
        let right = helper(root.right)
        res = max(res, root.val + left + right)
        let depthSum = root.val + max(left, right)
        return max(0, depthSum)
    }
}

class SlowSolution {
    var res: Int =  Int.min
    func maxPathSum(_ root: TreeNode?) -> Int {
        helper(root)
        return res
    }

    func helper(_ root: TreeNode?) {
        guard let root else { return }
        let left = getMaxDepthSum(root.left)
        let right = getMaxDepthSum(root.right)
        res = max(res, root.val + left + right)
        helper(root.left)
        helper(root.right)
    }

    func getMaxDepthSum(_ root: TreeNode?) -> Int {
        guard let root else { return 0 }
        let left = getMaxDepthSum(root.left)
        let right = getMaxDepthSum(root.right)
        let depthSum = root.val + max(left, right)
        return max(0, depthSum)
    }
}
