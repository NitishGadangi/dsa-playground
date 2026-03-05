import Foundation

//https://leetcode.com/problems/merge-intervals/description/

class Solution {
    func merge(_ intervals: [[Int]]) -> [[Int]] {
        let intervals = intervals.sorted { $0[0] < $1[0] }
        let count = intervals.count
        var idx = 0
        var res: [[Int]] = []
        while idx < count {
            var start = intervals[idx][0]
            var end = intervals[idx][1]
            while idx + 1 < count && end >= intervals[idx + 1][0] {
                end = max(end, intervals[idx + 1][1])
                idx += 1
            }
            res.append([start, end])
            idx += 1
        }
        return res
    }
}
