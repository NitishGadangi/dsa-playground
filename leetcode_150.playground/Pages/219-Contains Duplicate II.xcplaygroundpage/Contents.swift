import Foundation

//https://leetcode.com/problems/contains-duplicate-ii/?envType=study-plan-v2&envId=top-interview-150
class Solution {
    func containsNearbyDuplicate(_ nums: [Int], _ k: Int) -> Bool {
        guard k > 0 else { return false }
        var map: [Int: Int] = [:]
        for (idx, num) in nums.enumerated() {
            if let otherIdx = map[num], (idx - otherIdx) <= k {
                return true
            } else {
                map[num] = idx
            }
        }
        return false
    }
}
