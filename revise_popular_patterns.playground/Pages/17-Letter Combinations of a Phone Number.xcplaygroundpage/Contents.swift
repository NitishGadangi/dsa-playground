import Foundation

//https://leetcode.com/problems/letter-combinations-of-a-phone-number/description/

class Solution {
    let phoneMap = [
                    "2": ["a", "b", "c"],
                    "3": ["d", "e", "f"],
                    "4": ["g", "h", "i"],
                    "5": ["j", "k", "l"],
                    "6": ["m", "n", "o"],
                    "7": ["p", "q", "r", "s"],
                    "8": ["t", "u", "v"],
                    "9": ["w", "x", "y", "z"]
                ]
    func letterCombinations(_ digits: String) -> [String] {
        guard !digits.isEmpty else { return [] }
        var temp: [String] = []
        var res: [String] = []
        var strDigits = digits.map { "\($0)" }
        backtrack(digits: strDigits, temp: &temp, res: &res, idx: 0)
        return res
    }

    func backtrack(digits: [String], temp: inout [String], res: inout [String], idx: Int) {
        if temp.count == digits.count {
            res.append(temp.joined())
            return
        }
        for char in phoneMap[digits[idx]]! {
            temp.append(char)
            backtrack(digits: digits, temp: &temp, res: &res, idx: idx + 1)
            temp.removeLast()
        }
    }
}
