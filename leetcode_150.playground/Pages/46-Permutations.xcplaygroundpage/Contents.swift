import Foundation

//https://leetcode.com/problems/permutations/?envType=study-plan-v2&envId=top-interview-150
class Solution {
    var res: [[Int]] = []
    func permute(_ nums: [Int]) -> [[Int]] {
        backtrack(nums: nums, temp: [])
        return res
    }

    func backtrack(nums: [Int], temp: [Int]) {
        print("\(nums) - \(temp)")
        if nums.count == 0 {
            res.append(temp)
            return
        }

        var nums = nums
        var temp = temp

        for idx in 0..<nums.count {
            let remNum = nums.remove(at: idx)
            temp.append(remNum)
            backtrack(nums: nums, temp: temp)
            temp.removeLast()
            nums.insert(remNum, at: idx)
        }
    }
}

let res = Solution().permute([1,2,3])
print(res)
