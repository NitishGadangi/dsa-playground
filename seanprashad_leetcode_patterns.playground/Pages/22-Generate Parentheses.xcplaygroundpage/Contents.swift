import Foundation

//https://leetcode.com/problems/generate-parentheses/

class Solution {
    func generateParenthesis(_ n: Int) -> [String] {
        var res: [String] = []
        var temp: [String] = []
        backtrack(res: &res, temp: &temp, left: 0, right: 0, n: n)
        return res
    }
    
    func backtrack(res: inout [String], temp: inout [String], left: Int, right: Int, n: Int) {
        if temp.count == 2 * n {
            let joined = temp.joined()
            res.append(joined)
            return
        }
        if left < n {
            temp.append("(")
            backtrack(res: &res, temp: &temp, left: left + 1, right: right, n: n)
            temp.removeLast()
        }
        if left > right {
            temp.append(")")
            backtrack(res: &res, temp: &temp, left: left, right: right + 1, n: n)
            temp.removeLast()
        }
    }
}
