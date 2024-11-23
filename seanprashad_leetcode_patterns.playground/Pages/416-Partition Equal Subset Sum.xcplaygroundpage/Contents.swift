import Foundation

//https://leetcode.com/problems/partition-equal-subset-sum/

class Solution {
    var memoMap: [String: Bool] = [:]
    func canPartition(_ nums: [Int]) -> Bool {
        var sum = 0
        for num in nums {
            sum += num
        }
        guard sum % 2 == 0 else { return false }
        let target = sum / 2
        return partition(nums: nums, idx: 0, rem: target)
    }
    
    func partition(nums: [Int], idx: Int, rem: Int) -> Bool {
        if rem == 0 { return true }
        if rem < 0 || idx >= nums.count { return false }
        
        let key = "\(idx)-\(rem)"
        if let res = memoMap[key] {
            return res
        }
        
        let curNum = nums[idx]
        let consider = partition(nums: nums, idx: idx + 1, rem: rem - curNum)
        let ignroe = partition(nums: nums, idx: idx + 1, rem: rem)
        let res = consider || ignroe
        memoMap[key] = res
        return res
    }
}
