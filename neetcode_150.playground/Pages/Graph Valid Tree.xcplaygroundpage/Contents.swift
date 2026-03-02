import Foundation

//https://neetcode.io/problems/valid-tree/question?list=neetcode150

//Valid Tree : No Cycles and Only single parent
class Solution {
    func validTree(_ n: Int, _ edges: [[Int]]) -> Bool {
        let uf = UnionFind(count: n)
        for edge in edges {
            if !uf.union(node1: edge[0], node2: edge[1]) {
                return false
            }
        }
        return uf.noOfParents == 1
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
        let actualParent = find(node: parent[node])
        parent[node] = actualParent
        return actualParent
    }

    // true - if union happens
    // false - if both nodes are aleady in same set
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
            rank[r2] += r1
        }
        return true
    }
}

