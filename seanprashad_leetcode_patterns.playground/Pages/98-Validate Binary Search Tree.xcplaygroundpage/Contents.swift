import Foundation

//https://leetcode.com/problems/validate-binary-search-tree/

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
    var prev: Int = Int.min
    func isValidBST(_ root: TreeNode?) -> Bool {
        guard let root else { return true }
        let left = isValidBST(root.left)
        let cur = prev < root.val
        prev = root.val
        let right = isValidBST(root.right)
        return left && cur && right
    }
}
