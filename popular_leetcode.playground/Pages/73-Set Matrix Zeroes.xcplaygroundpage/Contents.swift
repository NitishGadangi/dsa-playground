import Foundation

//https://leetcode.com/problems/set-matrix-zeroes

class Solution {
    func setZeroes(_ matrix: inout [[Int]]) {
        let rows = matrix.count
        guard rows > 0 else { return }
        let cols = matrix[0].count

        var isFirstRowZero = false
        var isFirstColZero = false

        for idx in 0..<rows {
            if matrix[idx][0] == 0 {
                isFirstRowZero = true
            }
        }

        for idx in 0..<cols {
            if matrix[0][idx] == 0 {
                isFirstColZero = true
            }
        }

        // tarverse
        for r in 1..<rows {
            for c in 1..<cols {
                if matrix[r][c] == 0 {
                    matrix[r][0] = 0
                    matrix[0][c] = 0
                }
            }
        }

        for r in 1..<rows {
            for c in 1..<cols {
                if matrix[r][0] == 0 || matrix[0][c] == 0 {
                    matrix[r][c] = 0
                }
            }
        }

        for idx in 0..<rows {
            if isFirstRowZero {
                matrix[idx][0] = 0
            }
        }

        for idx in 0..<cols {
            if isFirstColZero {
                matrix[0][idx] = 0
            }
        }
    }
}
