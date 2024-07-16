import Foundation

//https://leetcode.com/problems/maximum-sum-circular-subarray/?envType=study-plan-v2&envId=top-interview-150

class Solution {
    func maxSubarraySumCircular(_ nums: [Int]) -> Int {
        var maxSum: Int = Int.min
        var minSum: Int = Int.max
        var curMax = 0
        var curMin = 0
        var totalSum = 0
        for curNum in nums {
            curMax += curNum
            curMax = max(curMax, curNum)
            maxSum = max(maxSum, curMax)

            curMin += curNum
            curMin = min(curMin, curNum)
            minSum = min(minSum, curMin)

            totalSum += curNum
        }
        if maxSum < 0 {
            return maxSum
        }
        return max(maxSum, totalSum - minSum)
    }
}
