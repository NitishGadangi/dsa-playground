import Foundation

//https://leetcode.com/problems/number-of-islands/

class Solution {
    func numIslands(_ grid: [[Character]]) -> Int {
        var grid = grid
        var rows = grid.count
        var cols = grid[0].count
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
        guard grid[r][c] == "1" else { return }
        grid[r][c] = "0"
        var rows = grid.count
        var cols = grid[0].count
        var dr = [-1, 0, 1, 0]
        var dc = [0, -1, 0, 1]
        for idx in 0..<4 {
            let rr = r + dr[idx]
            let cc = c + dc[idx]
            if rr >= 0 && rr < rows && cc >= 0 && cc < cols {
                dfs(grid: &grid, r: rr, c: cc)
            }
        }
    }
}
