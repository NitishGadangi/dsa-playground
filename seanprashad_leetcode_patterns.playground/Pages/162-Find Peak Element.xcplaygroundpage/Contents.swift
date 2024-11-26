import Foundation

//https://leetcode.com/problems/find-peak-element/

class Solution {
    func findPeakElement(_ nums: [Int]) -> Int {
        var start = 0
        var end = nums.count
        while start < end {
            let mid = start + (end - start)/2
            let leftVal = mid - 1 >= 0 ? nums[mid - 1] : Int.min
            let rightVal = mid + 1 < nums.count ? nums[mid + 1] : Int.min
            let midVal = nums[mid]
            if leftVal < midVal && rightVal < midVal {
                return mid
            }
            
            if leftVal < rightVal {
                start = mid + 1
            } else {
                end = mid - 1
            }
        }
        return start
    }
}
