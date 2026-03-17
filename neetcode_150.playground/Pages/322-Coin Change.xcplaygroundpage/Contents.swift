import Foundation

//https://leetcode.com/problems/coin-change/

class Solution {
    var memoMap: [Int: Int] = [:]
    func coinChange(_ coins: [Int], _ amount: Int) -> Int {
        return findChange(coins, amount)
    }

    func findChange(_ coins: [Int], _ amount: Int) -> Int {
        if amount <= 0 { return amount }
        if let res = memoMap[amount] { return res }
        var res: Int = Int.max
        var hasSolution = false
        for coin in coins {
            let tempRes = findChange(coins, amount - coin)
            if tempRes >= 0 {
                res = min(res, tempRes + 1)
                hasSolution = true
            }
        }
        res = hasSolution ? res : -1
        memoMap[amount] = res
        return res
    }
}
