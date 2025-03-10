import Foundation

//https://leetcode.com/problems/spiral-matrix/

// Note: Recursive solutions wont work.
// Use Iterative only
class Solution {
    func spiralOrder(_ matrix: [[Int]]) -> [Int] {
        let rows = matrix.count
        let cols = matrix[0].count
        var vis = Array(repeating: Array(repeating: false, count: cols), count: rows)
        var dr = 0
        var dc = 1
        var r = 0
        var c = 0
        var res: [Int] = []
        for _ in 0..<(rows * cols) {
            res.append(matrix[r][c])
            vis[r][c] = true

            if !(r + dr >= 0 && r + dr < rows && c + dc >= 0 && c + dc < cols)
                || vis[r + dr][c + dc] {
                // mind the minus
                // swap + dc = - dr
                (dr, dc) = (dc, -dr)
            }

            r = r + dr
            c = c + dc
        }
        return res
    }
}

let res = Solution().spiralOrder([[1,2,3],[4,5,6],[7,8,9]])
print(res)
