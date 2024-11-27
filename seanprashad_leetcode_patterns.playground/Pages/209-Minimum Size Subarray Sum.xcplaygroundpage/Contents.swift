import Foundation

//https://leetcode.com/problems/minimum-size-subarray-sum/

class Solution {
    func minSubArrayLen(_ target: Int, _ nums: [Int]) -> Int {
        var res: Int = Int.max
        var start = 0
        var end = 0
        var curSum = 0
        
        while end < nums.count {
            curSum += nums[end]
            while start <= end && curSum >= target {
                let tempRes = end - start + 1
                res = min(res, tempRes)
                curSum -= nums[start]
                start += 1
            }
            end += 1
        }
        
        return res == Int.max ? 0 : res
    }
}

let res = Solution().minSubArrayLen(7, [2,3,1,2,4,3])
