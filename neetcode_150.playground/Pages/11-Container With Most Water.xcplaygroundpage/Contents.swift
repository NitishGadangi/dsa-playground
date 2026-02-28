import Foundation

//https://leetcode.com/problems/container-with-most-water/description/

class Solution {
    func maxArea(_ height: [Int]) -> Int {
        var res: Int = 0
        var l = 0
        var r = height.count - 1
        while l < r {
            let lH = height[l]
            let rH = height[r]
            let area: Int
            if lH < rH {
                area = lH * (r - l)
                l += 1
            } else {
                area = rH * (r - l)
                r -= 1
            }
            res = max(res, area)
        }
        return res
    }
}
