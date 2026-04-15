import Foundation

// https://leetcode.com/problems/word-search/description/

class Solution {
    var visited: [[Bool]] = []
    func exist(_ board: [[Character]], _ word: String) -> Bool {
        let rows = board.count
        let cols = board[0].count
        for r in 0..<rows {
            for c in 0..<cols {
                visited = Array(repeating: Array(repeating: false, count: cols), count: rows)
                if dfs(board, word: word, r: r, c: c, idx: 0) {
                    return true
                }
            }
        }
        return false
    }

    func dfs(_ board: [[Character]], word: String, r: Int, c: Int, idx: Int) -> Bool {
        if idx == word.count { return true }
        let rows = board.count
        let cols = board[0].count
        guard r >= 0 && r < rows && c >= 0 && c < cols && !visited[r][c] else { return false }
        guard board[r][c] == Array(word)[idx] else { return false }
        visited[r][c] = true
        let dr = [0, 1, 0, -1]
        let dc = [1, 0, -1, 0]
        for dx in 0..<4 {
            let rr = r + dr[dx]
            let cc = c + dc[dx]
            if dfs(board, word: word, r: rr, c: cc, idx: idx + 1) {
                return true
            }
        }
        visited[r][c] = false
        return false
    }
}
