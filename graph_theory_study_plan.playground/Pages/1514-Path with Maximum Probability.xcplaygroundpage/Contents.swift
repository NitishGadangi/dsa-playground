import Foundation

//https://leetcode.com/problems/path-with-maximum-probability/

class Solution {
    func maxProbability(_ n: Int, _ edges: [[Int]], _ succProb: [Double], _ start_node: Int, _ end_node: Int) -> Double {
        var dist: [Double] = Array(repeating: 0, count: n)
        dist[start_node] = 1.0
        for _ in 0..<n {
            var hasUpdate = false
            for (idx, ed) in edges.enumerated() {
                let from = ed[0]
                let to = ed[1]
                let prob = succProb[idx]
                let toDist = dist[from] * prob
                if toDist > dist[to] {
                    dist[to] = toDist
                    hasUpdate = true
                }
                let fromDist = dist[to] * prob
                if fromDist > dist[from] {
                    dist[from] = fromDist
                    hasUpdate = true
                }
            }
            if !hasUpdate {
                break
            }
        }
        
        return dist[end_node] == Double(Int.min) ? 0 : dist[end_node]
    }
}
