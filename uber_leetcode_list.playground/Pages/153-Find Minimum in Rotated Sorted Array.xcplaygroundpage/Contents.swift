import Foundation

//https://leetcode.com/problems/find-minimum-in-rotated-sorted-array/

class Solution {
    func findMin(_ nums: [Int]) -> Int {
        var start = 0
        var end = nums.count - 1
        var res: Int = Int.max
        while start <= end {
            let startVal = nums[start]
            let endVal = nums[end]
            if startVal <= endVal {
                res = min(res, startVal)
                break
            }
            let  mid = start + (end - start)/2
            let midVal = nums[mid]
            if startVal <= midVal { // left sorted
                res = min(res, startVal)
                start = mid + 1
            } else {
                res = min(res, midVal)
                end = mid - 1
            }
        }
        return res
    }
}

class SolutionBroken {
    func findMin(_ nums: [Int]) -> Int {
        if nums.count == 1 { return nums[0] }
        var start = 0
        var end = nums.count - 1
        if nums[start] < nums[end] { return nums[start] }
        while start <= end {
            let mid = start + (end - start)/2
            let midVal = nums[mid]
            let startVal = nums[start]
            let endVal = nums[end]
            if mid - 1 >= 0 && midVal < nums[mid - 1] && mid + 1 < nums.count  && midVal < nums[mid + 1] {
                return midVal
            } else if midVal <= endVal { // right sorted
                end = mid - 1
            } else { // left sorted
                start = mid + 1
            }
        }
        return -1
    }
}
