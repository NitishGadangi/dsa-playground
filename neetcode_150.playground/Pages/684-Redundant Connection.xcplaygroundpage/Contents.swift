import Foundation

//https://leetcode.com/problems/redundant-connection/description/

class Solution {
    func findRedundantConnection(_ edges: [[Int]]) -> [Int] {
        let uf = UnionFind(count: edges.count + 1)
        for edg in edges {
            if !uf.union(node1: edg[0], node2: edg[1]) {
                return [edg[0], edg[1]]
            }
        }
        return []
    }
}

class UnionFind {
    var parent: [Int]
    var rank: [Int]
    var noOfParents: Int {
        parent.count { $0 == -1 }
    }

    init(count: Int) {
        parent = Array(repeating: -1, count: count)
        rank = Array(repeating: 1, count: count)
    }

    func find(node: Int) -> Int {
        if parent[node] == -1 {
            return node
        }
        let p = find(node: parent[node])
        parent[node] = p
        return p
    }

    func union(node1: Int, node2: Int) -> Bool {
        let p1 = find(node: node1)
        let p2 = find(node: node2)
        guard p1 != p2 else { return false }
        let r1 = rank[p1]
        let r2 = rank[p2]
        if r1 > r2 {
            parent[p2] = p1
            rank[p1] += r2
        } else {
            parent[p1] = p2
            rank[p2] += r1
        }
        return true
    }
}
