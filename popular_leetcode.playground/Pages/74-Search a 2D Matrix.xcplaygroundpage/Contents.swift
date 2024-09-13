import Foundation

//https://leetcode.com/problems/search-a-2d-matrix

class Solution {
    func searchMatrix(_ matrix: [[Int]], _ target: Int) -> Bool {
        let rows = matrix.count
        guard rows > 0 else { return false }
        let cols = matrix[0].count

        var left = 0
        var right = (rows * cols) - 1

        while left <= right {
            let mid = left + (right - left)/2
            let r = mid / cols
            let c = mid % cols
            let item = matrix[r][c]

            if item == target {
                return true
            }

            if item < target {
                left = mid + 1
            } else {
                right = mid - 1
            }
        }

        return false
    }
}
