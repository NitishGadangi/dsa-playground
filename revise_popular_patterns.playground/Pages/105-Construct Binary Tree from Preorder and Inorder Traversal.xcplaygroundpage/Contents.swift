import Foundation

//https://leetcode.com/problems/construct-binary-tree-from-preorder-and-inorder-traversal/

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
    // use preOrder for values
    // inorder to track the tree parts and return nil when reached to end
    var preIdx: Int = 0
    var inoMap: [Int: Int] = [:]
    func buildTree(_ preorder: [Int], _ inorder: [Int]) -> TreeNode? {
        for (idx, val) in inorder.enumerated() {
            inoMap[val] = idx
        }
        return traverse(preorder: preorder, start: 0, end: inorder.count - 1)
    }

    func traverse(preorder: [Int], start: Int, end: Int) -> TreeNode? {
        guard start <= end else { return nil }
        let nodeVal = preorder[preIdx]
        preIdx += 1
        let node = TreeNode(nodeVal)
        let inoIdx = inoMap[nodeVal]!
        node.left = traverse(preorder: preorder, start: start, end: inoIdx - 1)
        node.right = traverse(preorder: preorder, start: inoIdx + 1, end: end)
        return node
    }
}

let res = Solution().buildTree([3,9,20,15,7], [9,3,15,20,7])
