import Foundation

// Auto-generated-page

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
    var count = 0
    var res: Int = -1
    func kthSmallest(_ root: TreeNode?, _ k: Int) -> Int {
        res = -1
        count = 0
        traverse(root, k)
        return res
    }

    func traverse(_ root: TreeNode?, _ target: Int) {
        guard let root else { return }
        traverse(root.left, target)
        count += 1
        if count == target {
            res = root.val
            return
        }
        traverse(root.right, target)
    }
}
