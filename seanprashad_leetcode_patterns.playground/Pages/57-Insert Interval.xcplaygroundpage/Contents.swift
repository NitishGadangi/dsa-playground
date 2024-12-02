import Foundation

//https://leetcode.com/problems/insert-interval/

class Solution {
    func insert(_ intervals: [[Int]], _ newInterval: [Int]) -> [[Int]] {
        var left: [[Int]] = []
        var right: [[Int]] = []
        var midStart: Int = newInterval[0]
        var midEnd: Int = newInterval[1]
        
        for inter in intervals {
            if inter[1] < midStart {
                left.append(inter)
            } else if inter[0] > midEnd {
                right.append(inter)
            } else {
                midStart = min(midStart, inter[0])
                midEnd = max(midEnd, inter[1])
            }
        }
        
        var res: [[Int]] = []
        res.append(contentsOf: left)
        res.append([midStart, midEnd])
        res.append(contentsOf: right)
        return res
    }
}
