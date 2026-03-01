import Foundation

//https://leetcode.com/problems/balanced-binary-tree/

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

    func isBalanced(_ root: TreeNode?) -> Bool {
        return dfs(root).1
    }

    func dfs(_ root: TreeNode?) -> (Int, Bool) {
        guard let root else { return (0, true) }
        let left = dfs(root.left)
        let right = dfs(root.right)
        let balanced = (left.1 && right.1) && abs(left.0 - right.0) <= 1
        return (1 + max(left.0, right.0), balanced)
    }
}
