import Foundation

//https://leetcode.com/problems/longest-palindromic-substring/?envType=study-plan-v2&envId=top-interview-150
class Solution {
    func longestPalindrome(_ s: String) -> String {
        let strArr = Array(s)
        let strLen = strArr.count
        var maxLPS = ""

        for idx in 0..<strLen {
            //odd length lps
            var left = idx
            var right = idx
            while (left >= 0) && (right < strLen) && (strArr[left] == strArr[right]) {
                left -= 1
                right += 1
            }
            // revert back by one position
            left += 1
            right -= 1
            var newLPSLen = (right - left) + 1
            if newLPSLen > maxLPS.count,
               let newLps = s.substring(from: left, to: right) {
                maxLPS = newLps
            }

            //even length LPS
            left = idx
            right = idx + 1
            while (left >= 0) && (right < strLen) && (strArr[left] == strArr[right]) {
                left -= 1
                right += 1
            }
            // revert back by one position
            left += 1
            right -= 1
            newLPSLen = (right - left) + 1
            if newLPSLen > maxLPS.count,
               let newLps = s.substring(from: left, to: right) {
                maxLPS = newLps
            }
        }

        return maxLPS
    }
}

extension String {
    func substring(from fromIndex: Int, to toIndex: Int) -> String? {
        guard fromIndex >= 0, toIndex < self.count, fromIndex < toIndex else {
            return nil
        }

        let start = self.index(self.startIndex, offsetBy: fromIndex)
        let end = self.index(self.startIndex, offsetBy: toIndex)

        return String(self[start...end])
    }
}
