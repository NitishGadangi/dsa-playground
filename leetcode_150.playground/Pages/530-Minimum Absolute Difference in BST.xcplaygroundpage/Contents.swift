import Foundation

//https://leetcode.com/problems/minimum-absolute-difference-in-bst/description/?envType=study-plan-v2&envId=top-interview-150

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
    var minVal: Int = Int.max
    var prevNodeVal: Int?
    func getMinimumDifference(_ root: TreeNode?) -> Int {
        guard let root else { return 0 }
        inOrder(root)
        return minVal
    }

    func inOrder(_ root: TreeNode?) {
        guard let root else { return }
        inOrder(root.left)
        if let prevNodeVal {
            let diff = abs(prevNodeVal - root.val)
            minVal = min(minVal, diff)
        }
        prevNodeVal = root.val
        inOrder(root.right)
    }
}
