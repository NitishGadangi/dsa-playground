import Foundation

//https://leetcode.com/problems/find-longest-special-substring-that-occurs-thrice-i

class Solution {
    func maximumLength(_ s: String) -> Int {
        let len = s.count
        let sArr = Array(s)
        var strCountMap: [String: Int] = [:]
        var res = -1
        for start in 0..<len {
            for end in start..<len {
                if sArr[start] != sArr[end] { break }
                let subStr = s.substring(from: start, to: end)
                strCountMap[subStr] = (strCountMap[subStr] ?? 0) + 1

                let curCount = strCountMap[subStr] ?? 0
                if curCount > 1 {
                    res = max(res, subStr.count)
                }
            }
        }
        [].inse
        return res
    }
}


extension String {
    // including both from and to
    func substring(from: Int, to: Int) -> String {
        let startIndex = self.index(self.startIndex, offsetBy: from)
        let endIndex = self.index(self.startIndex, offsetBy: to)
        return String(self[startIndex...endIndex])
    }
}

let test = Solution().maximumLength("aaaa")
print(test)
