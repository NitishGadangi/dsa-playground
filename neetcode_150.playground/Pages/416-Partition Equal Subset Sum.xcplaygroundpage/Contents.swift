import Foundation

//https://leetcode.com/problems/partition-equal-subset-sum/

class Solution {
    var memoMap: [String: Bool] = [:]
    func canPartition(_ nums: [Int]) -> Bool {
        var sum = nums.reduce(0, +)
        guard sum % 2 == 0 else { return false }
        return canSum(nums, idx: 0, rem: sum/2)
    }

    func canSum(_ nums: [Int], idx: Int, rem: Int) -> Bool {
        if rem == 0 { return true }
        if rem < 0 { return false }
        guard idx < nums.count  else { return false }
        let key = "\(idx)-\(rem)"
        if let res = memoMap[key] { return res }
        let include = canSum(nums, idx: idx + 1, rem: rem - nums[idx])
        let exclude = canSum(nums, idx: idx + 1, rem: rem)
        let res = include || exclude
        memoMap[key] = res
        return res
    }
}
