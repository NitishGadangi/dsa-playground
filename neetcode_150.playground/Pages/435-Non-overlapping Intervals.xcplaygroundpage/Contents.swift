import Foundation

//https://leetcode.com/problems/non-overlapping-intervals/description/

class Solution {
    func eraseOverlapIntervals(_ intervals: [[Int]]) -> Int {
        let intervals = intervals.sorted { $0[0] < $1[0] }
        let count = intervals.count
        var idx = 0
        var skips = 0
        while idx < count {
            var end = intervals[idx][1]
            while idx + 1 < count && end > intervals[idx + 1][0] {
                end = min(end, intervals[idx + 1][1])
                skips += 1
                idx += 1
            }
            idx += 1
        }
        return skips
    }
}
