import Foundation

//https://leetcode.com/problems/longest-repeating-character-replacement/

class Solution {
    func characterReplacement(_ s: String, _ k: Int) -> Int {
        var res: Int = 0
        var start = 0
        var end = 0
        var map: [Character: Int] = [:]
        var sArr = Array(s)
        while end < s.count {
            let cur = sArr[end]
            map[cur, default: 0] += 1
            while ((end - start + 1) - map.values.max()!) > k {
                let startItem = sArr[start]
                map[startItem, default: 0] -= 1
                start += 1
            }
            res = max(res, end - start + 1)
            end += 1
        }
        return res
    }
}
