import Foundation

//https://leetcode.com/problems/longest-repeating-character-replacement

class Solution {
    func characterReplacement(_ s: String, _ k: Int) -> Int {
        let strArr = Array(s)
        var charSet = Set<String.Element>()
        for item in strArr {
            charSet.insert(item)
        }



        var res: Int = 0

        for char in charSet {
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
                    count += 1
                    start += 1
                }
                res = max(res, end - start)
            }
        }

        return res
    }
}
