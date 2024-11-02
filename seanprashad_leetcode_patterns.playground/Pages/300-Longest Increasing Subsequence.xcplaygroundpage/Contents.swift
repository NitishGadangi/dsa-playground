import Foundation

//https://leetcode.com/problems/longest-increasing-subsequence/

class Solution {
    func lengthOfLIS(_ nums: [Int]) -> Int {
        let n = nums.count
        var dp: [Int] = Array(repeating: 0, count: n)
        var res: Int = 1
        
        for idx in 0..<n {
            let curNum = nums[idx]
            var curMax = 0
            for subIdx in 0..<idx {
                if nums[subIdx] < curNum {
                    curMax = max(curMax, dp[subIdx])
                }
            }
            dp[idx] = 1 + curMax
            res = max(res, dp[idx])
        }
        return dp[n - 1]
    }
}
