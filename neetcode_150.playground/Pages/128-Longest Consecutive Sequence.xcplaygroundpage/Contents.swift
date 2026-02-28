import Foundation

//https://leetcode.com/problems/longest-consecutive-sequence/

class Solution {
    func longestConsecutive(_ nums: [Int]) -> Int {
        var set = Set<Int>(nums)
        var res = 0
        for num in nums {
            // not the first number in the sequence
            if set.contains(num - 1) { continue }
            var count = 0
            var cur = num
            while set.contains(cur) {
                cur += 1
                count += 1
            }
            res = max(res, count)
        }
        return res
    }
}
