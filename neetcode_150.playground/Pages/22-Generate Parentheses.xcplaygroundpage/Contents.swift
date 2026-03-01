import Foundation

//https://leetcode.com/problems/generate-parentheses/

class Solution {
    func generateParenthesis(_ n: Int) -> [String] {
        var res: [String] = []
        var temp: [String] = []
        backtrack(n, res: &res, temp: &temp, left: 0, right: 0)
        return res
    }

    func backtrack(_ n: Int, res: inout [String], temp: inout [String], left: Int, right: Int) {
        if temp.count == 2 * n {
            res.append(temp.joined(separator: ""))
            return
        }
        if left < n {
            temp.append("(")
            backtrack(n, res: &res, temp: &temp, left: left + 1, right: right)
            temp.removeLast()
        }
        if left > right {
            temp.append(")")
            backtrack(n, res: &res, temp: &temp, left: left, right: right + 1)
            temp.removeLast()
        }
    }
}
