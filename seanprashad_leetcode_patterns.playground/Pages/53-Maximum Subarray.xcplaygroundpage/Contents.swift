import Foundation

//https://leetcode.com/problems/maximum-subarray/

class Solution {
    func maxSubArray(_ nums: [Int]) -> Int {
        var res: Int = Int.min
        var curSum: Int = 0
        for num in nums {
            curSum += num
            curSum = max(curSum, num)
            res = max(res, curSum)
        }
        return res
    }
}
