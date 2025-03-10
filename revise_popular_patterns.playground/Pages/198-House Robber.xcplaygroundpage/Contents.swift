import Foundation

//https://leetcode.com/problems/house-robber/

class Solution {
    func rob(_ nums: [Int]) -> Int {
        let n = nums.count
        var dp = Array(repeating: 0, count: n + 1)
        for idx in 0...n {
            let numsIdx = idx - 1
            let cur = (nums[safe: numsIdx] ?? 0) + (dp[safe: idx - 2] ?? 0)
            let prev = dp[safe: idx - 1] ?? 0
            dp[idx] = max(cur, prev)
        }
        return dp[n]
    }
}

extension Array {
    subscript(safe index: Int) -> Element? {
        guard index >= 0 && index < count else { return nil }
        return self[index]
    }
}
