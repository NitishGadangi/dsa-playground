import Foundation

//https://leetcode.com/problems/min-cost-climbing-stairs/description/

class Solution {
    var memoMap: [Int: Int] = [:]
    func minCostClimbingStairs(_ cost: [Int]) -> Int {
        return min(calculateCost(cost, idx: 0), calculateCost(cost, idx: 1))
    }

    func calculateCost(_ cost: [Int], idx: Int) -> Int {
        guard idx < cost.count else { return 0 }
        if let res = memoMap[idx] { return res }
        let oneStep = cost[idx] + calculateCost(cost, idx: idx + 1)
        let twoStep = cost[idx] + calculateCost(cost, idx: idx + 2)
        let res = min(oneStep, twoStep)
        memoMap[idx] = res
        return res
    }
}

class SolutionOptimised {
    func minCostClimbingStairs(_ cost: [Int]) -> Int {
        var res = 0
        var cost = cost
        for idx in stride(from: cost.count - 3, through: 0, by: -1) {
            cost[idx] = cost[idx] + min(cost[idx + 1], cost[idx + 2])
        }
        return min(cost[0], cost[1])
    }
}
