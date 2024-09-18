import Foundation

//https://leetcode.com/problems/most-stones-removed-with-same-row-or-column

class Solution {
    func removeStones(_ stones: [[Int]]) -> Int {
        let count = stones.count
        let unionFind = UnionFind(count: count)
        for i in 0..<count {
            for j in (i+1)..<count {
                if stones[i][0] == stones[j][0] || // either rows are common or
                   stones[i][1] == stones[j][1] { // cols are common
                    unionFind.union(i, j)
                }
            }
        }
        return count - unionFind.numOfSets
    }
}

class UnionFind {
    let count: Int
    var parent: [Int]
    var rank: [Int]

    var numOfSets: Int {
        var res = 0
        for node in parent {
            if node == -1 {
                res += 1
            }
        }
        return res
    }

    init(count: Int) {
        self.count = count
        self.parent = Array(repeating: -1, count: count)
        self.rank = Array(repeating: 1, count: count)
    }

    func find(_ node: Int) -> Int {
        let p = parent[node]
        if p == -1 {
            return node
        }
        let res = find(p)
        parent[node] = res
        return res
    }

    func union(_ node1: Int, _ node2: Int) {
        let p1 = find(node1)
        let p2 = find(node2)
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
