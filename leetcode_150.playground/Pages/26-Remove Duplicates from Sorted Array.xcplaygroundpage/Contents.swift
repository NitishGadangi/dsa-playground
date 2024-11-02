import Foundation

//https://leetcode.com/problems/remove-duplicates-from-sorted-array/?envType=study-plan-v2&envId=top-interview-150

class Solution {
    func removeDuplicates(_ nums: inout [Int]) -> Int {
        var idx = 0
        while (idx < (nums.count - 1)) {
            let curItem = nums[idx]
            let nextItem = nums[idx + 1]
            if (curItem == nextItem) {
                nums.remove(at: idx)
            } else {
                idx += 1
            }
        }
        return nums.count
    }
}

// Two Pointer
class AlternateSolution {
    func removeDuplicates(_ nums: inout [Int]) -> Int {
        var k = 1
        for index in 1..<nums.count {
            if nums[index] != nums[k - 1] {
                nums[k] = nums[index]
                k += 1
            }
        }
        return k
    }
}

class AnotherSolution {
    func removeDuplicates(_ nums: inout [Int]) -> Int {
        var k = 0
        for num in nums {
            if k < 1 || num != nums[k - 1] {
                nums[k] = num
                k += 1
            }
        }
        return k
    }
}
