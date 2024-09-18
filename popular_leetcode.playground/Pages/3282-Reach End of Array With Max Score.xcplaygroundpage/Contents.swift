import Foundation

//https://leetcode.com/problems/reach-end-of-array-with-max-score

class Solution {
    func findMaximumScore(_ nums: [Int]) -> Int {
        var res = 0
        var curMax = 0
        for item in nums {
            res += curMax
            curMax = max(curMax, item)
        }
        return res
    }
}
