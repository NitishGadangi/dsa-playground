import Foundation

//https://leetcode.com/problems/minimum-size-subarray-sum/?envType=study-plan-v2&envId=top-interview-150
class Solution {
    func minSubArrayLen(_ target: Int, _ nums: [Int]) -> Int {
        var start = 0
        var end = 0
        var curSum = 0
        var minArr = Int.max
        while end < nums.count {
            curSum += nums[end]
            while (start <= end) && (curSum >= target) {
                let curSize = (end - start) + 1
                minArr = min(minArr, curSize)
                curSum -= nums[start]
                start += 1
            }
            end += 1
        }
        if minArr == Int.max {
            return 0
        }
        return minArr
    }
}
