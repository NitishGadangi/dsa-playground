import Foundation

//https://leetcode.com/problems/valid-palindrome/description/?envType=study-plan-v2&envId=top-interview-150
class Solution {
    func isPalindrome(_ s: String) -> Bool {
        var start = 0
        var end = s.count - 1
        let strArr = Array(s.lowercased())
        while (start < end) {
            let stChar = strArr[start]
            let endChar = strArr[end]
            guard (stChar.isLetter || stChar.isNumber)  else {
                start += 1
                continue
            }
            guard (endChar.isLetter || endChar.isNumber) else {
                end -= 1
                continue
            }
            if (stChar != endChar) {
                return false
            }
            start += 1
            end -= 1
        }
        return true
    }
}
