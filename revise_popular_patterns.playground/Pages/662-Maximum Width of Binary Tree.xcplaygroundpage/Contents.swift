import Foundation

//https://leetcode.com/problems/maximum-width-of-binary-tree/

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

    struct BSTNode {
        let node: TreeNode
        let idx: Int

        func left() -> BSTNode? {
            guard let leftNode = node.left else { return nil }
            return BSTNode(node: leftNode, idx: 2 * idx)
        }

        func right() -> BSTNode? {
            guard let rightNode = node.right else { return nil }
            return BSTNode(node: rightNode, idx: 2 * idx + 1)
        }
    }

    // for given node n (n > 1)
    // idx of left item = 2n
    // idx of right item = 2n + 1
    func widthOfBinaryTree(_ root: TreeNode?) -> Int {
        guard let root else { return 0 }
        var res: Int = 0
        var queue: [BSTNode] = [BSTNode(node: root, idx: 1)]
        while !queue.isEmpty {
            let levelSize = queue.count
            let start = queue[0].idx
            let end = queue[levelSize - 1].idx
            res = max(res, end - start + 1)
            for _ in 0..<levelSize {
                let cur = queue.removeFirst()
                if let left = cur.left() {
                    queue.append(left)
                }
                if let right = cur.right() {
                    queue.append(right)
                }
            }
        }
        return res
    }
}
