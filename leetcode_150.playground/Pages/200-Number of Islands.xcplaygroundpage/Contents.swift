import Foundation

//https://leetcode.com/problems/number-of-islands/description/?envType=study-plan-v2&envId=top-interview-150

class Solution {
    func numIslands(_ grid: [[Character]]) -> Int {
        guard grid.count > 0 else { return 0 }
        var grid = grid
        let rows = grid.count
        let columns = grid[0].count
        var count = 0

        // iterate over grid
        for i in stride(from: 0, to: rows, by: 1) {
            for j in stride(from: 0, to: columns, by: 1) {
                if (grid[i][j] == "1") {
                    dfs(&grid, i: i, j: j, rows: rows, columns: columns)
                    count += 1
                }
            }
        }
        return count
    }

    func dfs(_ grid: inout [[Character]], i: Int, j: Int, rows: Int, columns: Int) {
        guard i >= 0 && i < rows,
              j >= 0 && j < columns,
              grid[i][j] == "1"
        else { return }

        grid[i][j] = "2" // marking as visited

        // move around
        dfs(&grid, i: i, j: j - 1, rows: rows, columns: columns) //left
        dfs(&grid, i: i, j: j + 1, rows: rows, columns: columns) // right
        dfs(&grid, i: i - 1, j: j, rows: rows, columns: columns) // top
        dfs(&grid, i: i + 1, j: j, rows: rows, columns: columns) // bottom
    }
}
