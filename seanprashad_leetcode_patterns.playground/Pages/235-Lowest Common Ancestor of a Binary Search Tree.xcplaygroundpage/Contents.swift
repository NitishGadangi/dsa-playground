import Foundation

//https://leetcode.com/problems/lowest-common-ancestor-of-a-binary-search-tree/

public class TreeNode {
    public var val: Int
    public var left: TreeNode?
    public var right: TreeNode?
    public init(_ val: Int) {
        self.val = val
        self.left = nil
        self.right = nil
    }
}

class Solution {
    func lowestCommonAncestor(_ root: TreeNode?, _ p: TreeNode?, _ q: TreeNode?) -> TreeNode? {
        guard let root, let p, let q else { return nil }
        if root.val < p.val && root.val < q.val {
            return lowestCommonAncestor(root.left, p, q)
        } else if root.val > p.val && root.val > q.val {
            return lowestCommonAncestor(root.right, p, q)
        } else {
            return root
        }
    }
}

class UsualSolution {
    func lowestCommonAncestor(_ root: TreeNode?, _ p: TreeNode?, _ q: TreeNode?) -> TreeNode? {
        guard let root else { return nil }
        if root.val == p?.val { return p }
        if root.val == q?.val { return q }
        
        let left = lowestCommonAncestor(root.left, p, q)
        let right = lowestCommonAncestor(root.right, p, q)
        if left == nil { return right }
        if right == nil { return left }
        return root
    }
}