import Foundation

//https://leetcode.com/problems/minimum-height-trees/

class Solution {
    func findMinHeightTrees(_ n: Int, _ edges: [[Int]]) -> [Int] {
        if n == 0 { return [] }
        if n == 1 { return [0] }
        
        var adjList: [Set<Int>] = Array(repeating: [], count: n)
        for item in edges {
            let from = item[0]
            let to = item[1]
            adjList[from].insert(to)
            adjList[to].insert(from)
        }
        
        var leaves: [Int] = []
        for (idx, list) in adjList.enumerated() {
            if list.count == 1 {
                leaves.append(idx) // add leaves
            }
        }
        var remNodes: Int = n
        while remNodes > 2 {
            let leavesCnt = leaves.count
            remNodes -= leavesCnt
            for _ in 0..<leavesCnt {
                let cur = leaves.removeFirst() // remove leavs
                let nbr = adjList[cur].first! // one and only nbr
                adjList[nbr].remove(cur)
                if adjList[nbr].count == 1 {
                    leaves.append(nbr)
                }
            }
        }
        
        return leaves
    }
}
