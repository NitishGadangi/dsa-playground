import Foundation

//https://leetcode.com/problems/all-nodes-distance-k-in-binary-tree

public class TreeNode {
    public var val: Int
    public var left: TreeNode?
    public var right: TreeNode?
    public init(_ val: Int) {
        self.val = val
        self.left = nil
        self.right = nil
    }
}
 
class Solution {
    var adjList: [Int: [Int]] = [:]
    func distanceK(_ root: TreeNode?, _ target: TreeNode?, _ k: Int) -> [Int] {
        guard let root, let target else { return [] }
        buildGraph(root: root, parent: nil)
        var vis: [Int: Bool] = [:]
        var res: [Int] = []
        var dist: Int = 0
        var queue: [Int] = [target.val]
        while !queue.isEmpty {
            let count = queue.count
            for _ in 0..<count {
                let cur = queue.removeFirst()
                if dist == k {
                    res.append(cur)
                }
                if dist > k {
                    break
                }
                vis[cur] = true
                for nbr in adjList[cur, default: []] {
                    if !vis[nbr, default: false] {
                        queue.append(nbr)
                    }
                }
            }
            dist += 1
        }
        return res
    }
    
    func buildGraph(root: TreeNode?, parent: TreeNode?) {
        guard let root else { return }
        let curVal = root.val
        if adjList[root.val] == nil {
            adjList[curVal] = []
        }
        if let parVal = parent?.val {
            adjList[curVal]?.append(parVal)
        }
        if let leftNode = root.left {
            adjList[curVal]?.append(leftNode.val)
            buildGraph(root: leftNode, parent: root)
        }
        if let rightNode = root.right {
            adjList[curVal]?.append(rightNode.val)
            buildGraph(root: rightNode, parent: root)
        }
    }
}
