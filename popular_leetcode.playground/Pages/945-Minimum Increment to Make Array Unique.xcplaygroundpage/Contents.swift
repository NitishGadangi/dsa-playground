import Foundation

//https://leetcode.com/problems/minimum-increment-to-make-array-unique

class Solution {
    func minIncrementForUnique(_ nums: [Int]) -> Int {
        var maxVal: Int = 0
        for num in nums {
            maxVal = max(maxVal, num)
        }

        var freq: [Int] = Array(repeating: 0, count: nums.count + maxVal)
        for num in nums {
            freq[num] += 1
        }

        var res: Int = 0
        for idx in 0..<freq.count {
            let f = freq[idx]
            guard f > 1 else { continue }
            let dups = f - 1
            res += dups
            if idx + 1 < freq.count {
                freq[idx + 1] += dups
            }
        }
        return res
    }
}

class AlternateSolution {
    func minIncrementForUnique(_ nums: [Int]) -> Int {
        var nums = nums.sorted()
        var res: Int = 0

        for idx in 1..<nums.count {
            let cur = nums[idx]
            let prev = nums[idx - 1]
            if cur > prev { continue }
            nums[idx] = prev + 1
            res += nums[idx] - cur
        }

        return res
    }
}
