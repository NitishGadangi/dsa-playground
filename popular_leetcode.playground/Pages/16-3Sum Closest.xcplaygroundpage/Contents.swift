import Foundation

//https://leetcode.com/problems/3sum-closest

class Solution {
    func threeSumClosest(_ nums: [Int], _ target: Int) -> Int {
        var diff: Int = Int.max
        var nums = nums.sorted()
        for i in 0..<nums.count where diff != 0 {
            var low = i + 1
            var high = nums.count - 1
            while low < high {
                let sum = nums[i] + nums[low] + nums[high]
                let curDiff = target - sum
                if abs(curDiff) < abs(diff) {
                    diff = curDiff
                }

                if sum < target {
                    low += 1
                } else {
                    high -= 1
                }
            }
        }
        return target - diff
    }
}

// -4, -1, 1, 2
