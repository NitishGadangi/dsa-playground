import Foundation

//https://leetcode.com/problems/symmetric-tree/?envType=study-plan-v2&envId=top-interview-150

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
    func isSymmetric(_ root: TreeNode?) -> Bool {
        return isSymmetricRecurr(first: root?.left, second: root?.right)
    }

    func isSymmetricRecurr(first: TreeNode?, second: TreeNode?) -> Bool {
        if (first == nil) && (second == nil) { return true }
        guard first?.val == second?.val else { return false }
        let firstLeftSecondRight = isSymmetricRecurr(first: first?.left, second: second?.right)
        let firstRightSecondLeft = isSymmetricRecurr(first: first?.right, second: second?.left)
        return firstLeftSecondRight && firstRightSecondLeft
    }
}
