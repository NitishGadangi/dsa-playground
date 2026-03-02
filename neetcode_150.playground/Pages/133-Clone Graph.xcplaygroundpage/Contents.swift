import Foundation

//https://leetcode.com/problems/clone-graph/description/

public class Node {
    public var val: Int
    public var neighbors: [Node?]
    public init(_ val: Int) {
        self.val = val
        self.neighbors = []
    }
}

class Solution {
    var nodeMap: [Int: Node] = [:]
    func cloneGraph(_ node: Node?) -> Node? {
        nodeMap = [:]
        return dfs(node)
    }

    func dfs(_ node: Node?) -> Node? {
        guard let node else { return nil }
        let newNode = Node(node.val)
        nodeMap[node.val] = newNode

        for nbr in node.neighbors {
            guard let nbr else { continue }
            let newNbr = nodeMap[nbr.val] ?? dfs(nbr)
            newNode.neighbors.append(newNbr)
        }
        return newNode
    }
}
