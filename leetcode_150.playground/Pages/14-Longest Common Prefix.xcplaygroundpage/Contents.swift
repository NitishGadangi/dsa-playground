import Foundation

//https://leetcode.com/problems/longest-common-prefix/?envType=study-plan-v2&envId=top-interview-150
class Solution {
    func longestCommonPrefix(_ strs: [String]) -> String {
        let smallStr = getSmallestWord(strs: strs)
        let smallArr = Array(smallStr)
        var res = ""
        for (idx, item) in smallArr.enumerated() {
            for str in strs {
                let curItem = Array(str)[idx]
                if (curItem != item) {
                    return res
                }
            }
            res.append(item)
        }
        return res
    }

    func getSmallestWord(strs: [String]) -> String {
        var smallCount = Int.max
        var smallest = ""
        for str in strs {
            if str.count < smallCount {
                smallCount = str.count
                smallest = str
            }
        }
        return smallest
    }
}

// Alternate Solution
// Sort list of strings lexicographically
// compare first and last item in the list to get common prefix

