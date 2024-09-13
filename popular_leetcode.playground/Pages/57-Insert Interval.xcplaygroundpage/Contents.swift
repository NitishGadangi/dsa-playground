import Foundation

//https://leetcode.com/problems/insert-interval

class Solution {
    func insert(_ intervals: [[Int]], _ newInterval: [Int]) -> [[Int]] {
        var newStart = newInterval[0]
        var newEnd = newInterval[1]

        var leftItems: [[Int]] = []
        var rightItems: [[Int]] = []

        for interval in intervals {
            let curStart = interval[0]
            let curEnd = interval[1]

            if curEnd < newStart {
                leftItems.append(interval)
            } else if curStart > newEnd {
                rightItems.append(interval)
            } else {
                newStart = min(newStart, curStart)
                newEnd = max(newEnd, curEnd)
            }
        }

        var res: [[Int]] = []
        res.append(contentsOf: leftItems)
        res.append([newStart, newEnd])
        res.append(contentsOf: rightItems)
        return res
    }
}
