import Foundation

//https://leetcode.com/problems/minimum-absolute-sum-difference/

class Solution {
    // find the maximun difference we can
    func minAbsoluteSumDiff(_ nums1: [Int], _ nums2: [Int]) -> Int {
        var n = nums1.count
        var totalDiff = 0
        for idx in 0..<n {
            totalDiff += abs(nums1[idx] - nums2[idx])
        }
        var res: Int = totalDiff
        let numSet = Set<Int>(nums1)
        for subNum in numSet {
            for idx in 0..<nums1.count {
                let extDiff = abs(nums1[idx] - nums2[idx])
                let replaceDiff = abs(subNum - nums2[idx])
                let newSumDiff = totalDiff - extDiff + replaceDiff
                res = min(res, newSumDiff)
            }
        }
        return res
    }
}

let res = Solution().minAbsoluteSumDiff([1,7,5], [2,3,5])
