import Foundation

//https://leetcode.com/problems/length-of-last-word/?envType=study-plan-v2&envId=top-interview-150
class Solution {
    func lengthOfLastWord(_ s: String) -> Int {
        var str = s
        let words = str.components(separatedBy: " ")
        for idx in stride(from: words.count - 1, through: 0, by: -1) {
            let curWord = words[idx]
            let parsed = curWord.replacingOccurrences(of: " ", with: "")
            let wordLen = parsed.count
            if wordLen > 0 {
                return wordLen
            }
        }
        return 0
    }
}
