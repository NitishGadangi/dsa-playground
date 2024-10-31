import Foundation

//https://leetcode.com/problems/single-number/description/

class Solution {
    func singleNumber(_ nums: [Int]) -> Int {
        var res = 0
        for num in nums {
            res = res ^ num
        }
        return res
    }
}
