import Foundation

//https://leetcode.com/problems/squares-of-a-sorted-array/

class Solution {
    func sortedSquares(_ nums: [Int]) -> [Int] {
        var n = nums.count
        var left = 0
        var right = n - 1
        var res: [Int] = Array(repeating: 0, count: n)
        for idx in stride(from: n-1, through: 0, by: -1) {
            let leftVal = abs(nums[left])
            let rightVal = abs(nums[right])
            if leftVal > rightVal {
                res[idx] = leftVal * leftVal
                left += 1
            } else {
                res[idx] = rightVal * rightVal
                right -= 1
            }
        }
        return res
    }
}
