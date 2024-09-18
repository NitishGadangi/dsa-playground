import Foundation

//https://leetcode.com/problems/count-sub-islands

class Solution {
    var visitMap: [String: Bool] = [:]
    func countSubIslands(_ grid1: [[Int]], _ grid2: [[Int]]) -> Int {
        guard grid2.count > 0 else { return 0 }
        let nRows = grid2.count
        let nCols = grid2[0].count
        var res: Int = 0
        for r in 0..<nRows {
            for c in 0..<nCols {
                if (visitMap["\(r)-\(c)"] ?? false) == false && grid2[r][c] == 1 {
                    let isSubIsland = dfs(grid1, grid2, r: r, c: c)
                    if isSubIsland {
                        res += 1
                    }
                }
            }
        }
        return res
    }

    func dfs(_ grid1: [[Int]], _ grid2: [[Int]], r: Int, c: Int) -> Bool {
        let nRows = grid2.count
        let nCols = grid2[0].count
        visitMap["\(r)-\(c)"] = true
        var isSubIsland = grid1[r][c] == grid2[r][c]

        var directions: [[Int]] = [[0,1], [0, -1], [1, 0], [-1, 0]]
        for path in directions {
            let dr = r + path[0]
            let dc = c + path[1]

            if dr >= 0 && dr < nRows 
                && dc >= 0 && dc < nCols
                && (visitMap["\(dr)-\(dc)"] ?? false) == false
                && grid2[dr][dc] == 1 {

                let validSubIsland = dfs(grid1, grid2, r: dr, c: dc)
                isSubIsland = isSubIsland && validSubIsland
            }
        }
        return isSubIsland
    }
}
