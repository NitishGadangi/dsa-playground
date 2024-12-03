import Foundation

//https://leetcode.com/problems/number-of-provinces

class Solution {
    func findCircleNum(_ isConnected: [[Int]]) -> Int {
        let n = isConnected.count
        guard n > 0 else { return 0 }
        let uf = UnionFind(n: isConnected.count)
        for i in 0..<n {
            for j in (i + 1)..<n {
                if isConnected[i][j] == 1 {
                    uf.union(n1: i, n2: j)
                }
            }
        }
        var res: Int = 0
        for par in uf.parent {
            if par == -1 {
                res += 1
            }
        }
        return res
    }
}

class UnionFind {
    let count: Int
    var parent: [Int]
    var rank: [Int]
    
    init(n: Int) {
        self.count = n
        self.parent = Array(repeating: -1, count: n)
        self.rank = Array(repeating: 1, count: n)
    }
    
    func find(_ node: Int) -> Int {
        let p = parent[node]
        if p == -1 { return node }
        let res = find(p)
        parent[node] = res
        return res
    }
    
    func union(n1: Int, n2: Int) {
        let p1 = find(n1)
        let p2 = find(n2)
        guard p1 != p2 else { return }
        let r1 = rank[p1]
        let r2 = rank[p2]
        if r1 > r2 {
            parent[p2] = p1
            rank[r1] += r2
        } else {
            parent[p1] = p2
            rank[r2] += r1
        }
    }
}
