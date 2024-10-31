import Foundation

//https://leetcode.com/problems/path-sum/

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
    func hasPathSum(_ root: TreeNode?, _ targetSum: Int) -> Bool {
        guard let root else { return false }
        let remSum = targetSum - root.val
        if remSum == 0 && root.left == nil && root.right == nil {
            return true
        }
        let left = hasPathSum(root.left, remSum)
        let right = hasPathSum(root.right, remSum)
        return left || right
    }
}
