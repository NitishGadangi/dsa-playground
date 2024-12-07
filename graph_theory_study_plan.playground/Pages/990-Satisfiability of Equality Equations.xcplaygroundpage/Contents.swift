import Foundation

//https://leetcode.com/problems/satisfiability-of-equality-equations/

class Solution {
    func equationsPossible(_ equations: [String]) -> Bool {
        var n = 26
        let uf = UnionFind(n: n)
        
        for eq in equations {
            if eq.contains("==") {
                let eqArr = Array(eq)
                uf.union(n1: eq.first!.asciiIdx, n2: eq.last!.asciiIdx)
            }
        }
        
        for eq in equations {
            if eq.contains("!=") {
                let eqArr = Array(eq)
                let p1 = uf.find(node: eqArr.first!.asciiIdx)
                let p2 = uf.find(node: eqArr.last!.asciiIdx)
                if p1 == p2 {
                    return false
                }
            }
        }
        
        return true
    }
}

extension Character {
    var asciiIdx: Int {
        return Int(self.asciiValue! - Character("a").asciiValue!)
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
    
    func find(node: Int) -> Int {
        let p = parent[node]
        if p == -1 {
            return node
        }
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
        if r1 >= r2 { // optimisation with rank
            parent[p2] = p1
            rank[p1] += r2
        } else {
            parent[p1] = p2
            rank[p2] += r1
        }
    }
}


