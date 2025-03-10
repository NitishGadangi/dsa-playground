import Foundation

//https://leetcode.com/problems/house-robber-ii/

// circular House Robber
class Solution {
    func rob(_ nums: [Int]) -> Int {
        let ignoreFirst = rob(nums, start: 1, end: nums.count)
        let ignoreLast = rob(nums, start: 0, end: nums.count - 1)
        return max(ignoreFirst, ignoreLast)
    }

    func rob(_ nums: [Int], start: Int, end: Int) -> Int {
        guard start <= end else { return 0 }

        var dp = Array(repeating: 0, count: nums.count)
        for idx in start..<end {
            let cur = nums[safe: idx, 0] + dp[safe: idx - 2, 0]
            let prev = dp[safe: idx - 1, 0]
            dp[idx] = max(cur, prev)
        }
        return dp[end - 1]
    }
}

extension Array {
    subscript(safe index: Int) -> Element? {
        guard index >= 0 && index < count else { return nil }
        return self[index]
    }

    subscript(safe index: Int, fallback: Element) -> Element {
        guard index >= 0 && index < count else { return fallback }
        return self[index]
    }
}

let res = Solution().rob([2,3,2])
