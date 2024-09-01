import Foundation

//https://leetcode.com/problems/number-of-good-pairs/

class Solution {
    func numIdenticalPairs(_ nums: [Int]) -> Int {
        var numCountMap: [Int: Int] = [:]
        var res: Int = 0
        for item in nums {
            if let count = numCountMap[item] {
                res += count
            }
            numCountMap[item] = (numCountMap[item] ?? 0) + 1
        }
        return res
    }
}
