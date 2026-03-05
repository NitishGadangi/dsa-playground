import Foundation

//https://leetcode.com/problems/jump-game/

class Solution {
    func canJump(_ nums: [Int]) -> Bool {
        var idx = 0
        var range = 0
        for (idx, num) in nums.enumerated() {
            if range < idx { return false }
            let curRange = idx + num
            range = max(range, curRange)
        }
        return true
    }
}
