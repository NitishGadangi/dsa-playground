import Foundation

//https://leetcode.com/problems/container-with-most-water/?envType=study-plan-v2&envId=top-interview-150
class Solution {
    func maxArea(_ height: [Int]) -> Int {
        var left = 0
        var right = height.count - 1
        var maxArea = 0
        while left < right {
            let leftHeight = height[left]
            let rightHeight = height[right]
            let curArea = (right - left) * min(leftHeight, rightHeight)
            maxArea = max(curArea, maxArea)
            if leftHeight < rightHeight {
                left += 1
            } else {
                right -= 1
            }
        }
        return maxArea
    }
}
