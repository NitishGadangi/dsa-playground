import Foundation

//https://leetcode.com/problems/subsets-ii/description/

class Solution {
    func subsetsWithDup(_ nums: [Int]) -> [[Int]] {
        var res: [[Int]] = []
        var temp: [Int] = []
        var nums = nums.sorted()
        backtrack(nums, res: &res, temp: &temp, start: 0)
        return res
    }

    func backtrack(_ nums: [Int], res: inout [[Int]], temp: inout [Int], start: Int) {
        res.append(temp)
        for idx in start..<nums.count {
            if idx > start && nums[idx] == nums[idx - 1] { continue }
            temp.append(nums[idx])
            backtrack(nums, res: &res, temp: &temp, start: idx + 1)
            temp.removeLast()
        }
    }
}
