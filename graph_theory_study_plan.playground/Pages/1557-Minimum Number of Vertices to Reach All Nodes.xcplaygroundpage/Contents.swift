import Foundation

//https://leetcode.com/problems/minimum-number-of-vertices-to-reach-all-nodes/

class Solution {
    func findSmallestSetOfVertices(_ n: Int, _ edges: [[Int]]) -> [Int] {
        var indegree: [Int] = Array(repeating: 0, count: n)
        for edg in edges {
            indegree[edg[1]] += 1
        }
        var res: [Int] = []
        for (idx, deg) in indegree.enumerated() {
            if deg == 0 {
                res.append(idx)
            }
        }
        return res
    }
}
