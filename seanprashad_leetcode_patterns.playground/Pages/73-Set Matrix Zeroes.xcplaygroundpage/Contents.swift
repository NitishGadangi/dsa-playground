import Foundation

//https://leetcode.com/problems/set-matrix-zeroes/

class Solution {
    func setZeroes(_ matrix: inout [[Int]]) {
        guard matrix.count > 0 else { return }
        var nRows = matrix.count
        var nCols = matrix[0].count
        var isFirstRowZero: Bool = false
        var isFirstColZero: Bool = false
        for idx in 0..<nRows {
            if matrix[idx][0] == 0 {
                isFirstColZero = true
                break
            }
        }
        for idx in 0..<nCols {
            if matrix[0][idx] == 0 {
                isFirstRowZero = true
                break
            }
        }
        
        for r in 1..<nRows {
            for c in 1..<nCols {
                if matrix[r][c] == 0 {
                    matrix[r][0] = 0
                    matrix[0][c] = 0
                }
            }
        }
        
        for r in 1..<nRows {
            for c in 1..<nCols {
                if matrix[r][0] == 0 || matrix[0][c] == 0 {
                    matrix[r][c] = 0
                }
            }
        }
        
        if isFirstRowZero {
            for idx in 0..<nCols {
                matrix[0][idx] = 0
            }
        }
        
        if isFirstColZero {
            for idx in 0..<nRows {
                matrix[idx][0] = 0
            }
        }
    }
}
