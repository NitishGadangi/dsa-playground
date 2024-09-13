import Foundation

//https://leetcode.com/problems/the-earliest-moment-when-everyone-become-friends

class Solution {
    func earliestAcq(_ logs: [[Int]], _ n: Int) -> Int {
        var logs = logs.sorted { first, second in
            first[0] < second[0]
        }

        var groupsCount = n
        let unionFind = UnionFind(n)

        for log in logs {
            let time = log[0]
            let n1 = log[1]
            let n2 = log[2]

            if (unionFind.union(n1, n2)) {
                groupsCount -= 1
            }

            if groupsCount == 1 {
                return time
            }
        }


        return -1
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
