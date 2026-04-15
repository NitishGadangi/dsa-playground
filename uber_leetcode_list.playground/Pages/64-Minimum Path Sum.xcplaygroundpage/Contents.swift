import Foundation

// https://leetcode.com/problems/minimum-path-sum/description/

class Solution {
    var memoMap: [String: Int] = [:]
    func minPathSum(_ grid: [[Int]]) -> Int {
        memoMap = [:]
        return dfs(grid, r: 0, c: 0)
    }

    func dfs(_ grid: [[Int]], r: Int, c: Int) -> Int {
        let rows = grid.count
        let cols = grid[0].count
        let key = "\(r)-\(c)"
        if let res = memoMap[key] { return res }
        guard r >= 0 && r < rows && c >= 0 && c < cols else { return Int.max }
        if r == rows - 1 && c == cols - 1 { return grid[r][c] }
        let right = dfs(grid, r: r, c: c + 1)
        let down = dfs(grid, r: r + 1, c: c)
        let res = grid[r][c] + min(right, down)
        memoMap[key] = res
        return res
    }
}
