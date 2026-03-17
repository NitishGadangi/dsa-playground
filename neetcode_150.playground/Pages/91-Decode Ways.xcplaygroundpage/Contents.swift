import Foundation

//https://leetcode.com/problems/decode-ways/

class Solution {
    var memoMap: [Int: Int] = [:]
    func numDecodings(_ s: String) -> Int {
        return decode(s, idx: 0)
    }

    func decode(_ s: String, idx: Int) -> Int {
        let n = s.count
        if idx == n { return 1 }
        if let res = memoMap[idx] { return res }
        let sArr = Array(s)
        if sArr[idx] == "0" {
            return 0
        }
        var res: Int = 0
        res += decode(s, idx: idx + 1) // single digit
        if (idx + 1 < n) && (sArr[idx] == "1" || ( sArr[idx] == "2" && sArr[idx + 1] < "7")) {
            // two digit
            res += decode(s, idx: idx + 2)
        }
        memoMap[idx] = res
        return res
    }
}
