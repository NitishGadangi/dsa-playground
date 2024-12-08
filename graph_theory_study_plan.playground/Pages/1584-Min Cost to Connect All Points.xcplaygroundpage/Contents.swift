import Foundation

//https://leetcode.com/problems/min-cost-to-connect-all-points/

class Solution {
    func minCostConnectPoints(_ points: [[Int]]) -> Int {
        var edges: [[Int]] = []
        let nPoints = points.count
        for i in 0..<nPoints {
            for j in (i + 1)..<nPoints {
                let fromX = points[i][0]
                let fromY = points[i][1]
                let toX = points[j][0]
                let toY = points[j][1]
                let dis = abs(fromX - toX) + abs(fromY - toY)
                edges.append([i, j, dis])
            }
        }
        edges = edges.sorted(by: { l, r in
            l[2] < r[2]
        })
        var res = 0
        var edgCount = 0
        let dsu = UnionFind(nPoints)
        for ed in edges {
            let from = ed[0]
            let to = ed[1]
            let wt = ed[2]
            if dsu.union(from, to) {
                res += wt
                edgCount += 1
                if edgCount == nPoints - 1 {
                    break
                }
            }
        }
        return edgCount == nPoints - 1 ? res : -1
    }
}

class UnionFind {
    private let count: Int
    private var parent: [Int]
    private var rank: [Int]

    init(_ count: Int) {
        self.count = count
        parent = Array(repeating: -1, count: count)
        rank = Array(repeating: 1, count: count)
    }

    func find(_ node: Int) -> Int {
        let p = parent[node]
        if p == -1 {
            return node
        }
        let res = find(p)
        parent[node] = res // path compression
        return res
    }

    func union(_ node1: Int, _ node2: Int) -> Bool {
        let p1 = find(node1)
        let p2 = find(node2)
        guard p1 != p2 else { return false }
        let r1 = rank[p1]
        let r2 = rank[p2]

        // union by rank
        if r1 > r2 {
            parent[p2] = p1
            rank[p1] += rank[p2]
        } else {
            parent[p1] = p2
            rank[p2] += rank[p1]
        }

        return true
    }
}

