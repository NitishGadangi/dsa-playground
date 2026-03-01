import Foundation

//https://leetcode.com/problems/letter-combinations-of-a-phone-number/

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
        var res: [String] = []
        var temp: [String] = []
        var digits = digits.map {  String($0) }
        backtrack(digits, res: &res, temp: &temp, pos: 0)
        return res
    }

    func backtrack(_ digits: [String], res: inout [String], temp: inout [String], pos: Int) {
        if pos == digits.count {
            res.append(temp.joined(separator: ""))
            return
        }
        guard let letters = phoneMap[digits[pos]] else { return }
        for char in letters {
            temp.append(char)
            backtrack(digits, res: &res, temp: &temp, pos: pos + 1)
            temp.removeLast()
        }
    }
}
