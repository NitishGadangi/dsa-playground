import Foundation

//https://leetcode.com/problems/binary-search/

class Solution {
    func search(_ nums: [Int], _ target: Int) -> Int {
        var start = 0
        var end = nums.count - 1
        while start <= end {
            let mid = start + (end - start)/2
            let cur = nums[mid]
            if target < cur {
                end = mid - 1
            } else if target > cur {
                start = mid + 1
            } else {
                return mid
            }
        }
        return -1
    }
}
