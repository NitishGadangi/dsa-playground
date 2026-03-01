import Foundation

//https://leetcode.com/problems/count-good-nodes-in-binary-tree/

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
    func goodNodes(_ root: TreeNode?) -> Int {
        return traverse(root, maxVal: Int.min)
    }

    func traverse(_ root: TreeNode?, maxVal: Int) -> Int {
        guard let root else { return 0 }
        let isGoodNode = root.val >= maxVal
        var maxVal = max(maxVal, root.val)
        let left = traverse(root.left, maxVal: maxVal)
        let right = traverse(root.right, maxVal: maxVal)
        return (isGoodNode ? 1 : 0) + left + right
    }
}
