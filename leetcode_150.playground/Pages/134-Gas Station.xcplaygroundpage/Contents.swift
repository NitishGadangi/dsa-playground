//: [Previous](@previous)

import Foundation

//https://leetcode.com/problems/gas-station/description/?envType=study-plan-v2&envId=top-interview-150
class Solution {
    func canCompleteCircuit(_ gas: [Int], _ cost: [Int]) -> Int {
        let totalGas = gas.reduce(0) { res, ele in
            return res + ele
        }

        let totalCost = cost.reduce(0) { res, ele in
            return res + ele
        }

        guard totalGas >= totalCost else { return -1 }

        var start = 0
        var gasAvbl = 0
        for idx in 0..<gas.count {
            let curGas = gas[idx]
            let curCost = cost[idx]
            gasAvbl += curGas - curCost
            if gasAvbl < 0 {
                start = idx + 1
                gasAvbl = 0
            }
        }
        return start
    }
}
