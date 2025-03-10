import Foundation

//https://leetcode.com/problems/two-sum/

class Solution {
    func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
        var map: [Int: Int] = [:] // num - index
        for (idx, cur)  in nums.enumerated() {
            let otherNum = target - cur
            if let otherIdx = map[otherNum] {
                return [otherIdx, idx]
            }
            map[cur] = idx
        }
        return []
    }
}
