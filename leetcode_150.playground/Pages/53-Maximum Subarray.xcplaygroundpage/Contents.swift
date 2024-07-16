import Foundation

//https://leetcode.com/problems/maximum-subarray/?envType=study-plan-v2&envId=top-interview-150

class Solution {
    func maxSubArray(_ nums: [Int]) -> Int {
        var maxSum: Int = Int.min
        var curSum = 0
        for num in nums {
            curSum += num
            curSum = max(curSum, num)
            maxSum = max(maxSum, curSum)
        }
        return maxSum
    }
}
