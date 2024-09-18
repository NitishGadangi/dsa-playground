import Foundation

//https://leetcode.com/problems/binary-subarrays-with-sum

class Solution {
    func numSubarraysWithSum(_ nums: [Int], _ goal: Int) -> Int {
        var sumMap: [Int: Int] = [:]
        var res: Int = 0
        var curSum: Int = 0
        for item in nums {
            curSum += item
            if curSum == goal {
                res += 1
            }
            let prefixTarget = curSum - goal
            if let sumCount = sumMap[prefixTarget] {
                res += sumCount
            }
            sumMap[curSum] = (sumMap[curSum] ?? 0) + 1
        }
        return res
    }
}
