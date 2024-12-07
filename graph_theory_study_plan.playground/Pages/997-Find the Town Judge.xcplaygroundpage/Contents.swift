import Foundation

//https://leetcode.com/problems/find-the-town-judge

class Solution {
    func findJudge(_ n: Int, _ trust: [[Int]]) -> Int {
        var adjList: [[Int]] = Array(repeating: [], count: n)
        var inDegree: [Int] = Array(repeating: 0, count: n)
        for tr in trust {
            adjList[tr[0] - 1].append(tr[1] - 1)
            inDegree[tr[1] - 1] += 1
        }
        for (idx, deg) in inDegree.enumerated() {
            if deg == (n - 1) && adjList[idx].count == 0 {
                return idx + 1
            }
        }
        return -1
    }
}

let res = Solution().findJudge(2, [[1,2]])
