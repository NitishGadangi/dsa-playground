import Foundation

//https://leetcode.com/problems/search-a-2d-matrix/

class Solution {
    func searchMatrix(_ matrix: [[Int]], _ target: Int) -> Bool {
        let rows = matrix.count
        guard rows > 0 else { return false }
        let cols = matrix[0].count
        var start = 0
        var end = (rows * cols) - 1
        
        while start <= end {
            let mid = start + (end - start)/2
            let r = mid / cols
            let c = mid % cols
            let midVal = matrix[r][c]
            if target < midVal {
                end = mid - 1
            } else if target > midVal {
                start = mid + 1
            } else {
                return true
            }
        }
        return false
    }
}

let res = Solution().searchMatrix([[1,1]], 2)
