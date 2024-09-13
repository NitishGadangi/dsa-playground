import Foundation

//https://leetcode.com/problems/maximum-product-subarray

class Solution {
    func maxProduct(_ nums: [Int]) -> Int {
        var product = 1
        var res = Int.min

        for num in nums {
            product *= num
            res = max(res, product)
            if product == 0 {
                product = 1
            }
        }

        product = 1
        for idx in stride(from: nums.count - 1, through: 0, by: -1) {
            let num = nums[idx]
            product *= num
            res = max(res, product)
            if product == 0 {
                product = 1
            }
        }
        return res
    }
}
