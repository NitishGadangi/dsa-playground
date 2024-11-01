import Foundation

//https://leetcode.com/problems/two-sum/

class Solution {
    func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
        var idxMap: [Int: Int] = [:]
        for (idx, curNum) in nums.enumerated() {
            let comp = target - curNum
            if let compIdx = idxMap[comp] {
                return [compIdx, idx]
            }
            idxMap[curNum] = idx
        }
        return []
    }
}
