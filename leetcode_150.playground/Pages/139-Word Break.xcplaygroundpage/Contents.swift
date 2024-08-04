import Foundation

//https://leetcode.com/problems/word-break/?envType=study-plan-v2&envId=top-interview-150
class Solution {
    var memoMap: [String: Bool] = [:]
    func wordBreak(_ s: String, _ wordDict: [String]) -> Bool {
        guard s.count > 0 else { return true }

        if let res = memoMap[s] {
            return res
        }

        for word in wordDict {
            if s.hasPrefix(word) {
                let wordSize = word.count
                let next = s.dropFirst(wordSize)
                let isNextPossible = wordBreak(String(next), wordDict)
                if isNextPossible {
                    memoMap[s] = true
                    return true
                }
            }
        }

        memoMap[s] = false
        return false
    }
}
