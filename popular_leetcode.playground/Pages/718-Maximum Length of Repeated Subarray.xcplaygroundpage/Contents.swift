import Foundation

//https://leetcode.com/problems/maximum-length-of-repeated-subarray

class Solution {
    // DP Bottom Up
    func findLength(_ nums1: [Int], _ nums2: [Int]) -> Int {
        // dp array of n1+1 * n2+1
        // n1 rows & n2 cols
        var dp: [[Int]] = Array(
            repeating: Array(repeating: 0, count: nums2.count + 1),
            count: nums1.count + 1
        )
        var res: Int = 0
        for i in stride(from: nums1.count - 1, through: 0, by: -1) {
            for j in stride(from: nums2.count - 1, through: 0, by: -1) {
                // start brom last idxes which means both are enpty
                if nums1[i] == nums2[j] {
                    dp[i][j] = dp[i+1][j+1] + 1
                    res = max(res, dp[i][j])
                }
            }
        }
        return res
    }
}
