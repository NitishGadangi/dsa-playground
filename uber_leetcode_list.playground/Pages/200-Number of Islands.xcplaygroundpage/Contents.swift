import Foundation

// https://leetcode.com/problems/number-of-islands/description/

class Solution {
    var visited: [[Bool]] = []
    func numIslands(_ grid: [[Character]]) -> Int {
        var rows = grid.count
        var cols = grid[0].count
        visited = Array(repeating: Array(repeating: false, count: cols), count: rows)
        var res = 0
        for r in 0..<rows {
            for c in 0..<cols {
                guard grid[r][c] == "1" && !visited[r][c] else { continue }
                res += 1
                dfs(grid, r: r, c: c)
            }
        }
        return res
    }

    func dfs(_ grid: [[Character]], r: Int, c: Int) {
        var rows = grid.count
        var cols = grid[0].count
        guard r >= 0 && r < rows && c >= 0 && c < cols
                && grid[r][c] == "1"
                && !visited[r][c] else { return }
        visited[r][c] = true
        let dr = [0, 1, 0, -1]
        let dc = [1, 0, -1, 0]
        for idx in 0..<4 {
            let rr = r + dr[idx]
            let cc = c + dc[idx]
            dfs(grid, r: rr, c: cc)
        }
    }
}
