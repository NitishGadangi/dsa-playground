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
    var preIdx = 0
    var inoMap: [Int: Int] = [:]
    func buildTree(_ preorder: [Int], _ inorder: [Int]) -> TreeNode? {
        for (idx, val) in inorder.enumerated() {
            inoMap[val] = idx
        }
        return build(preOrder: preorder, start: 0, end: inorder.count - 1)
    }
    
    func build(preOrder: [Int], start: Int, end: Int) -> TreeNode? {
        guard start <= end else { return nil }
        let nodeVal = preOrder[preIdx]
        preIdx += 1
        guard let inoIdx = inoMap[nodeVal] else { return nil }
        let curNode = TreeNode(nodeVal)
        curNode.left = build(preOrder: preOrder, start: start, end: inoIdx - 1)
        curNode.right = build(preOrder: preOrder, start: inoIdx + 1, end: end)
        return curNode
    }
}
