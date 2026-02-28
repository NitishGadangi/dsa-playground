import Foundation

//https://leetcode.com/problems/3sum/

class Solution {
    func threeSum(_ nums: [Int]) -> [[Int]] {
        var res: [[Int]] = []
        var nums = nums.sorted { l, r in
            l < r
        }
        var idx = 0
        while idx < nums.count {
            let num = nums[idx]
            let target = -1 * num
            var start = idx + 1
            var end = nums.count - 1
            while start < end {
                let left = nums[start]
                let right = nums[end]
                let curSum = left + right
                if curSum < target {
                    start += 1
                } else if curSum > target {
                    end -= 1
                } else {
                    res.append([num, nums[start], nums[end]])

                    // skip duplicates
                    while start < end && left == nums[start] {
                        start += 1
                    }
                    while start < end && right == nums[end] {
                        end -= 1
                    }
                }
            }

            // skip duplicates
            while idx < nums.count && num == nums[idx] {
                idx += 1
            }
        }
        return res
    }
}
