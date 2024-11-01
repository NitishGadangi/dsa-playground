import Foundation

//https://leetcode.com/problems/maximum-average-subarray-i/

class Solution {
    func findMaxAverage(_ nums: [Int], _ k: Int) -> Double {
        guard nums.count >= k else { return -1 }
        var curSum = 0
        for idx in 0..<k {
            curSum += nums[idx]
        }
        var res: Double = Double(curSum)/Double(k)
        for idx in k..<nums.count {
            let leftNum = nums[idx - k]
            let newNum = nums[idx]
            curSum = curSum - leftNum + newNum
            let newAvg: Double = Double(curSum)/Double(k)
            res = max(res, newAvg)
        }
        return res
    }
}
