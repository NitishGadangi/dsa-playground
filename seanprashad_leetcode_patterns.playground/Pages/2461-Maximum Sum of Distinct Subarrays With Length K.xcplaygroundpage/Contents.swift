import Foundation

//https://leetcode.com/problems/maximum-sum-of-distinct-subarrays-with-length-k/

class Solution {
    func maximumSubarraySum(_ nums: [Int], _ k: Int) -> Int {
        var numIdx: [Int: Int] = [:]
        var start = 0
        var end = 0
        var res = 0
        var curSum = 0
        while end < nums.count {
            let curNum = nums[end]
            let lastOcuurance = numIdx[curNum]
            while (lastOcuurance != nil && start <= lastOcuurance!) || (end - start + 1 > k) {
                curSum -= nums[start]
                start += 1
            }
            numIdx[curNum] = end
            curSum += curNum
            let curLen = end - start + 1
            if curLen == k {
                res = max(res, curSum)
            }
            end += 1
        }
        return res
    }
}
