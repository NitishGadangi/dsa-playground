import Foundation

//https://leetcode.com/problems/accounts-merge

class Solution {
    func accountsMerge(_ accounts: [[String]]) -> [[String]] {
        let n = accounts.count
        let uf = UnionFind(n: n)
        var mailIdMap: [String: Int] = [:]
        for (idx, mails) in accounts.enumerated() {
            for (mailIdx, mail) in mails.enumerated() where mailIdx > 0 {
                if let extIdx = mailIdMap[mail] {
                    uf.union(n1: extIdx, n2: idx)
                } else {
                    mailIdMap[mail] = idx
                }
            }
        }
        
        var mergMap: [Int: [String]] = [:]
        for (mail, idx) in mailIdMap {
            let finIdx = uf.find(node: idx)
            mergMap[finIdx, default: []].append(mail)
        }
        var res: [[String]] = []
        for (idx, mail) in mergMap {
            var curRes =  [accounts[idx][0]]
            curRes.append(contentsOf: mail.sorted())
            res.append(curRes)
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
