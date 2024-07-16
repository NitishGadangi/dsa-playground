import Foundation

//https://leetcode.com/problems/find-minimum-in-rotated-sorted-array/?envType=study-plan-v2&envId=top-interview-150

class Solution {
    func findMin(_ nums: [Int]) -> Int {
        var start = 0
        var end = nums.count - 1
        var curMin = Int.max
        while start <= end {
            // full sorted
            if nums[start] < nums[end] {
                curMin = min(curMin, nums[start])
                break
            }

            let mid = start + (end - start)/2

            // left sorted
            if nums[start] <= nums[mid] {
                curMin = min(curMin, nums[start])
                start = mid + 1 // eliminate left
            } else { // right sorted
                curMin = min(curMin, nums[mid])
                end = mid - 1 // eliminate right
            }
        }
        return curMin
    }
}
