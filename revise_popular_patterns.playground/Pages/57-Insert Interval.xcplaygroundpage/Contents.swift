import Foundation

//https://leetcode.com/problems/insert-interval/

class Solution {
    func insert(_ intervals: [[Int]], _ newInterval: [Int]) -> [[Int]] {
        var leftIntrs: [[Int]] = []
        var rightIntr: [[Int]] = []
        var start: Int = newInterval[0]
        var end: Int = newInterval[1]
        for intr in intervals {
            let curStart = intr[0]
            let curEnd = intr[1]
            if curEnd < start {
                leftIntrs.append(intr)
            } else if curStart > end {
                rightIntr.append(intr)
            } else {
                start = min(start, curStart)
                end = max(end, curEnd)
            }
        }
        var res: [[Int]] = []
        res.append(contentsOf: leftIntrs)
        res.append([start, end])
        res.append(contentsOf: rightIntr)
        return res
    }
}
