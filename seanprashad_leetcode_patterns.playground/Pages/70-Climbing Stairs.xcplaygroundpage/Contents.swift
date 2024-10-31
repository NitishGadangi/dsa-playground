import Foundation

//https://leetcode.com/problems/climbing-stairs/

class Solution {
    var memoMap: [Int: Int] = [:]
    func climbStairsRec(_ n: Int) -> Int {
        guard n > 2 else { return n }
        if let res = memoMap[n] {
            return res
        }
        let oneStep = climbStairsRec(n - 1)
        let twoSteps = climbStairsRec(n - 2)
        let res = oneStep + twoSteps
        memoMap[n] = res
        return res
    }
    
    func climbStairs(_ n: Int) -> Int {
        guard n > 2 else { return n }
        var dp: [Int] = Array(repeating: 0, count: n + 1)
        dp[0] = 0
        dp[1] = 1
        dp[2] = 2
        for idx in 3...n {
            dp[idx] = dp[idx - 1] + dp[idx - 2]
        }
        return dp[n]
    }
}
