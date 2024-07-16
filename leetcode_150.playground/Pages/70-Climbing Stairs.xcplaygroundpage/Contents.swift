import Foundation

//https://leetcode.com/problems/climbing-stairs/?envType=study-plan-v2&envId=top-interview-150

class Solution {
    func climbStairs(_ n: Int) -> Int {
        var map: [Int: Int] = [:]
        return climbMemoised(n, map: map)
    }

    func climbMemoised(_ n: Int, map: [Int: Int]) -> Int {
        guard n > 2 else { return n }
        if let res = map[n] {
            return res
        }
        var map = map
        let oneStep = climbMemoised(n - 1,  map: map)
        let twoStep = climbMemoised(n - 2, map: map)
        let res = oneStep + twoStep
        map[n] = res
        return res
    }
}
