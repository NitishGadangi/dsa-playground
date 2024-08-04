import Foundation

//https://leetcode.com/problems/edit-distance/description/?envType=study-plan-v2&envId=top-interview-150
class Solution {
    var memoMap: [String: Int] = [:]
    func minDistance(_ word1: String, _ word2: String) -> Int {
        return editDistance(word1, word2, i: word1.count - 1, j: word2.count - 1)
    }

    func editDistance(_ word1: String, _ word2: String, i: Int, j: Int) -> Int {
        if (i < 0) { return j + 1 } // i,j are indices, hence plus 1 to return len
        if (j < 0) { return i + 1 }

        if let res = memoMap["\(i)-\(j)"] {
            return res
        }

        var res = 0
        if (word1[i] == word2[j]) {
            res = editDistance(word1, word2, i: i - 1, j: j - 1)
        } else {
            let insert = 1 + editDistance(word1, word2, i: i, j: j - 1)
            let delete = 1 + editDistance(word1, word2, i: i - 1, j: j)
            let replace = 1 + editDistance(word1, word2, i: i - 1, j: j - 1)
            res = min(insert, min(delete, replace))
        }
        memoMap["\(i)-\(j)"] = res
        return res
    }
}

extension String {
    subscript(_ idx: Int) -> Character {
        return Array(self)[idx]
    }
}
