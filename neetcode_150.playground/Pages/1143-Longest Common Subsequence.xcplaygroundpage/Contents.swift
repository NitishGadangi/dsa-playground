import Foundation

//https://leetcode.com/problems/longest-common-subsequence/description/

class Solution {
    var memoMap: [String: Int] = [:]
    func longestCommonSubsequence(_ text1: String, _ text2: String) -> Int {
        return calculate(Array(text1), Array(text2), idx1: 0, idx2: 0)
    }

    func calculate(_ text1: [String.Element], _ text2: [String.Element], idx1: Int, idx2: Int) -> Int {
        guard idx1 < text1.count && idx2 < text2.count else { return 0 }
        let key = "\(idx1)-\(idx2)"
        if let res = memoMap[key] { return res }
        if text1[idx1] == text2[idx2] {
            return 1 + calculate(text1, text2, idx1: idx1 + 1, idx2: idx2 + 1)
        }
        let skip1 = calculate(text1, text2, idx1: idx1 + 1, idx2: idx2)
        let skip2 = calculate(text1, text2, idx1: idx1, idx2: idx2 + 1)
        let res = max(skip1, skip2)
        memoMap[key] = res
        return res
    }
}
