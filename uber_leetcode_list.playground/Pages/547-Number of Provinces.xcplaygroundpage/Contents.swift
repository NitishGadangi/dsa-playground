import Foundation

// https://leetcode.com/problems/number-of-provinces/

class Solution {
    func findCircleNum(_ isConnected: [[Int]]) -> Int {
        let size = isConnected.count
        let uf = UnionFind(size)
        for r in 0..<size {
            for c in 0..<size {
                if isConnected[r][c] == 1 {
                    uf.union(r, c)
                }
            }
        }
        return uf.noOfParents
    }
}

class UnionFind {
    private var parent: [Int]
    private var rank: [Int]
    var noOfParents : Int {
        parent.count { $0 == -1 }
    }

    init(_ size: Int) {
        self.parent = Array(repeating: -1, count: size)
        self.rank = Array(repeating: 1, count: size)
    }

    func find(_ x: Int) -> Int {
        let p = parent[x]
        if p == -1 { return x }
        let res = find(p)
        parent[x] = res
        return res
    }

    @discardableResult
    func union(_ x1: Int, _ x2: Int) -> Bool {
        let p1 = find(x1)
        let p2 = find(x2)
        if p1 == p2 { return false }
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
