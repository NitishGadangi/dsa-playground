import Foundation

//https://leetcode.com/problems/combination-sum/

class Solution {
    func combinationSum(_ candidates: [Int], _ target: Int) -> [[Int]] {
        var res: [[Int]] = []
        var temp: [Int] = []
        backtrack(nums: candidates, res: &res, temp: &temp, rem: target, start: 0)
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
            temp.append(curNum)
            backtrack(nums: nums, res: &res, temp: &temp, rem: rem - curNum, start: idx)
            temp.removeLast()
        }
    }
}
