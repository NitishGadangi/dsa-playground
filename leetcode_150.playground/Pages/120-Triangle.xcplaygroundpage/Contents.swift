import Foundation

//https://leetcode.com/problems/triangle/description/?envType=study-plan-v2&envId=top-interview-150
class Solution {
    var memoMap: [String: Int] = [:]
    func minimumTotal(_ triangle: [[Int]]) -> Int {
        guard triangle.count > 0 else { return 0 }
        return minTotalRec(triangle, row: 0, idx: 0)
    }

    func minTotalRec(_ triangle: [[Int]], row: Int, idx: Int) -> Int {
        guard row < triangle.count else { return 0 }
        guard idx < triangle[row].count else { return 0 }

        if let res = memoMap["\(row)\(idx)"] {
            return res
        }

        let curVal = triangle[row][idx]
        let nextRowSameIdx = curVal + minTotalRec(triangle, row: row + 1, idx: idx)
        let nextRowNextIdx = curVal + minTotalRec(triangle, row: row + 1, idx: idx + 1)
        let res = min(nextRowNextIdx, nextRowSameIdx)
        memoMap["\(row)\(idx)"] = res
        return res
    }
}
