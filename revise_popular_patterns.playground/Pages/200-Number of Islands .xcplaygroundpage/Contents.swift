import Foundation

//https://leetcode.com/problems/number-of-islands/

class Solution {
    func numIslands(_ grid: [[Character]]) -> Int {
        let rows = grid.count
        let cols = grid[0].count
        var grid = grid
        var res = 0
        for r in 0..<rows {
            for c in 0..<cols {
                if grid[r][c] == "1" {
                    dfs(grid: &grid, r: r, c: c)
                    res += 1
                }
            }
        }
        return res
    }

    func dfs(grid: inout [[Character]], r: Int, c: Int) {
        let rows = grid.count
        let cols = grid[0].count
        guard r >= 0 && r < rows && c >= 0 && c < cols
                && grid[r][c] == "1"
        else { return }
        grid[r][c] = "0"
        let dr = [0, 1, 0, -1]
        let dc = [1, 0, -1, 0]
        for idx in 0..<4 {
            let rr = r + dr[idx]
            let cc = c + dc[idx]
            dfs(grid: &grid, r: rr, c: cc)
        }
    }
}
