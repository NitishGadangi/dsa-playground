import Foundation

//https://leetcode.com/problems/validate-binary-search-tree/?envType=study-plan-v2&envId=top-interview-150

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
    var prevNodeVal = Int.min
    func isValidBST(_ root: TreeNode?) -> Bool {
        guard let root else { return true }
        let leftRes = isValidBST(root.left)
        let curRes = prevNodeVal < root.val
        prevNodeVal = root.val
        let rightRes = isValidBST(root.right)
        return leftRes && curRes && rightRes
    }
}
