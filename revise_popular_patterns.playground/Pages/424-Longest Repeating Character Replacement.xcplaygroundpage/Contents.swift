import Foundation

//https://leetcode.com/problems/longest-repeating-character-replacement/

class Solution {
    func characterReplacement(_ s: String, _ k: Int) -> Int {
        let strArr = Array(s)
        var res = 0
        var start = 0
        var end = 0
        var map: [Character: Int] = [:]
        while end < s.count {
            let cur = strArr[end]
            map[cur, default: 0] += 1
            while ((end - start + 1) - map.values.max()!) > k {
                start += 1
                map[strArr[start], default: 0] -= 1
            }
            let curLen = end - start + 1
            res = max(res, curLen)
            end += 1
        }
        return res
    }
}

let res = Solution().characterReplacement("AABABBA", 1)

class TLESolution {
    func characterReplacement(_ s: String, _ k: Int) -> Int {
        let set = Set<String.Element>(s)
        let strArr = Array(s)
        var res = 0
        for char in set {
            var start = 0
            var end = 0
            var count = k
            while end < s.count {
                if strArr[end] == char {
                    end += 1
                } else if count > 0 {
                    end += 1
                    count -= 1
                } else if strArr[start] == char {
                    start += 1
                } else {
                    start += 1
                    count += 1
                }
                // no plus 1 - because we already incremented it
                let curRes = end - start
                res = max(res, curRes)
            }
        }
        return res
    }
}
