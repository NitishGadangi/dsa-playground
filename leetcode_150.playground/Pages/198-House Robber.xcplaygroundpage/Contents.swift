import Foundation

//https://leetcode.com/problems/house-robber/?envType=study-plan-v2&envId=top-interview-150

class Solution {
    var memoMap: [Int: Int] = [:]
    func rob(_ nums: [Int]) -> Int {
        return robRec(nums: nums, curIdx: 0)
    }

    func robRec(nums: [Int], curIdx: Int) -> Int {
        guard curIdx < nums.count else { return 0 }
        if let res = memoMap[curIdx] {
            return res
        }

        let robCurrent = nums[curIdx] + robRec(nums: nums, curIdx: curIdx + 2)
        let ignoreCurrent = robRec(nums: nums, curIdx: curIdx + 1)
        let res = max(robCurrent, ignoreCurrent)
        memoMap[curIdx] = res
        return res
    }
}
