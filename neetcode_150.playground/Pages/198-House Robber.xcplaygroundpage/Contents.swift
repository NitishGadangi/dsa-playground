import Foundation

//https://leetcode.com/problems/house-robber/description/

class Solution {
    var memoMap: [Int: Int] = [:]
    func rob(_ nums: [Int]) -> Int {
        return rob(nums, idx: 0)
    }

    func rob(_ nums: [Int], idx: Int) -> Int {
        guard idx < nums.count else { return 0 }
        if let res = memoMap[idx] { return res }
        let current = nums[idx]  + rob(nums, idx: idx + 2)
        let next = rob(nums, idx: idx + 1)
        let res = max(current, next)
        memoMap[idx] = res
        return res
    }
}

class SolutionAlt {
    func rob(_ nums: [Int]) -> Int {
        let n = nums.count
        guard n > 1 else { return nums[0] }
        var nums = nums
        for idx in 0..<nums.count {
            let cur = nums[idx] + (idx - 2 >= 0 ? nums[idx - 2] : 0)
            let prev = idx - 1 >= 0 ? nums[idx - 1] : 0
            nums[idx] = max(cur, prev)
        }
        return max(nums[n - 1], nums[n - 2])
    }
}
