import Foundation

//https://leetcode.com/problems/longest-substring-without-repeating-characters/

class Solution {
    func lengthOfLongestSubstring(_ s: String) -> Int {
        var res: Int = 0
        var l: Int = 0
        var r: Int = 0
        var set = Set<Character>()
        var sArr = Array(s)
        while l <= r && r < s.count {
            let cur = sArr[r]
            if set.contains(cur) {
                while set.contains(cur) {
                    set.remove(sArr[l])
                    l += 1
                }
            }
            set.insert(cur)
            res = max(res, r - l + 1)
            r += 1
        }
        return res
    }
}
