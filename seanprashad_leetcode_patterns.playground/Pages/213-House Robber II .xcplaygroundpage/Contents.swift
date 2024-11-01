import Foundation

//https://leetcode.com/problems/house-robber-ii/

class Solution {
    func rob(_ nums: [Int]) -> Int {
        guard nums.count > 1 else { return nums[0] }
        let ignoreFirst = rob(nums: nums, start: 1, end: nums.count)
        let ignoreLast = rob(nums: nums, start: 0, end: nums.count - 1)
        return max(ignoreFirst, ignoreLast)
    }
    
    // excluding end
    func rob(nums: [Int], start: Int, end: Int) -> Int {
        var dp: [Int] = Array(repeating: 0, count: nums.count)
        for idx in start..<end {
            let curVal = nums[idx]
            let cur = curVal + (idx - 2 >= 0 ? dp[idx - 2] : 0)
            let prev = idx - 1 >= 0 ? dp[idx - 1] : 0
            dp[idx] = max(cur, prev)
        }
        return dp[end - 1]
    }
}
