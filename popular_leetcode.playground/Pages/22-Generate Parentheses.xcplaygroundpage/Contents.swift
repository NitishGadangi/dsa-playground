import Foundation

//https://leetcode.com/problems/generate-parentheses

class Solution {
    func generateParenthesis(_ n: Int) -> [String] {
        var res: [String] = []
        var temp: [String] = []
        backTrack(res: &res, temp: &temp, left: 0, right: 0, n: n)
        return res
    }

    func backTrack(res: inout [String], temp: inout [String], left: Int, right: Int, n: Int) {
        if temp.count == 2 * n {
            let curRes = temp.joined(separator: "")
            res.append(curRes)
            return
        }

        if left < n {
            temp.append("(")
            backTrack(res: &res, temp: &temp, left: left + 1, right: right, n: n)
            temp.removeLast()
        }
        if left > right {
            temp.append(")")
            backTrack(res: &res, temp: &temp, left: left, right: right + 1, n: n)
            temp.removeLast()
        }
    }
}
