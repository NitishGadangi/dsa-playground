import Foundation

//

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
    var visited: Set<Int> = []
    var res: [Int] = []
    func distanceK(_ root: TreeNode?, _ target: TreeNode?, _ k: Int) -> [Int] {
        guard let root, let target else { return [] }
        buildGraph(root: root, parent: nil)
        dfs(node: target.val, dist: 0, k: k)
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
    
    func dfs(node: Int, dist: Int, k: Int) {
        guard !visited.contains(node), let adj = adjList[node] else { return }
        visited.insert(node)
        if dist == k {
            res.append(node)
        }
        for nbr in adj {
            dfs(node: nbr, dist: dist + 1, k: k)
        }
    }
}
