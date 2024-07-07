import Foundation

//https://leetcode.com/problems/average-of-levels-in-binary-tree/description/?envType=study-plan-v2&envId=top-interview-150


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
    func averageOfLevels(_ root: TreeNode?) -> [Double] {
        guard let root else { return [] }
        var res: [Double] = []
        var queue: [TreeNode] = []
        queue.add(root)
        while queue.isNotEmpty {
            let levelSize = queue.count
            var levelSum: Int = 0
            for idx in 0..<levelSize {
                let curNode = queue.pop()
                levelSum += curNode.val
                if let leftNode = curNode.left {
                    queue.add(leftNode)
                }
                if let rightNode = curNode.right {
                    queue.add(rightNode)
                }
            }
            let levelAvg: Double = Double(levelSum) / Double(levelSize)
            res.append(levelAvg)
        }
        return res
    }
}

// Queue on Array
extension Array {
    var isNotEmpty: Bool {
        get {
            return isEmpty == false
        }
    }

    mutating func add(_ newElement: Element) {
        append(newElement)
    }

    mutating func pop() -> Element {
        return remove(at: 0)
    }
}

