import Foundation

//https://leetcode.com/problems/coin-change/

class Solution {
    var memoMap: [Int: Int] = [:]
    func coinChange(_ coins: [Int], _ amount: Int) -> Int {
        guard amount > 0 else { return amount }
        if let res = memoMap[amount] {
            return res
        }
        var res: Int = Int.max
        var hasSolve = false
        for coin in coins {
            let numOfCoins = coinChange(coins, amount - coin)
            if numOfCoins < 0 { continue }
            res = min(res, 1 + numOfCoins)
            hasSolve = true
        }
        if !hasSolve {
            res = -1
        }
        memoMap[amount] = res
        return res
    }
}
