import Foundation

//https://leetcode.com/problems/best-time-to-buy-and-sell-stock/

class Solution {
    func maxProfit(_ prices: [Int]) -> Int {
        var minPrice = Int.max
        var res: Int = Int.min

        for price in prices {
            minPrice = min(minPrice, price)
            let curProfit = price - minPrice
            res = max(res, curProfit)
        }

        return res
    }
}
