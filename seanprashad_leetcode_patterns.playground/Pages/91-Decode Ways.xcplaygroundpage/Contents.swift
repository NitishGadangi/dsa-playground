import Foundation

//https://leetcode.com/problems/decode-ways/

class Solution {
    var memoMap: [Int: Int] = [:]
    func numDecodings(_ s: String) -> Int {
        let n = s.count
        guard n > 0 else { return n }
        var strArr = Array(s)
        var dp: [Int] = Array(repeating: 0, count: n + 1)
        dp[n] = 1
        for idx in stride(from: n-1, through: 0, by: -1) {
            if strArr[idx] == "0" {
                dp[idx] = 0
            } else {
                dp[idx] = dp[idx + 1]
                if idx < n-1 && (strArr[idx] == "1" || (strArr[idx] == "2" && strArr[idx + 1] < "7")) {
                    dp[idx] += dp[idx + 2]
                }
            }
        }
        return dp[0]
    }
    
    func numDecodingsRec(_ s: String) -> Int {
        guard s.count > 0 else { return 0 }
        return decode(str: s, idx: 0)
    }
    
    func decode(str: String, idx: Int) -> Int {
        let n = str.count
        if idx == n { return 1 }
        
        if let res = memoMap[idx] {
            return res
        }
        
        let strArr = Array(str)
        if strArr[idx] == "0" {
            return 0
        }
        var res: Int = decode(str: str, idx: idx + 1)
        if idx < n - 1 && ( strArr[idx] == "1" || (strArr[idx] == "2" && strArr[idx + 1] < "7")) {
            res += decode(str: str, idx: idx + 2)
        }
        memoMap[idx] = res
        return res
    }
}
