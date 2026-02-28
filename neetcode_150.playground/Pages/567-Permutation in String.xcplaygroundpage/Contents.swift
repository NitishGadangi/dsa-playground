import Foundation

//https://leetcode.com/problems/permutation-in-string/

class Solution {
    func checkInclusion(_ s1: String, _ s2: String) -> Bool {
        if s1.count > s2.count { return false }

        var s1Freq = Array(repeating: 0, count: 26)
        for char in s1 {
            s1Freq[char.asiiIdx] += 1
        }

        var s2Freq = Array(repeating: 0, count: 26)
        var start = 0
        for (end, char) in s2.enumerated() {
            s2Freq[char.asiiIdx] += 1
            if end - start + 1 > s1.count {
                s2Freq[s2.charAt(index: start).asiiIdx] -= 1
                start += 1
            }
            if end - start + 1 == s1.count && s1Freq == s2Freq { return true}
        }

        return false
    }
}

extension Character {
    var asiiIdx: Int { Int(self.asciiValue! - Character("a").asciiValue!) }
}

extension String {
    func charAt(index: Int) -> Character {
        let stringIndex = self.index(self.startIndex, offsetBy: index)
        return self[stringIndex]
    }
}
