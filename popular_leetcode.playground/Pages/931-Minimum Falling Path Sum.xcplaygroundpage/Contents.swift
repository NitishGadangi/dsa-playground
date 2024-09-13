import Foundation

//https://leetcode.com/problems/minimum-falling-path-sum

class Solution {
    var memoMap: [String: Int] = [:]
    func minFallingPathSum(_ matrix: [[Int]]) -> Int {
        guard matrix.count > 0 && matrix[0].count > 0 else { return -1}
        let c = matrix[0].count
        var res: Int = Int.max

        for col in 0..<c {
            let sum = pathSumRec(matrix: matrix, row: 0, col: col)
            res = min(res, sum)
        }

        return res
    }

    func pathSumRec(matrix: [[Int]], row: Int, col: Int) -> Int {
        let r = matrix.count
        let c = matrix[0].count
        guard row >= 0 && row < r
                && col >= 0 && col < c
        else { return Int.max }

        if row == r - 1 {
            return matrix[row][col]
        }

        var memoKey = "\(row)-\(col)"
        if let res = memoMap[memoKey] {
            return res
        }

        let nextLeft = pathSumRec(matrix: matrix, row: row + 1, col: col - 1)
        let nextBottom = pathSumRec(matrix: matrix, row: row + 1, col: col)
        let nextRight = pathSumRec(matrix: matrix, row: row + 1, col: col + 1)

        let res = matrix[row][col] + min(nextLeft, min(nextBottom, nextRight))
        memoMap[memoKey] = res
        return res
    }
}
