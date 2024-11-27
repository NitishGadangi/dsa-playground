//: [Previous](@previous)

import Foundation

//https://leetcode.com/problems/container-with-most-water/

class Solution {
    func maxArea(_ height: [Int]) -> Int {
        var left = 0
        var right = height.count - 1
        var res: Int = 0
        while left < right {
            if height[left] <= height[right] {
                let area = height[left] * (right - left)
                res = max(res, area)
                left += 1
            } else {
                let area = height[right] * (right - left)
                res = max(res, area)
                right -= 1
            }
        }
        return res
    }
}

let res = Solution().maxArea([1,8,6,2,5,4,8,3,7])
