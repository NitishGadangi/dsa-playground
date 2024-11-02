import Foundation

//https://leetcode.com/problems/delete-nodes-and-return-forest/

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
    func delNodes(_ root: TreeNode?, _ to_delete: [Int]) -> [TreeNode?] {
        guard let root else { return [] }
        var deleteSet = Set<Int>(to_delete)

        var res: [TreeNode?] = []
        var queue: [TreeNode] = []
        queue.append(root)

        while !queue.isEmpty {
            let curNode = queue.removeFirst()

            if let leftNode = curNode.left {
                queue.append(leftNode)
                if deleteSet.contains(leftNode.val) {
                    curNode.left = nil
                }
            }

            if let rightNode = curNode.right {
                queue.append(rightNode)
                if deleteSet.contains(rightNode.val) {
                    curNode.right = nil
                }
            }

            if deleteSet.contains(curNode.val) {
                if let leftNode = curNode.left {
                    res.append(leftNode)
                }
                if let rightNode = curNode.right {
                    res.append(rightNode)
                }
            }
        }


        if !deleteSet.contains(root.val) {
            res.append(root)
        }

        return res
    }
}

class SolutionRec {

    var res: [TreeNode?] = []
    func delNodes(_ root: TreeNode?, _ to_delete: [Int]) -> [TreeNode?] {
        var deleteSet = Set<Int>(to_delete)
        var root = traverse(node: root, deleteSet: deleteSet)

        if let root {
            res.append(root)
        }

        return res
    }

    func traverse(node: TreeNode?, deleteSet: Set<Int>) -> TreeNode? {
        guard let node else { return nil }

        node.left = traverse(node: node.left, deleteSet: deleteSet)
        node.right = traverse(node: node.right, deleteSet: deleteSet)

        if deleteSet.contains(node.val) {
            if let leftNode = node.left {
                res.append(leftNode)
            }
            if let rightNode = node.right {
                res.append(rightNode)
            }
            return nil
        }

        return node
    }
}
