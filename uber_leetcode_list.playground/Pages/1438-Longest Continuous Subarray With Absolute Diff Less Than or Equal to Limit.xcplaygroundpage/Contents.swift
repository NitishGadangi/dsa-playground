import Foundation

//https://leetcode.com/problems/longest-continuous-subarray-with-absolute-diff-less-than-or-equal-to-limit/

//Instead of sorting:
//Track max in O(1) → front of maxDeque
//Track min in O(1) → front of minDeque
// pair with sliding window
// By the time we update res, we will ensure maxDeque and minDeque will only have valid SubArray nums.
class Solution {
    func longestSubarray(_ nums: [Int], _ limit: Int) -> Int {
        var res = 1
        var start = 0
        var minQueue: [Int] = [] // store index of nums in increasing order of values
        var maxQueue: [Int] = [] // store index of nums in decreasing order of values
        for end in 0..<nums.count {
            let curNum = nums[end]
            // minQueue - increasing order
            while let last = minQueue.last, nums[last] > curNum {
                minQueue.removeLast()
            }
            minQueue.append(end)

            // maxQueue - decreasing order
            while let last = maxQueue.last, nums[last] < curNum {
                maxQueue.removeLast()
            }
            maxQueue.append(end)

            // Shrink window if invalid
            while nums[maxQueue.first!] - nums[minQueue.first!] > limit {
                if start == minQueue.first! {
                    minQueue.removeFirst()
                }
                if start == maxQueue.first!{
                    maxQueue.removeFirst()
                }
                start += 1
            }
            res = max(res, end - start + 1)
        }
        return res
    }
}
