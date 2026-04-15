import Foundation

// https://leetcode.com/problems/minimum-number-of-taps-to-open-to-water-a-garden/

// preprocess and come with ranges from each index
// hold curMaxRange, prevRange
class Solution {
    func minTaps(_ n: Int, _ ranges: [Int]) -> Int {
        var reach: [Int] = Array(repeating: 0, count: n + 1)
        for (idx, r) in ranges.enumerated() {
            let left = max(idx - r, 0)
            let right = idx + r
            reach[left] = max(reach[left], right)
        }

        var curReach = 0
        var farthest = 0
        var taps = 0
        for (idx, r) in reach.enumerated() {
            if idx > farthest { return -1 }
            farthest = max(farthest, r)
            if idx == curReach && idx != n {
                curReach = farthest
                taps += 1
            }
        }
        return taps
    }
}
