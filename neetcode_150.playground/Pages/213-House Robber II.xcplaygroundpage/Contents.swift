import Foundation

//https://leetcode.com/problems/house-robber-ii/

class Solution {
    var memoMap: [Int: Int] = [:]
    func rob(_ nums: [Int]) -> Int {
        guard nums.count > 1 else { return nums[0] }
        let ditchFirst = rob(nums, idx: 1, end: nums.count - 1)
        memoMap = [:]
        let ditchLast = rob(nums, idx: 0, end: nums.count - 2)
        return max(ditchFirst, ditchLast)
    }

    func rob(_ nums: [Int], idx: Int, end: Int) -> Int {
        guard idx <= end else { return 0 }
        if let res = memoMap[idx] { return res }
        let cur = nums[idx] + rob(nums, idx: idx + 2, end: end)
        let next = rob(nums, idx: idx + 1, end: end)
        let res = max(cur, next)
        memoMap[idx] = res
        return res
    }
}
