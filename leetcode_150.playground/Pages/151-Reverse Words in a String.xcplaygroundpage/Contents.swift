import Foundation

//https://leetcode.com/problems/reverse-words-in-a-string/description/?envType=study-plan-v2&envId=top-interview-150
class Solution {
    func reverseWords(_ s: String) -> String {
        let words = s.components(separatedBy: " ")
        var res = [String]()
        for idx in stride(from: words.count - 1, through: 0, by: -1) {
            let curWord = words[idx]
            let parsed = curWord.replacingOccurrences(of: " ", with: "")
            let wordLen = parsed.count
            if wordLen > 0 {
                res.append(parsed)
            }
        }
        return res.joined(separator: " ")
    }
}

