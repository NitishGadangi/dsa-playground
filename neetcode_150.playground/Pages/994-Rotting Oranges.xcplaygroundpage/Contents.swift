import Foundation

//https://leetcode.com/problems/rotting-oranges/description/

class Solution {
    struct Cell {
        let row: Int
        let col: Int
    }
    let FRESH = 1
    let ROTTEN = 2

    func orangesRotting(_ grid: [[Int]]) -> Int {
        var grid = grid
        var rows = grid.count
        var cols = grid[0].count
        var freshCnt: Int = 0
        var queue: [Cell] = []
        for r in 0..<rows {
            for c in 0..<cols {
                if grid[r][c] == ROTTEN {
                    queue.append(Cell(row: r, col: c))
                } else if grid[r][c] == FRESH {
                    freshCnt += 1
                }
            }
        }
        var time = 0
        while !queue.isEmpty && freshCnt > 0 {
            let size = queue.count
            for _ in 0..<size {
                let cell = queue.removeFirst()
                let dr = [0, 1, 0, -1]
                let dc = [1, 0, -1, 0]
                for idx in 0..<dr.count {
                    let rr = cell.row + dr[idx]
                    let cc = cell.col + dc[idx]
                    guard rr >= 0 && rr < rows && cc >= 0 && cc < cols
                            && grid[rr][cc] == FRESH else { continue }
                    freshCnt -= 1
                    grid[rr][cc] = ROTTEN
                    queue.append(Cell(row: rr, col: cc))
                }
            }
            time += 1
        }
        return freshCnt == 0 ? time : -1
    }
}
