import Foundation

//https://leetcode.com/problems/minimum-path-sum/?envType=study-plan-v2&envId=top-interview-150
class Solution {

    var memoMap: [String: Int] = [:]
    func minPathSum(_ grid: [[Int]]) -> Int {
        guard grid.count > 0, grid[0].count > 0 else { return 0 }
        let bottomRow = grid.count - 1
        let bottomCol = grid[0].count - 1
        return pathSum(grid: grid, row: bottomRow, col: bottomCol)
    }

    // start from bottom
    func pathSum(grid: [[Int]], row: Int, col: Int) -> Int {
        guard (row >= 0) && (col >= 0) else { return Int.max }
        
        if let res = memoMap["\(row)-\(col)"] {
            return res
        }

        let curVal = grid[row][col]
        
        if (row == 0) && (col == 0) {
            return curVal
        }

        let moveUp = pathSum(grid: grid, row: row - 1, col: col)
        let moveLeft = pathSum(grid: grid, row: row, col: col - 1)
        let res = curVal + min(moveUp, moveLeft)
        memoMap["\(row)-\(col)"] = res
        return res
    }

    // start from top
    func pathSumAlter(grid: [[Int]], row: Int, col: Int) -> Int {
        guard grid.count > 0, grid[0].count > 0 else { return 0 }

        if let res = memoMap["\(row)-\(col)"] {
            return res
        }

        let bottomRow = grid.count - 1
        let bottomCol = grid[0].count - 1

        let curVal = grid[row][col]

        if row == bottomRow && col == bottomCol {
            return curVal
        }

        let nextRow = row + 1
        let nextCol = col + 1

        var moveDown = Int.max
        if nextRow <= bottomRow {
            moveDown = pathSumAlter(grid: grid, row: nextRow, col: col)
        }

        var moveRight = Int.max
        if nextCol <= bottomCol {
            moveRight = pathSumAlter(grid: grid, row: row, col: nextCol)
        }
        let res = curVal + min(moveDown, moveRight)
        memoMap["\(row)-\(col)"] = res
        return res
    }
}
