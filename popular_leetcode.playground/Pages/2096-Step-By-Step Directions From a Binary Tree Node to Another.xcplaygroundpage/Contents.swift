import Foundation

//https://leetcode.com/problems/step-by-step-directions-from-a-binary-tree-node-to-another

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
    func getDirections(_ root: TreeNode?, _ startValue: Int, _ destValue: Int) -> String {
        guard let root else { return "" }
        let lcaNode = getLCA(root: root, startValue: startValue, destValue: destValue)

        var startPath: [String] = []
        getPath(root: lcaNode, target: startValue, res: &startPath)
        startPath = Array(repeating: "U", count: startPath.count)

        var endPath: [String] = []
        getPath(root: lcaNode, target: destValue, res: &endPath)

        var res: [String] = []
        res.append(contentsOf: startPath)
        res.append(contentsOf: endPath)
        return res.joined(separator: "")
    }

    func getLCA(root: TreeNode?, startValue: Int, destValue: Int) -> TreeNode? {
        guard let root else { return nil }
        if (root.val == startValue) || (root.val == destValue) {
            return root
        }
        let left = getLCA(root: root.left, startValue: startValue, destValue: destValue)
        let right = getLCA(root: root.right, startValue: startValue, destValue: destValue)
        if left == nil { return right }
        if right == nil { return left }
        return root
    }

    func getPath(root: TreeNode?, target: Int, res: inout [String]) -> Bool {
        guard let root else { return false }
        if root.val == target { return true }

        res.append("L")
        let left = getPath(root: root.left, target: target, res: &res)
        if left { return true }
        res.removeLast()

        res.append("R")
        let right = getPath(root: root.right, target: target, res: &res)
        if right { return true }
        res.removeLast()

        return false
    }
}
