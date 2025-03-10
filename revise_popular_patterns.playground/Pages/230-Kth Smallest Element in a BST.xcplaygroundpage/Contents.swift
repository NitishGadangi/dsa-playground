import Foundation

//https://leetcode.com/problems/kth-smallest-element-in-a-bst/

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
    var res: Int = -1
    func kthSmallest(_ root: TreeNode?, _ k: Int) -> Int {
        traverse(root: root, target: k)
        return res
    }

    func traverse(root: TreeNode?, target: Int) {
        guard let root else { return }
        traverse(root: root.left, target: target)
        count += 1
        if count == target {
            res = root.val
        }
        traverse(root: root.right, target: target)
    }
}
