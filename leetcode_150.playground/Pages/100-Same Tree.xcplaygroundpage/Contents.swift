import Foundation

//https://leetcode.com/problems/same-tree/?envType=study-plan-v2&envId=top-interview-150


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
    func isSameTree(_ p: TreeNode?, _ q: TreeNode?) -> Bool {
        if (p == nil) && (q == nil) { return true }
        guard p?.val == q?.val else { return false }
        let left = isSameTree(p?.left, q?.left)
        let right = isSameTree(p?.right, q?.right)
        return left && right
    }
}
