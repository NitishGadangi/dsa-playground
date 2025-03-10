import Foundation

//https://leetcode.com/problems/squares-of-a-sorted-array/

class Solution {
    // two pointer, fill from last
    func sortedSquares(_ nums: [Int]) -> [Int] {
        let n = nums.count
        var res = Array(repeating: 0, count: n)
        var left = 0
        var right = n - 1
        for idx in stride(from: n-1, through: 0, by: -1) {
            let leftVal = nums[left] * nums[left]
            let rightVal = nums[right] * nums[right]
            if leftVal > rightVal {
                res[idx] = leftVal
                left += 1
            } else {
                res[idx] = rightVal
                right -= 1
            }
        }
        return res
    }
}
