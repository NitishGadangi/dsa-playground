import Foundation

//https://leetcode.com/problems/sort-characters-by-frequency/

class Solution {
    struct Item {
        let ch: Character
        let freq: Int
    }
    func frequencySort(_ s: String) -> String {
        var freqs: [Character: Int] = [:]
        for ch in s {
            freqs[ch, default: 0] += 1
        }
        var fqArr = [Item]()
        for (ch, fq) in freqs {
            fqArr.append(Item(ch: ch, freq: fq))
        }
        fqArr = fqArr.sorted(by: { left, right in
            left.freq > right.freq
        })
        var res = ""
        for item in fqArr {
            for _ in 0..<item.freq {
                res += "\(item.ch)"
            }
        }
        
        return res
    }
}
