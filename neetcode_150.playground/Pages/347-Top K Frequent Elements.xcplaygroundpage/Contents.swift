import Foundation

//https://leetcode.com/problems/top-k-frequent-elements/

class Solution {
    struct Freq {
        let num: Int
        let freq: Int
    }
    func topKFrequent(_ nums: [Int], _ k: Int) -> [Int] {
        var countMap: [Int: Int] = [:]
        for num in nums {
            countMap[num, default: 0] += 1
        }
        var frArr: [Freq] = []
        for (num, fq) in countMap {
            frArr.append(Freq(num: num, freq: fq))
        }
        var frArrSorted = frArr.sorted { l, r in
            l.freq > r.freq
        }
        var res: [Int] = []
        var cnt = 0
        for fq in frArrSorted {
            res.append(fq.num)
            cnt += 1
            if cnt >= k { break}
        }
        return res
    }
}
