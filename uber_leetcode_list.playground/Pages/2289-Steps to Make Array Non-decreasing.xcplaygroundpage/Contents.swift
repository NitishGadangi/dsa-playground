import Foundation

// https://leetcode.com/problems/steps-to-make-array-non-decreasing/

// use monotonic stack and track ttl
// https://algo.monster/liteproblems/2289
class Solution {
    struct Item {
        let val: Int
        let ttl: Int
    }
    func totalSteps(_ nums: [Int]) -> Int {
        var stack: [Item] = []
        var res = 0
        for idx in stride(from: nums.count - 1, through: 0, by: -1) {
            let cur = nums[idx]
            var count = 0 // no of operations it should perform before its free for removal
            while !stack.isEmpty && cur > stack.last!.val {
                count = max(count + 1, stack.last!.ttl)
                stack.removeLast()
            }
            stack.append(Item(val: cur, ttl: count))
            res = max(res, count)
        }
        return res
    }
}
