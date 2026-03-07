import Foundation

//https://leetcode.com/problems/longest-palindromic-substring/description/

class Solution {
    func longestPalindrome(_ s: String) -> String {
        var maxLen: Int = 0
        var maxStr: String = ""
        var sArr = Array(s)
        var n = s.count
        for idx in 0..<n {
            // odd len
            var left = idx
            var right = idx
            while left >= 0 && right < n && sArr[left] == sArr[right] {
                left -= 1
                right += 1
            }
            left += 1
            right -= 1
            var len = right - left + 1
            if len > maxLen {
                maxStr = s.subString(start: left, end: right)
                maxLen = len
            }

            // even len
            left = idx
            right = idx + 1
            while left >= 0 && right < n && sArr[left] == sArr[right] {
                left -= 1
                right += 1
            }
            left += 1
            right -= 1
            len = right - left + 1
            if len > maxLen {
                maxStr = s.subString(start: left, end: right)
                maxLen = len
            }
        }
        return maxStr
    }
}

extension String {
    func subString(start: Int, end: Int) -> String {
//        guard start >= 0 && end < self.count && start <= end else { return nil }
        let startIdx = self.index(self.startIndex, offsetBy: start)
        let endIdx = self.index(self.startIndex, offsetBy: end)
        return String(self[startIdx...endIdx])
    }
}
