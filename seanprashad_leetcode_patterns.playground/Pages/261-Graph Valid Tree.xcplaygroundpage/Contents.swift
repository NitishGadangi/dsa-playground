import Foundation

//https://leetcode.com/problems/graph-valid-tree/

class Solution {
    func validTree(_ n: Int, _ edges: [[Int]]) -> Bool {
        let uf = UnionFind(n: n)
        
        for edge in edges {
            let union = uf.union(n1: edge[0], n2: edge[1])
            if !union { return false }
        }
        return uf.numOfParents == 1
    }
    
}

class UnionFind {
    let count: Int
    var parent: [Int]
    var rank: [Int]
    
    var numOfParents: Int {
        var count = 0
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
    
    func union(n1: Int, n2: Int) -> Bool {
        let p1 = find(node: n1)
        let p2 = find(node: n2)
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

let tes = Solution().validTree(5, [[0,1],[1,2],[2,3],[1,3],[1,4]])
