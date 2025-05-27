import Foundation

//https://leetcode.com/problems/network-delay-time/description/

class Solution {
    func networkDelayTime(_ times: [[Int]], _ n: Int, _ k: Int) -> Int {
        let dists = bellmanFordShortestDist(edges: times, n: n, src: k)
        var res: Int = 0
        for idx in 1...n {
            if dists[idx] == Int.max { return -1 }
            res = max(res, dists[idx])
        }
        return res
    }

    func bellmanFordShortestDist(edges: [[Int]], n: Int, src: Int) -> [Int] {
        // considering edges from 1...n
        var dist: [Int] = Array(repeating: Int.max, count: n + 1)
        dist[src] = 0

        // relax edges for v - 1 times
        for _ in 0..<n-1 {
            for edge in edges {
                let from = edge[0]
                let to = edge[1]
                let wt = edge[2]
                if dist[from] != Int.max && (dist[from] + wt < dist[to]) {
                    dist[to] = dist[from] + wt
                }
            }
        }

        // check for negative weight cycle
        for edge in edges {
            let from = edge[0]
            let to = edge[1]
            let wt = edge[2]
            if dist[from] != Int.max && (dist[from] + wt < dist[to]) {
                return Array(repeating: Int.max, count: n + 1)
            }
        }
        return dist
    }
}
