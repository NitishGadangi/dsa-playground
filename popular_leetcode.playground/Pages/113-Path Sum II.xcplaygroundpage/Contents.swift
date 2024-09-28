import Foundation

//https://leetcode.com/problems/path-sum-ii

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
    func pathSum(_ root: TreeNode?, _ targetSum: Int) -> [[Int]] {
        var res: [[Int]] = []
        var temp: [Int] = []
        traverse(node: root, rem: targetSum, temp: temp, res: &res)
        return res
    }
    
    func traverse(node: TreeNode?, rem: Int, temp: [Int], res: inout [[Int]]) {
        guard let node else { return }
        var temp = temp
        temp.append(node.val)
        var rem = rem - node.val
        if node.left == nil && node.right == nil && rem == 0 { // leaf node
            res.append(temp)
            return
        }
        traverse(node: node.left, rem: rem, temp: temp, res: &res)
        traverse(node: node.right, rem: rem, temp: temp, res: &res)
    }
}
