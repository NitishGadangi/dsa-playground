import Foundation

//https://leetcode.com/problems/two-sum/?envType=study-plan-v2&envId=top-interview-150
class Solution {
    func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
        var map: [Int: Int] = [:]
        for (idx, num) in nums.enumerated() {
            let otherNum = target - num
            if let otherIdx = map[otherNum] {
                return [otherIdx, idx]
            }
            map[num] = idx
        }
        return []
    }
}
