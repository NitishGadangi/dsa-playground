import Foundation

//https://leetcode.com/problems/lowest-common-ancestor-of-a-binary-tree/?envType=study-plan-v2&envId=top-interview-150

public class TreeNode {
    public var val: Int
    public var left: TreeNode?
    public var right: TreeNode?
    public init(_ val: Int) {
        self.val = val
        self.left = nil
        self.right = nil
    }
}

class Solution {
    func lowestCommonAncestor(_ root: TreeNode?, _ p: TreeNode?, _ q: TreeNode?) -> TreeNode? {
        guard let root else { return nil }
        if (root.val == p?.val) || (root.val == q?.val) {
            return root
        }
        let leftLCA = lowestCommonAncestor(root.left, p, q)
        let rightLCA = lowestCommonAncestor(root.right, p, q)
        if leftLCA == nil {
            return rightLCA
        }
        if rightLCA == nil {
            return leftLCA
        }
        return root
    }
}

class AlternateSolution {
    var lca: TreeNode? = nil
    func lowestCommonAncestor(_ root: TreeNode?, _ p: TreeNode?, _ q: TreeNode?) -> TreeNode? {
        findLCA(root: root, leftTarget: p, rightTarget: q)
        return lca
    }

    func findLCA(root: TreeNode?, leftTarget: TreeNode?,  rightTarget: TreeNode?) -> Bool {
        guard let root else { return false }
        let isRootTarget = (root.val == leftTarget?.val) || (root.val == rightTarget?.val)
        let leftLCA = findLCA(root: root.left, leftTarget: leftTarget, rightTarget: rightTarget)
        let rightLCA = findLCA(root: root.right, leftTarget: leftTarget, rightTarget: rightTarget)
        print("\(root.val) - left \(leftLCA), right - \(rightLCA)")
        if (leftLCA && rightLCA) || (isRootTarget && (leftLCA || rightLCA)) {
            lca = root
        }
        return leftLCA || rightLCA || isRootTarget
    }
}
