import Foundation

//https://leetcode.com/problems/convert-1d-array-into-2d-array/

class Solution {
    func construct2DArray(_ original: [Int], _ m: Int, _ n: Int) -> [[Int]] {
        guard m * n == original.count else { return [] }
        var res: [[Int]] = Array(repeating: Array(repeating: 0, count: n), count: m)
        for (idx, val) in original.enumerated() {
            let r = idx / n
            let c = idx % n
            res[r][c] = val
        }
        return res
    }
}
