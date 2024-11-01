import Foundation

//https://leetcode.com/problems/maximum-product-subarray/

class Solution {
    func maxProduct(_ nums: [Int]) -> Int {
        var res: Int = Int.min
        var curProduct: Int = 1
        for num in nums {
            curProduct *= num
            res = max(res, curProduct)
            if curProduct == 0 {
                curProduct = 1
            }
        }
        curProduct = 1
        for idx in stride(from: nums.count - 1, through: 0, by: -1) {
            curProduct *= nums[idx]
            res = max(res, curProduct)
            if curProduct == 0 {
                curProduct = 1
            }
        }
        return res
    }
}
