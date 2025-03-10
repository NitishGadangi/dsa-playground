import Foundation

//https://leetcode.com/problems/best-time-to-buy-and-sell-stock/

class Solution {
    func maxProfit(_ prices: [Int]) -> Int {
        var maxP: Int = 0
        var buyP: Int = Int.max
        for curP in prices {
            buyP = min(buyP, curP)
            let profit = curP - buyP
            maxP = max(maxP, profit)
        }
        return maxP
    }
}
