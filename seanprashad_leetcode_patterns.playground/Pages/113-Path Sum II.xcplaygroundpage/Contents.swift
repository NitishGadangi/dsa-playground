import Foundation

//https://leetcode.com/problems/path-sum-ii/

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
        traverse(root: root, rem: targetSum, temp: &temp, res: &res)
        return res
    }
    
    func traverse(root: TreeNode?, rem: Int, temp: inout [Int], res: inout [[Int]]) {
        guard let root else { return }
        var newRem = rem - root.val
        temp.append(root.val)
        if root.left == nil && root.right == nil && newRem == 0 {
            res.append(temp)
        }
        if let left = root.left {
            traverse(root: left, rem: newRem, temp: &temp, res: &res)
        }
        if let right = root.right {
            traverse(root: right, rem: newRem, temp: &temp, res: &res)
        }
        temp.removeLast()
    }
}
