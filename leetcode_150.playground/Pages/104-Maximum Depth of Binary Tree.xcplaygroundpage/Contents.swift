import Foundation

//https://leetcode.com/problems/maximum-depth-of-binary-tree/?envType=study-plan-v2&envId=top-interview-150


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
    func maxDepth(_ root: TreeNode?) -> Int {
        return maxDepthRecursive(root, depth: 0)
    }

    func maxDepthRecursive(_ root: TreeNode?, depth: Int) -> Int {
        guard let root else { return depth }
        let left = maxDepthRecursive(root.left, depth: depth + 1)
        let right = maxDepthRecursive(root.right, depth: depth + 1)
        return max(left, right)
    }
}
