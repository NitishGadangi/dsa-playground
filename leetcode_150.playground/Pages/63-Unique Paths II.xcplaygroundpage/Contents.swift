import Foundation

//https://leetcode.com/problems/unique-paths-ii/?envType=study-plan-v2&envId=top-interview-150
class Solution {
    var memoMap: [String: Int] = [:]
    func uniquePathsWithObstacles(_ obstacleGrid: [[Int]]) -> Int {
        guard (obstacleGrid.count > 0) && (obstacleGrid[0].count > 0) else { return 0 }
        let bottomRow = obstacleGrid.count - 1
        let bottomCol = obstacleGrid[0].count - 1
        return uniquePath(grid: obstacleGrid, row: bottomRow, col: bottomCol)
    }

    // starting from bottom right
    func uniquePath(grid: [[Int]], row: Int, col: Int) -> Int {
        guard (row >=0) && (col >= 0) && (grid[row][col] == 0)
        else { return 0 }

        if let res = memoMap["\(row)-\(col)"] {
            return res
        }

        if (row == 0) && (col == 0) { return 1 }

        let moveUp = uniquePath(grid: grid, row: row - 1, col: col)
        let moveLeft = uniquePath(grid: grid, row: row, col: col - 1)
        
        let res = moveUp + moveLeft
        memoMap["\(row)-\(col)"] = res
        return res
    }
}
