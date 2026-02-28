import Foundation

//https://leetcode.com/problems/product-of-array-except-self/

class Solution {
    func productExceptSelf(_ nums: [Int]) -> [Int] {
        var res: [Int] = []
        let firstLast = firstToLast(nums)
        let lastFirst = lastToFirst(nums)
        for idx in 0..<nums.count {
            res.append(firstLast[idx] * lastFirst[idx])
        }
        return res
    }

    func firstToLast(_ nums: [Int]) -> [Int] {
        var res: [Int] = Array(repeating: 1, count: nums.count)
        for idx in 1..<nums.count {
            res[idx] = res[idx - 1] * nums[idx - 1]
        }
        return res
    }

    func lastToFirst(_ nums: [Int]) -> [Int] {
        var res: [Int] = Array(repeating: 1, count: nums.count)
        for idx in stride(from: nums.count - 2, through: 0, by: -1) {
            res[idx] = res[idx + 1] * nums[idx + 1]
        }
        return res
    }
}
