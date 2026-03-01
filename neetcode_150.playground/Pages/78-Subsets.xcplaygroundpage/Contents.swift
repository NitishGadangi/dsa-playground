import Foundation

//https://leetcode.com/problems/subsets/description/

class Solution {
    func subsets(_ nums: [Int]) -> [[Int]] {
        var res: [[Int]] = []
        var temp: [Int] = []
        backtrack(nums, pos: 0, res: &res, temp: &temp)
        return res
    }

    func backtrack(_ nums: [Int], pos: Int, res: inout [[Int]], temp: inout [Int]) {
        res.append(temp)
        for idx in pos..<nums.count {
            if idx > pos && nums[idx - 1] == nums[idx] { continue } // skip duplicates
            temp.append(nums[idx])
            backtrack(nums, pos: idx + 1, res: &res, temp: &temp)
            temp.removeLast()
        }
    }
}
