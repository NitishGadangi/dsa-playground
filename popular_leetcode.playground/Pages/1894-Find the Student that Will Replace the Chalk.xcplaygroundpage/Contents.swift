import Foundation

//https://leetcode.com/problems/find-the-student-that-will-replace-the-chalk

class Solution {
    func chalkReplacer(_ chalk: [Int], _ k: Int) -> Int {
        var sum: Int = 0
        for item in chalk {
            sum += item
            if sum > k {
                break
            }
        }
        var k = k % sum
        for (idx, item) in chalk.enumerated() {
            if k < item {
                return idx
            }
            k = k - item
        }
        return 0
    }
}
