import Foundation

//https://leetcode.com/problems/construct-binary-tree-from-preorder-and-inorder-traversal/description/

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
    var inoMap: [Int: Int] = [:] //node.val -> idx
    var curPreIdx: Int = 0
    func buildTree(_ preorder: [Int], _ inorder: [Int]) -> TreeNode? {
        for (idx, num) in inorder.enumerated() {
            inoMap[num] = idx
        }
        curPreIdx = 0
        return divideAndConcur(preorder, start: 0, end: inorder.count - 1)
    }

    func divideAndConcur(_ preorder: [Int], start: Int, end: Int) -> TreeNode? {
        guard start <= end  else { return nil }
        let curVal = preorder[curPreIdx]
        curPreIdx += 1
        let curNode = TreeNode(curVal)
        let inoIdx = inoMap[curVal]!
        curNode.left = divideAndConcur(preorder, start: start, end: inoIdx - 1)
        curNode.right = divideAndConcur(preorder, start: inoIdx + 1, end: end)
        return curNode
    }
}
