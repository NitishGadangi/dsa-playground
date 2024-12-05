import Foundation

//https://leetcode.com/problems/01-matrix/

class Solution {
    struct Cell {
        let r: Int
        let c: Int
        let dist: Int
    }
    func updateMatrix(_ mat: [[Int]]) -> [[Int]] {
        var rows = mat.count
        var cols = mat[0].count
        var res: [[Int]] = Array(repeating: Array(repeating: 0, count: cols), count: rows)
        var vis: [[Bool]] = Array(repeating: Array(repeating: false, count: cols), count: rows)
        var queue: [Cell] = []
        for r in 0..<rows {
            for c in 0..<cols {
                if mat[r][c] == 0 {
                    queue.append(Cell(r: r, c: c, dist: 0))
                    vis[r][c] = true
                }
            }
        }
        var dr = [1, 0, -1, 0]
        var dc = [0, 1, 0, -1]
        while !queue.isEmpty {
            let cell = queue.removeFirst()
            for idx in 0..<dr.count {
                let rr = cell.r + dr[idx]
                let cc = cell.c + dc[idx]
                if rr >= 0 && rr < rows && cc >= 0 && cc < cols && !vis[rr][cc] {
                    vis[rr][cc] = true
                    res[rr][cc] = cell.dist + 1
                    queue.append(Cell(r: rr, c: cc, dist: cell.dist + 1))
                }
            }
        }
        
        return res
    }
}
