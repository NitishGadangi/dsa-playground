import Foundation

//https://leetcode.com/problems/pacific-atlantic-water-flow/description/

class Solution {
    struct Cell {
        let row: Int
        let col: Int
    }

    func pacificAtlantic(_ heights: [[Int]]) -> [[Int]] {
        var rows = heights.count
        var cols = heights[0].count
        var pacificVis: [[Bool]] = Array(repeating: Array(repeating: false, count: cols), count: rows)
        var pacificQueue: [Cell] = []
        var atlanticVis: [[Bool]] = Array(repeating: Array(repeating: false, count: cols), count: rows)
        var atlanticQueue: [Cell] = []
        for r in 0..<rows {
            pacificVis[r][0] = true
            pacificQueue.append(Cell(row: r, col: 0))
            atlanticVis[r][cols - 1] = true
            atlanticQueue.append(Cell(row: r, col: cols - 1))
        }
        for c in 0..<cols {
            pacificVis[0][c] = true
            pacificQueue.append(Cell(row: 0, col: c))
            atlanticVis[rows - 1][c] = true
            atlanticQueue.append(Cell(row: rows - 1, col: c))
        }
        climbTheCoast(heights, queue: pacificQueue, visited: &pacificVis)
        climbTheCoast(heights, queue: atlanticQueue, visited: &atlanticVis)
        var res: [[Int]] = []
        for r in 0..<rows {
            for c in 0..<cols {
                if pacificVis[r][c] && atlanticVis[r][c] {
                    res.append([r, c])
                }
            }
        }
        return res
    }

    func climbTheCoast(_ heights: [[Int]], queue: [Cell], visited: inout [[Bool]]) {
        var rows = heights.count
        var cols = heights[0].count
        var queue = queue
        while !queue.isEmpty {
            let cell = queue.removeFirst()
            let curH = heights[cell.row][cell.col]
            let dr = [0, 1, 0, -1]
            let dc = [1, 0, -1, 0]
            for idx in 0..<dr.count {
                let rr = cell.row + dr[idx]
                let cc = cell.col + dc[idx]
                guard rr >= 0 && rr < rows && cc >= 0 && cc < cols
                        && !visited[rr][cc] && heights[rr][cc] >= curH else { continue }
                visited[rr][cc] = true
                queue.append(Cell(row: rr, col: cc))
            }
        }
    }
}
