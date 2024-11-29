import Foundation

//https://leetcode.com/problems/pacific-atlantic-water-flow/

class Solution {
    func pacificAtlantic(_ heights: [[Int]]) -> [[Int]] {
        var rows = heights.count
        var cols = heights[0].count
        var atlantic: [[Bool]] = Array(repeating: Array(repeating: false, count: cols), count: rows)
        var pacific: [[Bool]] = Array(repeating: Array(repeating: false, count: cols), count: rows)
        
        // fill pacific - first row, first col
        for c in 0..<cols {
            dfs(heights: heights, r: 0, c: c, visited: &pacific)
        }
        
        for r in 0..<rows {
            dfs(heights: heights, r: r, c: 0, visited: &pacific)
        }
        
        // fill atlantic - last row, last col
        for c in 0..<cols {
            dfs(heights: heights, r: rows - 1, c: c, visited: &atlantic)
        }
        
        for r in 0..<rows {
            dfs(heights: heights, r: r, c: cols - 1, visited: &atlantic)
        }
        
        var res: [[Int]] = []
        for r in 0..<rows {
            for c in 0..<cols {
                if pacific[r][c] && atlantic[r][c] {
                    res.append([r, c])
                }
            }
        }
        
        return res
    }
    
    func dfs(heights: [[Int]], r: Int, c: Int, visited: inout [[Bool]]) {
        guard !visited[r][c] else { return }
        var rows = heights.count
        var cols = heights[0].count
        visited[r][c] = true
        var dr = [-1, 0, 1, 0]
        var dc = [0, -1, 0, 1]
        for idx in 0..<4 {
            let rr = r + dr[idx]
            let cc = c + dc[idx]
            if rr >= 0 && rr < rows &&
                cc >= 0 && cc < cols &&
                heights[rr][cc] >= heights[r][c] {
                dfs(heights: heights, r: rr, c: cc, visited: &visited)
            }
        }
    }
}

class OverComplicatedSolution {
    // -1 - notvisited
    // -2 - notpossible
    // 0 - pacific, 1 - atlantic, 2 - both
    
    var visited: [[Int]] = []
    func pacificAtlantic(_ heights: [[Int]]) -> [[Int]] {
        var rows = heights.count
        var cols = heights[0].count
        visited = Array(repeating: Array(repeating: -1, count: cols), count: rows)
        
        var res: [[Int]] = []
        for r in 0..<rows {
            for c in 0..<cols {
                let curRes = dfs(heights: heights, r: r, c: c)
                if curRes == 2 {
                    res.append([r, c])
                }
            }
        }
        print(visited)
        return res
    }
    
    func dfs(heights: [[Int]], r: Int, c: Int) -> Int {
        var rows = heights.count
        var cols = heights[0].count
        guard visited[r][c] == -1 else { return visited[r][c] }
        
        visited[r][c] = -2
        var res = -2
        
        var dr = [-1, 0, 1, 0]
        var dc = [0, -1, 0, 1]
        for idx in 0..<4 {
            if res == 2 { break }
            let rr = r + dr[idx]
            let cc = c + dc[idx]
            if rr < 0 || cc < 0 {
                res = solveRes(curRes: res, newRes: 0)
            } else if rr >= rows || cc >= cols {
                res = solveRes(curRes: res, newRes: 1)
            } else if heights[rr][cc] <= heights[r][c] {
                let newRes = dfs(heights: heights, r: rr, c: cc)
                res = solveRes(curRes: res, newRes: newRes)
            }
        }
        visited[r][c] = res
        return res
    }
    
    func solveRes(curRes: Int, newRes: Int) -> Int {
        if curRes < 0 { return newRes }
        if newRes < 0 { return curRes }
        return curRes == newRes ? curRes : 2
    }
}
