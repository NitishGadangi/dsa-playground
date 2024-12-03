import Foundation

//https://leetcode.com/problems/all-paths-from-source-to-target/

class Solution {
    func allPathsSourceTarget(_ graph: [[Int]]) -> [[Int]] {
        var res: [[Int]] = []
        var temp: [Int] = [0]
        dfs(graph: graph, cur: 0, temp: &temp, res: &res)
        return res
    }
    
    func dfs(graph: [[Int]], cur: Int, temp: inout [Int], res: inout [[Int]]) {
        if cur == graph.count - 1 {
            res.append(temp)
            return
        }
        for nbr in graph[cur] {
            temp.append(nbr)
            dfs(graph: graph, cur: nbr, temp: &temp, res: &res)
            temp.removeLast()
        }
    }
}
