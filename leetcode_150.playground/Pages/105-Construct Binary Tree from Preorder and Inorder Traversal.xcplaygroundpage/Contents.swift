import Foundation

//https://leetcode.com/problems/construct-binary-tree-from-preorder-and-inorder-traversal/?envType=study-plan-v2&envId=top-interview-150

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
    private var inoMap: [Int: Int] = [:] //node - index
    private var curPre: Int = 0

    func buildTree(_ preorder: [Int], _ inorder: [Int]) -> TreeNode? {
        for (idx, item) in inorder.enumerated() {
            inoMap[item] = idx
        }
        let numOfNodes = inorder.count
        return buildTree(preorder: preorder, start: 0, end: numOfNodes - 1)
    }

    func buildTree(preorder: [Int], start: Int, end: Int) -> TreeNode? {
        guard start <= end else { return nil }
        let curVal = preorder[curPre]
        curPre += 1
        guard let inoIndex = inoMap[curVal] else { return nil }

        let node = TreeNode(curVal)
        node.left = buildTree(preorder: preorder, start: start, end: inoIndex - 1)
        node.right = buildTree(preorder: preorder, start: inoIndex + 1, end: end)
        return node
    }
}
