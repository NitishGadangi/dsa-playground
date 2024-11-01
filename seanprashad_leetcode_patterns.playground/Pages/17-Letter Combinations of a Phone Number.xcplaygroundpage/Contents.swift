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
        guard digits.count > 0 else { return [] }
        var res: [String] = []
        var temp: [String] = []
        backtrack(digits: digits, res: &res, temp: &temp, cur: 0)
        return res
    }
    
    func backtrack(digits: String, res: inout [String], temp: inout [String], cur: Int) {
        if cur == digits.count {
            let msg = temp.joined()
            res.append(msg)
            return
        }
        let curDig = digits.charAt(idx: cur)
        for inp in phoneMap[curDig]! {
            temp.append(inp)
            backtrack(digits: digits, res: &res, temp: &temp, cur: cur + 1)
            temp.removeLast()
        }
    }
}

extension String {
    func charAt(idx: Int) -> String {
        return String(Array(self)[idx])
    }
}
