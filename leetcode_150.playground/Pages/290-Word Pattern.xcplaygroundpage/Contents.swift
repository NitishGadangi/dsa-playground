import Foundation

//https://leetcode.com/problems/word-pattern/?envType=study-plan-v2&envId=top-interview-150
class Solution {
    func wordPattern(_ pattern: String, _ s: String) -> Bool {
        let sArr = s.components(separatedBy: " ")
        guard pattern.count == sArr.count else { return false }
        let len = pattern.count
        let pArr = Array(pattern)
        var sMap: [String: Int] = [:]
        var pMap: [String.Element: Int] = [:]
        for idx in 0..<len {
            let ptr = pArr[idx]
            let str = sArr[idx]
            pMap[ptr] = pMap[ptr] ?? idx
            sMap[str] = sMap[str] ?? idx
            if pMap[ptr] != sMap[str] {
                return false
            }
        }
        return true
    }
}
