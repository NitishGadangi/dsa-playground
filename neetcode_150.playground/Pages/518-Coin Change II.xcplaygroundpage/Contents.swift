import Foundation

//https://leetcode.com/problems/coin-change-ii/description/

class Solution {
    var memoMap: [String: Int] = [:]
    func change(_ amount: Int, _ coins: [Int]) -> Int {
        return calculate(coins, idx: 0, amount: amount)
    }

    func calculate(_ coins: [Int], idx: Int, amount: Int) -> Int {
        if amount == 0 { return 1 }
        guard amount > 0 && idx < coins.count else { return 0 }
        let key = "\(idx)-\(amount)"
        if let res = memoMap[key] { return res }
        let takeCur = calculate(coins, idx: idx, amount: amount - coins[idx])
        let skipCur = calculate(coins, idx: idx + 1, amount: amount)
        let res = takeCur + skipCur
        memoMap[key] = res
        return res
    }
}
