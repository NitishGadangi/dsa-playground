import Foundation

//https://leetcode.com/problems/palindrome-partitioning

class Solution {
    func partition(_ s: String) -> [[String]] {
        var res: [[String]] = []
        var temp: [String] = []
        backTrack(res: &res, temp: &temp, str: s, start: 0)
        return res
    }

    func backTrack(res: inout [[String]], temp: inout [String], str: String, start: Int) {
        if start == str.count {
            res.append(temp)
            return
        }

        for idx in start..<str.count {
            if (isPalindrome(str: str, start: start, end: idx)) {
                let subStr = str.substring(from: start, to: idx)
                temp.append(subStr)
                backTrack(res: &res, temp: &temp, str: str, start: idx + 1)
                temp.removeLast()
            }
        }
    }

    func isPalindrome(str: String, start: Int, end: Int) -> Bool {
        var start = start
        var end = end
        var strArr = Array(str)
        while start < end {
            if strArr[start] != strArr[end] {
                return false
            }
            start += 1
            end -= 1
        }
        return true
    }
}

extension String {
    // including both from and to
    func substring(from: Int, to: Int) -> String {
        let startIndex = self.index(self.startIndex, offsetBy: from)
        let endIndex = self.index(self.startIndex, offsetBy: to)
        return String(self[startIndex...endIndex])
    }

    func substringSafe(from: Int, to: Int) -> String? {
        guard from >= 0, to >= from, to < self.count else {
            return nil
        }
        return substring(from: from, to: to)
    }
}
