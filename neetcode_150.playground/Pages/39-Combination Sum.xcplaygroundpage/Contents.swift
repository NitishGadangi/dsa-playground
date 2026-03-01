import Foundation

//https://leetcode.com/problems/combination-sum/description/

class Solution {
    func combinationSum(_ candidates: [Int], _ target: Int) -> [[Int]] {
        var res: [[Int]] = []
        var temp: [Int] = []
        backtrack(candidates, res: &res, temp: &temp, rem: target, start: 0)
        return res
    }

    func backtrack(_ nums: [Int], res: inout [[Int]], temp: inout [Int], rem: Int, start: Int) {
        if rem < 0 { return }
        if rem == 0 {
            res.append(temp)
            return
        }
        for idx in start..<nums.count {
            let cur = nums[idx]
            temp.append(cur)
            // you can chose the same number again. Hence start = idx
            backtrack(nums, res: &res, temp: &temp, rem: rem - cur, start: idx)
            temp.removeLast()
        }
    }
}
