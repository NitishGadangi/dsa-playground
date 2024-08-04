import Foundation

//https://leetcode.com/problems/interleaving-string/description/?envType=study-plan-v2&envId=top-interview-150
class Solution {

    var memoMap: [String: Bool] = [:]
    func isInterleave(_ s1: String, _ s2: String, _ s3: String) -> Bool {
        guard (s1.count + s2.count) == s3.count else { return false }
        return interleaveRec(s1, s2, s3, i: 0, j: 0, k: 0)
    }

    func interleaveRec(_ s1: String, _ s2: String, _ s3: String, i: Int, j: Int, k: Int) -> Bool {
        if let res = memoMap["\(i)-\(j)-\(k)"] {
            return res
        }

        if k == s3.count { return true }

        var res = false
        if (i < s1.count) && (j < s2.count) && (s1[i] == s3[k]) && (s2[j] == s3[k]) {
            let considerS1 = interleaveRec(s1, s2, s3, i: i + 1, j: j, k: k + 1)
            let considerS2 = interleaveRec(s1, s2, s3, i: i, j: j + 1, k: k + 1)
            res = considerS1 || considerS2
        } else if (i < s1.count) && (s1[i] == s3[k]) {
            let considerS1 = interleaveRec(s1, s2, s3, i: i + 1, j: j, k: k + 1)
            res = considerS1
        } else if (j < s2.count) && (s2[j] == s3[k]) {
            let considerS2 = interleaveRec(s1, s2, s3, i: i, j: j + 1, k: k + 1)
            res = considerS2
        }
        memoMap["\(i)-\(j)-\(k)"] = res
        return res
    }
}

extension String {
    subscript(_ idx: Int) -> Character {
        return Array(self)[idx]
    }
}
