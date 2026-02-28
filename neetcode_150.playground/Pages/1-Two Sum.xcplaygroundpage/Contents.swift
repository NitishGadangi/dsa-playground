import Foundation

//https://leetcode.com/problems/two-sum/

class Solution {
    func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
        var idxMap: [Int: Int] = [:]
        for (idx, cur) in nums.enumerated() {
            var comp = target - cur
            if let compIdx = idxMap[comp] {
                return [compIdx, idx]
            }
            idxMap[cur] = idx
        }
        return []
    }
}
