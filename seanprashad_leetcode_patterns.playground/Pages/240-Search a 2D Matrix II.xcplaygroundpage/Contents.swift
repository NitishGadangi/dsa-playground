import Foundation

//https://leetcode.com/problems/search-a-2d-matrix-ii/

class Solution {
    
    // O(m + n)
    // https://leetcode.com/problems/search-a-2d-matrix-ii/solutions/66140/my-concise-o-m-n-java-solution/
    func searchMatrix(_ matrix: [[Int]], _ target: Int) -> Bool {
        let rows = matrix.count
        guard rows > 0 else { return false }
        let cols = matrix[0].count
        
        var r = 0
        var c = cols - 1
        while r < rows && c >= 0 {
            if target == matrix[r][c] {
                return true
            } else if target < matrix[r][c] {
                c -= 1
            } else if target > matrix[r][c] {
                r += 1
            }
        }
        return false
    }
}
