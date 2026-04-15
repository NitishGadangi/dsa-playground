import Foundation

// https://leetcode.com/problems/top-k-frequent-elements/

class Solution {
    struct Freq {
        let val: Int
        let cnt: Int
    }
    func topKFrequent(_ nums: [Int], _ k: Int) -> [Int] {
        var freqMap: [Int: Int] = [:]
        for num in nums {
            freqMap[num, default: 0] += 1
        }
        var freqs = [Freq]()
        for (num, cnt) in freqMap {
            freqs.append(Freq(val: num, cnt: cnt))
        }
        freqs = freqs.sorted { $0.cnt > $1.cnt }
        var res: [Int] = []
        for idx in 0..<k {
            res.append(freqs[idx].val)
        }
        return res
    }
}
