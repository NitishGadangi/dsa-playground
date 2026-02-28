import Foundation

//https://leetcode.com/problems/valid-palindrome/

class Solution {
    func isPalindrome(_ s: String) -> Bool {
        var l = 0
        var r = s.count - 1
        let sArr = Array(s.lowercased())
        while l < r {
            guard sArr[l].isAlphanumeric else {
                l += 1
                continue
            }
            guard sArr[r].isAlphanumeric else {
                r -= 1
                continue
            }
            if sArr[l] != sArr[r] { return false }
            l += 1
            r -= 1
        }
        return true
    }
}

extension Character {
    var isAlphanumeric: Bool { isLetter || isNumber }
}
