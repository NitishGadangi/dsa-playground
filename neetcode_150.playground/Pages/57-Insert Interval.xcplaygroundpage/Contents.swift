import Foundation

//https://leetcode.com/problems/insert-interval/description/

class Solution {
    func insert(_ intervals: [[Int]], _ newInterval: [Int]) -> [[Int]] {
        var left: [[Int]] = []
        var right: [[Int]] = []
        var newStart: Int = newInterval[0]
        var newEnd: Int = newInterval[1]
        for itvl in intervals {
            let curStart = itvl[0]
            let curEnd = itvl[1]
            if curEnd < newStart {
                left.append(itvl)
            } else if curStart > newEnd {
                right.append(itvl)
            } else {
                newStart = min(newStart, curStart)
                newEnd = max(newEnd, curEnd)
            }
        }
        var res: [[Int]] = []
        res.append(contentsOf: left)
        res.append([newStart, newEnd])
        res.append(contentsOf: right)
        return res
    }
}
