import Foundation

//https://leetcode.com/problems/is-subsequence/?envType=study-plan-v2&envId=top-interview-150
class Solution {
    func isSubsequence(_ s: String, _ t: String) -> Bool {
        guard t.count >= s.count  else { return false }

        let tArr = Array(t)
        let sArr = Array(s)

        var tIdx = 0
        var sIdx = 0

        while (tIdx < tArr.count) && (sIdx < sArr.count) {
            let curT = tArr[tIdx]
            let curS = sArr[sIdx]
            if (curT == curS) {
                sIdx += 1
            }
            tIdx += 1
        }
        return sIdx == sArr.count
    }
}
