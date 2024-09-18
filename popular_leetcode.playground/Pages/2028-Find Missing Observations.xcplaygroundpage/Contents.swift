import Foundation

//https://leetcode.com/problems/find-missing-observations

class Solution {
    func missingRolls(_ rolls: [Int], _ mean: Int, _ n: Int) -> [Int] {
        let sum = rolls.reduce(0, +)
        let remSum = (mean * (n + rolls.count)) - sum

        guard remSum <= 6 * n && remSum >= n else { return [] }

        let eachItem = remSum / n
        var remItems = remSum % n
        var res: [Int] = []

        for _ in 0..<n {
            let curItem = eachItem + (remItems > 0 ? 1 : 0)
            remItems -= 1
            res.append(curItem)
        }

        return res
    }
}
