import Foundation

//https://leetcode.com/problems/kth-smallest-element-in-a-bst/description/

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
    var count: Int = 0
    var res: Int? = nil
    func kthSmallest(_ root: TreeNode?, _ k: Int) -> Int {
        count = k
        traverse(root)
        return res ?? -1
    }

    func traverse(_ root: TreeNode?) {
        guard let root else { return }
        traverse(root.left)
        count -= 1
        if count == 0 {
            res = root.val
        }
        traverse(root.right)
    }
}
