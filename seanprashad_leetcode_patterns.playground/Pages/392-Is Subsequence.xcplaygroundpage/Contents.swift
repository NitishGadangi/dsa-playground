import Foundation

//https://leetcode.com/problems/is-subsequence/

class Solution {
    func isSubsequence(_ s: String, _ t: String) -> Bool {
        var left = 0
        var right = 0
        while left < s.count && right < t.count {
            let leftItem = Array(s)[left]
            let rightItem = Array(t)[right]
            if leftItem == rightItem {
                left += 1
            }
            right += 1
        }
        return left == s.count
    }
}
