import Foundation

//https://leetcode.com/problems/best-time-to-buy-and-sell-stock-with-cooldown/

class Solution {
    var memoMap: [String: Int] = [:]
    func maxProfit(_ prices: [Int]) -> Int {
        return calculate(prices, idx: 0, shouldBuy: true)
    }

    func calculate(_ prices: [Int], idx: Int, shouldBuy: Bool) -> Int {
        var res = 0
        guard idx < prices.count else { return 0 }
        let key = "\(idx)-\(shouldBuy)"
        if let res = memoMap[key] { return res }
        if shouldBuy {
            let buyNow = -prices[idx] + calculate(prices, idx: idx + 1, shouldBuy: false)
            let buyLater = 0 + calculate(prices, idx: idx + 1, shouldBuy: true)
            res = max(buyNow, buyLater)
        } else {
            let sellNow = prices[idx] + calculate(prices, idx: idx + 2, shouldBuy: true)
            let sellLater = 0 + calculate(prices, idx: idx + 1, shouldBuy: false)
            res = max(sellNow, sellLater)
        }
        memoMap[key] = res
        return res
    }
}
