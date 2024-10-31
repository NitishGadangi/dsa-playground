import Foundation

//https://leetcode.com/problems/contains-duplicate/description/

class Solution {
    func containsDuplicate(_ nums: [Int]) -> Bool {
        var set: Set<Int> = []
        for num in nums {
            if set.contains(num) {
                return true
            }
            set.insert(num)
        }
        return false
    }
}
