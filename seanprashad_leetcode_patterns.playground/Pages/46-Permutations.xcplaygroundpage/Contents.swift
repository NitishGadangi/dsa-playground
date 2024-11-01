import Foundation

//https://leetcode.com/problems/permutations/description/

class Solution {
    func permute(_ nums: [Int]) -> [[Int]] {
        var res: [[Int]] = []
        var temp: [Int] = []
        backtrack(nums: nums, res: &res, temp: &temp)
        return res
    }
    
    func backtrack(nums: [Int], res: inout [[Int]], temp: inout [Int]) {
        if temp.count == nums.count {
            res.append(temp)
            return
        }
        for idx in 0..<nums.count {
            let curNum = nums[idx]
            if temp.contains(curNum) { continue }
            temp.append(curNum)
            backtrack(nums: nums, res: &res, temp: &temp)
            temp.removeLast()
        }
    }
}
