import Foundation

//https://leetcode.com/problems/binary-search/

class Solution {
    func search(_ nums: [Int], _ target: Int) -> Int {
        var left = 0
        var right = nums.count - 1
        while left <= right {
            let mid = left + (right - left)/2
            let cur = nums[mid]
            if cur < target {
                left = mid + 1
            } else if cur > target {
                right = mid - 1
            } else {
                return mid
            }
        }
        return -1
    }
}
