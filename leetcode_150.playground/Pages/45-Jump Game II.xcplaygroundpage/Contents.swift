import Foundation

//https://leetcode.com/problems/jump-game-ii/?envType=study-plan-v2&envId=top-interview-150
class Solution {
    func jump(_ nums: [Int]) -> Int {
        var jumps = 0
        let lastIdx = nums.count - 1
        var idx = 0
        while idx < lastIdx {
            jumps += 1
            idx = nextJumpIdx(curIdx: idx, curVal: nums[idx], nums: nums)
        }
        return jumps
    }

    func nextJumpIdx(curIdx: Int, curVal: Int, nums: [Int]) -> Int {
        let lastIdx = nums.count - 1
        if (curIdx + curVal) >= lastIdx {
            return lastIdx
        }
        var nextIdx = curIdx
        var maxReach = 0
        ((curIdx + 1)...(curIdx + curVal)).forEach { idx in
            let reach = idx + nums[idx]
            if reach >= maxReach {
                nextIdx = idx
                maxReach = reach
            }
        }
        return nextIdx
    }
}
