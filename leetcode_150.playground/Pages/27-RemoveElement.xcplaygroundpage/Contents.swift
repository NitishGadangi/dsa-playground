import UIKit

// https://leetcode.com/problems/remove-element/?envType=study-plan-v2&envId=top-interview-150
class Solution {
    func removeElement(_ nums: inout [Int], _ val: Int) -> Int {
        guard nums.count > 0 else { return 0 }
        var idx = 0
        while idx < nums.count {
            let curNum = nums[idx]
            if (curNum == val) {
                nums.remove(at: idx)
            } else {
                idx += 1
            }
        }
        return nums.count
    }
}

final class AlternateSolution {
    func removeElement(_ nums: inout [Int], _ val: Int) -> Int {
        guard !nums.isEmpty else { return 0 }
        var i = 0

        for num in nums {
            guard num != val else { continue }
            nums[i] = num
            i += 1
        }

        return i
    }
}

