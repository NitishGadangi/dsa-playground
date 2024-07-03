import Foundation

//https://leetcode.com/problems/sum-root-to-leaf-numbers/description/?envType=study-plan-v2&envId=top-interview-150

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
    func sumNumbers(_ root: TreeNode?) -> Int {
        return calculateSum(node: root, prevNum: 0)
    }

    func calculateSum(node: TreeNode?, prevNum: Int) -> Int {
        guard let node else { return 0 }
        var curVal = (prevNum * 10) + node.val
        if node.isLeaf {
            return curVal
        }
        let leftVal = calculateSum(node: node.left, prevNum: curVal)
        let rightVal = calculateSum(node: node.right, prevNum: curVal)
        return leftVal + rightVal
    }
}

extension TreeNode {
    var isLeaf: Bool {
        get {
            (left == nil) && (right == nil)
        }
    }
}
