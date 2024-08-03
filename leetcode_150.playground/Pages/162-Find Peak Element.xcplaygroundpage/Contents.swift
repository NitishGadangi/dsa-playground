import Foundation

//https://leetcode.com/problems/find-peak-element/?envType=study-plan-v2&envId=top-interview-150
class Solution {
    func findPeakElement(_ nums: [Int]) -> Int {
        let count = nums.count
        
        if count == 1 { return 0 }
        if nums[0] > nums[1] { return 0 }
        if nums[count - 1] > nums[count-2] { return count - 1}

        var start = 0
        var end = count - 1
        while start < end {
            let mid = start + (end - start)/2
            let cur = nums[mid]
            let left = nums[mid - 1]
            let right = nums[mid + 1]
            if (cur > left) && (cur > right) {
                return mid
            } else if cur < left {
                end = mid - 1
            } else {
                start = mid + 1
            }
        }
        return -1
    }
}
