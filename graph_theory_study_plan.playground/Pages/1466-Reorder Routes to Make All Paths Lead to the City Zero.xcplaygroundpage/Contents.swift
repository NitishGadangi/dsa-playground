import Foundation

//https://leetcode.com/problems/reorder-routes-to-make-all-paths-lead-to-the-city-zero

class Solution {
    struct Node {
        let idx: Int
        let isActual: Bool
    }
    func minReorder(_ n: Int, _ connections: [[Int]]) -> Int {
        var adjList: [[Node]] = Array(repeating: [], count: n)
        for con in connections {
            adjList[con[0]].append(Node(idx: con[1], isActual: true))
            adjList[con[1]].append(Node(idx: con[0], isActual: false))
        }
        var queue: [Node] = [Node(idx: 0, isActual: false)]
        var visited: [Bool] = Array(repeating: false, count: n)
        var count = 0
        while !queue.isEmpty {
            let curNode = queue.removeFirst()
            visited[curNode.idx] = true
            for nbr in adjList[curNode.idx] {
                if !visited[nbr.idx] {
                    if nbr.isActual {
                        count += 1
                    }
                    queue.append(nbr)
                }
            }
        }
        return count
    }
}
