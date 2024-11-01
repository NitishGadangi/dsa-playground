import Foundation

//https://leetcode.com/problems/target-sum/

class Solution {
    var count: Int = 0
    func findTargetSumWays(_ nums: [Int], _ target: Int) -> Int {
        count = 0
        backtrack(nums: nums, target: target, cur: 0, idx: 0)
        return count
    }
    
    func backtrack(nums: [Int], target: Int, cur: Int, idx: Int) {
        if idx == nums.count {
            if cur == target {
                count += 1
            }
            return
        }
        let num = nums[idx]
        backtrack(nums: nums, target: target, cur: cur + num, idx: idx + 1)
        backtrack(nums: nums, target: target, cur: cur - num, idx: idx + 1)
    }
}
