import Foundation

// https://leetcode.com/problems/collect-coins-in-a-tree/

// remove leaf nodes with 0 coins
// then remove two layers of leaf nodes
// to and fro traversal distance = 2 * no of remaining nodes

class Solution {
    func collectTheCoins(_ coins: [Int], _ edges: [[Int]]) -> Int {
        var adjList: [Set<Int>] = Array(repeating: [], count: coins.count)
        for e in edges {
            adjList[e[0]].insert(e[1])
            adjList[e[1]].insert(e[0])
        }
        
        // step 1: remove leaf nodes with 0 coins
        var queue: [Int] = []
        for (node, list) in adjList.enumerated() {
            if list.count == 1 && coins[node] == 0 {
                queue.append(node)
            }
        }
        while !queue.isEmpty {
            let cur = queue.removeFirst()
            for nbr in adjList[cur] {
                adjList[nbr].remove(cur)
                if adjList[nbr].count == 1 && coins[nbr] == 0 {
                    queue.append(nbr)
                }
            }
            adjList[cur].removeAll()
        }

        // step 2: remove two layers of leaf nodes
        for _ in 0..<2 {
            var leaves: [Int] = []
            for (node, list) in adjList.enumerated() {
                if list.count == 1 {
                    leaves.append(node)
                }
            }

            for node in leaves {
                for nbr in adjList[node] {
                    adjList[nbr].remove(node)
                }
                adjList[node].removeAll()
            }
        }

        // step 3: calculate number of edges
        var edges = 0
        for list in adjList {
            edges += list.count
        }

        return edges
    }
}
