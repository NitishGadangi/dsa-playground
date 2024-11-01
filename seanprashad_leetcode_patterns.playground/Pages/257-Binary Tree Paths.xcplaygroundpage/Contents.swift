import Foundation

//https://leetcode.com/problems/binary-tree-paths/description/

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
    func binaryTreePaths(_ root: TreeNode?) -> [String] {
        var res: [String] = []
        traverse(root: root, curPath: "", res: &res)
        return res
    }
    
    func traverse(root: TreeNode?, curPath: String, res: inout [String]) {
        guard let root else { return }
        let newPath = curPath + (curPath.isEmpty ? "\(root.val)" : "->(root.val)")
        if root.left == nil && root.right == nil {
            res.append(newPath)
            return
        }
        traverse(root: root.left, curPath: newPath, res: &res)
        traverse(root: root.right, curPath: newPath, res: &res)
    }
}
