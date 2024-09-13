import Foundation

//https://leetcode.com/problems/merge-intervals

class Solution {
    func merge(_ intervals: [[Int]]) -> [[Int]] {
        var intervals = intervals.sorted { first, second in
            first[0] < second[0]
        }
        let count = intervals.count
        var res: [[Int]] = []
        var idx = 0

        while idx < count {
            var curStart = intervals[idx][0]
            var curEnd = intervals[idx][1]

            while idx + 1 < count && curEnd >= intervals[idx + 1][0] {
                idx += 1
                curEnd = max(curEnd, intervals[idx][1])
            }
            res.append([curStart, curEnd])
            idx += 1
        }

        return res
    }
}
