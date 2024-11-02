import Foundation

//https://leetcode.com/problems/longest-palindromic-substring/

class Solution {
    func longestPalindrome(_ s: String) -> String {
        let n = s.count
        guard n > 1 else { return s }
        var res: String = s.substring(from: 0, to: 0)
        for idx in 0..<(n-1) {
            let odd = longestPalindrome(str: s, left: idx, right: idx)
            let even = longestPalindrome(str: s, left: idx, right: idx + 1)
            if odd.count > res.count {
                res = odd
            }
            if even.count > res.count {
                res = even
            }
        }
        return res
    }
    
    func longestPalindrome(str: String, left: Int, right: Int) -> String {
        var left = left
        var right = right
        var strArr = Array(str)
        while left >= 0 && right < str.count && strArr[left] == strArr[right] {
            left -= 1
            right += 1
        }
        return str.substring(from: left + 1, to: right - 1)
    }
}

extension String {
    // including both from and to
    func substring(from: Int, to: Int) -> String {
        guard from <= to else { return "" }
        let startIndex = self.index(self.startIndex, offsetBy: from)
        let endIndex = self.index(self.startIndex, offsetBy: to)
        return String(self[startIndex...endIndex])
    }
}
