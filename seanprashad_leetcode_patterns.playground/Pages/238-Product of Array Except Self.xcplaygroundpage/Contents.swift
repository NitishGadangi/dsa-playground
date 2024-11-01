import Foundation

//https://leetcode.com/problems/product-of-array-except-self/

class Solution {
    func productExceptSelf(_ nums: [Int]) -> [Int] {
        var forward: [Int] = []
        var backward: [Int] = []
        var leftRunning: Int = 1
        var rightRunning: Int = 1
        forward.append(1)
        backward.append(1)
        for idx in 0..<(nums.count - 1) {
            let leftItem = nums[idx]
            let rightItem = nums[nums.count - 1 - idx]
            leftRunning *= leftItem
            rightRunning *= rightItem
            forward.append(leftRunning)
            backward.insert(rightRunning, at: 0)
        }
        
        var res: [Int] = []
        for idx in 0..<nums.count {
            res.append(forward[idx] * backward[idx])
        }
        return res
    }
}
