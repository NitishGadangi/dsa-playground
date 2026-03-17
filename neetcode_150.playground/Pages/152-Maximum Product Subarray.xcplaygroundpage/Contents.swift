import Foundation

//https://leetcode.com/problems/maximum-product-subarray/

class Solution {
    func maxProduct(_ nums: [Int]) -> Int {
        var res: Int = Int.min
        var curMul = 1
        for num in nums {
            curMul *= num
            res = max(res, curMul)
            if curMul == 0 {
                curMul = 1
            }
        }
        curMul = 1
        for idx in stride(from: nums.count - 1, through: 0, by: -1) {
            var num = nums[idx]
            curMul *= num
            res = max(res, curMul)
            if curMul == 0 {
                curMul = 1
            }
        }
        return res
    }
}
