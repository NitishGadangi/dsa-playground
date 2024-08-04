import Foundation

//https://leetcode.com/problems/climbing-stairs/?envType=study-plan-v2&envId=top-interview-150
class Solution {
    var memoMap: [Int: Int] = [:]
    func climbStairs(_ n: Int) -> Int {
        guard n > 2 else { return n }
        if let res = memoMap[n] {
            return res
        }
        let oneStep = climbStairs(n - 1)
        let twoStep = climbStairs(n - 2)
        let res = oneStep + twoStep
        memoMap[n] = res
        return res
    }

    func climbStairsAlternate(_ n: Int) -> Int {
        guard n > 2 else { return n }
        var res: [Int] = [0, 1]
        for idx in stride(from: 2, through: n, by: 1) {
            let cur = res[idx - 1] + res[idx - 2]
            res.append(cur)
        }
        return res[n]
    }
}
