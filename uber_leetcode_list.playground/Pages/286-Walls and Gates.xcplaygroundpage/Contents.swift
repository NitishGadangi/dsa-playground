import Foundation

// https://algo.monster/liteproblems/286
// https://neetcode.io/problems/islands-and-treasure/question

class Solution {
    struct Cell {
        let r: Int
        let c: Int
    }
    func islandsAndTreasure(_ grid: inout [[Int]]) {
        let rows = grid.count
        let cols = grid[0].count
        var visited: [[Bool]] = Array(repeating: Array(repeating: false, count: cols), count: rows)
        var queue: [Cell] = []
        for r in 0..<rows {
            for c in 0..<cols {
                if grid[r][c] == 0 {
                    queue.append(Cell(r: r, c: c))
                    visited[r][c] = true
                }
            }
        }

        var dist = 0
        let dr = [0, 1, 0, -1]
        let dc = [1, 0, -1, 0]

        //bfs
        while !queue.isEmpty {
            let level = queue.count
            for _ in 0..<level {
                let cur = queue.removeFirst()
                grid[cur.r][cur.c] = dist
                for idx in 0..<dr.count {
                    let rr = cur.r + dr[idx]
                    let cc = cur.c + dc[idx]
                    if rr >= 0 && rr < rows && cc >= 0 && cc < cols && grid[rr][cc] != -1 && !visited[rr][cc] {
                        visited[rr][cc] = true
                        queue.append(Cell(r: rr, c: cc))
                    }
                }
            }
            dist += 1
        }
    }
}

