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
    var inorder: [Int] = []
    func kthSmallest(_ root: TreeNode?, _ k: Int) -> Int {
        traverseInorder(root: root)
        guard inorder.count >= k else { return -1 }
        return inorder[k - 1]
    }
    
    func traverseInorder(root: TreeNode?) {
        guard let root else { return }
        traverseInorder(root: root.left)
        inorder.append(root.val)
        traverseInorder(root: root.right)
    }
}
