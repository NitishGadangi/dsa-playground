import Foundation

//https://leetcode.com/problems/surrounded-regions/?envType=study-plan-v2&envId=top-interview-150

// ignore the O's which are in all four borders along with onces that are connected to these
class Solution {
    func solve(_ board: inout [[Character]]) {
        guard board.count > 1,
              board[0].count > 1
        else { return }

        let rows = board.count
        let columns = board[0].count

        //top & bottom borders
        for j in stride(from: 0, to: columns, by: 1) {
            if board[0][j] == "O" {
                dfs(&board, i: 0, j: j)
            }
            if board[rows - 1][j] == "O" {
                dfs(&board, i: rows - 1, j: j)
            }
        }

        //left & right borders
        for i in stride(from: 0, to: rows, by: 1) {
            if board[i][0] == "O" {
                dfs(&board, i: i, j: 0)
            }
            if board[i][columns - 1] == "O" {
                dfs(&board, i: i, j: columns - 1)
            }
        }

        //mark remaining O -> X && Y -> O
        for i in stride(from: 0, to: rows, by: 1) {
            for j in stride(from: 0, to: columns, by: 1) {
                if (board[i][j] == "O") {
                    board[i][j] = "X"
                }
                if (board[i][j] == "Y") {
                    board[i][j] = "O"
                }
            }
        }
    }

    func dfs(_ board: inout [[Character]], i: Int, j: Int) {
        let rows = board.count
        let columns = board[0].count
        guard i >= 0 && i < rows,
              j >= 0 && j < columns,
              board[i][j] == "O"
        else { return }

        board[i][j] = "Y"

        dfs(&board, i: i, j: j - 1) // left
        dfs(&board, i: i, j: j + 1) // right
        dfs(&board, i: i - 1, j: j) // top
        dfs(&board, i: i + 1, j: j) // bottom
    }
}
