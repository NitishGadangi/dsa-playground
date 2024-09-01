import Foundation

//https://leetcode.com/problems/shortest-path-in-binary-matrix/

class Solution {
    func shortestPathBinaryMatrix(_ grid: [[Int]]) -> Int {
        var grid = grid
        var n = grid.count

        // edge case
        guard grid[0][0] == 0 &&
                grid[n-1][n-1] == 0
        else { return -1 }

        var queue: [Cell] = []
        queue.append(Cell(row: 0, col: 0, dist: 1))
        grid[0][0] = 1 // mark as visited

        while !queue.isEmpty {
            let curCell = queue.removeFirst()
            let row = curCell.row
            let col = curCell.col
            let dist = curCell.dist

            if (row == n - 1) && (col == n - 1) {
                return dist
            }

            for dx in stride(from: -1, through: 1, by: 1) {
                for dy in stride(from: -1, through: 1, by: 1) {
                    let nextRow = row + dx
                    let nextCol = col + dy
                    if nextCol >= 0, nextCol < n,
                       nextRow >= 0, nextRow < n,
                       grid[nextRow][nextCol] == 0 {
                        queue.append(Cell(row: nextRow, col: nextCol, dist: dist + 1))
                        grid[nextRow][nextCol] = 1 // mark as visited
                    }
                }
            }
        }
        return -1
    }

    struct Cell {
        let row: Int
        let col: Int
        let dist: Int
    }
}

