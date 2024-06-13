import Foundation

//https://leetcode.com/problems/jump-game/?envType=study-plan-v2&envId=top-interview-150
class Solution {
    func canJump(_ nums: [Int]) -> Bool {
        guard nums.count > 1 else { return true }
        var reach = 0
        for (idx, num) in nums.enumerated() {
            if idx > reach { return false }
            reach = max(reach, idx + num)
        }
        return true
    }
}
