import Foundation

//https://leetcode.com/problems/best-time-to-buy-and-sell-stock-with-cooldown/description/

class Solution {
    var memoMap: [String: Int] = [:]
    func maxProfit(_ prices: [Int]) -> Int {
        return findMaxProfit(prices: prices, idx: 0, shouldBuy: true)
    }
    
    func findMaxProfit(prices: [Int], idx: Int, shouldBuy: Bool) -> Int {
        if idx >= prices.count {
            return 0
        }
        let key = "\(idx)-\(shouldBuy)"
        if let res = memoMap[key] {
            return res
        }
        var res = 0
        if shouldBuy {
            let buyNow = -prices[idx] + findMaxProfit(prices: prices, idx: idx + 1, shouldBuy: false)
            let buyLater = 0 + findMaxProfit(prices: prices, idx: idx + 1, shouldBuy: true)
            res = max(buyNow, buyLater)
        } else {
            let sellNow = prices[idx] + findMaxProfit(prices: prices, idx: idx + 2, shouldBuy: true)
            let sellLater = 0 + findMaxProfit(prices: prices, idx: idx + 1, shouldBuy: false)
            res = max(sellNow, sellLater)
        }
        memoMap[key] = res
        return res
    }
}
