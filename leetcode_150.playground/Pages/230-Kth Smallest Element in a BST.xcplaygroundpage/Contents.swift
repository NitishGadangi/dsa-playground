import Foundation

//https://leetcode.com/problems/kth-smallest-element-in-a-bst/?envType=study-plan-v2&envId=top-interview-150

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
    var inOrderRes: [Int] = []
    func kthSmallest(_ root: TreeNode?, _ k: Int) -> Int {
        traverseInorder(root)
        return inOrderRes[k - 1]
    }

    func traverseInorder(_ root: TreeNode?) {
        guard let root else { return }
        traverseInorder(root.left)
        inOrderRes.append(root.val)
        traverseInorder(root.right)
    }
}
