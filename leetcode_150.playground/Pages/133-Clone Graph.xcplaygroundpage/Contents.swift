import Foundation

//https://leetcode.com/problems/clone-graph/?envType=study-plan-v2&envId=top-interview-150

public class Node {
    public var val: Int
    public var neighbors: [Node?]
    public init(_ val: Int) {
        self.val = val
        self.neighbors = []
    }
}

class Solution {
    func cloneGraph(_ node: Node?) -> Node? {
        guard let node else { return nil }
        var cloneMap: [Int:Node] = [:]
        return dfs(node, &cloneMap)
    }

    private func dfs(_ node: Node, _ cloneMap: inout [Int:Node]) -> Node {
        let newNode = Node(node.val)
        cloneMap[node.val] = newNode

        for nbr in node.neighbors {
            guard let nbr else { continue }
            var newNbr: Node? = cloneMap[nbr.val]
            if newNbr == nil {
                newNbr = dfs(nbr, &cloneMap)
            }
            newNode.neighbors.append(newNbr)
        }
        return newNode
    }
}
