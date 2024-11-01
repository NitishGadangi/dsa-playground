import Foundation

//https://leetcode.com/problems/permutations-ii/

class Solution {
    func permuteUnique(_ nums: [Int]) -> [[Int]] {
        var res: [[Int]] = []
        var temp: [Int] = []
        var used: [Bool] = Array(repeating: false, count: nums.count)
        var nums = nums.sorted() // to remove duplicates. Should Sort.
        backtrack(nums: nums, res: &res, temp: &temp, used: &used)
        return res
    }
    
    func backtrack(nums: [Int], res: inout [[Int]], temp: inout [Int], used: inout [Bool]) {
        if temp.count == nums.count {
            res.append(temp)
            return
        }
        for idx in 0..<nums.count {
            let curNum = nums[idx]
            if used[idx] || (idx > 0 && curNum == nums[idx - 1] && !used[idx - 1]) { continue }
            used[idx] = true
            temp.append(curNum)
            backtrack(nums: nums, res: &res, temp: &temp, used: &used)
            temp.removeLast()
            used[idx] = false
        }
    }
}
