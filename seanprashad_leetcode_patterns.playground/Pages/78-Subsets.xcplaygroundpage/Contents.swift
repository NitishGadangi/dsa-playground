import Foundation

//https://leetcode.com/problems/subsets/

class Solution {
    func subsets(_ nums: [Int]) -> [[Int]] {
        var res: [[Int]] = []
        var temp: [Int] = []
        backtrack(nums: nums, res: &res, temp: &temp, start: 0)
        return res
    }
    
    func backtrack(nums: [Int], res: inout [[Int]], temp: inout [Int], start: Int) {
        res.append(temp)
        for idx in start..<nums.count {
            temp.append(nums[idx])
            backtrack(nums: nums, res: &res, temp: &temp, start: idx + 1)
            temp.removeLast()
        }
    }
}
