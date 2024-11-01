import Foundation

//https://leetcode.com/problems/combination-sum-ii/

class Solution {
    func combinationSum2(_ candidates: [Int], _ target: Int) -> [[Int]] {
        var res: [[Int]] = []
        var temp: [Int] = []
        var nums = candidates.sorted()
        backtrack(nums: nums, res: &res, temp: &temp, rem: target, start: 0)
        return res
    }
    
    func backtrack(nums: [Int], res: inout [[Int]], temp: inout [Int], rem: Int, start: Int) {
        if rem < 0 { return }
        if rem == 0 {
            res.append(temp)
            return
        }
        for idx in start..<nums.count {
            let curNum = nums[idx]
            if idx > start && curNum == nums[idx - 1] { continue }
            temp.append(curNum)
            backtrack(nums: nums, res: &res, temp: &temp, rem: rem - curNum, start: idx + 1)
            temp.removeLast()
        }
    }
}
