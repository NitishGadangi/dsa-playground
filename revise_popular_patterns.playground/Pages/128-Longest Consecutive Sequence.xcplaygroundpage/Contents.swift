import Foundation

//https://leetcode.com/problems/longest-consecutive-sequence/

class Solution {
    func longestConsecutive(_ nums: [Int]) -> Int {
        var res: Int = 0
        var set = Set(nums)
        for num in set {
            // check if this is first item in sequence
            if set.contains(num - 1) { continue }
            var temRes = 1
            var curNum = num
            while set.contains(curNum + 1) {
                curNum += 1
                temRes += 1
            }
            res = max(res, temRes)
        }
        return res
    }
}
