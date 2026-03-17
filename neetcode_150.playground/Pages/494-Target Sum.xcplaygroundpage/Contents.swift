import Foundation

//https://leetcode.com/problems/target-sum/description/

class Solution {
    var memoMap: [String: Int] = [:]
    func findTargetSumWays(_ nums: [Int], _ target: Int) -> Int {
        return calculate(nums, rem: target, idx: 0)
    }

    func calculate(_ nums: [Int], rem: Int, idx: Int) -> Int {
        if idx == nums.count {
            return rem == 0 ? 1 : 0
        }
        let key = "\(idx)-\(rem)"
        if let res = memoMap[key] { return res }
        let curPositive = calculate(nums, rem: rem - nums[idx], idx: idx + 1)
        let curNegative = calculate(nums, rem: rem + nums[idx], idx: idx + 1)
        let res =  curPositive + curNegative
        memoMap[key] = res
        return res
    }
}
