import Foundation

//https://leetcode.com/problems/longest-substring-without-repeating-characters/

class Solution {
    func lengthOfLongestSubstring(_ s: String) -> Int {
        var res: Int = 0
        var start: Int = 0
        var end = 0
        var set: Set<String.Element> = []
        var strArr = Array(s)
        
        while end < s.count {
            let endChar = strArr[end]
            while set.contains(endChar) {
                set.remove(strArr[start])
                start += 1
            }
            set.insert(endChar)
            let curRes = end - start + 1
            res = max(res, curRes)
            end += 1
        }
        
        return res
    }
}
