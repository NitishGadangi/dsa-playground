import Foundation

//https://leetcode.com/problems/longest-substring-without-repeating-characters/?envType=study-plan-v2&envId=top-interview-150
class Solution {
    func lengthOfLongestSubstring(_ s: String) -> Int {
        guard s.count > 0 else { return 0 }
        var maxLen = 1
        var start = 0
        var end = 0
        var map: [String.Element: Int] = [:]
        var strArr = Array(s)
        while end < strArr.count {
            let curItem = strArr[end]
            let curItemCount = (map[curItem] ?? 0) + 1
            map[curItem] = curItemCount
            if curItemCount > 1 {
                maxLen = max(maxLen, end - start)
                while (start <= end) && ((map[curItem] ?? 0) > 1) {
                    let subItem = strArr[start]
                    map[subItem] = (map[subItem] ?? 1) - 1
                    start += 1
                }
            }
            end += 1
        }
        maxLen = max(maxLen, end - start)
        return maxLen
    }
}

