import Foundation

//https://leetcode.com/problems/interval-list-intersections/

class Solution {
    func intervalIntersection(_ firstList: [[Int]], _ secondList: [[Int]]) -> [[Int]] {
        guard !firstList.isEmpty && !secondList.isEmpty else { return [] }
        var res: [[Int]] = []
        var first = 0
        var second = 0
        while first < firstList.count && second < secondList.count {
            let firstS = firstList[first][0]
            let firstE = firstList[first][1]
            let secondS = secondList[second][0]
            let secondE = secondList[second][1]
            let start = max(firstS, secondS)
            let end = min(firstE, secondE)
            if start <= end {
                res.append([start, end])
            }
            if firstE < secondE {
                first += 1
            } else {
                second += 1
            }
        }
        return res
    }
}
