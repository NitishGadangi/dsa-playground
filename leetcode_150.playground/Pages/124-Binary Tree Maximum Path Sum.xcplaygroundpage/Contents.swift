import Foundation

//https://leetcode.com/problems/binary-tree-maximum-path-sum/description/?envType=study-plan-v2&envId=top-interview-150

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
    var maxSum: Int = Int.min

    func maxPathSum(_ root: TreeNode?) -> Int {
        guard let root else { return 0 }
        findMaxSum(node: root)
        return maxSum
    }

    func findMaxSum(node: TreeNode?) -> Int {
        guard let node else { return 0 }
        
        let curVal = node.val

        var leftMaxSum = findMaxSum(node: node.left)
        leftMaxSum = max(leftMaxSum, 0)
        var rightMaxSum = findMaxSum(node: node.right)
        rightMaxSum = max(rightMaxSum, 0)
        
        maxSum = max(maxSum, leftMaxSum + rightMaxSum + curVal)

        return max(leftMaxSum, rightMaxSum) + curVal
    }
}
