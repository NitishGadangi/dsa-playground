import Foundation

//https://leetcode.com/problems/surrounded-regions/description/

class Solution {
    func solve(_ board: inout [[Character]]) {
        let rows = board.count
        let cols = board[0].count

        for r in 0..<rows {
            for c in 0..<cols {
                if (r == 0 || c == 0 || r == rows - 1 || c  == cols - 1) && board[r][c] == "O" {
                    capture(&board, r: r, c: c, replace: "Y")
                }
            }
        }

        for r in 0..<rows {
            for c in 0..<cols {
                if board[r][c] == "O" {
                    capture(&board, r: r, c: c, replace: "X")
                }
            }
        }

        for r in 0..<rows {
            for c in 0..<cols {
                if board[r][c] == "Y" {
                    board[r][c] = "O"
                }
            }
        }
    }

    func capture(_ board: inout [[Character]], r: Int, c: Int, replace: Character) {
        let rows = board.count
        let cols = board[0].count
        guard r >= 0 && r < rows && c >= 0 && c < cols else { return }
        board[r][c] = replace
        let dr = [0, 1, 0, -1]
        let dc = [1, 0, -1, 0]
        for idx in 0..<dr.count {
            let rr = r + dr[idx]
            let cc = c + dc[idx]
            guard rr >= 0 && rr < rows && cc >= 0 && cc < cols
                    && board[rr][cc] == "O" else { continue }
            capture(&board, r: rr, c: cc, replace: replace)
        }
    }
}
