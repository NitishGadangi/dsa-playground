import Foundation

//https://leetcode.com/problems/diameter-of-binary-tree/

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
    var res: Int = 0
    func diameterOfBinaryTree(_ root: TreeNode?) -> Int {
        diameter(root: root)
        return res
    }
    
    func diameter(root: TreeNode?) -> Int {
        guard let root else { return 0 }
        let leftDepth = diameter(root: root.left)
        let rightDepth = diameter(root: root.right)
        let curDia = leftDepth + rightDepth // no need of +1 as we count edges not nodes
        res = max(res, curDia)
        return 1 + max(leftDepth, rightDepth)
    }
}
