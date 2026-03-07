import Foundation

//https://leetcode.com/problems/climbing-stairs/description/

class Solution {
    var memoMap: [Int: Int] = [:]
    func climbStairs(_ n: Int) -> Int {
        guard n > 0 else { return n == 0 ? 1 : 0 }
        if let res = memoMap[n]  { return res }
        let res = climbStairs(n - 1) + climbStairs(n - 2)
        memoMap[n] = res
        return res
    }
}


