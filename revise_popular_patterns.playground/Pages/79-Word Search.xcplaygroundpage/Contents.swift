import Foundation

//https://leetcode.com/problems/word-search/

class Solution {
    func exist(_ board: [[Character]], _ word: String) -> Bool {
        let rows = board.count
        let cols = board[0].count
        for r in 0..<rows {
            for c in 0..<cols {
                var vis = Array(repeating: Array(repeating: false, count: cols), count: rows)
                if dfs(board, word, k: 0, r: r, c: c, vis: &vis) {
                    return true
                }
            }
        }
        return false
    }

    func dfs(_ board: [[Character]], _ word: String, k: Int, r: Int, c: Int, vis: inout [[Bool]]) -> Bool {
        if k == word.count { return true }

        let rows = board.count
        let cols = board[0].count
        guard r >= 0 && r < rows && c >= 0 && c < cols else { return false }
        guard board[r][c] == Array(word)[k] && !vis[r][c] else {
            return false
        }

        vis[r][c] = true

        let dr = [0, 1, 0, -1]
        let dc = [1, 0, -1, 0]
        for idx in 0..<4 {
            let rr = r + dr[idx]
            let cc = c + dc[idx]
            if dfs(board, word, k: k + 1, r: rr, c: cc, vis: &vis) {
                return true
            }
        }
        vis[r][c] = false

        return false
    }
}

let res = Solution().exist([["A","B","C","E"],["S","F","E","S"],["A","D","E","E"]], "ABCEFSADEESE")
