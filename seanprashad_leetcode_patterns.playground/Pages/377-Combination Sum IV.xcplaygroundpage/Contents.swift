import Foundation

//https://leetcode.com/problems/combination-sum-iv/

class Solution {
    var memoMap: [Int: Int] = [:]
    func combinationSum4(_ nums: [Int], _ target: Int) -> Int {
        return backtrack(nums: nums, rem: target)
    }
    
    func backtrack(nums: [Int], rem: Int) -> Int {
        if rem < 0 { return 0 }
        if rem == 0 { return 1 }
        if let res = memoMap[rem] {
            return res
        }
        var res = 0
        for num in nums {
            res += backtrack(nums: nums, rem: rem - num)
        }
        memoMap[rem] = res
        return res
    }
}

let res = Solution().combinationSum4([1,2,3], 4)
print("res - \(res)")
