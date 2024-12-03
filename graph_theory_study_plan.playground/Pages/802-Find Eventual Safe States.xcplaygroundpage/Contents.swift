import Foundation

//https://leetcode.com/problems/find-eventual-safe-states

class Solution {
    func eventualSafeNodes(_ graph: [[Int]]) -> [Int] {
        let n = graph.count
        var adjList: [[Int]] = Array(repeating: [], count: n)
        var inDegree: [Int] = Array(repeating: 0, count: n)
        for (to, list) in graph.enumerated() {
            for from in list {
                adjList[from].append(to)
                inDegree[to] += 1
            }
        }
        var queue: [Int] = []
        for (idx, deg) in inDegree.enumerated() {
            if deg == 0 {
                queue.append(idx)
            }
        }
        
        while !queue.isEmpty {
            let node = queue.removeFirst()
            for nbr in adjList[node] {
                inDegree[nbr] -= 1
                if inDegree[nbr] == 0 {
                    queue.append(nbr)
                }
            }
        }
        var res: [Int] = []
        for (node, deg) in inDegree.enumerated() {
            if deg == 0 {
                res.append(node)
            }
        }
        return res
    }
}
