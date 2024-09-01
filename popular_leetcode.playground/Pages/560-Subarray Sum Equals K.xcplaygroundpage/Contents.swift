import Foundation

//https://leetcode.com/problems/subarray-sum-equals-k/

class Solution {
    // Prefix Sum Arr
    func subarraySum(_ nums: [Int], _ k: Int) -> Int {
        var prefixSumArr = [Int]()
        var totalSum = 0
        for item in nums {
            totalSum += item
            prefixSumArr.append(totalSum)
        }

        var res = 0
        var prefixMap: [Int: Int] = [:] // item - count
        for item in prefixSumArr {
            // edge case - if sum is already k, ans++
            if item == k {
                res += 1
            }

            if let count = prefixMap[item - k] {
                res += count
            }
            prefixMap[item] = (prefixMap[item] ?? 0) + 1
        }
        return res
    }
}
