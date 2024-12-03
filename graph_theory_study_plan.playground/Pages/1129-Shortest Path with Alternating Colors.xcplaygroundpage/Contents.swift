import Foundation

//https://leetcode.com/problems/shortest-path-with-alternating-colors

class Solution {
    struct Node {
        let idx: Int
        let dist: Int
        let col: Int
        // 0 - any, 1 - red, 2 - blue
    }
    struct Edge {
        let idx: Int
        let col: Int
    }
    func shortestAlternatingPaths(_ n: Int, _ redEdges: [[Int]], _ blueEdges: [[Int]]) -> [Int] {
        var adjList: [[Edge]] = Array(repeating: [], count: n)
        for edge in redEdges {
            adjList[edge[0]].append(Edge(idx: edge[1], col: 1))
        }
        for edge in blueEdges {
            adjList[edge[0]].append(Edge(idx: edge[1], col: 2))
        }
        var queue: [Node] = [Node(idx: 0, dist: 0, col: 0)]
        var res = Array(repeating: -1, count: n)
        var vis: [String: Bool] = [:]
        while !queue.isEmpty {
            let curNode = queue.removeFirst()
            let extDist = res[curNode.idx]
            if extDist != -1 {
                res[curNode.idx] = min(extDist, curNode.dist)
            } else {
                res[curNode.idx] = curNode.dist
            }
            
            vis["\(curNode.idx)-\(curNode.col)"] = true
            for nbr in adjList[curNode.idx] {
                if nbr.col != curNode.col && vis["\(nbr.idx)-\(nbr.col)"] != true {
                    queue.append(Node(idx: nbr.idx, dist: curNode.dist + 1, col: nbr.col))
                }
            }
        }
        return res
    }
}
