import Foundation

//https://leetcode.com/problems/word-search/description/

class Solution {
    var chars: [Character] = []
    var visited: [[Bool]] = []
    func exist(_ board: [[Character]], _ word: String) -> Bool {
        let rows = board.count
        let cols = board[0].count
        visited = Array(repeating: Array(repeating: false, count: cols), count: rows)
        chars = word.map { Character(String($0)) }
        for r in 0..<rows {
            for c in 0..<cols {
                if dfs(board, r: r, c: c, pos: 0) {
                    return true
                }
            }
        }
        return false
    }

    func dfs(_ board: [[Character]], r: Int, c: Int, pos: Int) -> Bool {
        if pos == chars.count { return true }
        let rows = board.count
        let cols = board[0].count
        guard r >= 0 && r < rows && c >= 0 && c < cols
                && !visited[r][c] else { return false }
        guard board[r][c] == chars[pos] else { return false }

        visited[r][c] = true

        var res: Bool = false
        var dr = [0, 1, 0, -1]
        var dc = [1, 0, -1, 0]
        for idx in 0..<4 {
            let rr = r + dr[idx]
            let cc = c + dc[idx]
            res = res || dfs(board, r: rr, c: cc, pos: pos + 1)
        }

        visited[r][c] = false
        return res
    }
}
