import Foundation

//https://neetcode.io/problems/islands-and-treasure/question

class Solution {
    struct Cell {
        let row: Int
        let col: Int
    }
    func islandsAndTreasure(_ grid: inout [[Int]]) {
        let rows = grid.count
        let cols = grid[0].count
        var visited: [[Bool]] = Array(repeating: Array(repeating: false, count: cols), count: rows)
        var queue: [Cell] = []
        for r in 0..<rows {
            for c in  0..<cols {
                if grid[r][c] == 0 {
                    visited[r][c] = true
                    queue.append(Cell(row: r, col: c))
                }
            }
        }
        var dist = 0
        while !queue.isEmpty {
            let curSize = queue.count
            for _ in 0..<curSize {
                let cell = queue.removeFirst()
                grid[cell.row][cell.col] = dist

                let dr = [0, 1, 0, -1]
                let dc = [1, 0, -1, 0]
                for idx in 0..<dr.count {
                    let rr = cell.row + dr[idx]
                    let cc = cell.col + dc[idx]
                    guard rr >= 0 && rr < rows && cc >= 0 && cc < cols
                            && grid[rr][cc] != -1 && !visited[rr][cc] else { continue }
                    visited[rr][cc] = true
                    queue.append(Cell(row: rr, col: cc))
                }
            }
            dist += 1
        }
    }
}

