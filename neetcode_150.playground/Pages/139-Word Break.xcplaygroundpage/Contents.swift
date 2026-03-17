import Foundation

//https://leetcode.com/problems/word-break/description/

class Solution {
    var memoMap: [String: Bool] = [:]
    func wordBreak(_ s: String, _ wordDict: [String]) -> Bool {
        if s.isEmpty { return true }
        if let res = memoMap[s] {
            return res
        }
        for dict in wordDict {
            if s.hasPrefix(dict) {
                if wordBreak(String(s.dropFirst(dict.count)), wordDict) {
                    memoMap[s] = true
                    return true
                }
            }
        }
        memoMap[s] = false
        return false
    }
}
