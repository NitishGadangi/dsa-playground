import Foundation

//https://leetcode.com/problems/longest-increasing-subsequence/description/

class Solution {
    func lengthOfLIS(_ nums: [Int]) -> Int {
        var dp: [Int] = Array(repeating: 1, count: nums.count)
        for (idx, num) in nums.enumerated() {
            var cur = idx
            while cur >= 0 {
                if nums[cur] < num {
                    dp[idx] = max(dp[idx], dp[cur] + 1)
                }
                cur -= 1
            }
        }
        return dp.max()!
    }
}
