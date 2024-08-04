import Foundation

//https://leetcode.com/problems/coin-change/description/?envType=study-plan-v2&envId=top-interview-150
class Solution {
    var memoMap: [Int: Int] = [:]
    func coinChange(_ coins: [Int], _ amount: Int) -> Int {
        guard amount > 0 else { return amount }
        if let res = memoMap[amount] {
            return res
        }

        var res = Int.max
        var hasSolution = false
        for coin in coins {
            let numOfCoins = coinChange(coins, amount - coin)
            if numOfCoins < 0 { continue }
            res = min(res, numOfCoins + 1)
            hasSolution = true
        }
        if !hasSolution {
            res = -1
        }
        memoMap[amount] = res
        return res
    }
}
