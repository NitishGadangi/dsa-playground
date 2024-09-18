import Foundation

//https://leetcode.com/problems/random-pick-with-weight

class Solution {
    var sumArr: [Int] = []
    let totalSum: Int

    init(_ w: [Int]) {
        var curSum: Int = 0
        for item in w {
            curSum += item
            sumArr.append(item)
        }
        totalSum = curSum
    }

    func pickIndex() -> Int {
        let random = Double.random(in: 0...1)
        let target = random * Double(totalSum)
        for (idx, item) in sumArr.enumerated() {
            if Double(item) > target {
                return idx
            }
        }

        return sumArr.count - 1
    }
}

/**
 * Your Solution object will be instantiated and called as such:
 * let obj = Solution(w)
 * let ret_1: Int = obj.pickIndex()
 */
