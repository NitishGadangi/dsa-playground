import Foundation

//https://leetcode.com/problems/merge-intervals/

class Solution {
    func merge(_ intervals: [[Int]]) -> [[Int]] {
        let intervals = intervals.sorted { first, second in
            first[0] < second[0]
        }
        let n = intervals.count
        var res: [[Int]] = []
        var idx = 0
        while idx < n {
            let start = intervals[idx][0]
            var end = intervals[idx][1]
            while (idx + 1 < n) && (end >= intervals[idx + 1][0]) {
                end = max(end, intervals[idx + 1][1])
                idx += 1
            }
            res.append([start, end])
            idx += 1
        }
        return res
    }
}

let res = Solution().merge([[1,3],[2,6],[8,10],[15,18]])
