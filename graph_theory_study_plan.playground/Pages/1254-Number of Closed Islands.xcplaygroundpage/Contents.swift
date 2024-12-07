import Foundation

//https://leetcode.com/problems/number-of-closed-islands

class Solution {
    func closedIsland(_ grid: [[Int]]) -> Int {
        let rows = grid.count
        let cols = grid[0].count
        var grid = grid
        for r in 0..<rows {
            dfs(grid: &grid, r: r, c: 0)
            dfs(grid: &grid, r: r, c: cols - 1)
        }
        
        for c in 0..<cols {
            dfs(grid: &grid, r: 0, c: c)
            dfs(grid: &grid, r: rows - 1, c: c)
        }
        
        var count = 0
        for r in 0..<rows {
            for c in 0..<cols {
                if grid[r][c] == 0 {
                    dfs(grid: &grid, r: r, c: c)
                    count += 1
                }
            }
        }
        return count
    }
    
    func dfs(grid: inout [[Int]], r: Int, c: Int) {
        let rows = grid.count
        let cols = grid[0].count
        guard r >= 0 && r < rows
                && c >= 0 && c < cols
                && grid[r][c] == 0
        else { return }
        let dr = [0, 1, 0, -1]
        let dc = [1, 0, -1, 0]
        grid[r][c] = 1
        for idx in 0..<dc.count {
            let rr = r + dr[idx]
            let cc = c + dc[idx]
            dfs(grid: &grid, r: rr, c: cc)
        }
    }
}
