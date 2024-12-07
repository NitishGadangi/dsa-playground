import Foundation

//https://leetcode.com/problems/lexicographically-smallest-equivalent-string

class Solution {
    func smallestEquivalentString(_ s1: String, _ s2: String, _ baseStr: String) -> String {
        let n = 26
        let uf = UnionFind(n: n)
        for idx in 0..<s1.count {
            uf.union(n1: Array(s1)[idx].asciiIdx, n2: Array(s2)[idx].asciiIdx)
        }
        
        var res = ""
        for ch in baseStr {
            let lexCh = uf.find(node: ch.asciiIdx)
            res += lexCh.asciiStr
        }
        
        return res
    }
}

extension Character {
    var asciiIdx: Int {
        return Int(self.asciiValue! - Character("a").asciiValue!)
    }
}

extension Int {
    var asciiStr: String {
        let asciiVal = Int(Character("a").asciiValue!) + self
        let scalar = UnicodeScalar(asciiVal)
        return String(scalar!)
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
//        let r1 = rank[p1]
//        let r2 = rank[p2]
//        if r1 >= r2 { // optimisation with rank
//            parent[p2] = p1
//            rank[p1] += r2
//        } else {
//            parent[p1] = p2
//            rank[p2] += r1
//        }
        if p1 < p2 {
            parent[p2] = p1
        } else {
            parent[p1] = p2
        }
    }
}
