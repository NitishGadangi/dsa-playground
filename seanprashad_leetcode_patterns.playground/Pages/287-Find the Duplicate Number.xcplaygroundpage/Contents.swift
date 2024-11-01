import Foundation

//https://leetcode.com/problems/find-the-duplicate-number/

class Solution {
    func findDuplicate(_ nums: [Int]) -> Int {
        var left = 1
        var right = nums.count
        while left < right {
            let mid = left + (right - left)/2
            var count: Int = 0
            for num in nums {
                if num <= mid {
                    count += 1
                }
            }
            if count > mid {
                right = mid
            } else {
                left = mid
            }
        }
        return left
    }
}
