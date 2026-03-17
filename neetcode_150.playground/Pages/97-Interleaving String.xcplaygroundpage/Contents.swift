import Foundation

//https://leetcode.com/problems/interleaving-string/

class Solution {
    func isInterleave(_ s1: String, _ s2: String, _ s3: String) -> Bool {
        let c1 = s1.count
        let c2 = s2.count
        let c3 = s3.count
        guard c3 == c1 + c2 else { return false }
        let s1Arr = Array(s1)
        let s2Arr = Array(s2)
        let s3Arr = Array(s3)
        var memoMap: [String: Bool] = [:]
        func checkIfPossible(idx1: Int, idx2: Int, idx3: Int) -> Bool {
            if idx3 == c3 { return true }
            guard idx3 < c3 else { return false }
            let key = "\(idx1)-\(idx2)-\(idx3)"
            if let res = memoMap[key] { return res }
            var res = false
            if idx1 < c1 && s1Arr[idx1] == s3Arr[idx3] && idx2 < c2 && s2Arr[idx2] == s3Arr[idx3] {
                let considerS1 = checkIfPossible(idx1: idx1 + 1, idx2: idx2, idx3: idx3 + 1)
                let considerS2 = checkIfPossible(idx1: idx1, idx2: idx2 + 1, idx3: idx3 + 1)
                res = considerS1 || considerS2
            } else if idx1 < c1 && s1Arr[idx1] == s3Arr[idx3] {
                res = checkIfPossible(idx1: idx1 + 1, idx2: idx2, idx3: idx3 + 1)
            } else if idx2 < c2 && s2Arr[idx2] == s3Arr[idx3] {
                res = checkIfPossible(idx1: idx1, idx2: idx2 + 1, idx3: idx3 + 1)
            }
            memoMap[key] = res
            return res
        }
        return checkIfPossible(idx1: 0, idx2: 0, idx3: 0)
    }
}
