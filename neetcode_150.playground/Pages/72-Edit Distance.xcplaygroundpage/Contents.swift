import Foundation

//https://leetcode.com/problems/edit-distance/description/

class Solution {
    var memoMap: [String: Int] = [:]
    func minDistance(_ word1: String, _ word2: String) -> Int {
        return calculate(Array(word1), Array(word2), idx1: 0, idx2: 0)
    }

    func calculate(_ word1: [String.Element], _ word2: [String.Element], idx1: Int, idx2: Int) -> Int {
        if idx1 >= word1.count && idx2 >= word2.count { return 0 }
        if idx2 >= word2.count { return word1.count - idx1 }
        if idx1 >= word1.count { return word2.count - idx2 }
        let key = "\(idx1)-\(idx2)"
        if let res = memoMap[key] { return res }
        var res = 0
        if word1[idx1] == word2[idx2] {
            res = calculate(word1, word2, idx1: idx1 + 1, idx2: idx2 + 1)
        } else {
            let insert = calculate(word1, word2, idx1: idx1, idx2: idx2 + 1)
            let delete = calculate(word1, word2, idx1: idx1 + 1, idx2: idx2)
            let replace = calculate(word1, word2, idx1: idx1 + 1, idx2: idx2 + 1)
            res = 1 + min(insert, min(delete, replace))
        }
        memoMap[key] = res
        return res
    }
}
