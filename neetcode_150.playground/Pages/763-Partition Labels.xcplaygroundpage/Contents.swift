import Foundation

//https://leetcode.com/problems/partition-labels/description/

// idea is to know for each character whats its last index

class Solution {
    func partitionLabels(_ s: String) -> [Int] {
        var lastIdx: [Character: Int] = [:]
        for (idx, ch) in s.enumerated() {
            lastIdx[ch] = idx
        }
        var res: [Int] = []
        var size: Int = 0
        var end: Int = 0
        for (idx, ch) in s.enumerated() {
            var curEnd = lastIdx[ch]!
            end = max(end, curEnd)
            size += 1
            if idx == end {
                res.append(size)
                size = 0
            }
        }
        return res
    }
}
