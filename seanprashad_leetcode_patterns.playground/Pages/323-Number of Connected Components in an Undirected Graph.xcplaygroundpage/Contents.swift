import Foundation

//https://leetcode.com/problems/number-of-connected-components-in-an-undirected-graph/

class Solution {
    func countComponents(_ n: Int, _ edges: [[Int]]) -> Int {
        let uf = UnionFind(n: n)
        for egde in edges {
            uf.union(n1: egde[0], n2: egde[1])
        }
        return uf.numOfParents
    }
}

class UnionFind {
    let count: Int
    var parent: [Int]
    var rank: [Int]
    
    var numOfParents: Int {
        var count: Int = 0
        for par in parent {
            if par == -1 {
                count += 1
            }
        }
        return count
    }
    
    init(n: Int) {
        self.count = n
        self.parent = Array(repeating: -1, count: n)
        self.rank = Array(repeating: 1, count: n)
    }
    
    func find(node: Int) -> Int {
        let p = parent[node]
        if p == -1 { return node }
        let res = find(node: p)
        parent[node] = res // path compression
        return res
    }
    
    func union(n1: Int, n2: Int) {
        let p1 = find(node: n1)
        let p2 = find(node: n2)
        guard p1 != p2 else { return }
        let r1 = rank[p1]
        let r2 = rank[p2]
        if r1 > r2 {
            parent[p2] = p1
            rank[p1] += r2
        } else {
            parent[p1] = p2
            rank[p2] += r1
        }
    }
}
