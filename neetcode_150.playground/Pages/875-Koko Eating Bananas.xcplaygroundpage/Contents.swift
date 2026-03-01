import Foundation

//https://leetcode.com/problems/koko-eating-bananas/description/

class Solution {
    func minEatingSpeed(_ piles: [Int], _ h: Int) -> Int {
        var start = 1
        var end = piles.max()!
        var res = end
        while start <= end {
            let mid = start + (end - start)/2
            let time = calculateTime(piles, speed: mid)
            if time <= h {
                res = mid
                end = mid - 1
            } else {
                start = mid + 1
            }
        }

        return res
    }

    func calculateTime(_ piles: [Int], speed: Int) -> Int {
        var res: Int = 0
        for pile in piles {
            res += Int(ceil(Double(pile)/Double(speed)))
        }
        return res
    }
}
