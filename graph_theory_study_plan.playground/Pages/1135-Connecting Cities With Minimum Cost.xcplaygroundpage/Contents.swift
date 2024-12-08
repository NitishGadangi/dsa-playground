import Foundation

//https://leetcode.com/problems/connecting-cities-with-minimum-cost

class Solution {
    func minimumCost(_ n: Int, _ connections: [[Int]]) -> Int {
        guard connections.count >= (n - 1) else { return -1 }
        var sortedCons = connections.sorted { l, r in
            l[2] < r[2]
        }
        let dsu = UnionFind(n)
        var res = 0
        var edgesUsed = 0
        for con in sortedCons {
            let from = con[0] - 1
            let to = con[1] - 1
            let wt = con[2]
            if dsu.union(from, to) {
                edgesUsed += 1
                res += wt
                if edgesUsed == n - 1 { break }
            }
        }
        return edgesUsed == n - 1 ? res : -1
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
