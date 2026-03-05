import Foundation

//https://leetcode.com/problems/jump-game-ii/description/

class Solution {
    func jump(_ nums: [Int]) -> Int {
        var curReach: Int = 0
        var maxReach: Int = 0
        var jumps: Int = 0
        for (idx, num) in nums.enumerated() {
            maxReach = max(maxReach, idx + num)
            if idx + 1 < nums.count && idx == curReach {
                jumps += 1
                curReach = maxReach
            }
        }
        return jumps
    }
}
