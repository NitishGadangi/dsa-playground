import Foundation

//https://leetcode.com/problems/daily-temperatures

class Solution {
    func dailyTemperatures(_ temperatures: [Int]) -> [Int] {
        var stack: [Int] = []
        var res: [Int] = Array(repeating: 0, count: temperatures.count)
        for idx in 0..<temperatures.count {
            let curTemp = temperatures[idx]
            while !stack.isEmpty && temperatures[stack.last!] < curTemp {
                let popIdx = stack.removeLast()
                res[popIdx] = idx - popIdx
            }
            stack.append(idx)
        }
        return res
    }
}
