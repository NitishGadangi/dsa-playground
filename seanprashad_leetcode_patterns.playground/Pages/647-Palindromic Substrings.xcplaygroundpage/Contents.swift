import Foundation

//https://leetcode.com/problems/palindromic-substrings/

class Solution {
    func countSubstrings(_ s: String) -> Int {
        var count = 0
        var strArr = Array(s)
        for idx in 0..<s.count {
            //odd
            count += countPalindromes(strArr: strArr, from: idx, to: idx)
            //even
            if idx < s.count - 1 {
                count += countPalindromes(strArr: strArr, from: idx, to: idx + 1)
            }
        }
        return count
    }
    
    func countPalindromes(strArr: [String.Element], from: Int, to: Int) -> Int {
        var left = from
        var right = to
        var count: Int = 0
        let n = strArr.count
        while left >= 0 && right < n && strArr[left] == strArr[right] {
            count += 1
            left -= 1
            right += 1
        }
        return count
    }
}
