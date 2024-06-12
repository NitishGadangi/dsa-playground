import Foundation

//https://leetcode.com/problems/remove-duplicates-from-sorted-array-ii/?envType=study-plan-v2&envId=top-interview-150
// input - [1,1,1,2,2,3]

class Solution {
    func removeDuplicates(_ nums: inout [Int]) -> Int {
        var i = 0
        for num in nums {
            if i < 2 || num != nums[i - 2] {
                nums[i] = num
                i += 1
            }
        }
        return i
    }
}


class AlternateSolution {
    func removeDuplicates(_ nums: inout [Int]) -> Int {
        var k = 0
        var hasDuplicate = false
        for idx in 1..<nums.count {
            if nums[idx] == nums[k] && !hasDuplicate {
                hasDuplicate = true
                k += 1
                nums[k] = nums[idx]
            } else if nums[idx] != nums[k] {
                hasDuplicate = false
                k += 1
                nums[k] = nums[idx]
            }
        }
        return k + 1
    }
}

