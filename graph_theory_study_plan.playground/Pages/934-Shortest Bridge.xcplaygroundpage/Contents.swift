import Foundation

//https://leetcode.com/problems/shortest-bridge/

class Solution {
    func shortestBridge(_ grid: [[Int]]) -> Int {
        var rows: Int = grid.count
        var cols: Int = grid[0].count
        var grid = grid
        var rr = 0
        var cc = 0
        for r in 0..<rows {
            var foundRes = false
            for c in 0..<cols {
                if grid[r][c] == 1 {
                    dfs(grid: &grid, r: r, c: c)
                    
                    // store starting point
                    rr = r
                    cc = c
                    foundRes = true
                    break
                }
            }
            if foundRes { break }
        }
        return bfs(grid: &grid, r: rr, c: cc)
    }
    
    func bfs(grid: inout [[Int]], r: Int, c: Int) -> Int {
        var rows: Int = grid.count
        var cols: Int = grid[0].count
        var queue: [[Int]] = []
        for r in 0..<rows {
            for c in 0..<cols {
                if grid[r][c] == 2 {
                    queue.append([r, c])
                }
            }
        }
        var count = 0
        
        while !queue.isEmpty {
            let queCnt = queue.count
            for _ in 0..<queCnt {
                let cur = queue.removeFirst()
                let r = cur[0]
                let c = cur[1]
                let dr = [0, 1, 0, -1]
                let dc = [1, 0, -1, 0]
                for idx in 0..<dr.count {
                    let rr = r + dr[idx]
                    let cc = c + dc[idx]
                    if rr >= 0 && rr < rows && cc >= 0 && cc < cols {
                        if grid[rr][cc] == 1 {
                            grid[rr][cc] = 2
                            return count
                        } else if grid[rr][cc] == 0 {
                            queue.append([rr, cc])
                        }
                    }
                }
            }
            count += 1
        }
        
        return count
    }
    
    func dfs(grid: inout [[Int]], r: Int, c: Int) {
        var rows: Int = grid.count
        var cols: Int = grid[0].count
        guard r >= 0 && r < rows && c >= 0 && c < cols && grid[r][c] == 1
        else { return }
        grid[r][c] = 2
        let dr = [0, 1, 0, -1]
        let dc = [1, 0, -1, 0]
        for idx in 0..<dr.count {
            let rr = r + dr[idx]
            let cc = c + dc[idx]
            dfs(grid: &grid, r: rr, c: cc)
        }
    }
}
