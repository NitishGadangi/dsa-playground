import Foundation

//https://leetcode.com/problems/gas-station/description/

// Math Proof
// diff(x) = gas(x) - cost(x)
// Σdiff(x) = Σgas(x) - Σcost(x) >= 0 (first condition)
// when startIdx is found
// Σdiff(startIdx...n-1) >= 0
// we know Σdiff(x) = Σdiff(0...startIdx-1) + Σdiff(startIdx...n-1) >= 0
// |Σdiff(startIdx...n-1)| >= |Σdiff(0...startIdx-1)|
// as in fuel remaining is enough to compensate the remaining section

class Solution {
    func canCompleteCircuit(_ gas: [Int], _ cost: [Int]) -> Int {
        let gasSum = gas.reduce(0, { $0 + $1 })
        let costSum = cost.reduce(0, { $0 + $1 })
        guard gasSum >= costSum else { return -1 }
        var startIdx: Int = 0
        var range: Int = 0
        for idx in 0..<gas.count {
            range += gas[idx] - cost[idx]
            if range < 0 {
                startIdx = idx + 1
                range = 0
            }
        }
        return startIdx
    }
}
