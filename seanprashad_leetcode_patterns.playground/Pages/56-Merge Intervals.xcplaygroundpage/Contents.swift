import Foundation

//https://leetcode.com/problems/merge-intervals/

class Solution {
    func merge(_ intervals: [[Int]]) -> [[Int]] {
        var intervals = intervals.sorted { first, second in
            return first[0] < second[0]
        }
        var idx = 0
        var res: [[Int]] = []
        while idx < intervals.count {
            var start = intervals[idx][0]
            var curEnd = intervals[idx][1]
            while (idx + 1) < intervals.count && curEnd >= intervals[idx + 1][0] {
                idx += 1
                curEnd = max(curEnd, intervals[idx][1])
            }
            res.append([start, curEnd])
            idx += 1
        }
        return res
    }
}
