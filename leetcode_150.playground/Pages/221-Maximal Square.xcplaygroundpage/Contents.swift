import Foundation

//https://leetcode.com/problems/maximal-square/?envType=study-plan-v2&envId=top-interview-150
class Solution {
    var memoMap: [String: Int] = [:]
    func maximalSquare(_ matrix: [[Character]]) -> Int {
        let lastRow = matrix.count - 1
        let lastCol = matrix[0].count - 1
        dfs(matrix, i: lastRow, j: lastCol)

        var res = 0
        print(memoMap)
        for val in memoMap.values {
            res = max(res, val)
        }
        return res * res
    }

    func dfs(_ matrix: [[Character]], i: Int, j: Int) -> Int {
        guard (i >= 0) && (j >= 0) else { return 0 }

        if let res = memoMap["\(i)-\(j)"] {
            return res
        }

        let considerCurIndex = matrix[i][j] == "1"

        let moveUp = dfs(matrix, i: i-1, j: j)
        let moveLeft = dfs(matrix, i: i, j: j-1)
        let moveCross = dfs(matrix, i: i-1, j: j-1)
        var res = 0
        if considerCurIndex {
            res = 1 + min(moveUp, min(moveLeft, moveCross))
        }
        memoMap["\(i)-\(j)"] = res
        return res
    }
}

let solver = Solution()
let res = solver.maximalSquare([["1","0","1","0","0"],["1","0","1","1","1"],["1","1","1","1","1"],["1","0","0","1","0"]])
print(res)
