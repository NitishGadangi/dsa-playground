import Foundation

//https://leetcode.com/problems/house-robber/

class Solution {
    var memoMap: [Int: Int] = [:]
    func rob(_ nums: [Int]) -> Int {
        var dp: [Int] = Array(repeating: 0, count: nums.count)
        for (idx, val) in nums.enumerated() {
            let cur = val + (idx >= 2 ? dp[idx - 2] : 0)
            let prev = idx > 0 ? dp[idx - 1] : 0
            dp[idx] = max(cur, prev)
        }
        return dp[nums.count - 1]
    }
    
    func robRec(nums: [Int], idx: Int) -> Int {
        guard idx < nums.count else { return 0 }
        if let res = memoMap[idx] {
            return res
        }
        let cur = nums[idx] + robRec(nums: nums, idx: idx + 2)
        let next = robRec(nums: nums, idx: idx + 1)
        let res = max(cur, next)
        memoMap[idx] = res
        return res
    }
}
