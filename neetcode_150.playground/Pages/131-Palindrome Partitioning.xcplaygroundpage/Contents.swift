import Foundation

//https://leetcode.com/problems/palindrome-partitioning/description/

class Solution {
    func partition(_ s: String) -> [[String]] {
        var res: [[String]] = []
        var temp: [String] = []
        backtrack(s, res: &res, temp: &temp, start: 0)
        return res
    }

    func backtrack(_ s: String, res: inout [[String]], temp: inout [String], start: Int) {
        if start == s.count {
            res.append(temp)
            return
        }
        for idx in start..<s.count {
            guard s.isPalindrome(from: start, to: idx) else { continue }
            temp.append(s.substring(from: start, to: idx))
            backtrack(s, res: &res, temp: &temp, start: idx + 1)
            temp.removeLast()
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
        var from = from
        var to = to
        while from < to {
            guard strArr[from] == strArr[to] else { return false }
            from += 1
            to -= 1
        }
        return true
    }
}
