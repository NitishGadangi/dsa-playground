import Foundation

//https://leetcode.com/problems/longest-common-subsequence

class Solution {
    func longestCommonSubsequence(_ text1: String, _ text2: String) -> Int {
        var dp: [[Int]] = Array(
            repeating: Array(repeating: 0, count: text2.count + 1),
            count: text1.count + 1
        )
        for col in stride(from: text2.count - 1, through: 0, by: -1) {
            for row in stride(from: text1.count - 1, through: 0, by: -1) {
                var res: Int
                if Array(text1)[row] == Array(text2)[col] {
                    res = 1 + dp[row + 1][col + 1]
                } else {
                    let ignore1 = dp[row + 1][col]
                    let ignore2 = dp[row][col + 1]
                    res = max(ignore1, ignore2)
                }
                dp[row][col] = res
            }
        }
        return dp[0][0]
    }
}

class RecSolution {
    var memoMap: [String: Int] = [:]
    func longestCommonSubsequence(_ text1: String, _ text2: String) -> Int {
        return recLCS(text1: text1, text2: text2, p1: 0, p2: 0)
    }

    func recLCS(text1: String, text2: String, p1: Int, p2: Int) -> Int {
        guard p1 < text1.count && p2 < text2.count else { return 0 }

        let memoKey = "\(p1)-\(p2)"
        if let res = memoMap[memoKey] {
            return res
        }

        var res: Int = 0
        if Array(text1)[p1] == Array(text2)[p2] {
            res = 1 + recLCS(text1: text1, text2: text2, p1: p1 + 1, p2: p2 + 1)
        } else {
            let ignore1 = recLCS(text1: text1, text2: text2, p1: p1 + 1, p2: p2)
            let ignore2 = recLCS(text1: text1, text2: text2, p1: p1, p2: p2 + 1)
            res = max(ignore1, ignore2)
        }
        memoMap[memoKey] = res

        return res
    }
}
