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
    //If the index of a parent node is Ci, accordingly we can define the index of its left child node as 2⋅Ci and the index of its right child node as 2⋅Ci + 1.
    struct BFSItem {
        let node: TreeNode
        let idx: Int
    }
    func widthOfBinaryTree(_ root: TreeNode?) -> Int {
        guard let root else { return 0 }
        var res: Int = 0
        let rootItem = BFSItem(node: root, idx: 1)
        var queue: [BFSItem] = [rootItem]
        while !queue.isEmpty {
            var start: Int = queue.first!.idx
            var end: Int = start
            var levelCnt = queue.count
            for _ in 0..<levelCnt {
                let curItem = queue.removeFirst()
                let curNode = curItem.node
                end = curItem.idx
                if let leftNode = curNode.left {
                    queue.append(BFSItem(node: leftNode, idx: 2 * end))
                }
                if let rightNode = curNode.right {
                    queue.append(BFSItem(node: rightNode, idx: 2 * end + 1))
                }
            }
            res = max(res, end - start + 1)
        }
        return res
    }
}
