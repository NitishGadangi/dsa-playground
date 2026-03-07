import Foundation

//https://leetcode.com/problems/palindromic-substrings/

class Solution {
    func countSubstrings(_ s: String) -> Int {
        var res = 0
        for idx in 0..<s.count {
            res += countPalindromes(s, start: idx, end: idx)
            if idx + 1 < s.count {
                res += countPalindromes(s, start: idx, end: idx + 1)
            }
        }
        return res
    }

    func countPalindromes(_ s: String, start: Int, end: Int) -> Int {
        var n = s.count
        var sArr = Array(s)
        var start = start
        var end = end
        var count = 0
        while start >= 0 && end < n && sArr[start] == sArr[end] {
            start -= 1
            end += 1
            count += 1
        }
        return count
    }
}
