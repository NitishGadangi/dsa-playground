import Foundation

//https://leetcode.com/problems/find-first-and-last-position-of-element-in-sorted-array/?envType=study-plan-v2&envId=top-interview-150
class Solution {
    func searchRange(_ nums: [Int], _ target: Int) -> [Int] {
        let firstIndex = binarySearch(nums: nums, target: target, shouldFindFirst: true)
        let lastIndex = binarySearch(nums: nums, target: target, shouldFindFirst: false)
        return [firstIndex, lastIndex]
    }

    func binarySearch(nums: [Int], target: Int, shouldFindFirst: Bool) -> Int {
        guard nums.count > 0 else { return -1 }
        var start = 0
        var end = nums.count - 1
        var res = -1
        while start <= end {
            let mid = start + (end - start)/2
            let midval = nums[mid]

            if midval == target {
                res = mid
                if shouldFindFirst {
                    end = mid - 1
                } else {
                    start = mid + 1
                }
            } else if midval > target {
                end = mid - 1
            } else {
                start = mid + 1
            }
        }
        return res
    }
}
