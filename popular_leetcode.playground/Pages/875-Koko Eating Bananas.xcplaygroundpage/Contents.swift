import Foundation

//https://leetcode.com/problems/koko-eating-bananas

class Solution {
    func minEatingSpeed(_ piles: [Int], _ h: Int) -> Int {
        guard piles.count > 0 else { return 0 }

        var maxPile: Int = piles[0]
        for pile in piles {
            maxPile = max(maxPile, pile)
        }

        var low: Int = 1
        var high: Int = maxPile

        while low < high {
            var tempK = low + (high - low)/2

            // check if tempK works
            var tempH: Int = 0
            for pile in piles {
                tempH += Int(ceil(Double(pile)/Double(tempK)))
            }

            if tempH <= h {
                high = tempK
            } else {
                low = tempK + 1
            }
        }

        return high
    }
}
