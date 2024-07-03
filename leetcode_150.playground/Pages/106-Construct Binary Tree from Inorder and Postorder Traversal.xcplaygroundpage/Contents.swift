import Foundation

//https://leetcode.com/problems/construct-binary-tree-from-inorder-and-postorder-traversal/?envType=study-plan-v2&envId=top-interview-150

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
    var inoMap: [Int: Int] = [:] // nodeVal - index
    var curPost: Int = 0

    func buildTree(_ inorder: [Int], _ postorder: [Int]) -> TreeNode? {
        let numOfNodes = inorder.count
        for (idx, item) in inorder.enumerated() {
            inoMap[item] = idx
        }
        curPost = numOfNodes - 1
        return buildTree(postOrder: postorder, start: 0, end: numOfNodes - 1)
    }

    func buildTree(postOrder: [Int], start: Int, end: Int) -> TreeNode? {
        guard start <= end else { return nil }
        let curVal = postOrder[curPost]
        curPost -= 1
        guard let inoIdx = inoMap[curVal] else { return nil }

        let node = TreeNode(curVal)
        node.right = buildTree(postOrder: postOrder, start: inoIdx + 1, end: end)
        node.left = buildTree(postOrder: postOrder, start: start, end: inoIdx - 1)
        return node
    }
}
