import Foundation

//https://leetcode.com/problems/maximum-points-you-can-obtain-from-cards/description/

class Solution {
    // Sliding Window
    func maxScore(_ cardPoints: [Int], _ k: Int) -> Int {
        let n = cardPoints.count
        let windowSize = n - k
        let totalSum = cardPoints.reduce(0, +)
        if windowSize == 0 { return totalSum }

        var windowSum = 0
        var maxSum = 0
        var start = 0
        var end = 0

        while end < n {
            windowSum += cardPoints[end]

            if (end - start + 1) >= windowSize {
                maxSum = max(maxSum, totalSum - windowSum)
                windowSum -= cardPoints[start]
                start += 1
            }

            end += 1
        }

        return maxSum
    }
}

let test = Solution().maxScore([1,2,3,4,5,6,1], 3)
print(test)
