import Foundation

//https://leetcode.com/problems/product-of-array-except-self/?envType=study-plan-v2&envId=top-interview-150
class Solution {
    func productExceptSelf(_ nums: [Int]) -> [Int] {
        var res = [Int]()
        let forwardArr = forwardProductArray(nums: nums)
        let backwardArr = backwardProductArray(nums: nums)
        for (idx, forVal) in forwardArr.enumerated() {
            let backVal = backwardArr[idx]
            res.append(forVal * backVal)
        }
        return res
    }

    func forwardProductArray(nums: [Int]) -> [Int] {
        var res = [Int]()
        var product = 1
        for num in nums {
            res.append(product)
            product = product * num
        }
        return res
    }

    func backwardProductArray(nums: [Int]) -> [Int] {
        var res = [Int]()
        var product = 1
        for idx in stride(from: nums.count - 1, through: 0, by: -1) {
            res.insert(product, at: 0)
            product = product * nums[idx]
        }
        return res
    }
}
