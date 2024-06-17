import Foundation

//https://leetcode.com/problems/valid-anagram/?envType=study-plan-v2&envId=top-interview-150
class Solution {
    func isAnagram(_ s: String, _ t: String) -> Bool {
        let sSorted = s.sorted { l, r in
            l < r
        }
        let tSorted = t.sorted { l, r in
            l < r
        }
        return sSorted == tSorted
    }
}


class AlternateSolution {
    func isAnagram(_ s: String, _ t: String) -> Bool {
        guard s.count == t.count else { return false }

        var dict = [Character: Int]()

        for char in s {
            dict[char, default: 0] += 1
        }

        for char in t {
            if let count = dict[char], count > 0 {
                dict[char] = count - 1
            } else {
                return false
            }
        }

        return true
    }
}
