import Foundation

//https://leetcode.com/problems/daily-temperatures/

class Solution {
    func dailyTemperatures(_ temperatures: [Int]) -> [Int] {
        var maxStack: [Int] = []
        var res: [Int] = Array(repeating: 0, count: temperatures.count)
        for idx in stride(from: temperatures.count - 1, through: 0, by: -1) {
            let cur = temperatures[idx]
            while let top = maxStack.last, temperatures[top] <= cur {
                maxStack.removeLast()
            }
            if let top = maxStack.last {
                res[idx] = top - idx
            }
            maxStack.append(idx)
        }
        return res
    }
}
