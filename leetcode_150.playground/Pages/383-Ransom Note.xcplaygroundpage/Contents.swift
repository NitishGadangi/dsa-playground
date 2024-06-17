import Foundation

//https://leetcode.com/problems/ransom-note/?envType=study-plan-v2&envId=top-interview-150
class Solution {
    func canConstruct(_ ransomNote: String, _ magazine: String) -> Bool {
        var magMap: [String.Element: Int] = [:]
        for item in magazine {
            magMap[item] = (magMap[item] ?? 0) + 1
        }
        for item in ransomNote {
            if let count = magMap[item], count > 0 {
                magMap[item] = count - 1
            } else {
                return false
            }
        }
        return true
    }
}
