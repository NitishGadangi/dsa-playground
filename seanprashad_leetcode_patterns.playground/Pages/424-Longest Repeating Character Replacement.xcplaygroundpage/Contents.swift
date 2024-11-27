import Foundation

//https://leetcode.com/problems/longest-repeating-character-replacement/

class Solution {
    func characterReplacement(_ s: String, _ k: Int) -> Int {
        var charSet: Set<String.Element> = []
        for char in s {
            charSet.insert(char)
        }
        var strArr = Array(s)
        var res: Int = 0
        for target in charSet {
            var start = 0
            var end = 0
            var count = k
            while end < s.count {
                if strArr[end] != target {
                    count -= 1
                }
                
                while start <= end && count < 0 {
                    if strArr[start] != target {
                        count += 1
                    }
                    start += 1
                }
                
                let curRes = end - start + 1
                res = max(res, curRes)
                end += 1
            }
        }
        return res
    }
}
