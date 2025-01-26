import Foundation

//https://leetcode.com/problems/trapping-rain-water/

class Solution {
    func trap(_ height: [Int]) -> Int {
        var left = 0
        var right = height.count - 1
        var res = 0
        var maxLeft = 0
        var maxRight = 0
        while left < right {
            if height[left] < height[right] {
                maxLeft = max(maxLeft, height[left])
                res += maxLeft - height[left]
                left += 1
            } else {
                maxRight = max(maxRight, height[right])
                res += maxRight - height[right]
                right -= 1
            }
        }
        
        return res
    }
}
