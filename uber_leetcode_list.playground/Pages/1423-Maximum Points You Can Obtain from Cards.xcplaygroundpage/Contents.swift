import Foundation

// https://leetcode.com/problems/maximum-points-you-can-obtain-from-cards/

// maxScore = totalSum - minSubarraySum(of size n - k)
class Solution {
    func maxScore(_ cardPoints: [Int], _ k: Int) -> Int {
        var total = cardPoints.reduce(0, +)
        if k == cardPoints.count { return total }
        var windowLen = cardPoints.count - k
        var curSum = 0
        for idx in 0..<windowLen {
            curSum += cardPoints[idx]
        }
        var minSum = curSum
        for idx in windowLen..<cardPoints.count {
            curSum += cardPoints[idx]
            curSum -= cardPoints[idx - windowLen]
            minSum = min(minSum, curSum)
        }
        return total - minSum
    }
}

class SolutionTLE {
    func maxScore(_ cardPoints: [Int], _ k: Int) -> Int {
        return calculate(cardPoints, k, start: 0, end: cardPoints.count - 1)
    }

    func calculate(_ cards: [Int], _ k: Int, start: Int, end: Int) -> Int {
        if k <= 0 { return 0 }
        let startNum = cards[start]
        let endNum = cards[end]
        let leftPick = startNum + calculate(cards, k - 1, start: start + 1, end: end)
        let rightPick = endNum + calculate(cards, k - 1, start: start, end: end - 1)
        return max(leftPick, rightPick)
    }
}
