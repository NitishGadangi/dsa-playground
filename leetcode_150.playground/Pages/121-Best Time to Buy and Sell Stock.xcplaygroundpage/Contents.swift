import Foundation

//https://leetcode.com/problems/best-time-to-buy-and-sell-stock/description/?envType=study-plan-v2&envId=top-interview-150
class Solution {
    func maxProfit(_ prices: [Int]) -> Int {
        var minPrice = Int.max
        var maxProfit = 0

        for price in prices {
            if price < minPrice {
                minPrice = price
            }
            let profit = price - minPrice
            if profit > maxProfit {
                maxProfit = profit
            }
        }

        return maxProfit
    }
}
