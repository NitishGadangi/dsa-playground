import Foundation

//https://leetcode.com/problems/permutations/description/

class Solution {
    func permute(_ nums: [Int]) -> [[Int]] {
        var res: [[Int]] = []
        var temp: [Int] = []
        var used = Array(repeating: false, count: nums.count)
        backtrack(nums, res: &res, temp: &temp, used: &used)
        return res
    }

    func backtrack(_ nums: [Int], res: inout [[Int]], temp: inout [Int], used: inout [Bool]) {
        if temp.count == nums.count {
            res.append(temp)
        }
        for idx in 0..<nums.count {
            if used[idx] { continue }
            temp.append(nums[idx])
            used[idx] = true
            backtrack(nums, res: &res, temp: &temp, used: &used)
            temp.removeLast()
            used[idx] = false
        }
    }
}
