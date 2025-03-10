import Foundation

//https://leetcode.com/problems/pacific-atlantic-water-flow/

class Solution {
    func pacificAtlantic(_ heights: [[Int]]) -> [[Int]] {
        var rows: Int = heights.count
        var cols: Int = heights[0].count
        var pacific: [[Bool]] = Array(repeating: Array(repeating: false, count: cols), count: rows)
        // pacific - top & left
        for r in 0..<rows {
            // left
            fill(heights: heights, vis: &pacific, r: r, c: 0, prevHeight: Int.min)
        }
        for c in 0..<cols {
            // right
            fill(heights: heights, vis: &pacific, r: 0, c: c, prevHeight: Int.min)
        }

        var atlantic: [[Bool]] = Array(repeating: Array(repeating: false, count: cols), count: rows)
        // atlantic - right & bottom
        for r in 0..<rows {
            // right
            fill(heights: heights, vis: &atlantic, r: r, c: cols - 1, prevHeight: Int.min)
        }
        for c in 0..<cols {
            // bottom
            fill(heights: heights, vis: &atlantic, r: rows - 1, c: c, prevHeight: Int.min)
        }

        var res: [[Int]] = []
        for r in 0..<rows {
            for c in 0..<cols {
                if pacific[r][c] && atlantic[r][c] {
                    res.append([r, c])
                }
            }
        }

        return res
    }

    func fill(heights: [[Int]], vis: inout [[Bool]], r: Int, c: Int, prevHeight: Int) {
        var rows: Int = heights.count
        var cols: Int = heights[0].count
        guard r >= 0 && r < rows && c >= 0 && c < cols && !vis[r][c] else { return }
        var curHeight = heights[r][c]
        guard curHeight >= prevHeight else { return }
        vis[r][c] = true
        var dr = [0, 1]
        var dc = [1, 0]
        for idx in 0..<2 {
            let rr = r + dr[idx]
            let cc = c + dc[idx]
            fill(heights: heights, vis: &vis, r: rr, c: cc, prevHeight: curHeight)
        }
    }
}
