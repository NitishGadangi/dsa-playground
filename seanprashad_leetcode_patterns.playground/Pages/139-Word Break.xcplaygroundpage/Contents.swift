import Foundation

//https://leetcode.com/problems/word-break/

class Solution {
    var memoMap: [String: Bool] = [:]
    func wordBreak(_ s: String, _ wordDict: [String]) -> Bool {
        guard s.count > 0 else { return true }
        
        if let res = memoMap[s] {
            return res
        }
        
        for word in wordDict {
            if s.hasPrefix(word) {
                let next = s.dropFirst(word.count)
                let hasSol = wordBreak(String(next), wordDict)
                if hasSol {
                    memoMap[s] = true
                    return true
                }
            }
        }
        memoMap[s] = false
        return false
    }
}
