import Foundation

//https://leetcode.com/problems/3sum-closest/

class Solution {
    func threeSumClosest(_ nums: [Int], _ target: Int) -> Int {
        var nums = nums.sorted()
        var diff: Int = Int.max
        for idx in 0..<(nums.count - 2) {
            let firNum = nums[idx]
            var sec = idx + 1
            var trd = nums.count - 1
            while sec < trd {
                let secNum = nums[sec]
                let trdNum = nums[trd]
                let curSum = firNum + secNum + trdNum
                let curDiff = target - curSum
                if abs(curDiff) < abs(diff) {
                    diff = curDiff
                }
                if diff == 0 { break }
                if curSum < target {
                    sec += 1
                } else {
                    trd -= 1
                }
            }
        }
        return target - diff
    }
}
