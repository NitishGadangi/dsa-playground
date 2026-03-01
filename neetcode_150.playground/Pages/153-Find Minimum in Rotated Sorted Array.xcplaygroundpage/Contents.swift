import Foundation

//https://leetcode.com/problems/find-minimum-in-rotated-sorted-array/description/

class Solution {
    func findMin(_ nums: [Int]) -> Int {
        var start = 0
        var end = nums.count - 1
        var res: Int = Int.max
        while start <= end {
            let startNum = nums[start]
            let endNum = nums[end]
            if startNum < endNum {
                res = min(res, startNum)
                break
            }

            let mid = start + (end - start)/2
            let midNum = nums[mid]
            if startNum <= midNum {// left sorted
                res = min(res, startNum)
                start = mid + 1
            } else { // right sorted
                res = min(res, midNum)
                end = mid - 1
            }
        }
        return res
    }
}
