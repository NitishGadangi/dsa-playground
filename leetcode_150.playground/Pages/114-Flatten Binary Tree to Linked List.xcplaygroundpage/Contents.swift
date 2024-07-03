import Foundation

//https://leetcode.com/problems/flatten-binary-tree-to-linked-list/?envType=study-plan-v2&envId=top-interview-150

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
    func flatten(_ root: TreeNode?) {
        guard let root else { return }
        var preOrderNode: [TreeNode] = []
        var stack: [TreeNode] = []
        stack.push(root)

        // preOrder traversal
        while stack.isNotEmpty {
            let cur = stack.pop()
            preOrderNode.append(cur)
            if let rightNode = cur.right {
                stack.push(rightNode)
            }
            if let leftNode = cur.left {
                stack.push(leftNode)
            }
        }

        //connect
        for idx in stride(from: 1, to: preOrderNode.count, by: 1) {
            let prevNode = preOrderNode[idx - 1]
            let curNode = preOrderNode[idx]
            prevNode.left = nil
            prevNode.right = curNode
        }
    }
}

//stack
extension Array {
    var isNotEmpty: Bool {
        get {
            return !isEmpty
        }
    }

    mutating func push(_ ele: Element) {
        append(ele)
    }

    mutating func pop() -> Element {
        return remove(at: count - 1)
    }
}
