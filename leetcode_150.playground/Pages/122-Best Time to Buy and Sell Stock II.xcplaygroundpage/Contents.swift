import Foundation

//https://leetcode.com/problems/best-time-to-buy-and-sell-stock-ii/description/?envType=study-plan-v2&envId=top-interview-150
class Solution {
    func maxProfit(_ prices: [Int]) -> Int {
        var totalProfit = 0
        var curMaxProfit = 0
        var buy = Int.max
        for price in prices {
            if price < buy {
                buy = price
            }
            let profit = price - buy
            if profit > curMaxProfit {
                curMaxProfit = profit
            } else {
                totalProfit += curMaxProfit
                curMaxProfit = 0
                buy = price
            }
        }
        return totalProfit + curMaxProfit
    }
}
