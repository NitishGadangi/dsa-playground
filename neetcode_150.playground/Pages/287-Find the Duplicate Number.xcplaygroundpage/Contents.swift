import Foundation

//https://leetcode.com/problems/find-the-duplicate-number/

class Solution {
    func findDuplicate(_ nums: [Int]) -> Int {
        // mid - decides possible range where duplicate may lie
        var start = 1
        var end = nums.count - 1
        while start < end {
            let mid = start + (end - start)/2
            var count = 0
            for num in nums where num <= mid {
                count += 1
            }
            if count > mid {
                end = mid
            } else {
                start = mid + 1
            }
        }
        return start
    }
}
