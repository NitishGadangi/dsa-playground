import Foundation

//https://leetcode.com/problems/interval-list-intersections/

class Solution {
    func intervalIntersection(_ firstList: [[Int]], _ secondList: [[Int]]) -> [[Int]] {
        var first = 0
        var second = 0
        var res: [[Int]] = []
        
        while first < firstList.count && second < secondList.count {
            let lo = max(firstList[first][0], secondList[second][0])
            let hi = min(firstList[first][1], secondList[second][1])
            if lo <= hi {
                res.append([lo, hi])
            }
            if firstList[first][1] < secondList[second][1] {
                first += 1
            } else {
                second += 1
            }
        }
        
        return res
    }
}
