import Foundation

//https://leetcode.com/problems/majority-element-ii

class Solution {
    func majorityElement(_ nums: [Int]) -> [Int] {
        var count1: Int = 0
        var count2: Int = 0

        var cand1: Int? = nil
        var cand2: Int? = nil

        for item in nums {
            if item == cand1 {
                count1 += 1
            } else if item == cand2 {
                count2 += 1
            } else if count1 == 0 {
                cand1 = item
                count1 += 1
            } else if count2 == 0 {
                cand2 = item
                count2 += 1
            } else {
                count1 -= 1
                count2 -= 1
            }
        }

        var res: [Int] = []
        count1 = 0
        count2 = 0

        for item in nums {
            if item == cand1 { count1 += 1 }
            if item == cand2 { count2 += 1 }
        }

        let threshold = nums.count/3

        if let cand1, count1 > threshold {
            res.append(cand1)
        }
        if let cand2, count2 > threshold {
            res.append(cand2)
        }

        return res
    }
}
