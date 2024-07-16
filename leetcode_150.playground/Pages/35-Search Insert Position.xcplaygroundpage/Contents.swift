import Foundation

//https://leetcode.com/problems/search-insert-position/submissions/1322504221/?envType=study-plan-v2&envId=top-interview-150

class Solution {
    func searchInsert(_ nums: [Int], _ target: Int) -> Int {
        var start = 0
        var end = nums.count - 1
        while start <= end {
            let mid = start + (end - start)/2
            let curNum = nums[mid]
            if curNum == target {
                return mid
            } else if curNum < target {
                start = mid + 1
            } else {
                end = mid - 1
            }
        }
        return start
    }
}
