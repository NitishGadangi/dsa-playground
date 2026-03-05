import Foundation

//https://leetcode.com/problems/maximum-subarray/description/

class Solution {
    func maxSubArray(_ nums: [Int]) -> Int {
        var curSum: Int = 0
        var maxSum: Int = Int.min
        for num in nums {
            curSum += num
            curSum = max(curSum, num)
            maxSum = max(maxSum, curSum)
        }
        return maxSum
    }
}
