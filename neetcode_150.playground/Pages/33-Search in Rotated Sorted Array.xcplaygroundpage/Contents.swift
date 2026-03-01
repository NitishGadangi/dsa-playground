import Foundation

//https://leetcode.com/problems/search-in-rotated-sorted-array/description/

class Solution {
    func search(_ nums: [Int], _ target: Int) -> Int {
        var start = 0
        var end = nums.count - 1
        while start <= end {
            let startVal = nums[start]
            let endVal = nums[end]
            let mid = start + (end - start)/2
            let midVal = nums[mid]
            if midVal == target {
                return mid
            }
            if startVal <= midVal { //left sorted
                if target >= startVal && target < midVal {
                    end = mid - 1
                } else {
                    start = mid + 1
                }
            } else { // right sorted
                if target > midVal && target <= endVal {
                    start = mid + 1
                } else {
                    end = mid - 1
                }
            }
        }
        return -1
    }
}
