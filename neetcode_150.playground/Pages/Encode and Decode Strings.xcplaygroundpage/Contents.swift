import Foundation

//https://neetcode.io/problems/string-encode-and-decode/question

class Solution {
    func encode(_ strs: [String]) -> String {
        if strs.isEmpty { return "" }

        var sizes: [Int] = []
        var res = ""
        for s in strs {
            sizes.append(s.count)
        }
        for sz in sizes {
            res += String(sz)
            res += ","
        }

        res += "#"
        for s in strs {
            res += s
        }
        return res
    }

    func decode(_ s: String) -> [String] {
        if s.isEmpty { return [] }
        let sArr = Array(s)
        var sizes: [Int] = []
        var res: [String] = []
        var i = 0

        while sArr[i] != "#" {
            var cur = ""
            while sArr[i] != "," {
                cur.append(sArr[i])
                i += 1
            }
            sizes.append(Int(cur)!)
            i += 1
        }

        i += 1
        for sz in sizes {
            let substring = String(sArr[i..<i+sz])
            res.append(substring)
            i += sz
        }
        return res
    }
}


