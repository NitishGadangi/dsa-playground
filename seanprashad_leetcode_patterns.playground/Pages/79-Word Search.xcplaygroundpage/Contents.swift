import Foundation

//https://leetcode.com/problems/word-search/

class Solution {
    var visited: [String: Bool] = [:]
    func exist(_ board: [[Character]], _ word: String) -> Bool {
        guard board.count > 0 else { return false }
        let rows = board.count
        let cols = board[0].count
        
        for r in 0..<rows {
            for c in 0..<cols {
                if dfs(board, word, r: r, c: c, k: 0) {
                    return true
                }
            }
        }
        return false
    }
    
    func dfs(_ board: [[Character]], _ word: String, r: Int, c: Int, k: Int) -> Bool {
        if k == word.count {
            return true
        }
        
        let rows = board.count
        let cols = board[0].count
        let visKey = "\(r)-\(c)"
        guard r >= 0 && r < rows && c >= 0 && c < cols
                && !(visited[visKey] ?? false) && board[r][c] == Array(word)[k]
        else { return false }
        
        var res: Bool = false
        let x = [1, 0, -1, 0]
        let y = [0, 1, 0, -1]
        
        visited[visKey] = true
        for idx in 0..<4 {
            res = res || dfs(board, word, r: r + x[idx], c: c + y[idx], k: k + 1)
        }
        visited[visKey] = false
        
        return res
    }
}
