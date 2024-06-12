//: [Previous](@previous)

import Foundation

//https://leetcode.com/problems/majority-element/?envType=study-plan-v2&envId=top-interview-150
//input - [2,2,1,1,1,2,2]
class Solution {
    func majorityElement(_ nums: [Int]) -> Int {
        var majIdx = 0
        var count = 0
        for (idx, num) in nums.enumerated() {
            if num == nums[majIdx] {
                count += 1
            } else {
                count -= 1
            }
            if count < 0 {
                majIdx = idx
                count = 0
            }
        }
        return nums[majIdx]
    }
}

class AlternateSolution {
    func majorityElement(_ nums: [Int]) -> Int {
        var candidate = 0, vote = 0
        nums.forEach { n in
            if vote == 0 { candidate = n }
            vote += n == candidate ? 1 : -1
        }
        return candidate
    }
}

