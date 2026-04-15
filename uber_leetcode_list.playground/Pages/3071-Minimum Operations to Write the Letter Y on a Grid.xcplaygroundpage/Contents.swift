import Foundation

// https://leetcode.com/problems/minimum-operations-to-write-the-letter-y-on-a-grid/

// res = total_cells - cells_already_correct_in_Y - cells_already_correct_in_non_Y

class Solution {
    func minimumOperationsToWriteY(_ grid: [[Int]]) -> Int {
        var onY = Array(repeating: 0, count: 3)
        var outY = Array(repeating: 0, count: 3)
        var n = grid.count
        for r in 0..<n {
            for c in 0..<n {
                let cur = grid[r][c]
                if isOnY(r: r, c: c, n: n) {
                    onY[cur] += 1
                } else {
                    outY[cur] += 1
                }
            }
        }

        // check for all permutations of "total - onY(i) - outY(i)"
        var res = Int.max
        var total = n * n
        for a in 0..<3 {
            for b in 0..<3 {
                if a == b { continue }
                let curRes = total - onY[a] - outY[b]
                res = min(res, curRes)
            }
        }

        return res
    }

    func isOnY(r: Int, c: Int, n: Int) -> Bool {
        (r == c && r < n/2) || (c == n/2 && r >= n/2) || (r + c == n-1 && r < n/2)
    }
}
