import Foundation

//https://leetcode.com/problems/palindrome-partitioning/

class Solution {
    func partition(_ s: String) -> [[String]] {
        var res: [[String]] = []
        var temp: [String] = []
        backtrack(str: s, res: &res, temp: &temp, start: 0)
        return res
    }
    
    func backtrack(str: String, res: inout [[String]], temp: inout [String], start: Int) {
        if start == str.count {
            res.append(temp)
            return
        }
        for idx in start..<str.count {
            if str.isPalindrome(from: start, to: idx) {
                let subStr = str.substring(from: start, to: idx)
                temp.append(subStr)
                backtrack(str: str, res: &res, temp: &temp, start: idx + 1)
                temp.removeLast()
            }
        }
    }
}

extension String {
    // including both from and to
    func substring(from: Int, to: Int) -> String {
        let startIndex = self.index(self.startIndex, offsetBy: from)
        let endIndex = self.index(self.startIndex, offsetBy: to)
        return String(self[startIndex...endIndex])
    }
    
    func isPalindrome(from: Int, to: Int) -> Bool {
        let strArr = Array(self)
        var left = from
        var right = to
        while left < right {
            if strArr[left] != strArr[right] {
                return false
            }
            left += 1
            right -= 1
        }
        return true
    }
}
