import Foundation

//https://leetcode.com/problems/product-of-array-except-self/

class Solution {
    func productExceptSelf(_ nums: [Int]) -> [Int] {
        let n = nums.count
        var leftRightProduct: [Int] = Array(repeating: 1, count: n)
        for idx in 1..<n {
            leftRightProduct[idx] = nums[idx - 1] * leftRightProduct[idx - 1]
        }

        var rightLeftProduct: [Int] = Array(repeating: 1, count: n)
        for idx in stride(from: n - 2, through: 0, by: -1) {
            rightLeftProduct[idx] = nums[idx + 1] * rightLeftProduct[idx + 1]
        }

        var res: [Int] = Array(repeating: 1, count: n)
        for idx in 0..<n {
            res[idx] = leftRightProduct[idx] * rightLeftProduct[idx]
        }
        return res
    }
}
