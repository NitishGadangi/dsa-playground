import Foundation

//https://leetcode.com/problems/trapping-rain-water/

class Solution {
    func trap(_ height: [Int]) -> Int {
        var res: Int = 0
        var lMax: Int = 0
        var rMax: Int = 0
        var l: Int = 0
        var r: Int = height.count - 1
        while l < r {
            let lH = height[l]
            let rH = height[r]
            lMax = max(lMax, lH)
            rMax = max(rMax, rH)
            if lMax < rMax {
                res += lMax - lH
                l += 1
            } else {
                res += rMax - rH
                r -= 1
            }
        }
        return res
    }
}
