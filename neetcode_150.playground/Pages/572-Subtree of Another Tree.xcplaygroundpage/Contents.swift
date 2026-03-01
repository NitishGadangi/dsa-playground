import Foundation

//https://leetcode.com/problems/subtree-of-another-tree/description/

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
    func isSubtree(_ root: TreeNode?, _ subRoot: TreeNode?) -> Bool {
        if root == nil && subRoot == nil { return true }
        guard let root, let subRoot else { return false }
        if (root.val == subRoot.val)  && sameTree(root, subRoot) {
            return true
        }
        let left = isSubtree(root.left, subRoot)
        let right = isSubtree(root.right, subRoot)
        return left || right
    }

    func sameTree(_ t1: TreeNode?, _ t2: TreeNode?) -> Bool {
        if t1 == nil && t2 == nil { return true }
        guard let t1, let t2 else { return false }
        guard t1.val == t2.val else { return false }
        let left = sameTree(t1.left, t2.left)
        let right = sameTree(t1.right, t2.right)
        return left && right
    }
}
