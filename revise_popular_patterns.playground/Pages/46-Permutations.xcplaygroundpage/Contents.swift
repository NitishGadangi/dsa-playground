import Foundation

//https://leetcode.com/problems/permutations/

class Solution {
    func permute(_ nums: [Int]) -> [[Int]] {
        var res: [[Int]] = []
        var temp: [Int] = []
        backtrack(nums, res: &res, temp: &temp)
        return res
    }

    func backtrack(_ nums: [Int], res: inout [[Int]], temp: inout [Int]) {
        if nums.count == temp.count {
            res.append(temp)
            return
        }
        for num in nums {
            if temp.contains(num) { continue }
            temp.append(num)
            backtrack(nums, res: &res, temp: &temp)
            temp.removeLast()
        }
    }
}
