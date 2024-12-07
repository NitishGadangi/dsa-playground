import Foundation

//https://leetcode.com/problems/maximal-network-rank/

class Solution {
    func maximalNetworkRank(_ n: Int, _ roads: [[Int]]) -> Int {
        var indegree: [Int] = Array(repeating: 0, count: n)
        var adjList: [[Int]] = Array(repeating: [], count: n)
        for rd in roads {
            indegree[rd[0]] += 1
            indegree[rd[1]] += 1
            adjList[rd[0]].append(rd[1])
            adjList[rd[1]].append(rd[0])
        }
        var res = 0
        for first in 0..<n {
            for sec in (first + 1)..<n {
                var curRnk = indegree[first] + indegree[sec]
                if adjList[first].contains(sec) || adjList[sec].contains(first) {
                    curRnk -= 1
                }
                res = max(res, curRnk)
            }
        }
        return res
    }
}
