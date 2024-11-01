import Foundation

//https://leetcode.com/problems/majority-element/

class Solution {
    func majorityElement(_ nums: [Int]) -> Int {
        guard nums.count > 0 else { return -1 }
        var res = nums[0]
        var vote = 0
        for num in nums {
            if num == res {
                vote += 1
            } else {
                vote -= 1
            }
            if vote < 0 {
                res = num
                vote = 1
            }
        }
        return res
    }
}
