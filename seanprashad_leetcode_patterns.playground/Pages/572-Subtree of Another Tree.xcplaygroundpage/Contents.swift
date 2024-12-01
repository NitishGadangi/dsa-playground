import Foundation

//https://leetcode.com/problems/subtree-of-another-tree/

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
        if root.val == subRoot.val && sameTree(first: root, second: subRoot) {
            return true
        }
        let left = isSubtree(root.left, subRoot)
        let right = isSubtree(root.right, subRoot)
        return left || right
    }
    
    func sameTree(first: TreeNode?, second: TreeNode?) -> Bool {
        if first == nil && second == nil { return true }
        guard let first, let second, first.val == second.val else { return false }
        let left = sameTree(first: first.left, second: second.left)
        let right = sameTree(first: first.right, second: second.right)
        return left && right
    }
}
