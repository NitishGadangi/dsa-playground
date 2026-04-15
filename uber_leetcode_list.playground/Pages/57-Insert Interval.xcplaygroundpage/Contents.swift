import Foundation

// https://leetcode.com/problems/insert-interval/

class Solution {
    func insert(_ intervals: [[Int]], _ newInterval: [Int]) -> [[Int]] {
        var left: [[Int]] = []
        var right: [[Int]] = []
        var midStart = newInterval[0]
        var midEnd = newInterval[1]
        for intrvl in intervals {
            let curStart = intrvl[0]
            let curEnd = intrvl[1]
            if curEnd < midStart {
                left.append(intrvl)
            } else if curStart > midEnd {
                right.append(intrvl)
            } else {
                midStart = min(midStart, curStart)
                midEnd = max(midEnd, curEnd)
            }
        }
        var res: [[Int]] = []
        res.append(contentsOf: left)
        res.append([midStart, midEnd])
        res.append(contentsOf: right)
        return res
    }
}
