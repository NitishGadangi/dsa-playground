import Foundation

//https://leetcode.com/problems/move-zeroes/

class Solution {
    func moveZeroes(_ nums: inout [Int]) {
        var leftIdx = 0
        var numIdx = 0
        while numIdx < nums.count {
            let curNum = nums[numIdx]
            if curNum != 0 {
                nums[leftIdx] = curNum
                leftIdx += 1
            }
            numIdx += 1
        }
        while leftIdx < nums.count {
            nums[leftIdx] = 0
            leftIdx += 1
        }
    }
}
