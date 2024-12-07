import Foundation

//https://leetcode.com/problems/is-graph-bipartite/

class Solution {
    func isBipartite(_ graph: [[Int]]) -> Bool {
        var n = graph.count
        // -1 = none, 0 = red, 1 = blue
        var cols: [Int] = Array(repeating: -1, count: n)
        
        for idx in 0..<n {
            if cols[idx] == -1 {
                let res = bfs(graph: graph, cols: &cols, start: idx)
                if res == false {
                    return false
                }
            }
        }
        return true
    }
    
    func bfs(graph: [[Int]], cols: inout [Int], start: Int) -> Bool {
        var queue: [Int] = [start]
        cols[start] = 0
        while !queue.isEmpty {
            let cur = queue.removeFirst()
            let curCol = cols[cur]
            for nbr in graph[cur] {
                if cols[nbr] == -1 {
                    cols[nbr] = 1 - curCol
                    queue.append(nbr)
                } else if cols[nbr] == curCol {
                    return false
                }
             }
        }
        return true
    }
}
