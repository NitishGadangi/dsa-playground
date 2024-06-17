import Foundation

//https://leetcode.com/problems/longest-consecutive-sequence/?envType=study-plan-v2&envId=top-interview-150
class Solution {
    func longestConsecutive(_ nums: [Int]) -> Int {
        var maxLen = 0
        var set = Set<Int>()
        for num in nums {
            set.insert(num)
        }
        for num in nums {
            let prevNum = num - 1
            guard set.contains(prevNum) == false else { continue }
            var tempLen = 0
            var curNum = num
            while set.contains(curNum) {
                curNum += 1
                tempLen += 1
            }
            maxLen = max(maxLen, tempLen)
        }
        return maxLen
    }
}
