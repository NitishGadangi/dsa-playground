import Foundation

//https://leetcode.com/problems/rotating-the-box/

// 90deg rotate
// rr, cc = c, rows - 1 - r
// 1st row -> last col, 1st col -> 1st row
class Solution {
    func rotateTheBox(_ boxGrid: [[Character]]) -> [[Character]] {
        let rows = boxGrid.count
        let cols = boxGrid[0].count
        var grid90 = rotate90(boxGrid)
        return applyGravity(grid90)
    }

    func rotate90(_ grid: [[Character]]) -> [[Character]] {
        let rows = grid.count
        let cols = grid[0].count
        var res: [[Character]] = Array(repeating: Array(repeating: ".", count: rows), count: cols)
        for r in 0..<rows {
            for c in 0..<cols {
                let rr = c
                let cc = rows - 1 - r
                res[rr][cc] = grid[r][c]
            }
        }
        return res
    }

    func applyGravity(_ grid: [[Character]]) -> [[Character]] {
        let rows = grid.count
        let cols = grid[0].count
        var grid = grid
        for c in 0..<cols {
            var queue: [Int] = [] // save row idx
            for r in stride(from: rows - 1, through: 0, by: -1) {
                switch grid[r][c] {
                case "#":
                    if queue.isEmpty { continue }
                    let rr = queue.removeFirst()
                    grid[rr][c] = grid[r][c]
                    grid[r][c] = "."
                    queue.append(r)
                case "*":
                    queue.removeAll()
                case ".":
                    queue.append(r)
                default:
                    continue
                }
            }
        }
        return grid
    }
}
