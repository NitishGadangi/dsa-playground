import Foundation

//https://leetcode.com/problems/shuffle-an-array/

//  Fisher-Yates algorithm logic:
//  - At position 0, any of the n elements could be first, so we pick from [0, n-1]
//  - At position 1, we pick from the remaining unplaced elements [1, n-1]
//  - At position i, we pick from [i, n-1]
//  By swapping the randomly chosen element with position i, we're essentially "placing" that element in its final shuffled. position and then moving on to the next position.
// REF: https://algo.monster/liteproblems/384#intuition

class Solution {
    var input: [Int]
    var length: Int {
        input.count
    }

    init(_ nums: [Int]) {
        self.input = nums
    }

    func reset() -> [Int] {
        input
    }

    func shuffle() -> [Int] {
        var shuffled = input
        for idx in 0..<length {
            let random = Int.random(in: idx..<length)
            (shuffled[idx], shuffled[random]) = (shuffled[random], shuffled[idx])
        }
        return shuffled
    }
}

/**
 * Your Solution object will be instantiated and called as such:
 * let obj = Solution(nums)
 * let ret_1: [Int] = obj.reset()
 * let ret_2: [Int] = obj.shuffle()
 */
