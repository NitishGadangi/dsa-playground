import Foundation

//https://leetcode.com/problems/longest-consecutive-sequence/

class Solution {
    func longestConsecutive(_ nums: [Int]) -> Int {
        var set: Set<Int> = []
        for num in nums {
            set.insert(num)
        }
        var res: Int = 0
        for num in nums {
            if set.contains(num - 1) { continue }
            var temp = num
            var count = 0
            while set.contains(temp) {
                count += 1
                temp += 1
            }
            res = max(res, count)
        }
        return res
    }
}

// This is O(2N) -- O(N)
