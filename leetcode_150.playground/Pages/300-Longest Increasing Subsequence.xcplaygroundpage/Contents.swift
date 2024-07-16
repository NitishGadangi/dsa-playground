import Foundation

//https://leetcode.com/problems/longest-increasing-subsequence/description/?envType=study-plan-v2&envId=top-interview-150

class Solution {
    func lengthOfLIS(_ nums: [Int]) -> Int {
        var dp: [Int] = Array(repeating: 1, count: nums.count)
        let count = nums.count
        for i in 1..<nums.count {
            let target = nums[i]
            for j in 0...i {
                let curNum = nums[j]
                if curNum < target {
                    let dpj = dp[j] + 1
                    let dpi = dp[i]
                    dp[i] = max(dpi, dpj)
                }
            }
        }

        var res = 1
        for val in dp {
            res = max(res, val)
        }
        return res
    }
}
