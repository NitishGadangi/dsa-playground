import Foundation

// https://leetcode.com/problems/evaluate-division/

class Solution {
    struct WtNode {
        let node: String
        let wt: Double
    }
    var visited: [String: Bool] = [:]
    func calcEquation(_ equations: [[String]], _ values: [Double], _ queries: [[String]]) -> [Double] {
        var adjList: [String: [WtNode]] = [:]
        for (idx, eq) in equations.enumerated() {
            let num = eq[0]
            let den = eq[1]
            let wt = values[idx]
            adjList[num, default: []].append(WtNode(node: den, wt: wt))
            adjList[den, default: []].append(WtNode(node: num, wt: 1/wt))
        }
        var res = [Double]()
        for q in queries {
            visited = [:]
            let cur = dfs(adjList, src: q[0], target: q[1])
            res.append(cur)
        }
        return res
    }

    func dfs(_ adj: [String: [WtNode]], src: String, target: String) -> Double {
        if visited[src, default: false] { return -1 }
        let adjKeys = adj.keys
        guard adjKeys.contains(src) && adjKeys.contains(target) else { return -1 }
        if src == target { return 1 }
        visited[src] = true
        for nbr in adj[src]! {
            let dist = dfs(adj, src: nbr.node, target: target)
            if dist != -1 {
                return dist * nbr.wt
            }
        }
        return -1.0
    }
}
