import Foundation

//https://leetcode.com/problems/group-anagrams/

class Solution {
    func groupAnagrams(_ strs: [String]) -> [[String]] {
        var anaMap: [String: [String]] = [:]
        for str in strs {
            var count = Array(repeating: 0, count: 26)
            for char in str {
                let chrIdx = Int(char.asciiValue! - Character("a").asciiValue!)
                count[chrIdx] += 1
            }
            let mapKey = count.map { String($0) }.joined(separator: "#")
            anaMap[mapKey, default: []].append(str)
        }
        return Array(anaMap.values)
    }
}
