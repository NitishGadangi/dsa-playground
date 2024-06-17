import Foundation

//https://leetcode.com/problems/group-anagrams/?envType=study-plan-v2&envId=top-interview-150
class Solution {
    func groupAnagrams(_ strs: [String]) -> [[String]] {
        var sortedArr: [String] = strs.map { str in
            return String(str.sorted())
        }
        var anaMap: [String: [Int]] = [:]
        for (idx, item) in sortedArr.enumerated() {
            var anaIndexs = anaMap[item] ?? []
            anaIndexs.append(idx)
            anaMap[item] = anaIndexs
        }
        var res: [[String]] = []
        for (_, idxs) in anaMap {
            var temp: [String] = []
            for idx in idxs {
                temp.append(strs[idx])
            }
            res.append(temp)
        }
        return res
    }
}
