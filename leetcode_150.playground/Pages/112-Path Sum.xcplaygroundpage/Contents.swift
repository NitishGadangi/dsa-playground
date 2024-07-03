import Foundation

//https://leetcode.com/problems/path-sum/?envType=study-plan-v2&envId=top-interview-150

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
        return possibleSum(node: root, rem: targetSum)
    }

    func possibleSum(node: TreeNode?, rem: Int) -> Bool {
        guard let node else { return false }
        var rem = rem - node.val
        if node.isLeaf && (rem == 0) {
            return true
        }
        let leftPath = possibleSum(node: node.left, rem: rem)
        let rightPath = possibleSum(node: node.right, rem: rem)
        return leftPath || rightPath
    }
}

extension TreeNode {
    var isLeaf: Bool {
        get {
            (left == nil) && (right == nil)
        }
    }
}
