import Foundation

//https://leetcode.com/problems/permutation-in-string/

class Solution {
    func checkInclusion(_ s1: String, _ s2: String) -> Bool {
        var s1Arr = Array(repeating: 0, count: 26)
        var s2Arr = Array(repeating: 0, count: 26)
        
        for char in s1 {
            s1Arr[char.asciIdx] += 1
        }
        
        for (idx, char) in s2.enumerated() {
            s2Arr[char.asciIdx] += 1
            guard idx >= s1.count - 1 else { continue }
            let startIdx = idx - s1.count
            if startIdx >= 0 {
                let starChar = Array(s2)[startIdx]
                s2Arr[starChar.asciIdx] -= 1
            }
            if equate(s1Arr: s1Arr, s2Arr: s2Arr) {
                return true
            }
        }
        
        return false
    }
    
    func equate(s1Arr: [Int], s2Arr: [Int]) -> Bool {
        for idx in 0..<26 {
            if s1Arr[idx] != s2Arr[idx] {
                return false
            }
        }
        return true
    }
}

extension Character {
    var asciIdx: Int {
        Int(self.asciiValue! - Character("a").asciiValue!)
    }
}

