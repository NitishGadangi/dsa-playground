import Foundation

//https://leetcode.com/problems/squares-of-a-sorted-array/

class Solution {
    func sortedSquares(_ nums: [Int]) -> [Int] {
        var res: [Int] = Array(repeating: 0, count: nums.count)
        var left = 0
        var right = nums.count - 1
        var idx = nums.count - 1
        while left <= right && idx >= 0 {
            let absLeft = abs(nums[left])
            let absRight = abs(nums[right])
            if absLeft > absRight {
                res[idx] = absLeft * absLeft
                left += 1
            } else {
                res[idx] = absRight * absRight
                right -= 1
            }
            idx -= 1
        }
        return res
    }
}
