import Foundation

//https://leetcode.com/problems/find-minimum-in-rotated-sorted-array/

class Solution {
    func findMin(_ nums: [Int]) -> Int {
        var start = 0
        var end = nums.count - 1
        var res: Int = Int.max
        while start <= end {
            // full sorted
            let startVal = nums[start]
            let endVal = nums[start]
            if startVal < endVal {
                res = min(res, startVal)
                break
            }
            
            let mid = start + (end - start)/2
            let midVal = nums[mid]
            if startVal <= midVal { // left sorted
                res = min(res, startVal)
                start = mid + 1 // eliminate left
            } else { // right sorted
                res = min(res, midVal)
                end = mid - 1 // eliminate right
            }
        }
        return res
    }
}
