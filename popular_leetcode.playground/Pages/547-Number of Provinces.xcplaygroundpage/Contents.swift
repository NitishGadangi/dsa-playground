import Foundation

//https://leetcode.com/problems/number-of-provinces

class Solution {
    func findCircleNum(_ isConnected: [[Int]]) -> Int {
        guard isConnected.count > 0 else { return 0 }
        let numOfNodes = isConnected.count
        let unionFind = UnionFind(numOfNodes: numOfNodes)
        for i in 0..<numOfNodes {
            for j in (i+1)..<numOfNodes {
                if isConnected[i][j] == 1 {
                    unionFind.union(i, j)
                }
            }
        }

        var res: Int = 0
        print(unionFind.parent)
        for parent in unionFind.parent {
            if parent == -1 {
                res += 1
            }
        }
        return res
    }
}

class UnionFind {
    let numOfNodes: Int
    var parent: [Int]
    var rank: [Int]

    init(numOfNodes: Int) {
        self.numOfNodes = numOfNodes
        self.parent = Array(repeating: -1, count: numOfNodes)
        self.rank = Array(repeating: 1, count: numOfNodes)
    }

    func find(_ node: Int) -> Int {
        let curParent = parent[node]
        if curParent == -1 {
            return node
        }

        let res = find(curParent)
        parent[node] = res
        return res
    }

    func union(_ node1: Int, _ node2: Int) {
        let parent1 = find(node1)
        let parent2 = find(node2)
        guard parent1 != parent2 else { return }
        let rank1 = rank[parent1]
        let rank2 = rank[parent2]
        if rank1 > rank2 {
            parent[parent2] = parent1
            rank[parent1] += rank2
        } else {
            parent[parent1] = parent2
            rank[parent2] += rank1
        }

    }
}
