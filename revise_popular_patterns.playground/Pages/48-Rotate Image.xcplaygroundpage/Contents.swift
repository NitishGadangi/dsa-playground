import Foundation

//https://leetcode.com/problems/rotate-image/

// for 90 deg inplace rotation
// 1. Vertical Reversal (Flip along the horizontal axis)
// 2. Transpose (Swap rows and columns)
class Solution {
    func rotate(_ matrix: inout [[Int]]) {
        let len = matrix.count
        var top = 0
        var bottom = len  - 1

        // vertical reversal
        while top < bottom {
            (matrix[top], matrix[bottom]) = (matrix[bottom], matrix[top])
            top += 1
            bottom -= 1
        }

        // transpose
        for r in 0..<len {
            // if we do this from 0 - then it flip all the items
            for c in (r + 1)..<len {
                (matrix[r][c], matrix[c][r]) = (matrix[c][r], matrix[r][c])
            }
        }
    }
}
