import Foundation

//https://leetcode.com/problems/search-in-rotated-sorted-array/?envType=study-plan-v2&envId=top-interview-150
class Solution {
    func search(_ nums: [Int], _ target: Int) -> Int {
        var start = 0
        var end = nums.count - 1

        while start <= end {
            let mid = start + (end - start)/2
            let midVal = nums[mid]
            if midVal == target { return mid }

            let startVal = nums[start]
            let endVal = nums[end]

            // left is sorted
            if startVal <= midVal {
                if (target >= startVal) && (target < midVal) {
                    end = mid - 1
                } else {
                    start = mid + 1
                }
            } else { // right is sorted
                if (target > midVal) && (target <= endVal) {
                    start = mid + 1
                } else {
                    end = mid - 1
                }
            }
        }
        return -1
    }
}
